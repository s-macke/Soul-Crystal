# Amiga TXT/TAB text archives

All five TXT/TAB pairs from the selected four-disk set are decoded. The Go
exporter preserves the original character stream, including layout spaces and
placeholders; it does not simulate the game's text wrapping or substitutions.

```sh
GO111MODULE=off go run ./src/Go/amigatext
GO111MODULE=off go test ./src/Go/amigatext
```

Output is under `texts/Amiga/Disk N`: a readable UTF-8 `.txt` and a `.json`
with game text IDs, compressed offsets and sizes, decoded byte counts, and
SHA-256 hashes. Existing C64/DOS exports are untouched.

## Coverage

| Archive | Disk | Records | Main ID range | Additional IDs | Packed bytes | Decoded bytes |
|---|---:|---:|---|---|---:|---:|
| RAMCommon | 3 | 146 | 1–106 | 580–619 | 15,972 | 26,705 |
| DiskA | 2 | 63 | 107–168 | 620 | 18,770 | 32,879 |
| DiskB | 3 | 199 | 169–355 | 621–632 | 55,807 | 97,609 |
| DiskC | 2 | 42 | 356–397 | — | 16,493 | 29,090 |
| DiskD | 4 | 186 | 398–579 | 633–636 | 52,389 | 91,700 |

Together these cover all 636 IDs, without gaps or duplicates. Every packed
archive byte belongs to one of these records. Each record consumes exactly
its specified packed byte length; only unused bits in the final byte remain.

The first DiskA text describes the hotel room, DiskB starts in Mylgor's study,
DiskC in the forest, and DiskD in the castle garden. RAMCommon contains shared
responses and interface messages, including the score and disk-change prompts.

## TAB tree

All integers are big-endian. The first uint16 is the number of nodes. Each node
has three uint16 fields: left child, right child, character value. Child indices
are **one-based**; the final node is the root. Leaves have both children zero.
Children precede their parent. The entire file is exactly `2 + 6 * nodeCount`
bytes. Tree sizes are 143, 145, 131, 159 and 167 nodes for A, B, C, D and RAMCommon.

TXT bits are consumed MSB-first. Zero selects the left child, one the right.
At a leaf, output its character byte and return to the root. German characters
use Latin-1 byte values, unlike the DOS CP437 and custom C64 character mapping.

There is **no terminating character** in these streams. Each record starts at
a byte boundary and stops after an externally supplied decoded byte count.
Decoding the whole file continuously incorrectly interprets inter-record padding
as extra letters. This is an important difference from the DOS archive decoder.

## Length tables and original decoder

`Disk 3/Code/Main` is an Amiga Hunk executable. Its first HUNK_DATA starts at
file offset `0x19dc4` and contains NUL-terminated decimal BASIC DATA values.
Offsets below are relative to that data hunk:

| Archive | Decoded lengths | Packed lengths |
|---|---:|---:|
| RAMCommon | 0x0010 | 0x020a |
| DiskA | 0x03ed | 0x04ea |
| DiskB | 0x05da | 0x08f9 |
| DiskC | 0x0be6 | 0x0c98 |
| DiskD | 0x0d40 | 0x1029 |

The text dispatch code (Main file offsets approximately `0x140e..0x1b7e`)
selects these tables by text ID, sums preceding packed lengths to obtain the
file offset, and supplies the decoded length to the decompressor. The exporter
pins Main's SHA-256 to avoid silently applying these offsets to another version:
`cc74c2f3ce20ac1445d5c53382c6ac4baae6e40160d88173df54cd469b82449c`.

The original decompressor is at **Code/Kernal offset 0x2a0**:

- A0: compressed record
- A1: output buffer
- A2: TAB tree including its count word
- D0: decoded byte count

All **636 records** were run through this actual routine using machine68k 0.4.1
(Musashi, M68000). Every execution returned normally, and every decoded byte
matched the Go result. Native output hashes are frozen in
`src/Go/amigatext/testdata/native_sha256.json` and checked by the Go tests.
This validates decompression, not the game's subsequent on-screen formatting.

## Comparison with existing exports

The same Huffman principle used by the C64/DOS decoders applies, but tree layout,
character encoding, and record framing differ. Of the 146 RAMCommon records,
138 exactly match a text in the existing DOS exports after removing whitespace.
The other records must not be assumed identical across platforms.

Layout spaces are kept verbatim. Some words appear joined where the original
renderer would wrap a line; no speculative spaces or line breaks are inserted.
`SoulCrystal.DATA`, music, and animation formats are outside this export.
