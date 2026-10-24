# C64 and DOS image galleries

Open `images/C64/index.html` or `images/DOS/index.html` directly in a browser.
No server is required. DOS defaults to the configured VGA presentation, with
a stored-pixel toggle; C64 retains its optional height toggle. These only change
HTML display; PNG pixels and dimensions are preserved. See
[DOS display evidence](DOS/image_format.md#14-dos-display-resolution-and-gallery-presentation).

From the repository root:

```sh
bash extract_images.sh          # C64 and DOS
bash extract_images.sh c64      # C64 only
bash extract_images.sh dos      # DOS only
```

The script uses the Go extractors, which also regenerate each gallery using
`src/Go/gallery`. Direct equivalents are `GO111MODULE=off go run ./src/Go/images`
and `GO111MODULE=off go run ./src/Go/dospic`.

## C64 source sides

| Folder under images/C64 | Source D64 side | PNGs |
|---|---|---:|
| Disk B1 | Soul Crystal SideB1.d64 | 19 |
| Disk B2 | Soul Crystal SideB2.d64 | 45 |
| Disk C1 | Soul Crystal SideC1.d64 | 21 |
| Disk C2 | Soul Crystal SideC2.d64 | 52 |

These are four extracted gameplay **sides**, not four physical floppies. The
selected source set also contains A1 and A2, whose graphics are not covered by
this extractor. The original side labels remain in filenames for traceability.
The C64 renderer already doubles horizontal multicolor pixels in the PNGs.

`images/C64/story` contains the eight existing story PNGs and `story.txt`,
moved unchanged from `data/story`. The gallery includes these images as a
separate section; the extractor preserves these manually supplied assets.

## DOS grouping and floppy evidence

| Folder under images/DOS | Source archives | PNGs |
|---|---|---:|
| Part A | PARTA.PIC | 18 |
| Part B | PARTB1.PIC, PARTB2.PIC | 45 |
| Part C | PARTC.PIC | 20 |
| Part D | PARTD1.PIC, PARTD2.PIC | 55 |
| Intro | INTRO.PIC | 26 |
| Shared | CASTTEXT.PIC, MENUSUBS.PIC, MENUMAIN.PIC, INITIAL.PIC, FONT.PIC | 36 |

These are resource groups, not asserted floppy assignments. `data/DOS/Soul`
is an installed directory, not a set of original disk images. The original
DOS floppy count remains unconfirmed.

The local DOS disassembly provides concrete disk-routing evidence:

- `seg001:D657..D66D` reads 0x228 bytes of SOUL.CFG into `seg005:0540`.
- The installed configuration starts `04 43 01`; the byte at offset 1 is `C`.
- The file loader `seg001:B06C` indexes the filename pointer table at
  `seg011:621C`, and reads a per-file disk byte from `seg005:0543 + fileIndex`.
- This corresponds to configuration offset `3 + fileIndex`. All 37 disk bytes
  in the current SOUL.CFG are zero. The loader also bypasses its disk-change
  call when the configuration byte at `seg005:0541` is `C`.
- `texts/DOS/RAM.txt` contains the prompt to insert `SoulCrystalDisk@u1`.

Thus the engine supports disk assignments, but this installed configuration
cannot reconstruct the original floppy layout. Archive names alone do not
prove disk numbers. The B1/B2 and D1/D2 archives are combined by game part.

The existing decoder's limitations remain: ANIMS.PIC frames are not exported;
images without embedded palettes use its EGA fallback palette.

## Move verification

All 337 existing C64/DOS PNGs were moved without renaming their basenames.
Regenerating with the updated Go extractors produced exactly the same SHA-256
hashes for all 337 files. Only their parent directories changed. Git can record
these as exact renames; there is no additional resized PNG collection.
