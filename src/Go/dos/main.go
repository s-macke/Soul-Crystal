package main

import (
	"encoding/binary"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

const dataDir = "data/DOS/Soul"

// CP437 subset used by the game, mapped to UTF-8.
func cp437ToUTF8(c byte) string {
	switch c {
	case 0:
		return ""
	case 0x81:
		return "ü"
	case 0x84:
		return "ä"
	case 0x94:
		return "ö"
	case 0x99:
		return "Ö"
	case 0x9A:
		return "Ü"
	case 0xE1:
		return "ß"
	default:
		return string(rune(c))
	}
}

// chunk is the IFF-style chunk header. Sizes are stored big-endian.
type chunk struct {
	Name [4]byte
	Size uint32
}

func (c chunk) NameStr() string {
	return string(c.Name[:])
}

// huffEntry is one node half in the Huffman table.
type huffEntry struct {
	bit   byte
	value byte
}

// archive holds all parsed chunks from one text file.
type archive struct {
	topName string
	formID  string
	hutb    []huffEntry
	body    []byte
	txtl    []uint16
	hufl    []uint16
	room    []uint16
	verbs   []string
	huhd    []byte
}

func readChunk(data []byte, pos int) (chunk, int, error) {
	if pos+8 > len(data) {
		return chunk{}, pos, fmt.Errorf("truncated chunk header at 0x%x", pos)
	}
	var c chunk
	copy(c.Name[:], data[pos:pos+4])
	c.Size = binary.BigEndian.Uint32(data[pos+4 : pos+8])
	return c, pos + 8, nil
}

func parseArchive(data []byte) (*archive, error) {
	a := &archive{}

	// Top-level header.
	top, pos, err := readChunk(data, 0)
	if err != nil {
		return nil, err
	}
	a.topName = top.NameStr()

	// Fixed 4-byte form identifier.
	if pos+4 > len(data) {
		return nil, fmt.Errorf("truncated form ID")
	}
	a.formID = string(data[pos : pos+4])
	pos += 4

	// Subchunks.
	for pos < len(data) {
		c, next, err := readChunk(data, pos)
		if err != nil {
			break
		}
		pos = next
		realSize := int(c.Size)
		padded := realSize
		if padded&1 != 0 {
			padded++
		}
		if pos+padded > len(data) {
			break
		}
		payload := data[pos : pos+realSize]

		switch c.NameStr() {
		case "HUHD":
			a.huhd = append([]byte{}, payload...)
		case "HUTB":
			for i := 0; i+1 < len(payload); i += 2 {
				a.hutb = append(a.hutb, huffEntry{bit: payload[i], value: payload[i+1]})
			}
		case "BODY":
			a.body = append([]byte{}, payload...)
		case "TXTL":
			for i := 0; i+1 < len(payload); i += 2 {
				a.txtl = append(a.txtl, binary.BigEndian.Uint16(payload[i:i+2]))
			}
		case "HUFL":
			for i := 0; i+1 < len(payload); i += 2 {
				a.hufl = append(a.hufl, binary.BigEndian.Uint16(payload[i:i+2]))
			}
		case "ROOM":
			for i := 0; i+1 < len(payload); i += 2 {
				a.room = append(a.room, binary.BigEndian.Uint16(payload[i:i+2]))
			}
		case "VERB":
			for i := 0; i+16 <= len(payload); i += 16 {
				var s strings.Builder
				for j := 0; j < 16; j++ {
					s.WriteString(cp437ToUTF8(payload[i+j]))
				}
				a.verbs = append(a.verbs, s.String())
			}
		}

		pos += padded
	}

	return a, nil
}

// decodeChar reads one Huffman-coded character from the bit stream.
func decodeChar(hutb []huffEntry, body []byte, bytePos *int, bitPos *int) byte {
	half := len(hutb) / 2
	pos := half - 1

	for {
		bit := (body[*bytePos] >> *bitPos) & 1

		lo := hutb[pos]
		hi := hutb[half+pos]

		if bit == 0 && lo.bit == 0 {
			return lo.value
		}
		if bit == 1 && hi.bit == 0 {
			return hi.value
		}

		if bit == 0 {
			pos = int(lo.value)
		} else {
			pos = int(hi.value)
		}

		*bitPos--
		if *bitPos < 0 {
			*bytePos++
			*bitPos = 7
		}
	}
}

// decodeBody decodes all Huffman-compressed strings from the BODY chunk.
func decodeBody(a *archive) []string {
	if len(a.hutb) == 0 || len(a.body) == 0 {
		return nil
	}

	var result []string
	var cur strings.Builder
	bytePos := 0
	bitPos := 7

	for bytePos < len(a.body) {
		ch := decodeChar(a.hutb, a.body, &bytePos, &bitPos)
		if ch == 0 {
			result = append(result, cur.String())
			cur.Reset()
			// Byte-align before next string.
			bitPos = 0
		} else {
			cur.WriteString(cp437ToUTF8(ch))
		}

		bitPos--
		if bitPos < 0 {
			bytePos++
			bitPos = 7
		}
	}
	if cur.Len() > 0 {
		result = append(result, cur.String())
	}

	return result
}

// decodeObjects reads the XOR-encoded object name table.
func decodeObjects(path string) ([]string, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}

	var objects []string
	for i := 0; i+16 <= len(data); i += 16 {
		var s strings.Builder
		for j := 0; j < 16; j++ {
			s.WriteString(cp437ToUTF8(data[i+j] ^ 0xAA))
		}
		objects = append(objects, s.String())
	}
	return objects, nil
}

var textFiles = []string{
	"PARTA.TXT",
	"PARTB.TXT",
	"PARTC.TXT",
	"PARTD.TXT",
	"COMMN.TXT",
	"RAM.TXT",
	"VERBS.TXT",
}

func main() {
	outDir := "texts/DOS"
	if err := os.MkdirAll(outDir, 0o755); err != nil {
		panic(err)
	}

	// Objects.
	objects, err := decodeObjects(filepath.Join(dataDir, "OBJECTS.TXT"))
	if err != nil {
		fmt.Fprintf(os.Stderr, "OBJECTS.TXT: %v\n", err)
		os.Exit(1)
	}
	var ob strings.Builder
	ob.WriteString("# Objects\n\n")
	for i, name := range objects {
		fmt.Fprintf(&ob, "%3d: %s\n", i, name)
	}
	outPath := filepath.Join(outDir, "objects.txt")
	if err := os.WriteFile(outPath, []byte(ob.String()), 0o644); err != nil {
		panic(err)
	}
	fmt.Printf("%s (%d objects)\n", outPath, len(objects))

	// Text archives.
	for _, name := range textFiles {
		data, err := os.ReadFile(filepath.Join(dataDir, name))
		if err != nil {
			fmt.Fprintf(os.Stderr, "%s: %v\n", name, err)
			continue
		}

		a, err := parseArchive(data)
		if err != nil {
			fmt.Fprintf(os.Stderr, "%s: %v\n", name, err)
			continue
		}

		base := strings.TrimSuffix(name, filepath.Ext(name))
		var out strings.Builder
		fmt.Fprintf(&out, "# %s\n\n", base)
		fmt.Fprintf(&out, "Container: %s / %s\n\n", a.topName, a.formID)

		if len(a.verbs) > 0 {
			out.WriteString("## Verbs\n\n")
			for i, v := range a.verbs {
				fmt.Fprintf(&out, "%3d: %s\n", i, v)
			}
			out.WriteByte('\n')
		}

		if len(a.room) > 0 {
			out.WriteString("## Rooms\n\n")
			for i, r := range a.room {
				fmt.Fprintf(&out, "%3d: %d\n", i, r)
			}
			out.WriteByte('\n')
		}

		texts := decodeBody(a)
		if len(texts) > 0 {
			out.WriteString("## Texts\n\n")
			for i, s := range texts {
				fmt.Fprintf(&out, "### %03d\n\n%s\n\n", i, s)
			}
		}

		outPath := filepath.Join(outDir, base+".txt")
		if err := os.WriteFile(outPath, []byte(out.String()), 0o644); err != nil {
			panic(err)
		}
		fmt.Printf("%s: %d texts, %d verbs, %d rooms\n", outPath, len(texts), len(a.verbs), len(a.room))
	}
}