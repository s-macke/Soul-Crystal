package main

import (
	"crypto/sha256"
	"encoding/binary"
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

type Record struct {
	Index        int      `json:"index"`
	SourceOffset int      `json:"source_offset"`
	Text         string   `json:"text"`
	ScreenLines  []string `json:"screen_lines"`
}
type Catalog struct {
	Version         int               `json:"schema_version"`
	Side            string            `json:"side"`
	Source          string            `json:"source"`
	SHA256          string            `json:"source_sha256"`
	CommonTailIndex int               `json:"common_tail_index"`
	Records         map[string]Record `json:"records"`
}
type Message struct {
	ID      int            `json:"id"`
	Kind    string         `json:"kind"`
	Records map[string]int `json:"records"`
	Handler string         `json:"handler,omitempty"`
	Note    string         `json:"note,omitempty"`
}
type Mapping struct {
	Version  int                `json:"schema_version"`
	Source   string             `json:"source"`
	Messages map[string]Message `json:"messages"`
}

// route mirrors $3CF2..$3FEE for ordinary (non-room-title) message dispatch.
// side is the value of $6963 (B1=1, B2=2, C1=3, C2=4).
func route(id, side, tail int) (int, bool) {
	if id <= 0 || id > 636 || side < 1 || side > 4 {
		return 0, false
	}
	if id <= 24 {
		return id + 102, true
	} // $5D94 overrides IDs 1,2,8,12 before this fallback.
	mode := 2
	for i, limit := range []int{106, 168, 355, 397, 579, 619, 620, 632, 636} {
		if id > limit {
			mode = []int{3, 4, 5, 6, 7, 8, 9, 11, 12}[i]
		}
	}
	if mode != 2 && mode != 7 && mode-2 != side && mode-7 != side {
		return 0, false
	}
	switch mode {
	case 2, 3:
		return id + 102, true
	case 4:
		return id + 40, true
	case 5:
		return id - 147, true
	case 6:
		return id - 189, true
	case 7, 8:
		return tail + id - 580, true
	case 9:
		return tail + id - 581, true
	case 11:
		return tail + id - 593, true
	}
	return 0, false
}
func writeJSON(path string, v interface{}) error {
	b, err := json.MarshalIndent(v, "", "  ")
	if err != nil {
		return err
	}
	return os.WriteFile(path, append(b, '\n'), 0644)
}
func exportCatalogs(ranges []diskRange, outputDir string, language string) error {
	if err := os.MkdirAll(outputDir, 0755); err != nil {
		return err
	}
	mapping := Mapping{1, "opcodeoracle/soul_crystal/soul_crystal.asm: $3C02, $3FEE, $4022, $54EB, $5D94", map[string]Message{}}
	if language == "en" {
		mapping.Source = "data/c64_en/SoulCrystalA2.d64: chain 10; $3C02..$4001 byte-identical to German dispatch (TestEnglishTextIDRoutingMatchesGerman)"
	}
	for id := 0; id <= 636; id++ {
		m := Message{ID: id, Kind: "disk_text", Records: map[string]int{}}
		if id == 0 {
			m.Kind = "no_text"
			m.Note = "Ordinary dispatch returns without displaying a message."
		}
		if id == 1 || id == 2 || id == 8 || id == 12 {
			m.Kind = "engine_formatted"
			m.Handler = "$5D94"
			m.Note = map[int]string{1: "Score message assembled by the engine.", 2: "Manual-check prompt assembled by the engine.", 8: "Drop-object response with object name.", 12: "Take-object response with object name."}[id]
		}
		mapping.Messages[strconv.Itoa(id)] = m
	}
	var catalogs []Catalog
	for side, disk := range ranges {
		b, err := os.ReadFile(disk.path)
		if err != nil {
			return err
		}
		if len(b) != d64Size {
			return fmt.Errorf("invalid D64 size")
		}
		cat := Catalog{1, disk.name, disk.path, fmt.Sprintf("%x", sha256.Sum256(b)), int(binary.LittleEndian.Uint16(b[0x2fa:0x2fc])), map[string]Record{}}
		for idx := 0; idx <= disk.lastIdx; idx++ {
			lines, err := decodeScreen(b, idx)
			if err != nil {
				return err
			}
			text := strings.Join(strings.Fields(strings.Join(lines, "\n")), " ")
			offset, err := pointerOffset(b, idx)
			if err != nil {
				return err
			}
			cat.Records[strconv.Itoa(idx)] = Record{idx, offset, text, lines}
		}
		for id := 1; id <= 636; id++ {
			m := mapping.Messages[strconv.Itoa(id)]
			if m.Kind == "engine_formatted" {
				continue
			}
			idx, ok := route(id, side+1, cat.CommonTailIndex)
			if !ok {
				continue
			}
			r, ok := cat.Records[strconv.Itoa(idx)]
			if !ok {
				return fmt.Errorf("%s ID %d points outside text records: %d", disk.name, id, idx)
			}
			m.Records[disk.name] = idx
			if strings.HasPrefix(r.Text, "r") && len(r.Text) == 3 {
				if _, err := strconv.Atoi(r.Text[1:]); err == nil {
					m.Note = "Literal placeholder record; do not substitute Amiga/DOS wording without documenting it."
				}
			}
			mapping.Messages[strconv.Itoa(id)] = m
		}
		if err := writeJSON(filepath.Join(outputDir, disk.name+".json"), cat); err != nil {
			return err
		}
		catalogs = append(catalogs, cat)
		fmt.Printf("%s: %d original text records, common tail starts at %d\n", disk.name, len(cat.Records), cat.CommonTailIndex)
	}
	if language == "en" {
		if err := writeJSON(filepath.Join(outputDir, "text_ids.json"), mapping); err != nil {
			return err
		}
		return cTextFilesLanguage("out", mapping, catalogs, "en")
	}
	if err := writeJSON(filepath.Join(outputDir, "text_ids.json"), mapping); err != nil {
		return err
	}
	if err := cTextFiles("out", mapping, catalogs); err != nil {
		return err
	}
	return commentsHeader("src/C/text_comments.generated.h", mapping, catalogs)
}

// Export a standalone C++ header alongside the JSONs from the same decoded data.
// Neither the C++ build nor the converter needs Go or JSON files.
func commentsHeader(path string, mapping Mapping, catalogs []Catalog) error {
	var out strings.Builder
	out.WriteString("// Generated from the C64 disks by src/Go/text. Do not edit.\n// Regenerate: GO111MODULE=off go run ./src/Go/text\n#pragma once\n#include <map>\n#include <string>\n")
	for _, cat := range catalogs {
		fmt.Fprintf(&out, "static const std::map<unsigned, std::string> text_comments_%s = {\n", cat.Side)
		for id := 0; id <= 636; id++ {
			m := mapping.Messages[strconv.Itoa(id)]
			var comment string
			switch m.Kind {
			case "no_text":
				comment = "no text"
			case "engine_formatted":
				comment = "engine $5D94: " + m.Note
			default:
				idx, ok := m.Records[cat.Side]
				if !ok {
					comment = "not displayed on " + cat.Side + " by $3F62"
				} else {
					r, exists := cat.Records[strconv.Itoa(idx)]
					if !exists {
						return fmt.Errorf("missing record %s:%d", cat.Side, idx)
					}
					comment = fmt.Sprintf("%s record %d: %s", cat.Side, idx, r.Text)
					if m.Note != "" {
						comment += " [" + m.Note + "]"
					}
				}
			}
			// strconv.Quote produces C++-compatible escapes for these printable strings.
			fmt.Fprintf(&out, "{%d, %s},\n", id, strconv.Quote(comment))
		}
		out.WriteString("};\n")
	}
	return os.WriteFile(path, []byte(out.String()), 0644)
}
func main() {
	language := flag.String("language", "de", "archive language: de or en (both export catalogs and compiled C texts)")
	flag.Parse()
	ranges, outputDir := knownRanges, "texts/C64"
	switch *language {
	case "de":
	case "en":
		outputDir = "texts/C64_en"
		ranges = append([]diskRange(nil), knownRanges...)
		for i := range ranges {
			ranges[i].path = filepath.Join("data/c64_en", "SoulCrystal"+ranges[i].name+".d64")
		}
	default:
		fmt.Fprintln(os.Stderr, "language must be de or en")
		os.Exit(2)
	}
	exportMarkdown(ranges, outputDir)
	if err := exportCatalogs(ranges, outputDir, *language); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}
