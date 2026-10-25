package main

import (
	"encoding/json"
	"os"
	"path/filepath"
	"strconv"
	"testing"
)

// Frozen oracle from Code/Kernal entry 0x2a0 under machine68k 0.4.1 (Musashi).
// A0=packed record, A1=output, A2=TAB, D0=decoded length. All 636 records
// returned normally and matched the Go export byte-for-byte.
func TestOriginal68000Output(t *testing.T) {
	root := "../../../data/Amiga/extracted"
	b, err := os.ReadFile(filepath.Join(root, "Disk 3/Code/Main"))
	if err != nil {
		t.Fatal(err)
	}
	data, err := mainData(b)
	if err != nil {
		t.Fatal(err)
	}
	oracle, err := os.ReadFile("testdata/native_sha256.json")
	if err != nil {
		t.Fatal(err)
	}
	var expected map[string]string
	if err = json.Unmarshal(oracle, &expected); err != nil {
		t.Fatal(err)
	}
	seen := map[int]bool{}
	for _, s := range specs {
		a, err := extract(root, s, data)
		if err != nil {
			t.Fatal(err)
		}
		for _, r := range a.Records {
			if seen[r.ID] {
				t.Fatalf("duplicate ID %d", r.ID)
			}
			seen[r.ID] = true
			if r.SHA256 != expected[strconv.Itoa(r.ID)] {
				t.Fatalf("native mismatch: %s ID %d", s.Name, r.ID)
			}
		}
	}
	if len(seen) != 636 || len(expected) != 636 {
		t.Fatal("incomplete native coverage")
	}
	for id := 1; id <= 636; id++ {
		if !seen[id] {
			t.Fatalf("missing ID %d", id)
		}
	}
}
func TestMalformedInputs(t *testing.T) {
	if _, err := tree([]byte{0, 3}); err == nil {
		t.Fatal("accepted truncated table")
	}
	// Third node points to itself, which would make decoding loop indefinitely.
	if _, err := tree([]byte{0, 3, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 0, 66, 0, 3, 0, 2, 0, 0}); err == nil {
		t.Fatal("accepted cyclic table")
	}
	nodes := []node{{Value: 65}, {Value: 66}, {Left: 1, Right: 2}}
	if _, err := decode(nodes, []byte{0}, 9); err == nil {
		t.Fatal("accepted short bitstream")
	}
	if _, err := decode(nodes, []byte{0, 0}, 1); err == nil {
		t.Fatal("accepted trailing byte")
	}
}
