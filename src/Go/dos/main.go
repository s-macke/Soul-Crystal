package main

import (
	"encoding/binary"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

const dataDir = "data/DOS/Soul"

// CP437 subset used by the game, mapped to UTF-8.
func cp437ToUTF8(c byte) string {
	switch c {
	case 0:
		return ""
	case 0x81:
		return "ü"
	case 0x84:
		return "ä"
	case 0x8E:
		return "Ä"
	case 0x94:
		return "ö"
	case 0x99:
		return "Ö"
	case 0x9A:
		return "Ü"
	case 0xE1:
		return "ß"
	default:
		return string(rune(c))
	}
}

// chunk is the IFF-style chunk header. Sizes are stored big-endian.
type chunk struct {
	Name [4]byte
	Size uint32
}

func (c chunk) NameStr() string {
	return string(c.Name[:])
}

// huffEntry is one node half in the Huffman table.
type huffEntry struct {
	bit   byte
	value byte
}

// Each TXTL/BODY/HUFL triple is a separate text block sharing the HUTB tree.
// PART archives contain game texts first and room titles second.
type textBlock struct {
	body []byte
	txtl []uint16
	hufl []uint16
}

// archive holds all parsed chunks from one text file.
type archive struct {
	topName string
	formID  string
	hutb    []huffEntry
	blocks  []textBlock
	room    []uint16
	verbs   []string
	huhd    []byte
}

func readChunk(data []byte, pos int) (chunk, int, error) {
	if pos+8 > len(data) {
		return chunk{}, pos, fmt.Errorf("truncated chunk header at 0x%x", pos)
	}
	var c chunk
	copy(c.Name[:], data[pos:pos+4])
	c.Size = binary.BigEndian.Uint32(data[pos+4 : pos+8])
	return c, pos + 8, nil
}

func parseArchive(data []byte) (*archive, error) {
	a := &archive{}

	// Top-level header.
	top, pos, err := readChunk(data, 0)
	if err != nil {
		return nil, err
	}
	a.topName = top.NameStr()
	if a.topName != "FORM" || uint64(top.Size)+8 != uint64(len(data)) {
		return nil, fmt.Errorf("invalid FORM header or file size")
	}

	// Fixed 4-byte form identifier.
	if pos+4 > len(data) {
		return nil, fmt.Errorf("truncated form ID")
	}
	a.formID = string(data[pos : pos+4])
	pos += 4

	// Subchunks.
	for pos < len(data) {
		c, next, err := readChunk(data, pos)
		if err != nil {
			return nil, err
		}
		pos = next
		realSize := int(c.Size)
		padded := realSize
		if padded&1 != 0 {
			padded++
		}
		if padded > len(data)-pos {
			return nil, fmt.Errorf("truncated %s chunk at 0x%x", c.NameStr(), pos)
		}
		payload := data[pos : pos+realSize]

		switch c.NameStr() {
		case "HUHD":
			a.huhd = append([]byte{}, payload...)
		case "HUTB":
			for i := 0; i+1 < len(payload); i += 2 {
				a.hutb = append(a.hutb, huffEntry{bit: payload[i], value: payload[i+1]})
			}
		case "TXTL":
			if len(payload)%2 != 0 {
				return nil, fmt.Errorf("odd TXTL length")
			}
			a.blocks = append(a.blocks, textBlock{})
			block := &a.blocks[len(a.blocks)-1]
			for i := 0; i < len(payload); i += 2 {
				block.txtl = append(block.txtl, binary.BigEndian.Uint16(payload[i:i+2]))
			}
		case "BODY", "HUFL":
			if len(a.blocks) == 0 {
				return nil, fmt.Errorf("%s without TXTL", c.NameStr())
			}
			block := &a.blocks[len(a.blocks)-1]
			if c.NameStr() == "BODY" {
				if block.body != nil {
					return nil, fmt.Errorf("duplicate BODY in text block")
				}
				block.body = append([]byte{}, payload...)
			} else {
				if block.hufl != nil || len(payload)%2 != 0 {
					return nil, fmt.Errorf("invalid HUFL")
				}
				for i := 0; i < len(payload); i += 2 {
					block.hufl = append(block.hufl, binary.BigEndian.Uint16(payload[i:i+2]))
				}
			}
		case "ROOM":
			for i := 0; i+1 < len(payload); i += 2 {
				a.room = append(a.room, binary.BigEndian.Uint16(payload[i:i+2]))
			}
		case "VERB":
			for i := 0; i+16 <= len(payload); i += 16 {
				var s strings.Builder
				for j := 0; j < 16; j++ {
					s.WriteString(cp437ToUTF8(payload[i+j]))
				}
				a.verbs = append(a.verbs, s.String())
			}
		}

		pos += padded
	}

	if a.formID == "HUFF" {
		if len(a.huhd) != 6 || len(a.hutb) != 2*int(binary.BigEndian.Uint16(a.huhd[:2])) {
			return nil, fmt.Errorf("invalid HUHD/HUTB")
		}
		counts := []int{int(binary.BigEndian.Uint16(a.huhd[2:4]))}
		if rooms := int(binary.BigEndian.Uint16(a.huhd[4:6])); rooms > 0 {
			counts = append(counts, rooms)
		}
		if len(a.blocks) != len(counts) {
			return nil, fmt.Errorf("got %d text blocks, expected %d", len(a.blocks), len(counts))
		}
		for i, block := range a.blocks {
			if len(block.txtl) != counts[i] || len(block.hufl) != counts[i] || block.body == nil {
				return nil, fmt.Errorf("incomplete text block %d", i)
			}
		}
	} else if a.formID != "TEXT" {
		return nil, fmt.Errorf("unsupported form %q", a.formID)
	}
	return a, nil
}

// decodeChar consumes every bit, including the final leaf bit, and never
// reads past this record's compressed boundary.
func decodeChar(hutb []huffEntry, body []byte, bitPos *int, end int) (byte, error) {
	half := len(hutb) / 2
	node := half - 1
	for depth := 0; depth <= len(hutb); depth++ {
		if node < 0 || node >= half {
			return 0, fmt.Errorf("invalid Huffman node %d", node)
		}
		if *bitPos >= end*8 {
			return 0, fmt.Errorf("truncated Huffman record")
		}
		bit := (body[*bitPos/8] >> uint(7-*bitPos%8)) & 1
		*bitPos++
		entry := hutb[node+int(bit)*half]
		if entry.bit == 0 {
			return entry.value, nil
		}
		node = int(entry.value)
	}
	return 0, fmt.Errorf("cyclic Huffman tree")
}

// Decode indexed records, not a scan of the entire padded BODY. HUFL offsets
// are relative to their own BODY; TXTL counts original bytes including NUL.
func decodeBody(a *archive, block textBlock) ([]string, error) {
	result := make([]string, len(block.txtl))
	for i, length := range block.txtl {
		start, end := int(block.hufl[i]), len(block.body)
		if i+1 < len(block.hufl) {
			end = int(block.hufl[i+1])
		}
		if length == 0 || start >= end || end > len(block.body) {
			return nil, fmt.Errorf("invalid record %d offset/length", i)
		}
		bits := start * 8
		var text strings.Builder
		for n := 0; n < int(length); n++ {
			c, err := decodeChar(a.hutb, block.body, &bits, end)
			if err != nil {
				return nil, fmt.Errorf("record %d: %w", i, err)
			}
			if n == int(length)-1 {
				if c != 0 {
					return nil, fmt.Errorf("record %d exceeds TXTL length %d", i, length)
				}
			} else {
				if c == 0 {
					return nil, fmt.Errorf("record %d terminates before TXTL length %d", i, length)
				}
				text.WriteString(cp437ToUTF8(c))
			}
		}
		result[i] = text.String()
	}
	return result, nil
}

// decodeObjects reads the XOR-encoded object name table.
func decodeObjects(path string) ([]string, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}

	var objects []string
	for i := 0; i+16 <= len(data); i += 16 {
		var s strings.Builder
		for j := 0; j < 16; j++ {
			s.WriteString(cp437ToUTF8(data[i+j] ^ 0xAA))
		}
		objects = append(objects, s.String())
	}
	return objects, nil
}

var textFiles = []string{
	"PARTA.TXT",
	"PARTB.TXT",
	"PARTC.TXT",
	"PARTD.TXT",
	"COMMN.TXT",
	"RAM.TXT",
	"VERBS.TXT",
}

func main() {
	outDir := "texts/DOS"
	if err := os.MkdirAll(outDir, 0o755); err != nil {
		panic(err)
	}

	// Objects.
	objects, err := decodeObjects(filepath.Join(dataDir, "OBJECTS.TXT"))
	if err != nil {
		fmt.Fprintf(os.Stderr, "OBJECTS.TXT: %v\n", err)
		os.Exit(1)
	}
	var ob strings.Builder
	ob.WriteString("# Objects\n\n")
	for i, name := range objects {
		fmt.Fprintf(&ob, "%3d: %s\n", i, name)
	}
	outPath := filepath.Join(outDir, "objects.txt")
	if err := os.WriteFile(outPath, []byte(ob.String()), 0o644); err != nil {
		panic(err)
	}
	fmt.Printf("%s (%d objects)\n", outPath, len(objects))

	// Text archives.
	for _, name := range textFiles {
		data, err := os.ReadFile(filepath.Join(dataDir, name))
		if err != nil {
			fmt.Fprintf(os.Stderr, "%s: %v\n", name, err)
			os.Exit(1)
		}

		a, err := parseArchive(data)
		if err != nil {
			fmt.Fprintf(os.Stderr, "%s: %v\n", name, err)
			os.Exit(1)
		}

		base := strings.TrimSuffix(name, filepath.Ext(name))
		var out strings.Builder
		fmt.Fprintf(&out, "# %s\n\n", base)
		fmt.Fprintf(&out, "Container: %s / %s\n\n", a.topName, a.formID)

		if len(a.verbs) > 0 {
			out.WriteString("## Verbs\n\n")
			for i, v := range a.verbs {
				fmt.Fprintf(&out, "%3d: %s\n", i, v)
			}
			out.WriteByte('\n')
		}

		if len(a.room) > 0 {
			out.WriteString("## Rooms\n\n")
			for i, r := range a.room {
				fmt.Fprintf(&out, "%3d: %d\n", i, r)
			}
			out.WriteByte('\n')
		}

		textCount := 0
		for blockIndex, block := range a.blocks {
			texts, err := decodeBody(a, block)
			if err != nil {
				fmt.Fprintf(os.Stderr, "%s block %d: %v\n", name, blockIndex, err)
				os.Exit(1)
			}
			heading := "Texts"
			if len(a.blocks) > 1 {
				if blockIndex == 0 {
					heading = "Game texts"
				} else {
					heading = "Room titles"
				}
			}
			fmt.Fprintf(&out, "## %s\n\n", heading)
			for i, text := range texts {
				fmt.Fprintf(&out, "### %03d\n\n%s\n\n", i, text)
			}
			textCount += len(texts)
		}

		outPath := filepath.Join(outDir, base+".txt")
		if err := os.WriteFile(outPath, []byte(out.String()), 0o644); err != nil {
			panic(err)
		}
		fmt.Printf("%s: %d texts, %d verbs, %d rooms\n", outPath, textCount, len(a.verbs), len(a.room))
	}
}
