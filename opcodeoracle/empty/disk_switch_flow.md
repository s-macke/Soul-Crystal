# Disk Switch Flow

This note summarizes the confirmed disk-side switch path in the main C64 binary,
updated to match the drive protocol analysis in `drive_command_protocol.md`.

## High-Level Result

The disk switch is not just a UI prompt plus a metadata refresh. It has three
distinct phases:

1. Prompt and side-selection UI.
2. Bulk reload of side-specific lookup tables.
3. Additional chained resource loads, with observed destinations at:
   - `$7600`
   - `$B926`

The current best interpretation is:

- `$7600` receives VM/script data.
- `$B926` receives SID music data.
- `$C900` receives a side-specific executable overlay for the stream/resource layer.

## 1. Prompt Layer

### `$52D2` `special_09_disk_install_flow`

This is the user-facing "install/change disk" prompt.

Confirmed behavior:

1. Shows text `$0247`.
2. Waits for translated frontend input through `$5D5A`.
3. Accepts `J` or right mouse.
4. On accept, calls `$62D1`.
5. On cancel/failure, shows text `$024A` and returns.

This prompt is not itself the low-level disk-transfer logic.

## 2. Entering Disk Side Selection

### `$5277`

Entry into the disk-side selection flow from regular game logic.

Confirmed behavior:

1. Sets `addr6963 = 1`.
2. Calls `refresh_current_room_state` at `$5396`.
3. Calls `$569D`.

### `$569D` `enter_disk_side_selection_flow`

Initializes selector state and enters the side-metadata setup path.

Immediate call:

- `$56FD` `load_disk_side_metadata_block`

### `$56FD` `load_disk_side_metadata_block`

Loads a side-specific metadata block through the generic descriptor loader:

```asm
JSR $0D4F
.BYTE $04,$92,$69,$01,$00,$67,$00
```

This is selector setup data, not yet the final side-table reload.

## 3. Modal Side Selection Loop

### `$53A4` `disk_side_selection_loop`

This is the modal loop that drives disk-side selection.

Confirmed behavior:

1. Accepts translated prompt input.
2. Loads selector resources.
3. Probes the currently inserted disk.
4. Compares the inserted disk identity against the selected disk ID.
5. Either stays in the local refresh path or branches to the real reload path at `$54EB`.

Important internal steps:

### `$5409`

Loads selector resources with:

```asm
JSR $0D4F
.BYTE $44,$92,$69,$01,$00,$00,$71
```

### `$5430`, `$5436`, `$543C`

Use `$0E7D` to extract type-`$06` fields from the disk ID / side-mapping data.

### `$5448`

Calls:

```asm
JSR $0CDB
.BYTE $00,$0C,$CB
```

Resolved service:

- `$CB0C`

Low-level effect:

- sends drive command `$06` with `X=$0F`, `Y=$FF`
- drive-side meaning: `Find sector header`

This is the inserted-disk probe step. The returned header bytes are copied into
`$CB1B/$CB1C` and then formatted by `$5451 / $558F`.

### `$5454`

Uses `$0F17` to compare the current inserted-disk identity against the selected one.

- match: stay in local refresh path
- mismatch: branch to `$54EB`

## 4. Actual Side Reload

### `$54EB` `reload_disk_side_tables`

This is the confirmed side-change reload point.

It calls:

```asm
JSR $0CDB
.BYTE $00,$18,$CB
```

Resolved service:

- `$CB18`
- body at `$CD30`

This triggers the bulk side-specific table reload.

## 5. Bulk Table Reload at `$CD30`

The early block-transfer phase now maps cleanly to the drive protocol.

Observed command sequence:

1. `A=$00 X=$01 Y=$02`
2. `A=$00 X=$12 Y=$05`
3. `A=$00 X=$01 Y=$03`
4. `A=$00 X=$01 Y=$04`
5. `A=$00 X=$01 Y=$05`
6. `A=$00 X=$01 Y=$06`
7. `A=$00 X=$01 Y=$07`
8. `A=$00 X=$01 Y=$08`

Per `drive_command_protocol.md`, drive command `$00` means:

- `Send sector (bitbang)`
- parameters:
  - `X = track`
  - `Y = sector`

So this phase is a sequence of single-sector reads from specific track/sector pairs.

Confirmed C64 destinations:

- `$CA00`
- `$C900`
- `$0400`
- `$0500`
- `$0600`
- `$0700`
- `$0800`
- `$0900`

These destinations are set through `$CB24`.

### Confirmed contents

- `$CA00-$CAFF`
  - mixed header/control block for the stream layer
  - most of it is used as the Huffman tree:
    - `$CA00-$CA7F` = `huffman_tree_bit1_table`
    - `$CA80-$CAFF` = `huffman_tree_bit0_table`
  - but several bytes inside the same sector are read directly as control values outside the Huffman decoder

- `$C900+`
  - side-specific executable overlay for the stream/resource layer
  - code at `$C900-$C98D` is the same across the known disk variants
  - the data tables at `$C99F-$C9FF` differ by disk/side

- `$0400-$0900`
  - additional side-specific lookup blocks used by the resource layer

### What the `$C900` overlay does

The block loaded into `$C900` is not just passive metadata.

Confirmed structure:

- `$C900`
  - main loader/selector entry
  - jumps to `$C926`
  - chooses a table-set ID from `$C9C0` based on the current stream selector
  - compares that against the cached key in `$CFF2/$CFF3`
  - if needed, starts a chained load through `$CB09`

- `$C903`
  - mode-dependent apply entry
  - branches between `$B006` and `$B003` depending on `music_enabled_flag`

- `$C906`
  - forced-default apply entry
  - always executes the `$B006` branch and ignores `music_enabled_flag`

The side-specific differences are in:

- `$C99F`
  - one-byte overlay/cache key
  - `B1=$01`, `B2=$02`, `C1=$03`, `C2=$04`

- `$C9A0-$C9BF`
  - track/sector table for later command-`$02` chained loads

- `$C9C0-$C9FF`
  - selector map from `stream_selector & $3F` to a table-set ID

So the second fixed sector read in `$CD30` installs executable overlay logic and
its side-specific tables, not just a data block.

### Important side-band fields inside `$CA00-$CAFF`

The first fixed sector loaded into `$CA00` is not a pure text-tree block.
Known bytes inside it are consumed directly by other code:

- `$CA60/$CA61`
  - used by `$532A`
  - become `X/Y` for a command-`$02` chained sector read during disk switch

- `$CA64/$CA65`
  - used by `$CD30`
  - become `X/Y` for the second fixed single-sector read, which loads the `$C900` overlay

- `$CAFA/$CAFB`
  - used by `$54EB`
  - copied into `$70FB/$7100` during the reload path

- `$CAFC/$CAFD`
  - used by `$CD30`
  - copied into `$CB1F/$CB20`, which become the image-side indexed-record table base

So the best current interpretation is:

- the `$CA00` sector is a mixed resource header/control block
- it embeds the Huffman tree, but also contains disk-side stream configuration bytes

## 6. Chained Loads After Table Reload

After the bulk single-sector reload, the switch flow performs additional larger loads.

Observed command:

- `A=$02 X=$10 Y=$02`

and later:

- `A=$02 X=$11 Y=$01`

Per `drive_command_protocol.md`, drive command `$02` means:

- `Send sector chain`
- parameters:
  - `X = track`
  - `Y = sector`

This is a chained multi-sector payload read, not a write.

During disk change, the special pointer-install path in `$CC08` has been observed
to set `$AD/$AE` to:

- `$7600`
- `$B926`

That makes the current best interpretation:

- one chained load targets `$7600` and refreshes VM/script data
- one chained load targets `$B926` and refreshes SID music data

The second one is especially plausible because `$B926` is the base of the current
SID song-header/pointer block.

One important connection to the `$C900` overlay:

- the overlay’s table at `$C9A0+` supplies track/sector pairs for later command-`$02` chained loads
- the overlay code at `$C926` selects one of those pairs and calls `$CB09`

So the disk switch has two distinct command-`$02` contexts:

1. explicit switch-time chained loads, where destinations observed so far are `$7600` and `$B926`
2. later overlay-driven chained loads selected by the `$C900` table data

The known `$C900` variants differ exactly in those chained-load tables.

## 7. Indexed Resource Fetches After Reload

Later in the switch sequence, the game performs indexed resource requests.

Observed commands:

- `A=$0C X=$01 Y=$13`
- `A=$0C X=$09 Y=$07`
- `A=$0C X=$04 Y=$0B`

Per `drive_command_protocol.md`, drive command `$0C` means:

- `Multi-sector read (escape protocol)`

This matches the existing high-level analysis:

- these requests go through the indexed-record/resource layer
- they are used for the image/text shown during and after the switch

The protocol for command `$0C` consumes an additional 4th byte after the command
header. The command-header trace only shows the first three bytes, so the full
resource selector is one byte wider than the visible `A/X/Y` triplet.

## 8. Command Trace Summary

Observed command-header trace during one disk switch:

1. `A=$06 X=$0F Y=$FF`
2. `A=$00 X=$01 Y=$02`
3. `A=$00 X=$12 Y=$05`
4. `A=$00 X=$01 Y=$03`
5. `A=$00 X=$01 Y=$04`
6. `A=$00 X=$01 Y=$05`
7. `A=$00 X=$01 Y=$06`
8. `A=$00 X=$01 Y=$07`
9. `A=$00 X=$01 Y=$08`
10. old image vanishes / new side data starts taking effect
11. `A=$02 X=$10 Y=$02`
12. `A=$00 X=$23 Y=$00`
13. `A=$00 X=$23 Y=$01`
14. `A=$00 X=$23 Y=$02`
15. `A=$00 X=$23 Y=$03`
16. `A=$00 X=$23 Y=$04`
17. `A=$00 X=$23 Y=$05`
18. `A=$00 X=$23 Y=$06`
19. `A=$0C X=$01 Y=$13`
20. `A=$02 X=$11 Y=$01`
21. first text is displayed
22. `A=$0C X=$09 Y=$07`
23. after SPACE, second text is displayed
24. `A=$0C X=$04 Y=$0B`
25. finished

Current best reading:

- `$06` = inserted-disk probe
- early `$00` phase = fixed single-sector metadata/table loads
- `$02` = chained payload loads
- `$0C` = indexed image/text resource reads

The `A=$00 X=$23 Y=$00..06` block is still not fully assigned to specific C64
destinations in this note, but the drive-side meaning is now clear: it is a run
of ordinary single-sector reads from track `$23`, sectors `$00..06`.

## 9. Things That Are Confirmed vs Open

Confirmed:

- `$52D2` is the user-facing disk install/change prompt.
- `$5277 / $569D` enter the disk-side selection path.
- `$53A4` is the modal disk-side selection loop.
- `$5448` probes the inserted disk via drive command `$06`.
- `$54EB -> $CD30` performs the early bulk table reload.
- the early reload uses drive command `$00` single-sector reads.
- later disk-switch payload loads use drive command `$02` chained reads.
- later image/text fetches use drive command `$0C` multi-sector escape reads.
- the Huffman tree ends up at `$CA00-$CAFF`.
- `$7600` and `$B926` are observed disk-switch load destinations.
- `$B926` is a strong match for SID music loading.

Open:

- the exact identity of every block in the `track $23, sector $00..06` run
- the exact high-level payload written to `$7600`
- whether the `$7600` chained load always carries VM bytecode or can also carry other script-side data
