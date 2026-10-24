package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/binary"
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"testing"
)

// Oracle: Code/Kernal from unlabelled disk 1, emulated with machine68k
// 0.4.1 (Musashi), entry 0; A0=packed input, D0=packed size, A3=output.
// All 51 blocks in the 13 unlabelled PICs matched the native routine.
// These frozen hashes are from the emulated output, not from this decoder.
func TestOriginal68000Output(t *testing.T) {
	b, err := os.ReadFile("testdata/native_raw_sha256.json")
	if err != nil {
		t.Fatal(err)
	}
	var expected map[string]string
	if err = json.Unmarshal(b, &expected); err != nil {
		t.Fatal(err)
	}
	paths, err := filepath.Glob("../../../data/Amiga/extracted/*/Data/Graphic/*.PIC")
	if err != nil {
		t.Fatal(err)
	}
	if len(paths) == 0 {
		t.Fatal("extract the Amiga ADFs before running this fixture test")
	}
	seen := map[string]bool{}
	for _, path := range paths {
		t.Run(filepath.Base(filepath.Dir(filepath.Dir(filepath.Dir(path))))+"/"+filepath.Base(path), func(t *testing.T) {
			b, err := os.ReadFile(path)
			if err != nil {
				t.Fatal(err)
			}
			raw, err := blocks(b)
			if err != nil {
				t.Fatal(err)
			}
			want, ok := expected[filepath.Base(path)]
			if !ok {
				t.Fatal("missing native oracle")
			}
			got := fmt.Sprintf("%x", sha256.Sum256(bytes.Join(raw, nil)))
			if got != want {
				t.Fatalf("native mismatch: %s != %s", got, want)
			}
			l := layouts[filepath.Base(path)]
			p, err := palette(path, l)
			if err != nil {
				t.Fatal(err)
			}
			if _, err = render(raw, l, p); err != nil {
				t.Fatal(err)
			}
			seen[filepath.Base(path)] = true
		})
	}
	if len(seen) != len(expected) {
		t.Fatalf("covered %d of %d native fixtures", len(seen), len(expected))
	}
}
func TestMalformedBlocks(t *testing.T) {
	paths, _ := filepath.Glob("../../../data/Amiga/extracted/Disk 1/Data/Graphic/Title.PIC")
	if len(paths) != 1 {
		t.Fatal("missing title fixture")
	}
	valid, err := os.ReadFile(paths[0])
	if err != nil {
		t.Fatal(err)
	}
	brokenFooter := append([]byte(nil), valid...)
	n := int(binary.BigEndian.Uint32(valid[4:]))
	brokenFooter[8+n-1] = 32
	oversized := append([]byte(nil), valid...)
	binary.BigEndian.PutUint32(oversized[4:], 0xffffffff)
	cases := [][]byte{nil, {1, 2, 3}, make([]byte, 9), valid[:len(valid)-1], brokenFooter, oversized}
	for i, b := range cases {
		if _, err := blocks(b); err == nil {
			t.Errorf("case %d accepted malformed input", i)
		}
	}
}

// Same original 68000 oracle as TestOriginal68000Output, now covering all
// 191 compressed blocks in the seven GFX archives. Hashes concatenate each
// archive's decoded records in file order, before rendering or cropping.
func TestGFXOriginal68000Output(t *testing.T) {
	b, err := os.ReadFile("testdata/native_gfx_sha256.json")
	if err != nil {
		t.Fatal(err)
	}
	var expected map[string]string
	if err = json.Unmarshal(b, &expected); err != nil {
		t.Fatal(err)
	}
	input := "../../../data/Amiga/extracted"
	data, err := mainData(input)
	if err != nil {
		t.Fatal(err)
	}
	paths, err := filepath.Glob(filepath.Join(input, "*", "Data/Graphic/*.GFX"))
	if err != nil {
		t.Fatal(err)
	}
	seen := map[string]bool{}
	for _, path := range paths {
		t.Run(filepath.Base(filepath.Dir(filepath.Dir(filepath.Dir(path))))+"/"+filepath.Base(path), func(t *testing.T) {
			b, err := os.ReadFile(path)
			if err != nil {
				t.Fatal(err)
			}
			name := filepath.Base(path)
			var raw []byte
			if len(name) >= 4 && name[:4] == "Disk" {
				assets, err := roomAssets(b, data, name)
				if err != nil {
					t.Fatal(err)
				}
				for _, a := range assets {
					raw = append(raw, a.raw...)
				}
				counts := map[string]int{"DiskA.GFX": 18, "DiskB.GFX": 44, "DiskC.GFX": 20, "DiskD.GFX": 51}
				if len(assets) != counts[name] {
					t.Fatal("wrong room record count")
				}
			} else {
				if _, err := otherGFX(path, b); err != nil {
					t.Fatal(err)
				}
				if name == "Menu.GFX" {
					b = b[456:]
				}
				chunks, err := blocks(b)
				if err != nil {
					t.Fatal(err)
				}
				raw = bytes.Join(chunks, nil)
			}
			want, ok := expected[name]
			if !ok {
				t.Fatal("missing native GFX oracle")
			}
			if got := fmt.Sprintf("%x", sha256.Sum256(raw)); got != want {
				t.Fatalf("native GFX mismatch: %s != %s", got, want)
			}
			seen[name] = true
		})
	}
	if len(seen) != len(expected) {
		t.Fatalf("covered %d of %d GFX fixtures", len(seen), len(expected))
	}
}
