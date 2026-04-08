# DOS Text Display Pipeline

This document describes how text is displayed in the DOS version of Soul Crystal, from game logic through Huffman decompression to screen output.

## 1. Overview

On the C64, the VM sets `textoutput` to a text ID and calls `showtext()` (opcode E8h) for immediate display. The DOS version replaces this with a multi-stage pipeline:

1. Verb handler determines a text ID and returns it.
2. Caller queues the ID into a display list.
3. Engine display controller picks up the entry.
4. Huffman decompressor expands the text into a buffer.
5. Screen renderer blits the buffer to the text area.

## 2. Game logic layer (seg000)

### 2.1 Text ID selection

Each verb handler (e.g. `sub_1000_10fc`) uses long `CMP`/`JNZ` chains to select a text ID based on room, object, and game state. The chosen ID is stored in a local variable (`[bp-18]`) and returned in AX:

```asm
mov word ptr [bp-18], 0070h   ; text ID for this situation
...
mov ax, [bp-18]               ; return it
retf 0002
```

### 2.2 Display list queue (`sub_1000_0a2d`)

The caller queues the text ID into a display list via `sub_1000_0a2d(text_id, room_property)`:

```asm
push word ptr [bp-16]         ; text ID
push word ptr es:[bx]         ; room_property from room record +04
call sub_1000_0a2d
```

The display list is a BASIC array at descriptor `[0080]`:

| Field       | Value                          |
|-------------|--------------------------------|
| Base        | far pointer at `[0080]`        |
| Entry size  | 14 bytes (0Eh)                 |
| Capacity    | 10 entries (indices 1--10)     |
| Entry +00   | text ID (word)                 |
| Entry +02   | room property / part ID (word) |
| Entry +04   | display counter (word)         |
| Entry +06.. | additional state               |

`sub_1000_0a2d` finds the first free slot (where `[entry+0] == FFh`), shifts entries down to make room at position 1, and stores the new (text_id, room_property) pair there. Entry 0 is reserved for the engine's current display state.

### 2.3 Queue maintenance (`sub_1000_28ff`)

Called in the main loop's post-action phase. Shifts entries in the display list (copies entry N to entry N+1 for N = 1..10), advancing the queue.

## 3. Engine display controller (`sub_1bd7_9710`)

This is the closest DOS equivalent to the C64 `showtext()`. It takes a pointer to a text reference structure:

| Offset | Width | Field          |
|--------|-------|----------------|
| +00    | word  | text_index     |
| +02    | word  | part_id        |
| +04    | word  | display_count  |
| +05    | byte  | repeat_counter |

Processing logic:

1. If the text archive for `part_id` is not loaded, calls `sub_1bd7_9a46` to load it from disk.
2. Classifies the text index into ranges:
   - 01h--52h: common text (from `COMMN.TXT`)
   - 53h--243h: room-specific text (from `PARTx.TXT`, index adjusted by subtracting 53h)
   - 244h+: part-specific extended text
3. Calls `sub_1bd7_a3a2` with the appropriate mode and text index to decompress.
4. Calls `sub_1bd7_a5b6` to render the decompressed text to the screen.
5. Sets the flag at `[6EBAh] = 1` to indicate text was displayed.

### 3.1 Text archive loader (`sub_1bd7_9a46`)

Loads a text archive (`.TXT` file) into memory. Supports three archive slots:

| Mode | Archive         | Huffman table base | Body base |
|------|-----------------|--------------------|-----------| 
| 0    | `COMMN.TXT`     | seg 2C43           | seg 458F  |
| 1    | Part text        | seg 458F           | seg 2C43  |
| 2    | Room text        | seg 458F           | seg 36AD  |

Each slot stores the parsed archive data at fixed segment:offset locations. Pointers to the HUTB lower half, HUTB upper half, TXTL table, BODY data, and tree size are set up in segment descriptor variables at `[6E3Eh]`--`[6E58h]`.

## 4. Huffman decompressor (`sub_1bd7_a3a2`)

Decompresses a single text entry from the loaded archive into a screen buffer.

### 4.1 Parameters

| Parameter   | Description                                    |
|-------------|------------------------------------------------|
| `[bp+8]`    | Mode (0 = common, 1 = part, 2 = room, 3 = room variant) |
| `[bp+6]`    | Text index within the archive                  |

### 4.2 Setup

Based on the mode, the function loads six values from the corresponding archive slot:

| Local        | Meaning                                |
|--------------|----------------------------------------|
| `[bp-4]`     | `poshalf` -- half the Huffman table size (= number of internal nodes) |
| `[bp-6]`     | Decompressed text length (from TXTL)   |
| `[bp-16]:[bp-14]` | Far pointer to HUTB lower half    |
| `[bp-1a]:[bp-18]` | Far pointer to HUTB upper half    |
| `[bp-1e]:[bp-1c]` | Far pointer to BODY compressed data |

The output buffer at `458F:CAB6h` (4096 bytes) is cleared to zero before decompression.

### 4.3 Decompression algorithm

The Huffman tree is walked bit-by-bit from the compressed body data. This is the same algorithm described in `text_archive_format.md` section 7, implemented in x86:

```
root = poshalf + 0xFF          ; root node index
node = root
bit_pos = 8                    ; forces first byte read
byte_offset = 0
output_pos = 0

while output_pos < text_length:
    if bit_pos == 8:
        current_byte = BODY[byte_offset]
        byte_offset++
        bit_pos = 0

    table_index = node - 0x100
    mask = 0x80 >> bit_pos     ; MSB-first bit order

    if current_byte & mask:
        node = upper_half[table_index]    ; bit = 1
    else:
        node = lower_half[table_index]    ; bit = 0

    bit_pos++

    if node <= 0xFF:           ; leaf node = decoded character
        buffer[output_pos] = node
        output_pos++
        node = root            ; restart from root
```

This matches the C64 VM's Huffman decoder exactly: MSB-first bit reading, the same two-half tree table layout, and root at `poshalf + 0xFF` (equivalent to `poshalf - 1` when the table uses 0-based indexing with entries ≥ 0x100 for internal nodes).

## 5. Text formatting (`sub_1bd7_98f0`)

After decompression, the buffer may contain inline formatting codes. `sub_1bd7_98f0` scans the buffer at `458F:CAB6h` and interprets control sequences:

- `@sN` (byte 40h, 73h, 30h+N): triggers a sub-display action (e.g. show associated image)
- `@uN` (byte 40h, 75h, 30h+N): triggers an update/animation action

The index N is extracted by subtracting 31h from the byte following the type character.

## 6. Screen renderer (`sub_1bd7_a5b6`)

Takes a far pointer to a null-terminated string buffer and a display mode flag. Renders the text into the game's text display area on the EGA screen. Called with:

```asm
push word ptr [bp-2]     ; mode (0 = normal, 1 = no-scroll)
mov ax, CAB6h            ; buffer offset
push es                  ; buffer segment (458Fh)
push ax
call sub_1bd7_a5b6
```

## 7. Scroll / area management (`sub_1bd7_a3a2` preamble)

Before decompression, the same function (`sub_1bd7_a3a2`) is also called in a separate invocation with mode parameters to scroll or clear the text display area. The display controller (`sub_1bd7_9710`) calls it with:

- Mode 0, index N: scroll up and prepare for common text entry N
- Mode 1, index N: prepare for part text entry N
- Mode 2, index N: prepare for room text entry N (index = original - 53h)
- Mode 3, index N: prepare for room text continuation

## 8. Complete call chain

```
Main loop (0002_loc_unknown_1000_0030)
  │
  ├─ sub_1000_2bdc          input parser / pre-action
  │    └─ sub_1000_361b      game state update
  │
  ├─ verb dispatch ──────── verb handler (e.g. sub_1000_10fc)
  │                            │
  │                            └─ returns text_id in AX
  │
  ├─ sub_1000_0a2d          queue (text_id, room) into display list
  │
  ├─ sub_1bd7_9710          display controller (showtext equivalent)
  │    ├─ sub_1bd7_9a46      load text archive if needed
  │    ├─ sub_1bd7_a3a2      Huffman decompress into buffer
  │    ├─ sub_1bd7_98f0      interpret formatting codes
  │    └─ sub_1bd7_a5b6      render to screen
  │
  └─ loop back
```

## 9. Text ID routing

The display controller (`sub_1bd7_9710`) routes text IDs to archives based on two values: the `part_id` (from room record +04) and the `text_id` itself.

### 9.1 Routing rules

| part_id | text_id range | Source             | Decompressor mode | Archive index      |
|---------|---------------|--------------------|-------------------|--------------------|
| 0       | 1--122        | `COMMN.TXT`        | 0                 | text_id − 1        |
| ≠ 0     | 1--82         | `PARTx.TXT` primary | 1                | text_id − 1        |
| ≠ 0     | 83--579       | `PARTx.TXT` room    | 2                | ROOM table lookup  |
| ≠ 0     | 580+          | `PARTx.TXT` primary | 1                | text_id − 498      |

The thresholds 83 (53h) and 579 (243h) are hard-coded in `sub_1bd7_9710`. The split at 83 aligns with room IDs starting at 83 in all `PARTx.TXT` ROOM chunks.

For the primary archive high range (580+), index = text_id − 498 = text_id − 580 + 82, so indices 82+ in the primary archive map to text IDs 580+. This gives the primary archive a contiguous index space: indices 0--81 for the low range and 82+ for the high range.

### 9.2 Archive contents

Each `PARTx.TXT` file contains **two** sub-archives sharing a single Huffman tree (HUTB):

| Sub-archive | Chunks                  | Content                   |
|-------------|-------------------------|---------------------------|
| Primary     | TXTL₁ + BODY₁ + HUFL₁  | Verb responses, game text |
| Room        | TXTL₂ + BODY₂ + HUFL₂ + ROOM | Room description strings |

The HUHD chunk header (6 bytes, 3 big-endian uint16) stores:

| Offset | Field           | Description                               |
|--------|-----------------|-------------------------------------------|
| +00    | poshalf         | Huffman tree half-size (root = poshalf − 1 + 100h) |
| +02    | primary_count   | Number of texts in primary sub-archive    |
| +04    | room_count      | Number of texts in room sub-archive (0 if none) |

### 9.3 Text counts per file

| File         | Primary texts | Room texts | Total | Notes                      |
|--------------|---------------|------------|-------|----------------------------|
| `COMMN.TXT`  | 122           | --         | 122   | Shared across all parts    |
| `RAM.TXT`    | 35            | --         | 35    | System / formatted messages |
| `PARTA.TXT`  | 63            | 15         | 78    | Text IDs 1--63 + rooms 83--97 |
| `PARTB.TXT`  | 199           | 35         | 234   | Text IDs 1--82, 580--696 + rooms 83--117 |
| `PARTC.TXT`  | 42            | 15         | 57    | Text IDs 1--42 + rooms 83--97 |
| `PARTD.TXT`  | 186           | 38         | 224   | Text IDs 1--82, 580--683 + rooms 83--120 |

Room descriptions are short strings (7--22 bytes decompressed, e.g. "Im Gästezimmer"). Primary archive texts are the substantial game content (200--1200 bytes each: verb responses, puzzle messages, story text).

### 9.4 `RAM.TXT`

`RAM.TXT` contains 35 system-level texts with `@u1`/`@s1` format placeholders for runtime values (score, object names, disk numbers). These include the score display, copy protection prompt, direction error message, and generic verb responses ("Okay, closed", "Dropped @s1"). It is loaded separately from the three-slot archive system and is file index 0 in the executable's filename table.

### 9.5 Archive slot loading

Three archive slots are populated at different times:

| Slot | Mode | Loaded by          | Trigger                      |
|------|------|--------------------|------------------------------|
| 0    | COMMN | `sub_1bd7_db3c`   | Once per game turn           |
| 1    | Part  | `sub_1bd7_db3c`   | When part changes            |
| 2    | Room  | `sub_1bd7_9710`   | On demand (when part_id changes) |

## 10. C64 equivalence

| C64 VM                | DOS                                          |
|-----------------------|----------------------------------------------|
| `textoutput = id`     | Verb handler stores ID in `[bp-18]`, returns in AX |
| `showtext()`          | `sub_1bd7_9710` → `sub_1bd7_a3a2` → `sub_1bd7_a5b6` |
| Huffman tree walk     | `sub_1bd7_a3a2` at `loc_1bd7_a527` (identical algorithm) |
| Text archives in RAM  | Three archive slots (common, part, room) at fixed segments |
| Immediate display     | Deferred via display list at `[0080]`         |

Note: C64 text IDs (from `out/part*.c`) do **not** correspond to DOS text IDs. The game logic was reimplemented, so text numbering differs between platforms even though the text content is equivalent.
