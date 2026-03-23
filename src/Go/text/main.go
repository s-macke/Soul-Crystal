package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

const d64Size = 174848

type diskRange struct {
	name    string
	path    string
	lastIdx int
}

var knownRanges = []diskRange{
	{"B1", "data/C64/d64/Soul Crystal SideB1.d64", 311},
	{"B2", "data/C64/d64/Soul Crystal SideB2.d64", 447},
	{"C1", "data/C64/d64/Soul Crystal SideC1.d64", 290},
	{"C2", "data/C64/d64/Soul Crystal SideC2.d64", 434},
}

var soulToASCII = []string{
	" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
	" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
	" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
	" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
	" ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
	"p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "ä", "ö", "ü", "[", "]",
	" ", "!", "\"", "#", "$", " ", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/",
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?",
	" ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
	"P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "Ä", "Ö", "Ü", "ß", "[",
	" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
	" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
	" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
	" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
	" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
	" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
}

func d64Pos(track, sector, b int) (int, bool) {
	switch {
	case 1 <= track && track <= 17:
		return ((track-1)*21+sector)*256 + b, true
	case 18 <= track && track <= 24:
		return (17*21+(track-18)*19+sector)*256 + b, true
	case 25 <= track && track <= 30:
		return (17*21+7*19+(track-25)*18+sector)*256 + b, true
	case 31 <= track && track <= 35:
		return (17*21+7*19+6*18+(track-31)*17+sector)*256 + b, true
	default:
		return 0, false
	}
}

func pointerOffset(buf []byte, idx int) (int, error) {
	base := 0x300 + idx*3
	if base+2 >= len(buf) {
		return 0, fmt.Errorf("pointer index %d out of range", idx)
	}
	pos, ok := d64Pos(int(buf[base]), int(buf[base+1]), int(buf[base+2]))
	if !ok {
		return 0, fmt.Errorf("invalid pointer at index %d", idx)
	}
	return pos, nil
}

func decodeChar(buf []byte, bytePos *int, bitPos *int) byte {
	pos := 0
	for {
		bit := (buf[*bytePos] >> *bitPos) & 1
		a := buf[0x200+pos]
		b := buf[0x280+pos]

		if bit == 1 && a >= 128 {
			return a
		}
		if bit == 0 && b >= 128 {
			return b
		}
		if bit == 1 {
			pos = int(a)
		} else {
			pos = int(b)
		}

		*bitPos--
		if *bitPos == -1 {
			*bytePos++
			*bitPos = 7
		}
	}
}

func soulChar(v byte) string {
	idx := int(v) - 0x40
	if idx < 0 || idx >= len(soulToASCII) {
		return " "
	}
	return soulToASCII[idx]
}

func decodeString(buf []byte, idx int) (string, error) {
	pos, err := pointerOffset(buf, idx)
	if err != nil {
		return "", err
	}
	bytePos := pos + 4
	bitPos := 7
	n := 0x10000 - int(buf[pos+2]) - int(buf[pos+3])<<8

	var out strings.Builder
	for i := 0; i < n; i++ {
		out.WriteString(soulChar(decodeChar(buf, &bytePos, &bitPos)))
		bitPos--
		if bitPos == -1 {
			bytePos++
			bitPos = 7
		}
		if (i+1)%40 == 0 && i+1 < n {
			out.WriteByte('\n')
		}
	}
	lines := strings.Split(out.String(), "\n")
	for i, line := range lines {
		lines[i] = strings.Join(strings.Fields(line), " ")
	}
	return strings.TrimSpace(strings.Join(lines, "\n")), nil
}

func main() {
	if err := os.MkdirAll("texts", 0o755); err != nil {
		panic(err)
	}

	for _, disk := range knownRanges {
		buf, err := os.ReadFile(disk.path)
		if err != nil {
			panic(err)
		}
		if len(buf) != d64Size {
			panic(fmt.Errorf("%s has unexpected size %d", disk.path, len(buf)))
		}

		outPath := filepath.Join("texts", disk.name+".md")
		f, err := os.Create(outPath)
		if err != nil {
			panic(err)
		}

		w := bufio.NewWriter(f)
		if _, err := fmt.Fprintf(w, "# %s Texts\n\n", disk.name); err != nil {
			panic(err)
		}
		for idx := 0; idx <= disk.lastIdx; idx++ {
			s, err := decodeString(buf, idx)
			if err != nil {
				panic(err)
			}
			if _, err := fmt.Fprintf(w, "## %03d\n\n%s\n\n", idx, s); err != nil {
				panic(err)
			}
		}
		if err := w.Flush(); err != nil {
			panic(err)
		}
		if err := f.Close(); err != nil {
			panic(err)
		}
		fmt.Println(outPath)
	}
}
