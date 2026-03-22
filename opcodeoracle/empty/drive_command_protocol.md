# 1541 Drive Command Protocol

## Overview

The C64 communicates with the custom drive code via a compact command protocol.
Most commands consist of 3 bytes sent over a 2-bit parallel fast serial link:

| Byte | Purpose | Storage |
|------|---------|---------|
| 1 | Command index (Y) | Y register (dispatch table index) |
| 2 | Parameter 1 (track) | Zero-page `$00` |
| 3 | Parameter 2 (sector) | Zero-page `$01` |

Command `Y=12` consumes an additional 4th byte, stored in zero-page `$02`.

## Protocol Flow

```
C64 → Drive:  [command byte] [param1] [param2]
Drive:        dispatches to handler via RTS trick (table at $06DE)
Drive → C64:  [response data...]
Drive → C64:  $FF (acknowledgment, for commands that return through `$0176`)
Drive:        loops back to $0118 for next command
```

The serial byte transfer (SUB_018A at `$018A`) uses 2-bit parallel transfer:
4 iterations reading 2 bits each from VIA port `$1800`, assembling a byte in `$03`.

## Command Table

Dispatch table at `$06DE`, indexed by Y (even values 0-14):

| Y | Target | Command | Description |
|---|--------|---------|-------------|
| 0 | `$0234` | Send sector (bitbang) | Read sector at track/sector, send 256 bytes via 2-bit serial protocol |
| 2 | `$0202` | Send sector chain | Read sector, send data, follow T/S chain at `$0700`/`$0701` until end |
| 4 | `$01FA` | Read write-protect | Return bit 4 of `$1C00` (write-protect sense) |
| 6 | `$01C3` | Find sector header | Search for sector header on disk, return track (`$16`), sector (`$17`), status |
| 8 | `$0183` | Receive & write sector | Receive 256 bytes from C64 into `$0700`, write sector to disk |
| 10 | `$06DB` | Reset drive | Clear RAM `$00B0`-`$07FF`, reboot via `JMP ($FFFC)` |
| 12 | `$0271` | Multi-sector read (escape protocol) | Read sectors with `$36` byte-stuffing escape protocol |
| 14 | `$017E` | Receive, execute & write | Receive 256 bytes, execute buffer at `$0700` as code, then write sector |

## Command Details

### Y=0: Send Sector (ENTRY_0234)

Reads sector at track=`$00`, sector=`$01`. Sends all 256 bytes using the
inline 2-bit serial send loop at `$023E`. Each byte is shifted out 2 bits at a
time via VIA port `$1800`.

### Y=2: Send Sector Chain (L_0202)

Reads sector and sends data to C64. The first two bytes of each sector
(`$0700`/`$0701`) are interpreted as next track/sector pointers. Continues
reading and sending sectors until the chain ends (track = `$00`).
Sends a length byte first (derived from `$0700`/`$0701`).

### Y=4: Read Write-Protect (ENTRY_01FA)

Simple status query. Reads `$1C00`, masks bit 4 (`AND #$10`), sends result.
Bit 4 = write-protect tab sense on the 1541.

### Y=6: Find Sector Header (ENTRY_01C3)

Searches the current track for a valid sector header using SUB_05CC.
Returns 3 bytes to the C64:
- Track number (`$16`)
- Sector number (`$17`)
- Status:
  - `$00` = success
  - `$80` = initial sync/search timeout before a candidate header is found
  - `$01` = header/signature mismatch
  - `$03` = header checksum mismatch
  - `$05` = track/sector mismatch during verification

### Y=8: Receive & Write Sector ($0183)

Self-modifying code: patches SUB_018A's RTS at `$01AB` to NOP (`$EA`),
causing the byte reader to fall through into a receive loop at `$01AC`:

```
$01AC: STA $0700,Y    ; store byte in buffer
$01AF: INY
$01B0: BNE $018A      ; loop 256 times
$01B2: JSR $0393      ; handshake
$01B5: LDA #$60       ; restore RTS
$01B7: STA $01AB
$01BA: BIT $0700      ; skip (no-op read)
$01BD: JSR $0323      ; write sector to disk
$01C0: JMP $039B      ; release ATN
```

### Y=10: Reset Drive (ENTRY_06DB)

Clears all RAM from `$00B0` to `$07FF` with zeros, then reboots the drive
via `JMP ($FFFC)` (6502 reset vector). Restores the drive to standard
CBM DOS operation.

### Y=12: Multi-Sector Read with Escape Protocol (ENTRY_0271)

Reads an additional 4th byte via SUB_018A as a buffer offset (`$02`).
Then reads sector and sends data using a `$36` byte-stuffing escape protocol:

| Sequence | Meaning |
|----------|---------|
| `$36 $36` | Literal data byte `$36` |
| `$36 $00` | End of current sector, loading next |

Follows the sector chain via SUB_02C1 (track/sector advancement).
Counts total bytes sent in `$09`/`$0A` (16-bit counter); transfer ends
when the counter wraps to zero.

### Y=14: Receive, Execute & Write (ENTRY_017E)

Like command Y=8, but additionally patches `$01BA` from BIT (`$2C`) to
JSR (`$20`), causing the sequence:

```
$01BA: JSR $0700      ; EXECUTE received data as code
$01BD: JSR $0323      ; then write sector to disk
```

This allows the C64 to upload and run arbitrary code inside the 1541 drive.
The executed code at `$0700` can perform custom drive operations before the
sector is written.

The `$01BA` patch is not restored afterward. Once command `Y=14` has run,
subsequent write commands continue to execute `$0700` until the drive is reset.

## Handshake Signals

| Routine | Address | Function |
|---------|---------|----------|
| SUB_0393 | `$0393` | Set ATN (bit 3 of `$1800` = 1) — "drive busy" |
| SUB_039B | `$039B` | Clear ATN (bit 3 of `$1800` = 0) — "drive ready" |

## Sector I/O

The drive uses a completely custom disk format (not standard CBM DOS):
- Custom 8-byte sync header at `$0024`: `$52 $57 $55 $35 $4B $74 $9E $A5`
- SUB_057B searches for this header pattern instead of standard sector headers
- ENTRY_0323 writes sectors in this custom format
- Standard 1541 DOS cannot read these sectors (copy protection)
