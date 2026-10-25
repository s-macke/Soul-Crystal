package main

import (
	"encoding/binary"
	"encoding/json"
	"fmt"
	"os"
	"regexp"
	"strconv"
	"strings"
	"testing"
)

// Check the checked-in C against the original snapshot bytes and JSON catalogs.
// This does not execute the converted game or assume the rest of its C is valid.
func TestConverterTextIDsAndSelectCases(t *testing.T) {
	read := func(path string) []byte {
		t.Helper()
		b, e := os.ReadFile("../../../" + path)
		if e != nil {
			t.Fatal(e)
		}
		return b
	}
	var mapping Mapping
	if err := json.Unmarshal(read("texts/C64/text_ids.json"), &mapping); err != nil {
		t.Fatal(err)
	}
	textRE := regexp.MustCompile(`textoutput = ([^;]+); // text ID ([0-9]+) \(0x([0-9a-f]+)\), script \$([0-9a-f]+): (.*)`)
	selectRE := regexp.MustCompile(`switch\(.*\) \{ // SELECT script \$([0-9a-f]+); original cases are 1-based`)
	caseRE := regexp.MustCompile(`case ([0-9]+): Func([0-9a-f]+)\(\); break;`)
	number := func(s string, base int) int {
		n, e := strconv.ParseInt(s, base, 32)
		if e != nil {
			t.Fatal(e)
		}
		return int(n)
	}
	total, switches, cases, unavailable := 0, 0, 0, 0
	for i, side := range []string{"B1", "B2", "C1", "C2"} {
		var cat Catalog
		if err := json.Unmarshal(read("texts/C64/"+side+".json"), &cat); err != nil {
			t.Fatal(err)
		}
		ram := read("data/C64/snapshots/disk" + strings.ToLower(side) + ".vsf")[0x99:0x10099]
		lines := strings.Split(string(read(fmt.Sprintf("out/part%c.c", 'a'+i))), "\n")
		seen := map[int]bool{}
		for li, line := range lines {
			if m := textRE.FindStringSubmatch(line); m != nil {
				total++
				id, addr := number(m[2], 10), number(m[4], 16)
				if seen[addr] {
					t.Fatalf("%s duplicate script provenance $%04x", side, addr)
				}
				seen[addr] = true
				if ram[addr] != 0x92 {
					t.Fatalf("%s $%04x: not textoutput", side, addr)
				}
				value, end := 0, addr+3
				switch ram[addr+1] {
				case 0xc0:
					value = int(ram[addr+2])
				case 0xc1:
					value = int(binary.LittleEndian.Uint16(ram[addr+2:]))
					end++
				default:
					t.Fatalf("%s $%04x: not literal", side, addr)
				}
				if ram[end] != 0xd7 || id != value || number(m[3], 16) != value || number(m[1], 0) != value {
					t.Fatalf("%s $%04x: assignment/ID mismatch", side, addr)
				}
				msg, ok := mapping.Messages[m[2]]
				if !ok {
					t.Fatalf("missing ID %d", id)
				}
				expected := ""
				switch msg.Kind {
				case "no_text":
					expected = "no text"
				case "engine_formatted":
					expected = "engine $5D94: " + msg.Note
				case "disk_text":
					idx, ok := msg.Records[side]
					if !ok {
						expected = "not displayed on " + side + " by $3F62"
						unavailable++
					} else {
						record, ok := cat.Records[strconv.Itoa(idx)]
						if !ok {
							t.Fatalf("missing %s:%d", side, idx)
						}
						expected = fmt.Sprintf("%s record %d: %s", side, idx, record.Text)
						if msg.Note != "" {
							expected += " [" + msg.Note + "]"
						}
					}
				default:
					t.Fatalf("unknown kind %q", msg.Kind)
				}
				if m[5] != expected {
					t.Fatalf("%s $%04x: wrong comment", side, addr)
				}
			} else if strings.Contains(line, "textoutput = 0x") {
				t.Fatalf("unannotated assignment: %s", line)
			}
			if m := selectRE.FindStringSubmatch(line); m != nil {
				switches++
				addr := number(m[1], 16)
				if ram[addr] != 0xe2 || ram[addr+1] >= 0xc0 {
					t.Fatalf("unexpected SELECT encoding $%04x", addr)
				}
				pc, n := addr+2, 1
				for ; ram[pc] == 0xea; pc, n = pc+3, n+1 {
					cases++
					c := caseRE.FindStringSubmatch(lines[li+n])
					if c == nil || number(c[1], 10) != n || number(c[2], 16) != int(binary.LittleEndian.Uint16(ram[pc+1:])) {
						t.Fatalf("%s $%04x: wrong SELECT case %d", side, addr, n)
					}
				}
				if strings.TrimSpace(lines[li+n]) != "}" {
					t.Fatalf("extra SELECT case at $%04x", addr)
				}
			} else if strings.Contains(line, "switch(") {
				t.Fatalf("SELECT without provenance: %s", line)
			}
		}
	}
	if total != 574 || unavailable != 17 || switches == 0 {
		t.Fatalf("unexpected coverage: texts=%d unavailable=%d switches=%d", total, unavailable, switches)
	}
	t.Logf("checked %d text assignments (%d unavailable on current side), %d SELECTs, %d cases", total, unavailable, switches, cases)
}

func TestJSONCatalogsMatchDisks(t *testing.T) {
	var mapping Mapping
	b, err := os.ReadFile("../../../texts/C64/text_ids.json")
	if err != nil {
		t.Fatal(err)
	}
	if err = json.Unmarshal(b, &mapping); err != nil {
		t.Fatal(err)
	}
	if len(mapping.Messages) != 637 {
		t.Fatal("expected IDs 0..636")
	}
	for side, disk := range knownRanges {
		raw, err := os.ReadFile("../../../" + disk.path)
		if err != nil {
			t.Fatal(err)
		}
		b, err := os.ReadFile("../../../texts/C64/" + disk.name + ".json")
		if err != nil {
			t.Fatal(err)
		}
		var cat Catalog
		if err = json.Unmarshal(b, &cat); err != nil {
			t.Fatal(err)
		}
		if len(cat.Records) != disk.lastIdx+1 || cat.CommonTailIndex != int(binary.LittleEndian.Uint16(raw[0x2fa:])) {
			t.Fatal("catalog bounds/tail mismatch")
		}
		for idx := 0; idx <= disk.lastIdx; idx++ {
			lines, err := decodeScreen(raw, idx)
			if err != nil {
				t.Fatal(err)
			}
			offset, err := pointerOffset(raw, idx)
			if err != nil {
				t.Fatal(err)
			}
			r, ok := cat.Records[strconv.Itoa(idx)]
			if !ok || r.Index != idx || r.SourceOffset != offset || strings.Join(r.ScreenLines, "\n") != strings.Join(lines, "\n") || r.Text != strings.Join(strings.Fields(strings.Join(lines, "\n")), " ") {
				t.Fatalf("%s record %d differs from D64", disk.name, idx)
			}
		}
		for id := 0; id <= 636; id++ {
			msg, exists := mapping.Messages[strconv.Itoa(id)]
			if !exists || msg.ID != id {
				t.Fatalf("missing/mismatched ID %d", id)
			}
			idx, ok := msg.Records[disk.name]
			if id == 0 || id == 1 || id == 2 || id == 8 || id == 12 {
				kind := "engine_formatted"
				if id == 0 {
					kind = "no_text"
				}
				if msg.Kind != kind || ok {
					t.Fatalf("wrong special ID %d", id)
				}
				continue
			}
			want, visible := route(id, side+1, cat.CommonTailIndex)
			if msg.Kind != "disk_text" || ok != visible || (ok && idx != want) {
				t.Fatalf("%s ID %d mapping mismatch", disk.name, id)
			}
		}
	}
}
