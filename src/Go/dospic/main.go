package main

import (
	"encoding/binary"
	"fmt"
	"image"
	"image/color"
	"image/png"
	"os"
	"path/filepath"
	"strings"
)

const (
	dataDir = "data/DOS/Soul"
	outDir  = "images/DOS"
)

// Standard EGA 16-color palette (fallback for images without embedded palette).
var defaultEGA = color.Palette{
	color.RGBA{0x00, 0x00, 0x00, 0xff},
	color.RGBA{0x00, 0x00, 0xaa, 0xff},
	color.RGBA{0x00, 0xaa, 0x00, 0xff},
	color.RGBA{0x00, 0xaa, 0xaa, 0xff},
	color.RGBA{0xaa, 0x00, 0x00, 0xff},
	color.RGBA{0xaa, 0x00, 0xaa, 0xff},
	color.RGBA{0xaa, 0x55, 0x00, 0xff},
	color.RGBA{0xaa, 0xaa, 0xaa, 0xff},
	color.RGBA{0x55, 0x55, 0x55, 0xff},
	color.RGBA{0x55, 0x55, 0xff, 0xff},
	color.RGBA{0x55, 0xff, 0x55, 0xff},
	color.RGBA{0x55, 0xff, 0xff, 0xff},
	color.RGBA{0xff, 0x55, 0x55, 0xff},
	color.RGBA{0xff, 0x55, 0xff, 0xff},
	color.RGBA{0xff, 0xff, 0x55, 0xff},
	color.RGBA{0xff, 0xff, 0xff, 0xff},
}

// iff chunk: 4-byte name + 4-byte big-endian size.
type chunk struct {
	name string
	data []byte
}

func parseChunks(data []byte) (formType string, chunks []chunk, err error) {
	if len(data) < 12 || string(data[:4]) != "FORM" {
		return "", nil, fmt.Errorf("not a FORM container")
	}
	formType = string(data[8:12])
	pos := 12
	for pos+8 <= len(data) {
		name := string(data[pos : pos+4])
		size := int(binary.BigEndian.Uint32(data[pos+4 : pos+8]))
		pos += 8
		if pos+size > len(data) {
			break
		}
		chunks = append(chunks, chunk{name, data[pos : pos+size]})
		pos += size
		if pos&1 != 0 {
			pos++ // pad to even
		}
	}
	return formType, chunks, nil
}

func findChunk(chunks []chunk, name string) []byte {
	for _, c := range chunks {
		if c.name == name {
			return c.data
		}
	}
	return nil
}

// parseOFFS returns image offsets from the 1024-byte OFFS table.
func parseOFFS(offs []byte) []uint32 {
	if len(offs) < 1024 {
		return nil
	}
	// Lower 128 entries (bytes 0-511) are offsets into BODY data.
	var offsets []uint32
	for i := 0; i < 512; i += 4 {
		v := binary.BigEndian.Uint32(offs[i : i+4])
		offsets = append(offsets, v)
	}
	return offsets
}

// imageCount determines how many images the OFFS table contains.
func imageCount(offsets []uint32) int {
	// Offset[0] == 0 is valid (first image). Count until we hit 0 after a non-zero.
	if len(offsets) == 0 {
		return 0
	}
	n := 1
	for n < len(offsets) && offsets[n] != 0 {
		n++
	}
	return n
}

// decompressByteRun1 decompresses PackBits/ByteRun1 data.
func decompressByteRun1(src []byte) []byte {
	var out []byte
	i := 0
	for i < len(src) {
		n := int(int8(src[i]))
		i++
		if n >= 0 {
			count := n + 1
			if i+count > len(src) {
				break
			}
			out = append(out, src[i:i+count]...)
			i += count
		} else if n != -128 {
			if i >= len(src) {
				break
			}
			count := 1 - n
			b := src[i]
			i++
			for j := 0; j < count; j++ {
				out = append(out, b)
			}
		}
	}
	return out
}

// parsePalette48 reads a 16-color palette (48 bytes, 3 bytes per color).
// Values are VGA DAC values scaled: stored_value/4 gives 6-bit DAC value.
// We expand to 8-bit by: v | (v >> 6).
func parsePalette48(data []byte) color.Palette {
	pal := make(color.Palette, 16)
	for i := 0; i < 16; i++ {
		r := data[i*3+0]
		g := data[i*3+1]
		b := data[i*3+2]
		pal[i] = color.RGBA{r | (r >> 6), g | (g >> 6), b | (b >> 6), 0xff}
	}
	return pal
}

// renderEGA converts 4-plane interleaved scanline data to a paletted image.
// planeW = width/8 bytes per plane per scanline.
func renderEGA(raw []byte, w, h int, pal color.Palette) *image.Paletted {
	planeW := w / 8
	bytesPerRow := planeW * 4
	img := image.NewPaletted(image.Rect(0, 0, w, h), pal)
	for y := 0; y < h; y++ {
		row := y * bytesPerRow
		for x := 0; x < w; x++ {
			byteOff := x / 8
			bit := uint(7 - x%8)
			var idx byte
			for plane := 0; plane < 4; plane++ {
				off := row + plane*planeW + byteOff
				if off < len(raw) {
					idx |= ((raw[off] >> bit) & 1) << plane
				}
			}
			img.SetColorIndex(x, y, idx)
		}
	}
	return img
}

func writePNG(path string, img image.Image) error {
	f, err := os.Create(path)
	if err != nil {
		return err
	}
	defer f.Close()
	return png.Encode(f, img)
}

// extractFont handles FONT.PIC (raw bitmap font, no IFF container).
func extractFont(data []byte) error {
	if len(data) < 8 || data[0] != 0xAA || data[1] != 0x55 {
		return fmt.Errorf("not a font file")
	}
	w := int(binary.LittleEndian.Uint16(data[2:4]))
	h := int(binary.LittleEndian.Uint16(data[4:6]))
	nChars := (len(data) - 8) / h
	fmt.Printf("  font: %dx%d, %d characters\n", w, h, nChars)

	// Render all 256 chars in a 16x16 grid.
	gridW := 16 * (w + 1)
	gridH := 16 * (h + 1)
	pal := color.Palette{
		color.RGBA{0x00, 0x00, 0x00, 0xff},
		color.RGBA{0xff, 0xff, 0xff, 0xff},
	}
	img := image.NewPaletted(image.Rect(0, 0, gridW, gridH), pal)
	for ch := 0; ch < nChars && ch < 256; ch++ {
		ox := (ch % 16) * (w + 1)
		oy := (ch / 16) * (h + 1)
		base := 8 + ch*h
		for row := 0; row < h; row++ {
			if base+row >= len(data) {
				break
			}
			b := data[base+row]
			for bit := 0; bit < w; bit++ {
				if (b>>(7-bit))&1 != 0 {
					img.SetColorIndex(ox+bit, oy+row, 1)
				}
			}
		}
	}
	return writePNG(filepath.Join(outDir, "font.png"), img)
}

// extractSingle handles a file with BODY only (no OFFS), like MENUMAIN.PIC.
func extractSingle(name string, body []byte, w, h, palSize int) error {
	var pal color.Palette
	compressed := body
	if palSize > 0 && len(body) >= palSize {
		pal = parsePalette48(body[:48])
		compressed = body[palSize:]
	} else {
		pal = defaultEGA
	}
	raw := decompressByteRun1(compressed)
	img := renderEGA(raw, w, h, pal)
	return writePNG(filepath.Join(outDir, name+".png"), img)
}

// extractMulti handles files with OFFS+BODY (multiple images).
func extractMulti(name string, offs, body []byte, w, h, palSize int) (int, error) {
	offsets := parseOFFS(offs)
	n := imageCount(offsets)
	if n == 0 {
		return 0, fmt.Errorf("no images in OFFS table")
	}

	for i := 0; i < n; i++ {
		start := int(offsets[i])
		var end int
		if i+1 < n {
			end = int(offsets[i+1])
		} else {
			end = len(body)
		}
		if start >= len(body) || end > len(body) || start >= end {
			continue
		}
		imgData := body[start:end]

		var pal color.Palette
		var compressed []byte
		if palSize > 0 && len(imgData) >= palSize {
			pal = parsePalette48(imgData[:48]) // use first 48 bytes as palette
			compressed = imgData[palSize:]
		} else {
			pal = defaultEGA
			compressed = imgData
		}

		raw := decompressByteRun1(compressed)
		img := renderEGA(raw, w, h, pal)
		outPath := filepath.Join(outDir, fmt.Sprintf("%s_%03d.png", name, i))
		if err := writePNG(outPath, img); err != nil {
			return 0, err
		}
	}
	return n, nil
}

// extractInitial handles INITIAL.PIC (uncompressed 64x64 letter images).
func extractInitial(cont, offs, body []byte) (int, error) {
	offsets := parseOFFS(offs)
	n := imageCount(offsets)
	if n == 0 {
		return 0, fmt.Errorf("no images")
	}

	for i := 0; i < n; i++ {
		start := int(offsets[i])
		var label string
		if i < len(cont) {
			label = string(cont[i])
		} else {
			label = fmt.Sprintf("%d", i)
		}

		const (
			letterW    = 64
			letterH    = 64
			letterSize = letterW / 8 * letterH * 4 // 2048
		)
		if start+letterSize > len(body) {
			continue
		}
		raw := body[start : start+letterSize]

		img := image.NewPaletted(image.Rect(0, 0, letterW, letterH), defaultEGA)
		planeBytes := letterW / 8 // 8 bytes per plane per scanline
		rowBytes := planeBytes * 4
		for y := 0; y < letterH; y++ {
			for x := 0; x < letterW; x++ {
				byteOff := x / 8
				bit := uint(7 - x%8)
				var idx byte
				for plane := 0; plane < 4; plane++ {
					idx |= ((raw[y*rowBytes+plane*planeBytes+byteOff] >> bit) & 1) << plane
				}
				img.SetColorIndex(x, y, idx)
			}
		}
		outPath := filepath.Join(outDir, fmt.Sprintf("initial_%s.png", label))
		if err := writePNG(outPath, img); err != nil {
			return 0, err
		}
	}
	return n, nil
}

type picSpec struct {
	file    string
	w, h    int
	palSize int // 0=no palette, 48=single, 96=dual (intro)
}

var multiFiles = []picSpec{
	{"PARTA.PIC", 352, 64, 48},
	{"PARTB1.PIC", 352, 64, 48},
	{"PARTB2.PIC", 352, 64, 48},
	{"PARTC.PIC", 352, 64, 48},
	{"PARTD1.PIC", 352, 64, 48},
	{"PARTD2.PIC", 352, 64, 48},
	{"INTRO.PIC", 640, 200, 96},
	{"CASTTEXT.PIC", 352, 88, 0},
	{"MENUSUBS.PIC", 640, 96, 0},
}

func main() {
	if err := os.MkdirAll(outDir, 0o755); err != nil {
		panic(err)
	}

	// FONT.PIC
	fontData, err := os.ReadFile(filepath.Join(dataDir, "FONT.PIC"))
	if err != nil {
		fmt.Fprintf(os.Stderr, "FONT.PIC: %v\n", err)
	} else {
		if err := extractFont(fontData); err != nil {
			fmt.Fprintf(os.Stderr, "FONT.PIC: %v\n", err)
		} else {
			fmt.Println("FONT.PIC -> font.png")
		}
	}

	// MENUMAIN.PIC (single image, no OFFS)
	menuData, err := os.ReadFile(filepath.Join(dataDir, "MENUMAIN.PIC"))
	if err != nil {
		fmt.Fprintf(os.Stderr, "MENUMAIN.PIC: %v\n", err)
	} else {
		_, chunks, err := parseChunks(menuData)
		if err != nil {
			fmt.Fprintf(os.Stderr, "MENUMAIN.PIC: %v\n", err)
		} else if body := findChunk(chunks, "BODY"); body != nil {
			if err := extractSingle("menumain", body, 640, 288, 0); err != nil {
				fmt.Fprintf(os.Stderr, "MENUMAIN.PIC: %v\n", err)
			} else {
				fmt.Println("MENUMAIN.PIC -> menumain.png")
			}
		}
	}

	// INITIAL.PIC (uncompressed letter images)
	initData, err := os.ReadFile(filepath.Join(dataDir, "INITIAL.PIC"))
	if err != nil {
		fmt.Fprintf(os.Stderr, "INITIAL.PIC: %v\n", err)
	} else {
		_, chunks, err := parseChunks(initData)
		if err != nil {
			fmt.Fprintf(os.Stderr, "INITIAL.PIC: %v\n", err)
		} else {
			cont := findChunk(chunks, "CONT")
			offs := findChunk(chunks, "OFFS")
			body := findChunk(chunks, "BODY")
			if offs != nil && body != nil {
				n, err := extractInitial(cont, offs, body)
				if err != nil {
					fmt.Fprintf(os.Stderr, "INITIAL.PIC: %v\n", err)
				} else {
					fmt.Printf("INITIAL.PIC -> %d letter images\n", n)
				}
			}
		}
	}

	// Multi-image files with OFFS+BODY
	for _, spec := range multiFiles {
		data, err := os.ReadFile(filepath.Join(dataDir, spec.file))
		if err != nil {
			fmt.Fprintf(os.Stderr, "%s: %v\n", spec.file, err)
			continue
		}
		_, chunks, err := parseChunks(data)
		if err != nil {
			fmt.Fprintf(os.Stderr, "%s: %v\n", spec.file, err)
			continue
		}
		offs := findChunk(chunks, "OFFS")
		body := findChunk(chunks, "BODY")
		if offs == nil || body == nil {
			fmt.Fprintf(os.Stderr, "%s: missing OFFS or BODY\n", spec.file)
			continue
		}
		base := strings.TrimSuffix(spec.file, filepath.Ext(spec.file))
		n, err := extractMulti(strings.ToLower(base), offs, body, spec.w, spec.h, spec.palSize)
		if err != nil {
			fmt.Fprintf(os.Stderr, "%s: %v\n", spec.file, err)
			continue
		}
		fmt.Printf("%s -> %d images\n", spec.file, n)
	}

	// ANIMS.PIC
	animData, err := os.ReadFile(filepath.Join(dataDir, "ANIMS.PIC"))
	if err != nil {
		fmt.Fprintf(os.Stderr, "ANIMS.PIC: %v\n", err)
	} else {
		_, chunks, err := parseChunks(animData)
		if err != nil {
			fmt.Fprintf(os.Stderr, "ANIMS.PIC: %v\n", err)
		} else {
			offs := findChunk(chunks, "OFFS")
			body := findChunk(chunks, "BODY")
			if offs != nil && body != nil {
				offsets := parseOFFS(offs)
				nSets := imageCount(offsets)
				fmt.Printf("ANIMS.PIC: %d animation sets (frame encoding not yet decoded)\n", nSets)
				for i := 0; i < nSets; i++ {
					start := int(offsets[i])
					var end int
					if i+1 < nSets {
						end = int(offsets[i+1])
					} else {
						end = len(body)
					}
					setData := body[start:end]
					nFrames := 0
					for j := 0; j < 256 && j*4+4 <= len(setData); j++ {
						v := binary.BigEndian.Uint32(setData[j*4 : j*4+4])
						if j > 0 && v == 0 {
							break
						}
						nFrames++
					}
					fmt.Printf("  set %2d: %3d frames, %d bytes\n", i, nFrames, len(setData))
				}
			}
		}
	}
}