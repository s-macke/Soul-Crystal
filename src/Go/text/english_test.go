package main

import (
	"encoding/json"
	"os"
	"path/filepath"
	"reflect"
	"strconv"
	"strings"
	"testing"
)

func TestEnglishCatalogs(t *testing.T) {
	for _, disk := range knownRanges {
		t.Run(disk.name, func(t *testing.T) {
			raw, err := os.ReadFile(filepath.Join("../../../data/c64_en", "SoulCrystal"+disk.name+".d64"))
			if err != nil {
				t.Fatal(err)
			}
			var en, de Catalog
			for path, dst := range map[string]*Catalog{"../../../texts/C64_en/original/" + disk.name + ".json": &en, "../../../texts/C64/" + disk.name + ".json": &de} {
				data, err := os.ReadFile(path)
				if err != nil {
					t.Fatal(err)
				}
				if err = json.Unmarshal(data, dst); err != nil {
					t.Fatal(err)
				}
			}
			if len(en.Records) != disk.lastIdx+1 || en.CommonTailIndex != de.CommonTailIndex {
				t.Fatal("catalog layout changed")
			}
			if en.Records["0"].Text != "[In the guest room]" {
				t.Fatal("English room title missing")
			}
			for idx := 0; idx <= disk.lastIdx; idx++ {
				key := strconv.Itoa(idx)
				lines, err := decodeScreen(raw, idx)
				if err != nil {
					t.Fatal(err)
				}
				record, ok := en.Records[key]
				if !ok || !reflect.DeepEqual(lines, record.ScreenLines) || record.Text != strings.Join(strings.Fields(strings.Join(lines, "\n")), " ") {
					t.Fatalf("record %d does not match disk", idx)
				}
				// Literal unused record labels must stay at the same positions.
				german := de.Records[key].Text
				if len(german) == 3 && strings.HasPrefix(german, "r") && german != record.Text {
					t.Fatalf("placeholder %d moved", idx)
				}
			}
		})
	}
}

// Every edited export must agree with the same checked rules used for the C
// arrays. The native screen lines and byte offsets remain untouched evidence.
func TestReviewedEnglishExports(t *testing.T) {
	root, err := filepath.Abs("../../..")
	if err != nil {
		t.Fatal(err)
	}
	rules, err := readEnglishCorrections(root)
	if err != nil {
		t.Fatal(err)
	}
	for _, disk := range knownRanges {
		var raw, reviewed Catalog
		for path, dst := range map[string]*Catalog{"original/" + disk.name + ".json": &raw, disk.name + ".json": &reviewed} {
			b, err := os.ReadFile(filepath.Join(root, "texts/C64_en", path))
			if err != nil {
				t.Fatal(err)
			}
			if err = json.Unmarshal(b, dst); err != nil {
				t.Fatal(err)
			}
		}
		if len(raw.Records) != len(reviewed.Records) {
			t.Fatal("record count changed")
		}
		for key, r := range raw.Records {
			want, err := correctedEnglishText(rules, disk.name+":"+key, r.Text)
			if err != nil {
				t.Fatal(err)
			}
			got := reviewed.Records[key]
			if got.Text != want || got.Index != r.Index || got.SourceOffset != r.SourceOffset || !reflect.DeepEqual(got.ScreenLines, r.ScreenLines) {
				t.Fatalf("reviewed %s:%s differs from rules/evidence", disk.name, key)
			}
		}
	}
	for _, name := range []string{"story", "diary"} {
		raw, err := os.ReadFile(filepath.Join(root, "texts/C64_en/original", name+".txt"))
		if err != nil {
			t.Fatal(err)
		}
		want, err := correctedEnglishText(rules, name, string(raw))
		if err != nil {
			t.Fatal(err)
		}
		got, err := os.ReadFile(filepath.Join(root, "texts/C64_en", name+".txt"))
		if err != nil {
			t.Fatal(err)
		}
		if string(got) != want {
			t.Fatalf("reviewed %s is stale", name)
		}
	}
}
