// Extract standard 880 KiB AmigaDOS OFS images without external dependencies.
// Run from the repository root: go run src/Go/amiga/main.go
// Layout reference: amitools fs/block/{FileHeaderBlock,FileDataBlock,UserDirBlock}.py.
package main

import (
	"crypto/sha256"
	"encoding/binary"
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

type record struct {
	Path   string `json:"path"`
	Size   int    `json:"size"`
	SHA256 string `json:"sha256"`
}
type inventory struct {
	Source    string   `json:"source"`
	Directory string   `json:"directory"`
	SHA256    string   `json:"sha256"`
	Volume    string   `json:"volume"`
	Files     []record `json:"files"`
}
type disk struct {
	data []byte
	used map[uint32]bool
}

func word(b []byte, n int) uint32 { return binary.BigEndian.Uint32(b[n*4 : n*4+4]) }
func hash(b []byte) string        { return fmt.Sprintf("%x", sha256.Sum256(b)) }
func (d *disk) block(n uint32) ([]byte, error) {
	if n < 2 || n >= uint32(len(d.data)/512) {
		return nil, fmt.Errorf("invalid block %d", n)
	}
	if d.used[n] {
		return nil, fmt.Errorf("duplicate or cyclic block %d", n)
	}
	d.used[n] = true
	b := d.data[int(n)*512 : int(n+1)*512]
	var sum uint32
	for i := 0; i < 128; i++ {
		sum += word(b, i)
	}
	if sum != 0 {
		return nil, fmt.Errorf("block %d checksum mismatch", n)
	}
	return b, nil
}
func name(b []byte) (string, error) {
	n := int(b[432])
	if n == 0 || n > 30 {
		return "", fmt.Errorf("invalid name length %d", n)
	}
	var s strings.Builder
	for _, c := range b[433 : 433+n] {
		s.WriteRune(rune(c))
	}
	v := s.String()
	if v == "." || v == ".." || strings.ContainsAny(v, "/\\:\x00") {
		return "", fmt.Errorf("unsafe name %q", v)
	}
	return v, nil
}
func (d *disk) file(header []byte, owner uint32) ([]byte, error) {
	size := word(header, 81)
	if size > uint32(len(d.data)) {
		return nil, fmt.Errorf("invalid file size %d", size)
	}
	out := make([]byte, 0, int(size))
	seq := uint32(1)
	for n := word(header, 4); n != 0; seq++ {
		b, err := d.block(n)
		if err != nil {
			return nil, err
		}
		if word(b, 0) != 8 || word(b, 1) != owner || word(b, 2) != seq {
			return nil, fmt.Errorf("invalid data block %d owner/sequence/type", n)
		}
		count := word(b, 3)
		if count > 488 || uint32(len(out))+count > size {
			return nil, fmt.Errorf("invalid data length at block %d", n)
		}
		out = append(out, b[24:24+int(count)]...)
		n = word(b, 4)
	}
	if uint32(len(out)) != size {
		return nil, fmt.Errorf("file size mismatch: %d != %d", len(out), size)
	}
	return out, nil
}
func (d *disk) directory(b []byte, parent uint32, rel, dest string, files *[]record) error {
	for i := 6; i < 78; i++ {
		for n := word(b, i); n != 0; {
			entry, err := d.block(n)
			if err != nil {
				return err
			}
			if word(entry, 0) != 2 || word(entry, 1) != n || word(entry, 125) != parent {
				return fmt.Errorf("invalid entry block %d", n)
			}
			leaf, err := name(entry)
			if err != nil {
				return err
			}
			path := filepath.Join(rel, leaf)
			target := filepath.Join(dest, path)
			switch int32(word(entry, 127)) {
			case 2:
				if err = os.Mkdir(target, 0755); err != nil {
					return err
				}
				if err = d.directory(entry, n, path, dest, files); err != nil {
					return err
				}
			case -3:
				data, err := d.file(entry, n)
				if err != nil {
					return fmt.Errorf("%s: %w", path, err)
				}
				f, err := os.OpenFile(target, os.O_WRONLY|os.O_CREATE|os.O_EXCL, 0644)
				if err != nil {
					return err
				}
				_, err = f.Write(data)
				cerr := f.Close()
				if err != nil {
					return err
				}
				if cerr != nil {
					return cerr
				}
				*files = append(*files, record{filepath.ToSlash(path), len(data), hash(data)})
			default:
				return fmt.Errorf("unsupported entry type %d", int32(word(entry, 127)))
			}
			n = word(entry, 124)
		}
	}
	return nil
}
func extract(source, dest, directory string) (inventory, error) {
	inv := inventory{Source: source, Directory: directory}
	data, err := os.ReadFile(source)
	if err != nil {
		return inv, err
	}
	if len(data) != 901120 || string(data[:4]) != "DOS\x00" {
		return inv, fmt.Errorf("expected 880 KiB DOS0/OFS image")
	}
	inv.SHA256 = hash(data)
	d := disk{data, make(map[uint32]bool)}
	root, err := d.block(880)
	if err != nil {
		return inv, err
	}
	if word(root, 0) != 2 || word(root, 3) != 72 || word(root, 127) != 1 {
		return inv, fmt.Errorf("invalid root block")
	}
	inv.Volume, err = name(root)
	if err != nil {
		return inv, err
	}
	target := filepath.Join(dest, directory)
	if err = os.Mkdir(target, 0755); err != nil {
		return inv, err
	}
	err = d.directory(root, 880, "", target, &inv.Files)
	return inv, err
}
func run() error {
	input := flag.String("input", "data/Amiga", "ADF source directory")
	output := flag.String("output", "data/Amiga/extracted", "new extraction directory (must not exist)")
	flag.Parse()
	// Use one complete set, rather than extracting duplicate crack variants.
	var sources []string
	for n := 1; n <= 4; n++ {
		source := filepath.Join(*input, fmt.Sprintf("Soul Crystal (1992)(Starbyte)(Disk %d of 4).adf", n))
		if _, err := os.Stat(source); err != nil {
			return err
		}
		sources = append(sources, source)
	}
	if err := os.Mkdir(*output, 0755); err != nil {
		return err
	}
	var all []inventory
	for i, source := range sources {
		directory := fmt.Sprintf("Disk %d", i+1)
		inv, err := extract(source, *output, directory)
		if err != nil {
			return fmt.Errorf("%s: %w", source, err)
		}
		all = append(all, inv)
		fmt.Printf("%s: %s, %d files\n", directory, inv.Volume, len(inv.Files))
	}
	data, err := json.MarshalIndent(all, "", "  ")
	if err != nil {
		return err
	}
	return os.WriteFile(filepath.Join(*output, "manifest.json"), append(data, '\n'), 0644)
}
func main() {
	if err := run(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}
