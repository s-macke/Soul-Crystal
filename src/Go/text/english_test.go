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
			for path, dst := range map[string]*Catalog{"../../../texts/C64_en/" + disk.name + ".json": &en, "../../../texts/C64/" + disk.name + ".json": &de} {
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
