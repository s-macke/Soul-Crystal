# C64 Text Compression

This document describes the text compression format used by indexed C64 text records stored in `.d64` data blocks.

## 1. Indexed text records in disk data

Indexed text records are referenced through the pointer table described in [`disk_format.md`](/home/sebastian/projects/Soul_Crystal/spec/C64/disk_format.md).

### 1.1 Record layout

A text record begins at the resolved indexed offset:

```text
+0..1: signed little-endian value `a`
+2..3: signed little-endian value `b`
+4..  : bit-packed payload
```

The payload starts at offset `+4`.

### 1.2 Decoded length

If the payload starts at offset `p`, then:

```text
a = (buf[p - 3] << 8) + buf[p - 4]
b = (buf[p - 1] << 8) + buf[p - 2]
decoded_length = 65536 - b
```

Only `b` is required to determine the number of decoded characters. The exact meaning of `a` is not fixed by this spec.

### 1.3 Decode tree layout

The decode tree is stored in the same disk data at:

```text
0x200..0x27f
0x280..0x2ff
```

At node `pos`:

```text
a = tree[0x200 + pos]
b = tree[0x280 + pos]
```

### 1.4 Bit order

Bits are consumed most significant bit first within each byte:

```text
bit 7, then bit 6, ..., then bit 0
```

When all bits in a byte have been consumed, decoding advances to the next byte.

### 1.5 Traversal rules

At each node:

- If the current bit is `1` and `a >= 128`, return `a`
- If the current bit is `0` and `b >= 128`, return `b`
- Otherwise descend to node `a` or `b`

This forms a binary decode tree with embedded terminal values.

### 1.6 Character mapping

Decoded byte values are converted through a game-specific character table using:

```text
character_index = value - 0x40
```

The character set includes:

- ASCII-style letters and digits
- punctuation
- German umlauts
- localized special symbols

### 1.7 Wrapping behavior

After every 40 decoded characters, a space is inserted to mimic C64 line wrapping behavior.

## 2. Open points

The following details remain intentionally unspecified:

- The exact meaning of the first 16-bit word in indexed text records
- The full localized character table in canonical table form
