package main

import (
	"bytes"
	"os"
	"path/filepath"
	"strings"
	"testing"
)

func originalArchive(t *testing.T, name string) ([]byte, *archive) {
	t.Helper()
	b, err := os.ReadFile(filepath.Join("../../..", dataDir, name+".TXT"))
	if err != nil {
		t.Fatal(err)
	}
	a, err := parseArchive(b)
	if err != nil {
		t.Fatal(err)
	}
	return b, a
}

func TestBothOriginalTextBlocks(t *testing.T) {
	cases := []struct {
		name   string
		counts []int
	}{
		{"PARTA", []int{63, 15}}, {"PARTB", []int{199, 35}},
		{"PARTC", []int{42, 15}}, {"PARTD", []int{186, 38}},
		{"COMMN", []int{122}}, {"RAM", []int{35}},
	}
	total := 0
	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			_, a := originalArchive(t, tc.name)
			if len(a.blocks) != len(tc.counts) {
				t.Fatalf("lost BODY block: %d", len(a.blocks))
			}
			for i, want := range tc.counts {
				texts, err := decodeBody(a, a.blocks[i])
				if err != nil {
					t.Fatal(err)
				}
				if len(texts) != want {
					t.Fatalf("block %d: %d records, want %d", i, len(texts), want)
				}
				total += len(texts)
				// The primary block starts with a room description, not its short title.
				if i == 0 && strings.HasPrefix(tc.name, "PART") && len(texts[0]) < 100 {
					t.Fatal("primary block contains a title instead of game text")
				}
				if tc.name == "PARTA" && i == 0 && !strings.HasPrefix(texts[0], "Du befindest Dich in Deinem kleinen") {
					t.Fatal(texts[0])
				}
				if tc.name == "PARTA" && i == 1 && texts[0] != "Im Gästezimmer" {
					t.Fatal(texts[0])
				}
			}
		})
	}
	if total != 750 {
		t.Fatalf("got %d texts, want 750", total)
	}
}

func TestDecodeUsesHUFLAndValidatesTXTL(t *testing.T) {
	a := &archive{hutb: []huffEntry{{0, 'A'}, {0, 0}}}
	// First byte is not part of a record. Each indexed record encodes A,NUL.
	block := textBlock{body: []byte{0xff, 0x40, 0x40}, hufl: []uint16{1, 2}, txtl: []uint16{2, 2}}
	texts, err := decodeBody(a, block)
	if err != nil || len(texts) != 2 || texts[0] != "A" || texts[1] != "A" {
		t.Fatal(texts, err)
	}
	block.txtl = []uint16{3, 2}
	if _, err = decodeBody(a, block); err == nil {
		t.Fatal("accepted early NUL")
	}
	block.txtl = []uint16{1, 2}
	if _, err = decodeBody(a, block); err == nil {
		t.Fatal("accepted missing final NUL")
	}
	block.txtl = []uint16{2, 2}
	block.hufl = []uint16{1, 4}
	if _, err = decodeBody(a, block); err == nil {
		t.Fatal("accepted offset outside BODY")
	}
	block.hufl = []uint16{1, 2}
	block.body = []byte{0xff, 0, 0x40}
	block.txtl = []uint16{9, 2}
	if _, err = decodeBody(a, block); err == nil {
		t.Fatal("read past compressed record boundary")
	}
}

func TestRejectsLostOrTruncatedBody(t *testing.T) {
	b, _ := originalArchive(t, "PARTA")
	if _, err := parseArchive(b[:len(b)-1]); err == nil {
		t.Fatal("accepted truncated archive")
	}
	// Dropping the first BODY must fail even though room titles remain intact.
	damaged := append([]byte(nil), b...)
	pos := bytes.Index(damaged, []byte("BODY"))
	if pos < 0 {
		t.Fatal("fixture lacks BODY")
	}
	copy(damaged[pos:pos+4], "JUNK")
	if _, err := parseArchive(damaged); err == nil {
		t.Fatal("accepted missing primary BODY")
	}
}
