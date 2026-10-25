package main

import (
	"bytes"
	"encoding/binary"
	"regexp"
	"strconv"
	"strings"
	"testing"
)

func TestAllTablesAgainstDisks(t *testing.T) {
	result := audit("../../..")
	if len(result.Parts) != 4 || len(result.StateArrays) != 11 {
		t.Fatal("missing audit coverage")
	}
	enumText := string(mustRead("../../../src/C/game_ids.h"))
	ids := map[string]int{}
	for _, m := range regexp.MustCompile(`\b([A-Z0-9_]+)\s*=\s*(0x[0-9A-Fa-f]+)`).FindAllStringSubmatch(enumText, -1) {
		n, _ := strconv.ParseInt(m[2], 0, 32)
		ids[m[1]] = int(n)
	}
	readNumber := func(s string) int {
		s = strings.TrimSpace(s)
		if n, ok := ids[s]; ok {
			return n
		}
		v, e := strconv.ParseInt(s, 0, 32)
		if e != nil {
			t.Fatal(s, e)
		}
		return int(v)
	}
	totalReaders := 0
	for i, p := range result.Parts {
		if !p.MatchesSnapshot || len(p.Tables) != 7 {
			t.Fatal("source mismatch")
		}
		disk := diskScript(mustRead("../../../data/C64/d64/Soul Crystal Side" + p.Side + ".d64"))
		source := string(mustRead("../../../out/game_tables.c"))
		for j, tab := range p.Tables {
			totalReaders += len(tab.Readers)
			if !tab.MatchesSnapshot || tab.PhysicalBytes != lengths[j] {
				t.Fatal("table source mismatch")
			}
			if j != 1 && !tab.SameAsPartA {
				t.Fatal("unexpected static part variation")
			}
			if j == 1 && (tab.MaximumReadBytes != 84 || tab.OverlapHex != "10 11 30") {
				t.Fatal("native overread changed")
			}
			body := regexp.MustCompile(`(?s)(const unsigned char|const ObjectTextEntry) ` + tab.Name + `\[\] = \{(.*?)\n\};`).FindStringSubmatch(source)
			if body == nil {
				t.Fatal("missing table", tab.Name)
			}
			var cleaned strings.Builder
			for _, line := range strings.Split(body[2], "\n") {
				cleaned.WriteString(strings.SplitN(line, "//", 2)[0])
				cleaned.WriteByte('\n')
			}
			raw := []byte{}
			if body[1] == "const unsigned char" {
				for _, value := range regexp.MustCompile(`0x[0-9a-f]+`).FindAllString(cleaned.String(), -1) {
					raw = append(raw, byte(readNumber(value)))
				}
			} else {
				for _, row := range regexp.MustCompile(`\{([^,]+),([^}]+)\}`).FindAllStringSubmatch(cleaned.String(), -1) {
					for _, field := range row[1:] {
						var b [2]byte
						binary.LittleEndian.PutUint16(b[:], uint16(readNumber(field)))
						raw = append(raw, b[:]...)
					}
				}
			}
			wantLength := lengths[j]
			if j == 1 {
				wantLength = 84
			}
			offset := starts[i][j] - 0x7600
			if len(raw) != wantLength || !bytes.Equal(raw, disk[offset:offset+wantLength]) {
				t.Fatalf("%s differs from original disk", tab.Name)
			}
		}
	}
	if totalReaders != 40 {
		t.Fatalf("expected 40 readers, got %d", totalReaders)
	}
}
