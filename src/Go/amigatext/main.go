// Export the Amiga Huffman text archives, using lengths embedded in Code/Main.
package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/binary"
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

const sourceRoot = "data/Amiga/extracted"
const mainHash = "cc74c2f3ce20ac1445d5c53382c6ac4baae6e40160d88173df54cd469b82449c"

type archiveSpec struct {
	Name                                      string
	Disk, Decoded, Packed, First, Last, Extra int
}

var specs = []archiveSpec{
	{"RAMCommon", 3, 0x10, 0x20a, 1, 106, 580},
	{"DiskA", 2, 0x3ed, 0x4ea, 107, 168, 620},
	{"DiskB", 3, 0x5da, 0x8f9, 169, 355, 621},
	{"DiskC", 2, 0xbe6, 0xc98, 356, 397, 0},
	{"DiskD", 4, 0xd40, 0x1029, 398, 579, 633},
}

type node struct{ Left, Right, Value uint16 }
type record struct {
	ID     int    `json:"id"`
	Offset int    `json:"source_offset"`
	Packed int    `json:"packed_bytes"`
	Length int    `json:"decoded_bytes"`
	SHA256 string `json:"decoded_sha256"`
	Text   string `json:"text"`
}
type archive struct {
	Source       string   `json:"source"`
	SourceSHA256 string   `json:"source_sha256"`
	TableSHA256  string   `json:"table_sha256"`
	MainSHA256   string   `json:"main_sha256"`
	Records      []record `json:"records"`
}

func hash(b []byte) string { return fmt.Sprintf("%x", sha256.Sum256(b)) }

// Offsets are specific to this verified executable. Its first HUNK_DATA contains
// NUL-terminated decimal BASIC DATA values for decoded and packed record lengths.
func mainData(b []byte) ([]byte, error) {
	if hash(b) != mainHash {
		return nil, fmt.Errorf("unsupported Code/Main version (SHA-256 %s)", hash(b))
	}
	if len(b) < 0x1c7ec {
		return nil, fmt.Errorf("truncated Code/Main")
	}
	const start = 0x19dc4
	if binary.BigEndian.Uint32(b[start-8:]) != 1002 || binary.BigEndian.Uint32(b[start-4:]) != 0xa8a {
		return nil, fmt.Errorf("unexpected HUNK_DATA")
	}
	return b[start : start+0x2a28], nil
}
func numbers(b []byte, count int) ([]int, error) {
	var out []int
	for len(b) > 0 && (count < 0 || len(out) < count) {
		end := bytes.IndexByte(b, 0)
		if end < 1 {
			return nil, fmt.Errorf("invalid length table")
		}
		n, err := strconv.Atoi(string(b[:end]))
		if err != nil || n <= 0 || n > 65535 {
			return nil, fmt.Errorf("invalid length %q", b[:end])
		}
		out = append(out, n)
		b = b[end+1:]
	}
	if count >= 0 && len(out) != count {
		return nil, fmt.Errorf("short length table")
	}
	return out, nil
}
func tree(b []byte) ([]node, error) {
	if len(b) < 2 {
		return nil, fmt.Errorf("short TAB")
	}
	n := int(binary.BigEndian.Uint16(b))
	if n < 3 || len(b) != 2+n*6 {
		return nil, fmt.Errorf("invalid TAB length")
	}
	nodes := make([]node, n)
	for i := range nodes {
		p := b[2+i*6:]
		v := node{binary.BigEndian.Uint16(p), binary.BigEndian.Uint16(p[2:]), binary.BigEndian.Uint16(p[4:])}
		// Children precede their parent and are numbered from one.
		if v.Left == 0 && v.Right == 0 {
			if v.Value > 255 {
				return nil, fmt.Errorf("invalid leaf")
			}
		} else if v.Left == 0 || v.Right == 0 || int(v.Left) > i || int(v.Right) > i || v.Value != 0 {
			return nil, fmt.Errorf("invalid node %d", i+1)
		}
		nodes[i] = v
	}
	return nodes, nil
}
func decode(nodes []node, b []byte, size int) ([]byte, error) {
	if size <= 0 || len(nodes) == 0 {
		return nil, fmt.Errorf("invalid decode parameters")
	}
	out := make([]byte, 0, size)
	root := len(nodes) - 1
	pos := root
	for i, v := range b {
		for bit := 7; bit >= 0; bit-- {
			next := nodes[pos].Left
			if (v>>bit)&1 != 0 {
				next = nodes[pos].Right
			}
			if next == 0 || int(next) > len(nodes) {
				return nil, fmt.Errorf("invalid branch")
			}
			pos = int(next) - 1
			if nodes[pos].Left == 0 && nodes[pos].Right == 0 {
				out = append(out, byte(nodes[pos].Value))
				pos = root
				if len(out) == size {
					if i+1 != len(b) {
						return nil, fmt.Errorf("unconsumed packed bytes")
					}
					return out, nil
				}
			}
		}
	}
	return nil, fmt.Errorf("truncated text: decoded %d of %d bytes", len(out), size)
}
func extract(root string, s archiveSpec, data []byte) (archive, error) {
	var a archive
	lengths, err := numbers(data[s.Decoded:s.Packed], -1)
	if err != nil {
		return a, err
	}
	sizes, err := numbers(data[s.Packed:], len(lengths))
	if err != nil {
		return a, err
	}
	path := filepath.Join(fmt.Sprintf("Disk %d", s.Disk), "Data/Texts", s.Name)
	body, err := os.ReadFile(filepath.Join(root, path+".TXT"))
	if err != nil {
		return a, err
	}
	tab, err := os.ReadFile(filepath.Join(root, path+".TAB"))
	if err != nil {
		return a, err
	}
	nodes, err := tree(tab)
	if err != nil {
		return a, err
	}
	a = archive{Source: filepath.ToSlash(path + ".TXT"), SourceSHA256: hash(body), TableSHA256: hash(tab), MainSHA256: mainHash}
	offset := 0
	for i, n := range lengths {
		size := sizes[i]
		if offset+size > len(body) {
			return a, fmt.Errorf("record exceeds TXT")
		}
		raw, err := decode(nodes, body[offset:offset+size], n)
		if err != nil {
			return a, fmt.Errorf("record %d: %w", i, err)
		}
		id := s.First + i
		if id > s.Last {
			if s.Extra == 0 {
				return a, fmt.Errorf("unexpected extra record")
			}
			id = s.Extra + i - (s.Last - s.First + 1)
		}
		// The game font uses Latin-1 for German characters. Preserve layout spaces.
		var text strings.Builder
		for _, v := range raw {
			text.WriteRune(rune(v))
		}
		a.Records = append(a.Records, record{id, offset, size, n, hash(raw), text.String()})
		offset += size
	}
	if offset != len(body) {
		return a, fmt.Errorf("%d trailing TXT bytes", len(body)-offset)
	}
	return a, nil
}
func run() error {
	b, err := os.ReadFile(filepath.Join(sourceRoot, "Disk 3/Code/Main"))
	if err != nil {
		return err
	}
	data, err := mainData(b)
	if err != nil {
		return err
	}
	for _, s := range specs {
		a, err := extract(sourceRoot, s, data)
		if err != nil {
			return fmt.Errorf("%s: %w", s.Name, err)
		}
		dir := filepath.Join("texts/Amiga", fmt.Sprintf("Disk %d", s.Disk))
		if err = os.MkdirAll(dir, 0755); err != nil {
			return err
		}
		var text strings.Builder
		fmt.Fprintf(&text, "# %s — Amiga\n\nQuelle: %s\nText-IDs aus Code/Main; originale Abstände bleiben erhalten.\n\n", s.Name, a.Source)
		for _, r := range a.Records {
			fmt.Fprintf(&text, "## %03d\n\n%s\n\n", r.ID, r.Text)
		}
		if err = os.WriteFile(filepath.Join(dir, s.Name+".txt"), []byte(text.String()), 0644); err != nil {
			return err
		}
		j, err := json.MarshalIndent(a, "", "  ")
		if err != nil {
			return err
		}
		if err = os.WriteFile(filepath.Join(dir, s.Name+".json"), append(j, '\n'), 0644); err != nil {
			return err
		}
		fmt.Printf("%s: %d texts\n", s.Name, len(a.Records))
	}
	return nil
}
func main() {
	if err := run(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}
