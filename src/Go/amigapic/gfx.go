package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/binary"
	"fmt"
	"html"
	"image"
	"image/color"
	"image/png"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

type gfxAsset struct {
	name   string
	im     *image.Paletted
	raw    []byte
	offset int
	note   string
}

func rgb12(b []byte) (color.Palette, error) {
	if len(b)%2 != 0 {
		return nil, fmt.Errorf("odd palette")
	}
	p := make(color.Palette, len(b)/2)
	for i := range p {
		v := binary.BigEndian.Uint16(b[i*2:])
		if v > 4095 {
			return nil, fmt.Errorf("invalid RGB12 colour %#x", v)
		}
		p[i] = color.RGBA{byte(v>>8) * 17, byte(v>>4&15) * 17, byte(v&15) * 17, 255}
	}
	return p, nil
}
func planar(b []byte, w, h, depth int, p color.Palette) (*image.Paletted, error) {
	stride := (w + 15) / 16 * 2
	size := stride * h
	if depth < 1 || depth > 8 || len(p) != 1<<depth || len(b) != size*depth {
		return nil, fmt.Errorf("invalid bitmap dimensions %dx%dx%d for %d bytes", w, h, depth, len(b))
	}
	planes := make([][]byte, depth)
	for i := range planes {
		planes[i] = b[i*size : (i+1)*size]
	}
	padded, err := render(planes, layout{width: stride * 8, height: h, planes: depth}, p)
	if err != nil {
		return nil, err
	}
	im := image.NewPaletted(image.Rect(0, 0, w, h), p)
	for y := 0; y < h; y++ {
		copy(im.Pix[y*im.Stride:y*im.Stride+w], padded.Pix[y*padded.Stride:y*padded.Stride+w])
	}
	return im, nil
}
func getSprite(b []byte, p color.Palette) (*image.Paletted, error) {
	if len(b) < 6 {
		return nil, fmt.Errorf("short GET bitmap")
	}
	depth := int(binary.BigEndian.Uint16(b))
	w := int(binary.BigEndian.Uint16(b[2:])) + 1
	h := int(binary.BigEndian.Uint16(b[4:])) + 1
	return planar(b[6:], w, h, depth, p)
}
func mainData(input string) ([]byte, error) {
	p := filepath.Join(input, "Disk 3", "Code/Main")
	b, err := os.ReadFile(p)
	if err != nil {
		return nil, err
	}
	// DATA hunk starts at file 0x19dc4 (Main CODE hunk size 0x18980).
	const off = 0x19dc4
	const size = 0x2a28
	if len(b) < off+size || binary.BigEndian.Uint32(b[off-8:]) != 0x3ea || binary.BigEndian.Uint32(b[off-4:]) != size/4 {
		return nil, fmt.Errorf("unsupported Main DATA hunk layout")
	}
	return b[off : off+size], nil
}
func roomAssets(b, data []byte, name string) ([]gfxAsset, error) {
	table, ok := map[string]int{"DiskA.GFX": 0x1612, "DiskB.GFX": 0x166c, "DiskC.GFX": 0x1748, "DiskD.GFX": 0x17ac}[name]
	if !ok {
		return nil, fmt.Errorf("unknown room archive")
	}
	var out []gfxAsset
	for pos := 0; pos < len(b); {
		end := bytes.IndexByte(data[table:], 0)
		if end < 0 {
			return nil, fmt.Errorf("unterminated size table")
		}
		n, err := strconv.Atoi(string(data[table : table+end]))
		if err != nil {
			return nil, err
		}
		table += end + 1
		if n < 8 || n > len(b)-pos {
			return nil, fmt.Errorf("room record outside archive")
		}
		size := int(binary.BigEndian.Uint32(b[pos+n-4:]) >> 8)
		raw, err := unpack(b[pos:pos+n], size)
		if err != nil {
			return nil, err
		}
		if len(raw) < 11298 || (len(raw)-11298)%12 != 0 || binary.BigEndian.Uint16(raw[len(raw)-2:]) != 0xffff {
			return nil, fmt.Errorf("invalid room metadata")
		}
		p, err := rgb12(raw[:32])
		if err != nil {
			return nil, err
		}
		im, err := planar(raw[32:32+11264], 352, 64, 4, p)
		if err != nil {
			return nil, err
		}
		out = append(out, gfxAsset{fmt.Sprintf("%s-%03d", strings.TrimSuffix(name, ".GFX"), len(out)), im, raw, pos, "Archive record index; room IDs and trailing interaction metadata are not yet mapped."})
		pos += n
	}
	return out, nil
}
func gfxBlocks(b []byte) ([][]byte, []int, error) {
	raw, err := blocks(b)
	if err != nil {
		return nil, nil, err
	}
	offsets := make([]int, len(raw))
	pos := 0
	for i := range raw {
		offsets[i] = pos
		pos += 8 + int(binary.BigEndian.Uint32(b[pos+4:]))
	}
	return raw, offsets, nil
}
func installPalette(source string) (color.Palette, error) {
	volume := filepath.Dir(filepath.Dir(filepath.Dir(source)))
	b, err := os.ReadFile(filepath.Join(volume, "Code/RAMInstall"))
	if err != nil {
		return nil, err
	}
	// GFA BASIC DATA strings: RAMInstall DATA hunk +0x5a, read by its palette loop.
	const off = 0x7f40 + 0x5a
	if len(b) < off+79 {
		return nil, fmt.Errorf("short RAMInstall DATA")
	}
	p := make([]byte, 32)
	pos := off
	for i := 0; i < 16; i++ {
		end := bytes.IndexByte(b[pos:], 0)
		if end < 0 {
			return nil, fmt.Errorf("unterminated palette")
		}
		s := string(b[pos : pos+end])
		base := 10
		if strings.HasPrefix(s, "$") {
			base = 16
			s = s[1:]
		}
		v, err := strconv.ParseUint(s, base, 12)
		if err != nil {
			return nil, err
		}
		binary.BigEndian.PutUint16(p[i*2:], uint16(v))
		pos += end + 1
	}
	return rgb12(p)
}
func otherGFX(source string, b []byte) ([]gfxAsset, error) {
	name := filepath.Base(source)
	var out []gfxAsset
	if name == "Credits.GFX" {
		raw, offsets, err := gfxBlocks(b)
		if err != nil {
			return nil, err
		}
		p, err := palette(source, layout{planes: 3, executable: "Intro", paletteOffset: 0x15b0, paletteCount: 8})
		if err != nil {
			return nil, err
		}
		for i, r := range raw {
			im, err := planar(r, 432, 158, 3, p)
			if err != nil {
				return nil, err
			}
			out = append(out, gfxAsset{fmt.Sprintf("Credits-%02d", i), im, r, offsets[i], "Palette from Intro +0x15b0; source stride 54, height 158, three planes (blitter setup +0x2a4)."})
		}
	} else if name == "Install.GFX" {
		raw, offsets, err := gfxBlocks(b)
		if err != nil {
			return nil, err
		}
		if len(raw) < 4 {
			return nil, fmt.Errorf("missing installation planes")
		}
		p, err := installPalette(source)
		if err != nil {
			return nil, err
		}
		background := bytes.Join(raw[:4], nil)
		im, err := planar(background, 640, 200, 4, p)
		if err != nil {
			return nil, err
		}
		out = append(out, gfxAsset{"Install-background", im, background, 0, "Palette from RAMInstall DATA +0x5a."})
		for i := 4; i < len(raw); i++ {
			im, err := getSprite(raw[i], p)
			if err != nil {
				return nil, err
			}
			out = append(out, gfxAsset{fmt.Sprintf("Install-sprite-%02d", i-4), im, raw[i], offsets[i], "GFA GET bitmap; dimensions stored as maximum x/y coordinates."})
		}
	} else if name == "Menu.GFX" {
		// Two length-prefixed auxiliary structures precede the compressed bitmaps.
		pos := 0
		for i := 0; i < 2; i++ {
			if len(b)-pos < 4 {
				return nil, fmt.Errorf("short menu metadata")
			}
			n := int(binary.BigEndian.Uint32(b[pos:]))
			if n > len(b)-pos-4 {
				return nil, fmt.Errorf("invalid menu metadata")
			}
			pos += 4 + n
		}
		raw, offsets, err := gfxBlocks(b[pos:])
		if err != nil {
			return nil, err
		}
		if len(raw) < 2 {
			return nil, fmt.Errorf("missing menu planes")
		}
		p, _ := rgb12([]byte{0, 0, 15, 255, 10, 170, 5, 85})
		background := bytes.Join(raw[:2], nil)
		im, err := planar(background, 640, 200, 2, p)
		if err != nil {
			return nil, err
		}
		note := "Uses the four shared UI colours (black, white, #aaa, #555); runtime composition is not reproduced."
		out = append(out, gfxAsset{"Menu-background", im, background, pos, note})
		for i := 2; i < len(raw); i++ {
			im, err := getSprite(raw[i], p)
			if err != nil {
				return nil, err
			}
			out = append(out, gfxAsset{fmt.Sprintf("Menu-sprite-%02d", i-2), im, raw[i], pos + offsets[i], note})
		}
	} else {
		return nil, fmt.Errorf("unsupported GFX %s", name)
	}
	return out, nil
}
func exportGFX(input, output string, gallery *strings.Builder, records *[]entry) error {
	data, err := mainData(input)
	if err != nil {
		return err
	}
	var paths []string
	err = filepath.WalkDir(input, func(path string, d os.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if !d.IsDir() && strings.EqualFold(filepath.Ext(path), ".GFX") {
			paths = append(paths, path)
		}
		return nil
	})
	if err != nil {
		return err
	}
	for _, path := range paths {
		b, err := os.ReadFile(path)
		if err != nil {
			return err
		}
		var assets []gfxAsset
		if strings.HasPrefix(filepath.Base(path), "Disk") {
			assets, err = roomAssets(b, data, filepath.Base(path))
		} else {
			assets, err = otherGFX(path, b)
		}
		if err != nil {
			return fmt.Errorf("%s: %w", path, err)
		}
		volume := filepath.Base(filepath.Dir(filepath.Dir(filepath.Dir(path))))
		fmt.Fprintf(gallery, "<h2>%s</h2><div style=\"display:flex;flex-wrap:wrap;gap:16px;align-items:start\">", html.EscapeString(filepath.Base(path)))
		for _, a := range assets {
			rel := filepath.Join(volume, a.name+".png")
			dest := filepath.Join(output, rel)
			if err = os.MkdirAll(filepath.Dir(dest), 0755); err != nil {
				return err
			}
			f, err := os.Create(dest)
			if err != nil {
				return err
			}
			err = png.Encode(f, a.im)
			cerr := f.Close()
			if err != nil {
				return err
			}
			if cerr != nil {
				return cerr
			}
			e := entry{Source: path, PNG: filepath.ToSlash(rel), SourceSHA256: fmt.Sprintf("%x", sha256.Sum256(b)), RawSHA256: fmt.Sprintf("%x", sha256.Sum256(a.raw)), Width: a.im.Rect.Dx(), Height: a.im.Rect.Dy(), Planes: 0, Note: a.note, SourceOffset: a.offset}
			for n := len(a.im.Palette); n > 1; n >>= 1 {
				e.Planes++
			}
			*records = append(*records, e)
			fmt.Fprintf(gallery, "<figure style=\"margin:0\">%s<figcaption>%s (%d × %d stored pixels)</figcaption></figure>", previewTag(rel, a.name, e.Width, e.Height, 2), html.EscapeString(a.name), e.Width, e.Height)
		}
		gallery.WriteString("</div>")
		fmt.Printf("%s: %d graphics\n", path, len(assets))
	}
	return nil
}
