package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/binary"
	"fmt"
	"html"
	"image"
	"image/color"
	"image/gif"
	"image/png"
	"os"
	"path/filepath"
	"strings"
)

// These are custom PowerPacker records, not IFF ANIM containers.
func animRecord(b []byte, pos *int) ([]byte, bool, error) {
	if len(b)-*pos < 8 {
		return nil, false, fmt.Errorf("truncated ANIM record at %#x", *pos)
	}
	n, k := int(binary.BigEndian.Uint32(b[*pos:])), int(binary.BigEndian.Uint32(b[*pos+4:]))
	*pos += 8
	if n == 0 && k == 0 {
		return nil, true, nil
	}
	if n <= 0 || n > 1<<20 || k <= 0 || k > len(b)-*pos {
		return nil, false, fmt.Errorf("invalid ANIM record lengths %d/%d", n, k)
	}
	packed := b[*pos : *pos+k]
	*pos += k
	if n == k {
		return bytes.Clone(packed), false, nil
	}
	raw, err := unpack(packed, n)
	return raw, false, err
}

// Intro CODE+$c7a and Endpart CODE+$eae: four plane-offset streams,
// column-wise skip/repeat/literal byte operations. Deltas replace bytes
// in alternating buffers; they are relative to the frame two steps earlier.
func applyAnimDelta(screen, delta []byte, columns int) error {
	if len(screen) < 32000 || len(delta) < 16 {
		return fmt.Errorf("short animation buffer")
	}
	for plane := 0; plane < 4; plane++ {
		p := int(binary.BigEndian.Uint32(delta[plane*4:]))
		if p == 0 {
			continue
		}
		read := func() (byte, error) {
			if p >= len(delta) {
				return 0, fmt.Errorf("truncated delta")
			}
			v := delta[p]
			p++
			return v, nil
		}
		for x := 0; x < columns; x++ {
			ops, err := read()
			if err != nil {
				return err
			}
			y := 0
			put := func(v byte) error {
				if y >= 200 {
					return fmt.Errorf("delta beyond screen")
				}
				screen[plane*8000+y*40+x] = v
				y++
				return nil
			}
			for op := 0; op < int(ops); op++ {
				code, err := read()
				if err != nil {
					return err
				}
				switch {
				case code == 0:
					count, err := read()
					if err != nil {
						return err
					}
					v, err := read()
					if err != nil {
						return err
					}
					for i := 0; i < int(count); i++ {
						if err := put(v); err != nil {
							return err
						}
					}
				case code&128 != 0:
					count := int(code & 127)
					if count == 0 {
						return fmt.Errorf("invalid zero literal run")
					}
					for i := 0; i < count; i++ {
						v, err := read()
						if err != nil {
							return err
						}
						if err = put(v); err != nil {
							return err
						}
					}
				default:
					y += int(code)
				}
			}
		}
	}
	return nil
}

type animation struct {
	frames  []*image.Paletted
	raw     [][]byte
	columns int
}

func decodeAnim(path string) (animation, error) {
	b, err := os.ReadFile(path)
	if err != nil {
		return animation{}, err
	}
	pos := 0
	victory := filepath.Base(path) == "Victory.ANIM"
	planes, columns := 5, 16
	var screen []byte
	var pal color.Palette
	if victory {
		planes, columns = 4, 40
		for i := 0; i < 4; i++ {
			raw, end, err := animRecord(b, &pos)
			if err != nil {
				return animation{}, err
			}
			if end || len(raw) != 8000 {
				return animation{}, fmt.Errorf("invalid victory base plane")
			}
			screen = append(screen, raw...)
		}
		_, end, err := animRecord(b, &pos)
		if err != nil || !end {
			return animation{}, fmt.Errorf("missing victory base terminator")
		}
		pal, err = palette(path, layout{planes: 4, executable: "Endpart", paletteOffset: 0x187e, paletteCount: 16})
		if err != nil {
			return animation{}, err
		}
	} else {
		portrait, end, err := animRecord(b, &pos)
		if err != nil {
			return animation{}, err
		}
		if end || len(portrait) != 4256 {
			return animation{}, fmt.Errorf("invalid cast portrait")
		}
		name, end, err := animRecord(b, &pos)
		if err != nil {
			return animation{}, err
		}
		if end || len(name) != 12600 {
			return animation{}, fmt.Errorf("invalid cast caption")
		}
		castPath := filepath.Join(filepath.Dir(path), "Cast.PIC")
		cast, err := os.ReadFile(castPath)
		if err != nil {
			return animation{}, err
		}
		base, err := blocks(cast)
		if err != nil {
			return animation{}, err
		}
		screen = bytes.Join(base, nil)
		pal, err = palette(castPath, layouts["Cast.PIC"])
		if err != nil {
			return animation{}, err
		}
		for i := 0; i < 16; i++ {
			c := binary.BigEndian.Uint16(portrait[4224+i*2:])
			if c > 4095 {
				return animation{}, fmt.Errorf("invalid portrait palette")
			}
			pal[i] = color.RGBA{byte(c>>8) * 17, byte(c>>4&15) * 17, byte(c&15) * 17, 255}
		}
		// Intro+$55e: 96x88 at (32,88), four planes; +$744:
		// 192x105 caption at (128,72), five planes. Cast frame is retained.
		for p := 0; p < 4; p++ {
			for y := 0; y < 88; y++ {
				copy(screen[p*8000+(y+88)*40+4:], portrait[p*1056+y*12:p*1056+(y+1)*12])
			}
		}
		for p := 0; p < 5; p++ {
			for y := 0; y < 105; y++ {
				copy(screen[p*8000+(y+72)*40+16:], name[p*2520+y*24:p*2520+(y+1)*24])
			}
		}
	}
	result := animation{columns: columns}
	add := func(s []byte) error {
		raw := bytes.Clone(s)
		parts := make([][]byte, planes)
		for p := range parts {
			parts[p] = raw[p*8000 : (p+1)*8000]
		}
		im, err := render(parts, layout{width: 320, height: 200, planes: planes}, pal)
		if err != nil {
			return err
		}
		result.frames = append(result.frames, im)
		result.raw = append(result.raw, raw)
		return nil
	}
	if err = add(screen); err != nil {
		return result, err
	}
	buffers := [2][]byte{bytes.Clone(screen), bytes.Clone(screen)}
	i := 0
	for {
		if len(b)-pos == 10 && bytes.Equal(b[pos:], []byte{0, 0, 0, 0, 10, 0, 0, 0, 0, 10}) {
			pos = len(b)
			break
		}
		delta, end, err := animRecord(b, &pos)
		if err != nil {
			return result, err
		}
		if end {
			break
		}
		if err = applyAnimDelta(buffers[i%2], delta, columns); err != nil {
			return result, fmt.Errorf("frame %d: %w", i+1, err)
		}
		if err = add(buffers[i%2]); err != nil {
			return result, err
		}
		i++
	}
	if pos != len(b) && !(pos+2 == len(b) && binary.BigEndian.Uint16(b[pos:]) == 10) {
		return result, fmt.Errorf("unexpected ANIM trailer at %#x", pos)
	}
	return result, nil
}

func exportANIM(input, output string, gallery *strings.Builder, records *[]entry) error {
	paths, err := filepath.Glob(filepath.Join(input, "*", "Data", "Graphic", "*.ANIM"))
	if err != nil {
		return err
	}
	gallery.WriteString("<h2>Animations</h2><p>Original low-resolution frames, including victory. GIF timing approximates the seven-frame wait; fades and music are omitted.</p>")
	for _, path := range paths {
		anim, err := decodeAnim(path)
		if err != nil {
			return fmt.Errorf("%s: %w", path, err)
		}
		source, err := os.ReadFile(path)
		if err != nil {
			return err
		}
		volume := filepath.Base(filepath.Dir(filepath.Dir(filepath.Dir(path))))
		name := strings.TrimSuffix(filepath.Base(path), ".ANIM")
		rel := filepath.Join(volume, "animations", name)
		dir := filepath.Join(output, rel)
		if err = os.MkdirAll(dir, 0755); err != nil {
			return err
		}
		movie := gif.GIF{LoopCount: 0}
		for i, im := range anim.frames {
			file := filepath.Join(rel, fmt.Sprintf("%s-%03d.png", name, i))
			f, err := os.Create(filepath.Join(output, file))
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
			*records = append(*records, entry{Source: path, PNG: filepath.ToSlash(file), SourceSHA256: fmt.Sprintf("%x", sha256.Sum256(source)), RawSHA256: fmt.Sprintf("%x", sha256.Sum256(anim.raw[i])), Width: 320, Height: 200, Planes: len(anim.raw[i]) / 8000, Note: fmt.Sprintf("Animation frame %d; original low-resolution pixels; no vertical doubling.", i)})
			movie.Image = append(movie.Image, im)
			delay := 14
			if i == 0 && name == "Victory" {
				delay = 400
			}
			movie.Delay = append(movie.Delay, delay)
			movie.Disposal = append(movie.Disposal, gif.DisposalNone)
		}
		gifRel := filepath.Join(rel, name+".gif")
		f, err := os.Create(filepath.Join(output, gifRel))
		if err != nil {
			return err
		}
		err = gif.EncodeAll(f, &movie)
		closeErr := f.Close()
		if err != nil {
			return err
		}
		if closeErr != nil {
			return closeErr
		}
		fmt.Fprintf(gallery, "<article><h3>%s · %d frames</h3>%s<p><a href=\"%s\">First frame PNG</a></p></article>", html.EscapeString(name), len(anim.frames), previewTag(gifRel, name, 320, 200, 1), html.EscapeString(filepath.ToSlash(filepath.Join(rel, name+"-000.png"))))
		fmt.Printf("%s: %d animation frames\n", path, len(anim.frames))
	}
	return nil
}
