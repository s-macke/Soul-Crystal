package main

import (
	"../gallery"
	"fmt"
	"image"
	"image/color"
	"image/png"
	"os"
	"path/filepath"
)

const (
	d64Size     = 174848
	imageWidth  = 176
	imageHeight = 64
	imageSize   = 22*8*8 + 22*8 + 22*8
)

var palette = color.Palette{
	color.RGBA{0x19, 0x1d, 0x19, 0xff},
	color.RGBA{0xfc, 0xf9, 0xfc, 0xff},
	color.RGBA{0x93, 0x3a, 0x4c, 0xff},
	color.RGBA{0xb6, 0xfa, 0xfa, 0xff},
	color.RGBA{0xd2, 0x7d, 0xed, 0xff},
	color.RGBA{0x6a, 0xcf, 0x6f, 0xff},
	color.RGBA{0x4f, 0x44, 0xd8, 0xff},
	color.RGBA{0xfb, 0xfb, 0x8b, 0xff},
	color.RGBA{0xd8, 0x9c, 0x5b, 0xff},
	color.RGBA{0x7f, 0x53, 0x07, 0xff},
	color.RGBA{0xef, 0x83, 0x9f, 0xff},
	color.RGBA{0x53, 0x57, 0x57, 0xff},
	color.RGBA{0xa7, 0xa7, 0xa3, 0xff},
	color.RGBA{0xb7, 0xfb, 0xbf, 0xff},
	color.RGBA{0xa3, 0x97, 0xff, 0xff},
	color.RGBA{0xef, 0xf9, 0xe7, 0xff},
}

type diskRange struct {
	name     string
	path     string
	firstIdx int
	lastIdx  int
}

var knownRanges = []diskRange{
	{"B1", "data/C64/d64/Soul Crystal SideB1.d64", 312, 330},
	{"B2", "data/C64/d64/Soul Crystal SideB2.d64", 448, 492},
	{"C1", "data/C64/d64/Soul Crystal SideC1.d64", 291, 311},
	{"C2", "data/C64/d64/Soul Crystal SideC2.d64", 435, 486},
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

func decodeImage(buf []byte, idx int) ([]byte, error) {
	pos, err := pointerOffset(buf, idx)
	if err != nil {
		return nil, err
	}
	pos += 2

	out := make([]byte, 0, imageSize)
	for len(out) <= imageSize {
		if pos >= len(buf) {
			return nil, fmt.Errorf("image %d ran past EOF", idx)
		}
		if buf[pos] != 0xcd {
			out = append(out, buf[pos])
		} else {
			pos++
			if pos+1 >= len(buf) {
				return nil, fmt.Errorf("image %d has truncated RLE", idx)
			}
			count := int(buf[pos])
			pos++
			for i := 0; i < count; i++ {
				out = append(out, buf[pos])
			}
		}
		pos++
	}

	return out[:imageSize], nil
}

func renderPaletted(data []byte) *image.Paletted {
	img := image.NewPaletted(image.Rect(0, 0, imageWidth, imageHeight), palette)
	colorA := 22 * 8 * 8
	colorB := colorA + 22*8

	for y := 0; y < imageHeight; y++ {
		m := ((y >> 3) * 22 * 8) + (y & 7)
		row := y >> 3
		for col := 0; col < 22; col++ {
			for k := 0; k < 4; k++ {
				code := (data[m] >> (6 - (k << 1))) & 3
				var palIdx byte
				switch code {
				case 0:
					palIdx = 0
				case 1:
					palIdx = (data[colorA+row*22+col] >> 4) & 0x0f
				case 2:
					palIdx = data[colorA+row*22+col] & 0x0f
				default:
					palIdx = data[colorB+row*22+col] & 0x0f
				}
				x := (col << 3) + (k << 1)
				img.SetColorIndex(x, y, palIdx)
				img.SetColorIndex(x+1, y, palIdx)
			}
			m += 8
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

func main() {
	if err := os.MkdirAll("images", 0o755); err != nil {
		panic(err)
	}

	for _, disk := range knownRanges {
		dir := filepath.Join("images/C64", "Disk "+disk.name)
		if err := os.MkdirAll(dir, 0o755); err != nil {
			panic(err)
		}
		buf, err := os.ReadFile(disk.path)
		if err != nil {
			panic(err)
		}
		if len(buf) != d64Size {
			panic(fmt.Errorf("%s has unexpected size %d", disk.path, len(buf)))
		}

		for idx := disk.firstIdx; idx <= disk.lastIdx; idx++ {
			data, err := decodeImage(buf, idx)
			if err != nil {
				panic(err)
			}
			out := filepath.Join(dir, fmt.Sprintf("%s-%d.png", disk.name, idx-disk.firstIdx))
			if err := writePNG(out, renderPaletted(data)); err != nil {
				panic(err)
			}
			fmt.Println(out)
		}
	}
	if err := gallery.Write("images/C64", "Soul Crystal — C64", "Four extracted gameplay sides: B1, B2, C1 and C2. Each folder corresponds to one D64 side, not one physical floppy. The source set also contains A1 and A2; their graphics are not covered by this extractor. C64 multicolor pixel doubling is already present in the PNGs."); err != nil {
		panic(err)
	}

}
