# DOS Text Archive Format

This document describes the DOS-side text archive formats used by the game data.

## 1. Chunk container

The DOS text archives use a chunked container format.

Each chunk begins with:

```text
struct TCHUNK {
  char     name[4];
  uint32_t size_be;
}
```

`size_be` is stored big-endian.

Archive structure:

1. A top-level chunk header
2. A second fixed 4-byte identifier
3. A sequence of subchunks

For each subchunk:

- Read 8-byte header (`name`, `size_be`)
- If `size_be` is odd, round up to the next even byte count when reading payload
- Only the unpadded size is meaningful content

## 2. Known chunk types

Recognized chunk IDs:

- `HUHD`: archive header (text counts and Huffman tree size)
- `HUTB`: Huffman table (shared by all sub-archives in the file)
- `TXTL`: decompressed text lengths (one per sub-archive)
- `BODY`: Huffman-compressed text stream (one per sub-archive)
- `HUFL`: compressed text offsets within BODY (one per sub-archive)
- `ROOM`: room ID mapping (only in `PARTx.TXT`)
- `VERB`: fixed-width verb strings (only in `VERBS.TXT`)

## 3. `TXTL`

`TXTL` is an array of 16-bit big-endian values.

Each value is the decoded length of one text entry.

## 4. `HUFL`

`HUFL` is an array of 16-bit big-endian values.

These appear to be positions or offsets related to the packed text stream, but the exact unit is not fixed by this spec.

## 5. `ROOM`

`ROOM` is an array of 16-bit big-endian room identifiers.

## 6. `VERB`

`VERB` contains fixed-width 16-byte strings.

Each record is exactly:

```text
16 bytes: verb text
```

## 7. Huffman text compression

### 7.1 `HUTB` layout

`HUTB` is a sequence of 2-byte entries:

```text
+0: bit flag
+1: value
```

The table is split into two equal halves and interpreted as an implicit binary tree.

### 7.2 Bit order

Bits are consumed most significant bit first (bit 7, then bit 6, …, bit 0).

### 7.3 Traversal rules

Let `poshalf = length(HUTB) / 2`. The table is interpreted as two parallel branch arrays:

- lower half (indices `0` … `poshalf-1`): selected when the stream bit is `0`
- upper half (indices `poshalf` … `length-1`): selected when the stream bit is `1`

Traversal starts at the root node, index `poshalf - 1` (the last entry of the lower half).

At each node at index `pos`:

1. Read one bit from the stream.
2. Pick the branch: if the bit is `0`, use entry `pos`; if `1`, use entry `poshalf + pos`.
3. If the selected entry has `bit == 0`, it is a terminal — return its `value`.
4. Otherwise, set `pos` to the entry's `value` and repeat from step 1.

### 7.4 `BODY` stream

`BODY` is a bit-packed text stream decoded through the Huffman table from `HUTB`.

Decoded strings are terminated by byte value `0`. After each `0` terminator, the bit stream advances to the next byte boundary before decoding the next string.

## 8. `HUHD` archive header

`HUHD` is always the first subchunk. Its 6-byte payload contains three big-endian uint16 values:

| Offset | Field           | Description                                          |
|--------|-----------------|------------------------------------------------------|
| +00    | poshalf         | Huffman tree half-size (number of internal nodes)    |
| +02    | primary_count   | Text count in the primary sub-archive                |
| +04    | room_count      | Text count in the room sub-archive (0 if none)       |

## 9. Dual sub-archive structure

`COMMN.TXT` and `RAM.TXT` contain a single sub-archive. `PARTx.TXT` files contain two sub-archives that share the same Huffman tree (HUTB).

Chunk order in a single-archive file:

```
HUHD  HUTB  TXTL  BODY  HUFL
```

Chunk order in a dual-archive file (`PARTx.TXT`):

```
HUHD  HUTB  TXTL₁  BODY₁  HUFL₁  TXTL₂  BODY₂  HUFL₂  ROOM
```

- Subscript 1: primary sub-archive (verb responses, game messages)
- Subscript 2: room sub-archive (room description strings)

The ROOM chunk maps room sub-archive indices to room IDs (see section 5).

### 9.1 Text counts

| File         | Primary | Room | Notes                              |
|--------------|---------|------|------------------------------------|
| `COMMN.TXT`  | 122     | --   | Shared text used when part_id = 0  |
| `RAM.TXT`    | 35      | --   | System messages with format placeholders |
| `PARTA.TXT`  | 63      | 15   | Rooms 83--97                       |
| `PARTB.TXT`  | 199     | 35   | Rooms 83--117                      |
| `PARTC.TXT`  | 42      | 15   | Rooms 83--97                       |
| `PARTD.TXT`  | 186     | 38   | Rooms 83--120                      |

Room descriptions are short strings (7--22 bytes). Primary texts are substantial game content (200--1200 bytes each).

## 10. Object name table

The object-name file consists of `166` fixed-size records of `16` bytes each.

Each byte is decoded by XOR with `0xAA`:

```text
decoded = encoded ^ 0xAA
```

The resulting byte stream is then mapped to display text using the game's localized output rules.

## 11. Open points

- The precise unit used by `HUFL` (likely byte offsets into BODY for each text entry, parallel to TXTL which gives decompressed lengths).
- The exact loading mechanism for `RAM.TXT` — it is file index 0 in the executable's filename table and contains system messages with `@u1`/`@s1` format placeholders, but its integration with the three-slot archive system is not fully traced.
