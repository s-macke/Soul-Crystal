package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/binary"
	"encoding/json"
	"flag"
	"fmt"
	"html"
	"image"
	"image/color"
	"image/png"
	"os"
	"path/filepath"
	"strings"
)

// The game's Code/Kernal, offsets 0x00..0xa0, is a backwards
// PowerPacker decoder with the offset-width table 09 0a 0c 0d at 0xea.
func unpack(src []byte, size int) (out []byte, err error) {
	defer func() {
		if v := recover(); v != nil {
			out = nil
			err = fmt.Errorf("invalid packed block: %v", v)
		}
	}()
	if len(src) < 8 || len(src)%4 != 0 {
		return nil, fmt.Errorf("invalid packed size")
	}
	trailer := binary.BigEndian.Uint32(src[len(src)-4:])
	if int(trailer>>8) != size || trailer&255 > 31 || size < 1 || size > 1<<20 {
		return nil, fmt.Errorf("invalid packed footer")
	}
	pos := len(src) - 4
	var bits uint32
	remaining := 0
	read := func(n int) int {
		v := 0
		for i := 0; i < n; i++ {
			if remaining == 0 {
				if pos < 4 {
					panic("input exhausted")
				}
				pos -= 4
				bits = binary.BigEndian.Uint32(src[pos:])
				remaining = 32
			}
			v = v<<1 | int(bits&1)
			bits >>= 1
			remaining--
		}
		return v
	}
	read(int(trailer & 255))
	out = make([]byte, size)
	dst := size
	put := func(v byte) {
		if dst == 0 {
			panic("output overflow")
		}
		dst--
		out[dst] = v
	}
	widths := [4]int{9, 10, 12, 13}
	for dst > 0 {
		if read(1) == 0 {
			count := 1
			for {
				v := read(2)
				count += v
				if count > dst {
					panic("literal overflow")
				}
				if v < 3 {
					break
				}
			}
			for i := 0; i < count; i++ {
				put(byte(read(8)))
			}
		}
		if dst == 0 {
			break
		}
		mode := read(2)
		count := mode + 2
		width := widths[mode]
		if mode == 3 && read(1) == 0 {
			width = 7
		}
		distance := read(width) + 1
		if mode == 3 {
			for {
				v := read(3)
				count += v
				if count > dst {
					panic("match overflow")
				}
				if v < 7 {
					break
				}
			}
		}
		for i := 0; i < count; i++ {
			from := dst - 1 + distance
			if from >= size {
				panic("invalid back reference")
			}
			put(out[from])
		}
	}
	return out, nil
}

// Each block expands to a whole bitplane for pictures, or a consecutive
// piece of a monochrome bitmap for scrolls. Story pictures end with 8 zero bytes.
func blocks(b []byte) ([][]byte, error) {
	var result [][]byte
	for pos := 0; pos < len(b); {
		if len(b)-pos < 8 {
			return nil, fmt.Errorf("truncated header")
		}
		size := int(binary.BigEndian.Uint32(b[pos:]))
		packed := int(binary.BigEndian.Uint32(b[pos+4:]))
		pos += 8
		if size == 0 && packed == 0 {
			if pos != len(b) {
				return nil, fmt.Errorf("data after terminator")
			}
			break
		}
		if size < 1 || packed < 8 || packed > len(b)-pos {
			return nil, fmt.Errorf("invalid block at %d", pos-8)
		}
		raw, err := unpack(b[pos:pos+packed], size)
		if err != nil {
			return nil, err
		}
		result = append(result, raw)
		pos += packed
	}
	if len(result) == 0 {
		return nil, fmt.Errorf("empty picture")
	}
	return result, nil
}

type layout struct {
	width, height, planes                     int
	executable                                string
	paletteOffset, paletteCount, paletteStart int
	mono                                      bool
}

// Addresses are relative to the first CODE hunk (file offset 32).
// Palette references: Intro 0xe4/0x16e/0x1dc/0x420/0x9a6;
// Endpart 0x5a6/0x8de. Display descriptors: Intro 0x1478/0x14e8.
var layouts = map[string]layout{
	"ACA.PIC":        {640, 200, 3, "Intro", 0x1578, 8, 0, false},
	"Starbyte.PIC":   {640, 200, 4, "Intro", 0x1558, 16, 0, false},
	"Title.PIC":      {640, 200, 4, "Intro", 0x1590, 16, 0, false},
	"Cast.PIC":       {320, 200, 5, "Intro", 0x1538, 16, 16, false},
	"Story1.PIC":     {640, 200, 4, "Intro", 0x15c0, 16, 0, false},
	"Story2.PIC":     {640, 200, 4, "Intro", 0x15c0, 16, 0, false},
	"Story3.PIC":     {640, 200, 4, "Intro", 0x15c0, 16, 0, false},
	"Story4.PIC":     {640, 200, 4, "Intro", 0x15c0, 16, 0, false},
	"HallOfFame.PIC": {640, 200, 4, "Endpart", 0x18be, 16, 0, false},
	"Hell.PIC":       {640, 200, 4, "Endpart", 0x189e, 16, 0, false},
	"EndScroll.PIC":  {640, 1000, 1, "", 0, 0, 0, true},
	"HellScroll.PIC": {640, 376, 1, "", 0, 0, 0, true},
	// Font source stride 37 at Endpart 0xb20; three banks at 0, 370, 740.
	// 1147 bytes include 31 stored rows; each rendered glyph uses 10 rows.
	"FameChar.PIC": {296, 31, 1, "", 0, 0, 0, true},
}

func palette(source string, l layout) (color.Palette, error) {
	p := make(color.Palette, 1<<l.planes)
	for i := range p {
		p[i] = color.RGBA{0, 0, 0, 255}
	}
	if l.mono {
		p[1] = color.RGBA{255, 255, 255, 255}
		return p, nil
	}
	volume := filepath.Dir(filepath.Dir(filepath.Dir(source)))
	b, err := os.ReadFile(filepath.Join(volume, "Code", l.executable))
	if err != nil {
		return nil, err
	}
	if len(b) < 32 || binary.BigEndian.Uint32(b) != 0x3f3 || binary.BigEndian.Uint32(b[24:]) != 0x3e9 {
		return nil, fmt.Errorf("unexpected executable hunk header")
	}
	off := 32 + l.paletteOffset
	if off+l.paletteCount*2 > len(b) {
		return nil, fmt.Errorf("palette outside executable")
	}
	for i := 0; i < l.paletteCount; i++ {
		c := binary.BigEndian.Uint16(b[off+i*2:])
		if c > 0xfff {
			return nil, fmt.Errorf("invalid RGB12 palette")
		}
		p[l.paletteStart+i] = color.RGBA{byte(c>>8) * 17, byte(c>>4&15) * 17, byte(c&15) * 17, 255}
	}
	return p, nil
}
func render(raw [][]byte, l layout, p color.Palette) (*image.Paletted, error) {
	if l.mono {
		raw = [][]byte{bytes.Join(raw, nil)}
	}
	if len(raw) != l.planes {
		return nil, fmt.Errorf("got %d planes, expected %d", len(raw), l.planes)
	}
	stride := l.width / 8
	for _, plane := range raw {
		if len(plane) != stride*l.height {
			return nil, fmt.Errorf("plane size %d, expected %d", len(plane), stride*l.height)
		}
	}
	im := image.NewPaletted(image.Rect(0, 0, l.width, l.height), p)
	for y := 0; y < l.height; y++ {
		for x := 0; x < l.width; x++ {
			var index byte
			for n, plane := range raw {
				index |= ((plane[y*stride+x/8] >> uint(7-x%8)) & 1) << uint(n)
			}
			im.SetColorIndex(x, y, index)
		}
	}
	return im, nil
}

type entry struct {
	Source       string `json:"source"`
	PNG          string `json:"png"`
	SourceSHA256 string `json:"source_sha256"`
	RawSHA256    string `json:"raw_sha256"`
	Width        int    `json:"width"`
	Height       int    `json:"height"`
	Planes       int    `json:"planes"`
	Note         string `json:"note,omitempty"`
	SourceOffset int    `json:"source_offset,omitempty"`
}

func run() error {
	input := flag.String("input", "data/Amiga/extracted", "extracted ADF directory")
	output := flag.String("output", "images/Amiga", "PNG output directory")
	flag.Parse()
	var paths []string
	err := filepath.WalkDir(*input, func(path string, d os.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if !d.IsDir() && strings.EqualFold(filepath.Ext(path), ".PIC") {
			paths = append(paths, path)
		}
		return nil
	})
	if err != nil {
		return err
	}
	if len(paths) == 0 {
		return fmt.Errorf("no PIC files found")
	}
	var records []entry
	var gallery strings.Builder
	gallery.WriteString(`<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Soul Crystal — Amiga graphics</title>
<style>body{background:#181818;color:#eee;font:16px system-ui;margin:32px}article{margin:32px 0}a{color:#9cf}.bitmap{display:block;max-width:100%;aspect-ratio:var(--corrected)}.bitmap img{display:block;width:100%;height:100%;image-rendering:pixelated;background:#000}body.raw .bitmap{aspect-ratio:var(--raw)}figure{max-width:100%}label{display:inline-block;padding:12px;background:#303030;cursor:pointer}figcaption{margin-top:6px;font-size:14px}h2{margin-top:32px}</style>
<h1>Soul Crystal — Amiga graphics</h1><p>Recovered title screens, room artwork, credits and interface graphics.</p>
<label><input type="checkbox" onchange="document.body.classList.toggle('raw',this.checked)"> Show raw square pixels</label>
<p>The default view doubles the height of high-resolution assets to approximate Amiga pixel proportions. The low-resolution cast image keeps its proportions. This is not an exact PAL/NTSC CRT simulation. Click an image for the original-resolution PNG.</p>
<p>Scrolls and font sheets use white on black; runtime fades, copper colour changes and overlays are not reproduced.</p>`)
	for _, path := range paths {
		l, ok := layouts[filepath.Base(path)]
		if !ok {
			return fmt.Errorf("unknown layout: %s", path)
		}
		b, err := os.ReadFile(path)
		if err != nil {
			return err
		}
		raw, err := blocks(b)
		if err != nil {
			return fmt.Errorf("%s: %w", path, err)
		}
		p, err := palette(path, l)
		if err != nil {
			return err
		}
		im, err := render(raw, l, p)
		if err != nil {
			return fmt.Errorf("%s: %w", path, err)
		}
		volume := filepath.Base(filepath.Dir(filepath.Dir(filepath.Dir(path))))
		rel := filepath.Join(volume, strings.TrimSuffix(filepath.Base(path), filepath.Ext(path))+".png")
		dest := filepath.Join(*output, rel)
		if err = os.MkdirAll(filepath.Dir(dest), 0755); err != nil {
			return err
		}
		f, err := os.Create(dest)
		if err != nil {
			return err
		}
		err = png.Encode(f, im)
		closeErr := f.Close()
		if err != nil {
			return err
		}
		if closeErr != nil {
			return closeErr
		}
		note := ""
		if l.mono {
			note = "Monochrome asset preview; runtime copper colours/overlays are not reproduced."
		}
		records = append(records, entry{Source: path, PNG: filepath.ToSlash(rel), SourceSHA256: fmt.Sprintf("%x", sha256.Sum256(b)), RawSHA256: fmt.Sprintf("%x", sha256.Sum256(bytes.Join(raw, nil))), Width: l.width, Height: l.height, Planes: l.planes, Note: note})
		scale := 2
		if filepath.Base(path) == "Cast.PIC" {
			scale = 1
		}
		fmt.Fprintf(&gallery, "<article><h2>%s — %d × %d stored pixels</h2>%s</article>", html.EscapeString(filepath.Base(path)), l.width, l.height, previewTag(rel, filepath.Base(path), l.width, l.height, scale))
		fmt.Printf("%s: %dx%d, %d planes\n", path, l.width, l.height, l.planes)
	}
	if err := exportGFX(*input, *output, &gallery, &records); err != nil {
		return err
	}
	gallery.WriteString("</html>\n")
	if err = os.WriteFile(filepath.Join(*output, "index.html"), []byte(gallery.String()), 0644); err != nil {
		return err
	}
	data, err := json.MarshalIndent(records, "", "  ")
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

// High-resolution pixels occupy half the horizontal space of low-resolution
// pixels. Keep exported PNG samples unchanged and correct only the gallery.
func previewTag(path, name string, width, height, verticalScale int) string {
	path = html.EscapeString(filepath.ToSlash(path))
	return fmt.Sprintf(`<a href="%s" class="bitmap" style="width:%dpx;--raw:%d / %d;--corrected:%d / %d"><img loading="lazy" src="%s" alt="%s"></a>`, path, width, width, height, width, height*verticalScale, path, html.EscapeString(name))
}
