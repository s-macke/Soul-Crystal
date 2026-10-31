# Amiga PIC and GFX graphics

The extracted disks contain 13 named PIC assets and seven GFX archives.
The selected unlabelled four-disk set produces 200 PNGs: 13 PIC assets, 133 room/archive
records, 15 credit cards, 21 installation graphics, and 18 menu graphics.
Only this complete set is extracted; duplicate Venture and Venom variants are skipped. Archive record
numbers are **not** asserted to be room IDs; some records are death scenes,
special images, or duplicates.

## Tools and output

Run from the repository root (Go standard library only):

```sh
go run src/Go/amiga/main.go
GO111MODULE=off go run ./src/Go/amigapic
GO111MODULE=off go test ./src/Go/amigapic
```

The first command extracts ADF files into `data/Amiga/extracted/` and requires
that output directory not already exist. The graphics command reads those
files and writes `images/Amiga/`. Both directories use the simple names
`Disk 1`, `Disk 2`, `Disk 3`, and `Disk 4`. The extraction manifest records
the original ADF filenames and hashes. The graphics tool also
writes a local `index.html` gallery and a `manifest.json` with source paths,
SHA-256 hashes, dimensions, and GFX record offsets. Re-running graphics export
replaces its generated PNGs, gallery, and manifest.

## Compression

PICs and most GFX records use PowerPacker without the normal `PP20` signature
or an embedded offset-width table. The original decoder is in `Code/Kernal`
at offsets `0x00..0xa0`, with the table `09 0a 0c 0d` at `0xea`.
`Code/Intro` contains another copy of the routine.

The packed stream is read backwards, using the least-significant bit of each
big-endian 32-bit word first. The final word contains a 24-bit unpacked size
and an 8-bit initial skip count. Literal and backwards-copy runs reconstruct
the output from its end towards its beginning.

PIC records and the Credits/Install GFX records have an 8-byte header:

| Offset | Meaning |
|---|---|
| 0 | Big-endian uint32 unpacked size |
| 4 | Big-endian uint32 packed size, including footer |
| 8 | Packed stream |

Story PICs have a final zero/zero header. Other files can end immediately after
the final block. The decoder rejects malformed lengths, footers, truncated
input, and invalid back references.

## PIC layouts and palettes

Pixels are MSB-first within a byte. Each complete bitplane is stored separately;
plane zero contributes bit zero of the palette index. Executable offsets below
are relative to the first CODE hunk, whose file data starts at offset 32 in
Intro and Endpart.

| File | Stored dimensions | Planes | Palette source |
|---|---|---|---|
| ACA.PIC | 640 x 200 | 3 | Intro +0x1578, 8 RGB12 words |
| Starbyte.PIC | 640 x 200 | 4 | Intro +0x1558, 16 words |
| Title.PIC | 640 x 200 | 4 | Intro +0x1590, 16 words |
| Story1..4.PIC | 640 x 200 | 4 | Intro +0x15c0, 16 words |
| Cast.PIC | 320 x 200 | 5 | Intro +0x1538, colours 16..31; lower colours initially black |
| Hell.PIC | 640 x 200 | 4 | Endpart +0x189e, 16 words |
| HallOfFame.PIC | 640 x 200 | 4 | Endpart +0x18be, 16 words |
| EndScroll.PIC | 640 x 1000 | 1 | Monochrome preview |
| HellScroll.PIC | 640 x 376 | 1 | Monochrome preview |
| FameChar.PIC | 296 x 31 | 1 | Monochrome font-sheet preview |

Scroll blocks are consecutive chunks of one bitmap, not separate planes.
FameChar has a 37-byte stride and three 10-row character banks; 31 rows are
stored. Endpart +0xa8e..0xb30 implements the character selection and copying.

RGB12 words encode `0RGB`; each nibble is multiplied by 17 for PNG RGB values.
These exports omit runtime fades, copper colour changes, animated overlays,
and dynamically drawn text.

## DiskA..DiskD.GFX room archives

These have no per-record size headers. The Main executable holds NUL-terminated
ASCII decimal packed-size tables in its DATA hunk (file offset `0x19dc4`).
The loader at CODE +0x27c8..0x2aec selects a table, sums preceding lengths,
seeks the archive and reads a record. Table offsets below are DATA-relative.

| Archive | Size-table offset | Records |
|---|---|---|
| DiskA.GFX | 0x1612 | 18 |
| DiskB.GFX | 0x166c | 44 |
| DiskC.GFX | 0x1748 | 20 |
| DiskD.GFX | 0x17ac | 51 |

The recorded lengths exactly consume each archive. Each unpacked record has:

- 32 bytes: 16 RGB12 palette words.
- 11264 bytes: four 2816-byte planes, each 352 x 64 pixels.
- Zero or more 12-byte metadata records, followed by `ffff`.

Metadata meanings and the complete room-ID mapping remain unresolved. The PNG
export uses the per-record palette and leaves metadata untouched in the source.

## Other GFX archives

**Credits.GFX:** 15 records, each 25596 bytes: three 8532-byte planes at
432 x 158. Intro +0x2a4 sets up the blitter with width 27 words, height 158,
source stride 54, and successive plane offsets of `0x2154`. The eight-colour
palette is at Intro +0x15b0.

**Install.GFX:** four 16000-byte planes form a 640 x 200 background. Twenty
following records contain GFA BASIC GET-style bitmaps: three big-endian words
(depth, maximum x, maximum y), then planar pixels. Width and height are the
stored maxima plus one; rows are padded to a 16-bit boundary. The palette is
stored as ASCII values in RAMInstall's DATA hunk at +0x5a (file +0x7f40),
referenced by CODE +0x2080.

**Menu.GFX:** two length-prefixed auxiliary structures (232 and 216 bytes)
precede graphics at file offset `0x1c8`. Two 16000-byte planes form the
640 x 200 menu background; 17 following blocks use the same GET bitmap header.
The export uses the four shared UI colours: black, white, #aaa, #555. These
match the first four entries of the room palettes; independent tracing of the
menu palette initialization is still pending.

## Pixel proportions

Native PNGs preserve stored samples. High-resolution Amiga pixels are half as
wide as low-resolution pixels for the same line duration. A square-pixel view
therefore looks vertically squeezed. The gallery defaults to doubling the
height of high-resolution assets and leaves Cast at its low-resolution ratio.
Its checkbox switches to native square pixels. This simple correction is not
an exact PAL/NTSC CRT or overscan simulation.

Hardware reference: [How Amiga's Video Display is Produced](https://amigadev.elowar.com/read/ADCD_2.1/Hardware_Manual_guide/node0063.html).

## Validation and limits

The original 68000 routine was run with machine68k 0.4.1 (Musashi), using the
unlabelled Disk 1 `Code/Kernal`:

```text
SHA-256: 471a9250ae11fee4a606db01d52913b4b7091167795111e1f418eb5a4dece2d7
Entry: 0
A0: packed input start
D0: packed byte count
A3: output buffer start
```

All 51 PIC blocks and 191 GFX blocks match Go byte-for-byte. Frozen SHA-256
values from emulated output are in `src/Go/amigapic/testdata/`; regression tests
check the selected four-disk set against these values. This establishes
**decompression equivalence**, not full renderer or gameplay equivalence.

All 13 PIC assets and the room-image contact sheet were visually inspected;
representative credits, menu and installer graphics were checked as well.
The code also decodes the 13 custom `.ANIM` files (see below). Dynamic room effects remain outside this export.


## Custom ANIM files

`Victory.ANIM` on Disk 4 contains the missing winning sequence: an open castle
gate closes and displays “The End”. Twelve Disk 1 files animate the cast portraits.
These are custom containers, **not IFF ANIM**. `anim.go` exports 664 PNG frames
and 13 looping GIF previews under each disk's `animations/<name>/` directory.
All frames are 320 × 200 **low-resolution** pixels, so the gallery does not double
their height. GIF delays approximate PAL playback; fades, music and input waits
are not reproduced.

Records start with big-endian unpacked and stored lengths. Equal lengths mean
uncompressed bytes; otherwise the existing PowerPacker decoder applies. Victory
starts with four 8000-byte bitplanes and a zero/zero separator, followed by 15
deltas and a zero/zero terminator. Its palette is Endpart CODE +0x187e. The win
branch at +0xba calls +0x20e, which loads this file.

Cast files start with a 4256-byte record (four 96×88 planes plus 16 RGB12 colours)
and a 12600-byte record (five 192×105 caption planes). Intro +0x55e places the
portrait at (32,88), and +0x744 places the caption at (128,72), over Cast.PIC.
The upper 16 palette entries come from Intro +0x1538. Cast trailers are ten
bytes: `00000000 0a 00000000 0a`; the player stops on the first zero longword.

Intro +0xc7a and Endpart +0xeae apply delta streams. The first four big-endian
longwords are offsets to per-plane streams (zero means unchanged). For each
column, one byte gives the number of operations. A nonzero byte below 128 skips
rows; a byte with bit 7 set copies its lower-seven-bit count of literals; zero
reads a count and a repeated byte. Screen stride is 40 bytes, plane stride 8000.
Cast modifies 16 columns, Victory 40. **Two alternating buffers** retain the
frame from two steps earlier. Applying all deltas to one buffer is incorrect.

### Native validation

All 651 delta updates were independently applied by the original 68000 routines
using machine68k 0.4.1 and matched Go byte-for-byte. Packed records in that run
were decompressed by the original Kernal routine. Frozen frame hashes are in
`testdata/native_anim_frames_sha256.json`. Initial composed screens are shared
inputs to this comparison, so this proves delta reconstruction, not independent
emulation of the blitter composition, palettes, timing or complete playback.
Representative cast frames and the first/last Victory frames were visually checked.

Optional oracle reproduction (machine68k must be installed in that Python):

```sh
SOUL_ANIM_NATIVE_DUMP=/tmp/soul-anim-raw GO111MODULE=off go test ./src/Go/amigapic -run TestAnimationFrames
python3 src/Go/amigapic/tools/verify_native_anim.py
```
