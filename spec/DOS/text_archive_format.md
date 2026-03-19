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

- `HUHD`: Huffman-related header block
- `HUTB`: Huffman table
- `BODY`: bit-packed text stream
- `TXTL`: decoded string lengths
- `HUFL`: packed-text positions or offsets
- `ROOM`: room IDs
- `VERB`: fixed-width verb strings

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

Bits are consumed most significant bit first.

### 7.3 Traversal rules

The table is interpreted as two parallel branch arrays:

- lower half: one branch set
- upper half: the other branch set

Traversal behavior:

- A branch with `bit == 0` is terminal and returns `value`
- Otherwise `value` is interpreted as the next node index

### 7.4 `BODY` stream

`BODY` is a bit-packed text stream decoded through the Huffman table from `HUTB`.

Decoded strings are terminated by byte value `0`.

## 8. Object name table

The object-name file consists of `166` fixed-size records of `16` bytes each.

Each byte is decoded by XOR with `0xAA`:

```text
decoded = encoded ^ 0xAA
```

The resulting byte stream is then mapped to display text using the game's localized output rules.

## 9. Open points

The following details remain intentionally unspecified:

- The precise unit used by `HUFL`
- The meaning of the fixed 4-byte identifier after the top-level archive header
