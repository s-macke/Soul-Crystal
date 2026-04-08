# DOS Image Format

This document describes the DOS-side image formats used by the game data.

## 1. Chunk container

The image archives reuse the same IFF-style chunked container as the text archives (see `text_archive_format.md` section 1).

Top-level form types:

- `ILBM`: still images
- `ANIM`: animation sets

## 2. Known chunk types

- `CONT`: content table mapping image indices to game IDs
- `OFFS`: offset table into `BODY` data
- `BODY`: pixel data (compressed or raw depending on file)

## 3. `CONT`

An array of 1-byte values, one per image. For room images these are room IDs. For `INITIAL.PIC` these are ASCII letters identifying each initial cap.

Zero entries after the last valid entry are padding.

## 4. `OFFS`

Always 1024 bytes. The table is split into two halves of 512 bytes each:

- Lower half (bytes 0--511): 128 big-endian `uint32` start offsets relative to the beginning of `BODY` data.
- Upper half (bytes 512--1023): 128 big-endian `uint32` compressed data sizes (excluding any per-image palette prefix).

The first valid offset is always 0. The number of images is determined by counting entries starting from index 0 up to (but not including) the first zero entry after a non-zero entry.

The size entries in the upper half are shifted by one index relative to the offsets: `sizes[i+1]` gives the compressed size of image `i`.

## 5. `BODY`

Contains the concatenated image data for all images referenced by `OFFS`. For files without `OFFS`, `BODY` contains a single image.

## 6. Per-image data layout

Each image within `BODY` consists of an optional palette prefix followed by pixel data.

### 6.1 Palette prefix

The palette prefix size depends on the file:

| File type | Prefix size | Contents |
|---|---|---|
| Room images (`PART*.PIC`) | 48 bytes | single 16-color palette |
| Intro images (`INTRO.PIC`) | 96 bytes | two consecutive 16-color palettes (for fade transitions) |
| All other `.PIC` files | 0 bytes | no embedded palette; uses the game's active palette |

Each 48-byte palette block stores 16 colors as 3 bytes each (R, G, B). Values are VGA DAC register values left-shifted by 2 (i.e. stored as 8-bit; divide by 4 to recover the 6-bit DAC value).

### 6.2 Pixel data

Pixel data is ByteRun1-compressed EGA bitplane data, except for `INITIAL.PIC` which stores raw uncompressed bitplanes.

## 7. ByteRun1 compression

Signed byte `n` controls decompression:

- `0 <= n <= 127`: copy the next `n + 1` bytes literally
- `-127 <= n <= -1`: repeat the next byte `1 - n` times
- `n == -128`: no-op

Decompression ends when the compressed input is exhausted.

## 8. EGA bitplane layout

Decompressed pixel data uses 4 interleaved EGA bitplanes per scanline:

```
row N: [plane0][plane1][plane2][plane3]
row N+1: [plane0][plane1][plane2][plane3]
...
```

Each plane segment is `width / 8` bytes. Bits are ordered MSB first within each byte. The pixel color index is assembled as:

```
index = plane0_bit | (plane1_bit << 1) | (plane2_bit << 2) | (plane3_bit << 3)
```

## 9. Image dimensions

| File                        | Width | Height | Notes                                   |
|-----------------------------|-------|--------|-----------------------------------------|
| `PARTA.PIC` .. `PARTD2.PIC` | 352   | 64     | room pictures                           |
| `INTRO.PIC`                 | 640   | 200    | full-screen intro sequence              |
| `MENUMAIN.PIC`              | 640   | 288    | main UI frame (single image, no `OFFS`) |
| `MENUSUBS.PIC`              | 640   | 96     | bottom UI command panels                |
| `CASTTEXT.PIC`              | 352   | 88     | credits text overlays                   |
| `INITIAL.PIC`               | 64    | 64     | decorative initial caps (uncompressed)  |
| `FONT.PIC`                  | --    | --     | bitmap font (see section 10)            |
| `ANIMS.PIC`                 | --    | --     | animation sets (not yet fully decoded)  |

Dimensions are not stored in the file; they are implied by the file identity.

## 10. `FONT.PIC`

`FONT.PIC` does not use the IFF container. Its layout is:

```
+0x00: 0xAA 0x55          magic
+0x02: uint16_le width    glyph width in pixels (8)
+0x04: uint16_le height   glyph height in pixels (14)
+0x06: uint16_le ???      (unused / zero)
+0x08: glyph data         256 glyphs, `height` bytes each, 1 bit per pixel MSB first
```

## 11. Object name table (`OBJECTS.TXT`)

Described in `text_archive_format.md` section 8.

## 12. `ANIMS.PIC` (partially decoded)

`ANIMS.PIC` uses form type `ANIM` with the standard `OFFS` + `BODY` chunk layout. The outer `OFFS` table points to 12 animation sets within `BODY`.

### 12.1 Animation set structure

Each set begins with an inner offset table: a variable-length array of big-endian `uint32` values. Entry 0 is always `0`. Entries 1..N point to delta frames within the set. The table ends at the first zero entry after a non-zero one.

After the inner offset table, the base frame (keyframe) is stored up to the byte offset given by entry 1. Subsequent delta frames are stored at the offsets given by entries 1..N.

### 12.2 Frame counts

| Set | Frames |
|-----|--------|
| 0   | 10     |
| 1   | 43     |
| 2   | 25     |
| 3   | 50     |
| 4   | 85     |
| 5   | 60     |
| 6   | 61     |
| 7   | 69     |
| 8   | 55     |
| 9   | 56     |
| 10  | 58     |
| 11  | 64     |

### 12.3 Open questions

The pixel encoding for animation frames is **not yet decoded**. Decompressed frame sizes do not match standard EGA bitplane dimensions at any tested width, indicating a custom delta encoding distinct from the ByteRun1 + interleaved-bitplane format used by static images. Full decoding requires reverse-engineering the animation renderer in the executable.

## 13. Other open points

- The game's active palette for files without embedded palettes (MENUMAIN, MENUSUBS, CASTTEXT, INITIAL) is set by the executable at runtime and not stored in the image files.
- `MENUMAIN.PIC` has height 288, which exceeds standard EGA mode heights (200 or 350). It likely stores the UI frame as a single contiguous buffer that the engine blits in parts.
