# C64 Disk Format

This document describes the C64 disk-image formats used by the game data.

It covers two layers:

1. Standard 35-track Commodore 1541 `.d64` sector addressing.
2. Game-specific data structures stored inside those disk images.

## 1. Raw `.d64` image

The disk image size is `174848` bytes, matching a standard 35-track 1541 disk image.

### 1.1 Track geometry

Sector counts per track:

- Tracks `1-17`: `21` sectors per track
- Tracks `18-24`: `19` sectors per track
- Tracks `25-30`: `18` sectors per track
- Tracks `31-35`: `17` sectors per track

Each sector is `256` bytes.

### 1.2 Absolute byte offset

A track/sector/byte tuple maps to an absolute image offset as follows:

```text
track 1-17:
  ((track - 1) * 21 + sector) * 256 + byte

track 18-24:
  (17 * 21 + (track - 18) * 19 + sector) * 256 + byte

track 25-30:
  (17 * 21 + 7 * 19 + (track - 25) * 18 + sector) * 256 + byte

track 31-35:
  (17 * 21 + 7 * 19 + 6 * 18 + (track - 31) * 17 + sector) * 256 + byte
```

## 2. Pointer table at offset `0x300`

The region beginning at absolute disk offset `0x300` is used as a game-specific pointer table.

### 2.1 Entry format

Each entry is 3 bytes:

```text
+0: track
+1: sector
+2: byte offset within sector
```

Given a table index `n`, the triplet is read from:

```text
0x300 + n * 3
```

and converted into an absolute disk offset using the track geometry above.

### 2.2 Intended use

The table acts as a directory of embedded resources:

- Text records
- Room image records
- Other indexed data blocks

Adjacent entries can also be compared to estimate record span.

## 3. Sequential file chain format

Some files are stored as linked sectors starting from an explicit `(track, sector)` pair.

### 3.1 Sector layout

Each sector begins with a 2-byte link:

```text
+0: next track
+1: next sector, or byte count on final sector
```

Interpretation:

- If byte `0 != 0`, the sector links to another sector.
- If byte `0 == 0`, this is the final sector and byte `1` is the number of valid bytes in the sector.

### 3.2 First sector layout

The first sector in a chained file has a special header:

```text
+0: load address low
+1: load address high
+2: next track
+3: next sector
+4..255: payload
```

Interpretation:

- Bytes `0-1` define the destination start address in C64 RAM.
- Payload begins at `+4`.

### 3.3 Continuation sector layout

All later sectors use:

```text
+0: next track
+1: next sector, or final byte count
+2..255: payload
```

Payload rules:

- Non-final continuation sectors contribute `254` payload bytes from `+2..255`.
- The final sector contributes `final_count - 2` bytes from `+2`.

### 3.4 Effective copy behavior

The chained loader behaves like this:

- First sector: copy `252` bytes from offset `+4`
- Middle sectors: copy `254` bytes from offset `+2`
- Final sector: copy `byte_1 - 2` bytes from offset `+2`

## 4. Indexed text and image records

Entries addressed through the pointer table are used for both text and image resources.

### 4.1 Text record header

A text record begins at the resolved pointer-table offset:

```text
+0..1: signed little-endian value `a`
+2..3: signed little-endian value `b`
+4..  : bit-packed payload
```

The stored words appear to be negative values encoded in two's complement. The second word controls decoded string length.

### 4.2 Decoded text length

If the bit-packed text payload starts at offset `p`, then:

```text
a = (buf[p - 3] << 8) + buf[p - 4]
b = (buf[p - 1] << 8) + buf[p - 2]
decoded_length = 65536 - b
```

Only `b` is required for termination of the decoded string. The exact meaning of `a` is not currently fixed by this spec.

### 4.3 Text compression

The payload beginning at `+4` is a bit-packed text stream. Its compression format, decode tree, and character mapping are specified separately in [`text_compression.md`](/home/sebastian/projects/Soul_Crystal/spec/C64/text_compression.md).

### 4.4 Image records

Image records begin at the resolved pointer-table offset and contain at least a 2-byte header before image payload:

```text
+0..1: image-specific header
+2..  : image payload
```

The image payload encoding is specified separately in [`image_format.md`](/home/sebastian/projects/Soul_Crystal/spec/C64/image_format.md).

## 5. Known pointer-table ranges used for room data

Known index bases:

- Side B1: `312`
- Side B2: `448`
- Side C1: `291`
- Side C2: `435`

These are known data ranges, not universal format constants.

## 6. Open points

The following details remain intentionally unspecified:

- The precise semantic meaning of the first 16-bit word in indexed text records
- The full binary encoding of image payloads
