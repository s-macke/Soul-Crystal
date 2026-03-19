# C64 Image Format

This document describes the indexed room-image format stored in the C64 disk data.

## 1. Record placement

Room images are addressed through the pointer table described in [`disk_format.md`](/home/sebastian/projects/Soul_Crystal/spec/C64/disk_format.md).

An image record begins at the resolved pointer-table offset:

```text
+0..1: compressed-size header
+2..  : compressed image payload
```

Current decoding starts at `record_offset + 2`.

The first two bytes are very likely a little-endian compressed-size field encoded as a negative value with an off-by-one convention:

```text
header_word      = lo + 256 * hi
compressed_size ~= 65536 - header_word + 1
```

Equivalent form:

```text
header_word = -(compressed_size - 1) mod 65536
```

This interpretation matches the measured compressed sizes of known image records, but should still be treated as inferred rather than fully proven.

## 2. Decompressed layout

The compressed payload expands into a fixed-size buffer of `1760` bytes:

```text
1408 bytes: multicolor bitmap data
 176 bytes: screen/color table A
 176 bytes: screen/color table B
```

This corresponds to:

- `22` character columns
- `8` character rows
- `8` bytes per character cell bitmap

The total bitmap area is therefore:

```text
22 * 8 * 8 = 1408 bytes
```

Each of the two color tables contains one byte per character cell:

```text
22 * 8 = 176 bytes
```

## 3. Compression

The image payload uses a simple run-length encoding.

### 3.1 Literal byte

Any byte other than `205` (`0xCD`) is copied directly to the decompressed output.

### 3.2 Repeated byte

The marker byte `205` (`0xCD`) introduces a run:

```text
+0: 0xCD
+1: repeat count
+2: repeated byte value
```

The repeated byte value is appended to the output `repeat count` times.

### 3.3 End condition

Decompression continues until at least `1760` bytes have been produced.

The intended decompressed size is exactly:

```text
22 * 8 * 8 + 22 * 8 + 22 * 8 = 1760 bytes
```

## 4. Decompressed buffer structure

After decompression, the buffer is divided as follows:

```text
offset 0x000..0x57f: bitmap data      (1408 bytes)
offset 0x580..0x62f: color table A     (176 bytes)
offset 0x630..0x6df: color table B     (176 bytes)
```

Equivalent decimal offsets:

```text
bitmap data:   0..1407
color table A: 1408..1583
color table B: 1584..1759
```

## 5. Bitmap organization

The bitmap is stored in character-cell order.

There are:

- `22` columns
- `8` rows of character cells
- `8` scanlines per character cell

For screen scanline `s`:

```text
char_row      = s >> 3
row_in_char   = s & 7
bitmap_offset = char_row * 22 * 8 + row_in_char
```

Within a scanline, each character cell contributes one bitmap byte. After reading one cell, the decoder advances by `8` bytes to reach the same scanline in the next cell.

## 6. Pixel encoding

Each bitmap byte encodes 4 multicolor pixels using 2 bits per pixel:

```text
bits 7-6: pixel 0
bits 5-4: pixel 1
bits 3-2: pixel 2
bits 1-0: pixel 3
```

Each encoded pixel expands horizontally to 2 output pixels, producing an effective width of:

```text
22 cells * 4 multicolor pixels * 2 = 176 pixels
```

## 7. Color selection

Each 2-bit pixel value selects one of four colors:

### 7.1 Pixel value `0`

```text
color index = 0
```

This is a global fixed color for the image.

### 7.2 Pixel value `1`

Use the high nibble of color table A for the current character cell:

```text
color index = (color_table_a[cell] >> 4) & 0x0f
```

### 7.3 Pixel value `2`

Use the low nibble of color table A for the current character cell:

```text
color index = color_table_a[cell] & 0x0f
```

### 7.4 Pixel value `3`

Use the low nibble of color table B for the current character cell:

```text
color index = color_table_b[cell] & 0x0f
```

The high nibble of color table B is not used by the current decoder.

## 8. Palette

Color indices map through a 16-entry palette:

```text
0:  0x191d19
1:  0xfcf9fc
2:  0x4c3a93
3:  0xfafab6
4:  0xed7dd2
5:  0x6fcf6a
6:  0xd8444f
7:  0x8bfbfb
8:  0x5b9cd8
9:  0x07537f
10: 0x9f83ef
11: 0x535757
12: 0xa7a7a3
13: 0xbffbb7
14: 0xff97a3
15: 0xe7f9ef
```

## 9. Output geometry

The full decoded image grid is `176 x 64` pixels.

The current renderer writes only the interior area:

```text
width:  174 pixels
height: 62 pixels
```

This is produced by cropping a 1-pixel border on all sides.

## 10. Post-processing

The current renderer applies a small smoothing step while exporting:

- For even x positions only
- If pixel `(x, y)` matches pixel `(x + 1, y)`
- Replace pixel `(x, y)` with the average of `(x, y)` and `(x - 1, y)`

This affects exported images but is not part of the underlying disk format.

## 11. Open points

The following details remain intentionally unspecified:

- Whether the high nibble of color table B has a meaning in the original format
- Whether `0xCD` can appear as a literal through an escape form not used by the current decoder
