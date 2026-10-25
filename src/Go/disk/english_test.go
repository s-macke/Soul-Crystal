package main

import (
	"bytes"
	"os"
	"path/filepath"
	"testing"
)

// Compare the original script payloads, including embedded text IDs, directly
// from both editions' disk chains. No snapshots or translated C are involved.
func TestEnglishScriptsMatchGerman(t *testing.T) {
	for _, spec := range knownDisks {
		if spec.vmRootOffset < 0 {
			continue
		}
		t.Run(spec.name, func(t *testing.T) {
			de, err := os.ReadFile(filepath.Join("../../..", spec.path))
			if err != nil {
				t.Fatal(err)
			}
			en, err := os.ReadFile(filepath.Join("../../../data/c64_en", "SoulCrystal"+spec.name+".d64"))
			if err != nil {
				t.Fatal(err)
			}
			a, err := loadVMChain(spec, de)
			if err != nil {
				t.Fatal(err)
			}
			b, err := loadVMChain(spec, en)
			if err != nil {
				t.Fatal(err)
			}
			if !bytes.Equal(a.payload, b.payload) {
				t.Fatalf("English and German script payloads differ (%d / %d bytes)", len(a.payload), len(b.payload))
			}
		})
	}
}

func TestEnglishTextIDRoutingMatchesGerman(t *testing.T) {
	var payloads [][]byte
	for _, path := range []string{"../../../data/C64/d64/Soul Crystal SideA2.d64", "../../../data/c64_en/SoulCrystalA2.d64"} {
		raw, err := os.ReadFile(path)
		if err != nil {
			t.Fatal(err)
		}
		roots, err := rootsAtOffset(raw, 0x0e00)
		if err != nil {
			t.Fatal(err)
		}
		payload, err := extractChain(raw, roots[9])
		if err != nil {
			t.Fatal(err)
		}
		if payload[0] != 0 || payload[1] != 0x0a {
			t.Fatal("unexpected engine load address")
		}
		payloads = append(payloads, payload)
	}
	// Native message dispatch, range selection, side checks and common-tail routing.
	const start = 0x3c02 - 0x0a00 + 2
	const end = 0x4002 - 0x0a00 + 2
	if !bytes.Equal(payloads[0][start:end], payloads[1][start:end]) {
		t.Fatal("English text-ID routing differs")
	}
}
