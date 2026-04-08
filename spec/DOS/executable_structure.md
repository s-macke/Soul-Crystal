# DOS Executable Structure

This document describes the internal structure of the DOS version of Soul Crystal (`SOUL.EXE`).

## 1. Overview

The DOS version does not use a bytecode VM. Unlike the C64 version (which interprets custom bytecodes at runtime), the DOS game logic was written in BASIC and compiled to native 16-bit x86 real-mode code.

## 2. Build toolchain

The executable's embedded version table contains:

| Field   | Value            |
|---------|------------------|
| Title   | Soul Crystal     |
| Version | 0.7              |
| Date    | 29-Jan-1992      |

Three compilers/assemblers were used:

| Tool             | Role                                       |
|------------------|--------------------------------------------|
| MS Basic 7.1     | Game logic (verb handlers, room logic)      |
| MS C 6.0         | Engine support (graphics, I/O, compression) |
| MS MASM 5.1      | Low-level routines (interrupts, hardware)   |

"MS Basic 7.1" refers to the Microsoft BASIC Professional Development System (PDS), a compiled BASIC that generates native x86 code with its own runtime library.

## 3. Executable sizes

| File                | Size       | Notes          |
|---------------------|------------|----------------|
| `SOUL.EXE`          | 127,658 B  | Packed         |
| `SOUL.unpacked.EXE` | 490,176 B  | Unpacked       |

## 4. Segment map

The unpacked executable uses a segmented 16-bit real-mode layout:

| Segment | Base  | Content                         | Subroutines | Data blocks |
|---------|-------|---------------------------------|-------------|-------------|
| seg000  | 1000h | Game logic (compiled BASIC)     | 53          | 54          |
| seg001  | 1bd7h | Runtime / engine                | 322         | 169         |
| seg002+ | 2b9ch+| Static data, BASIC runtime msgs | --          | 2           |
| seg012  | --    | Stack                           | --          | --          |

**seg000 (1000h)** contains the application-level game logic: the main loop, verb dispatch, and all verb handler functions. These are compiled BASIC `SUB` / `FUNCTION` procedures. The compiled output consists of long `CMP`/`JNZ` chains (compiled `SELECT CASE` and `IF/THEN/ELSEIF` blocks) that test room IDs, object IDs, and game state flags.

**seg001 (1bd7h)** contains the runtime library and engine code: the MS BASIC 7.1 runtime, string handling, file I/O, graphics rendering (EGA), sound/music playback, text display, and the input parser. This segment also handles save/load and disk operations.

**seg002+ (2b9ch)** contains static data: sprite/cursor bitmaps, the BASIC runtime message table (prefixed by `<<FMSG>>`), and zeroed BSS regions for runtime variables.

## 5. Key state variables

Game state is stored in the seg000 data segment. Key variables identified from the disassembly:

| Address | Width | Name (inferred)  | Description                            |
|---------|-------|-------------------|----------------------------------------|
| 0032    | word  | room_index        | Current room index into the room table |
| 0034    | word  | score             | Current score                          |
| 0062    | word  | verbose_flag      | FFFFh = verbose, 0000h = brief         |
| 0068    | word  | step_adjustment   | Step counter modifier                  |
| 00ae    | word  | verb_code         | Parsed verb/command code               |
| 00b0    | word  | object1           | First object operand                   |
| 00b2    | word  | object2           | Second object operand                  |
| 0112    | far   | room_table_ptr    | Far pointer to the room record array   |
| 0146    | word  | input_status      | Parser status (0Ah = valid input)      |
| 014a    | word  | game_mode         | 02 = special mode (intro/transition)   |
| 37b6    | word  | dispatch_verb     | Computed verb code for dispatch         |

## 6. Room record structure

Rooms are stored in an array pointed to by the far pointer at address 0112h. Each record is 20 bytes (14h):

| Offset | Width | Field          |
|--------|-------|----------------|
| +00    | word  | (unknown)      |
| +02    | word  | (unknown)      |
| +04    | word  | room_property  |
| +06    | word  | (unknown)      |
| +08    | word  | exit_north     |
| +0A    | word  | exit_east      |
| +0C    | word  | exit_south     |
| +0E    | word  | exit_west      |
| +10    | word  | exit_up        |
| +12    | word  | exit_down      |

The `room_property` field at +04 is read at the start of most verb handlers and stored in a global at 0072h. Exit values of 0 mean no exit. Bits 14--15 in an exit value are flags (the direction is blocked or conditional); the low 14 bits give the destination room index.

## 7. Main game loop

The entry point is `loc_unknown_1000_0030` (disasm file `0002`). Execution flow:

1. **Initialization**: allocates and populates game arrays via `sub_1bd7_14e6`, loads the starting game part via `sub_1000_0f0a`.
2. **Input loop** (at `loc_1000_010c`):
   - Calls the input parser `sub_1000_2bdc`.
   - On valid input (`[0146] == 0Ah`), computes `dispatch_verb = [37b2] AND [00ae]`.
   - Falls through to the verb dispatch chain (section 8).
3. **Post-action**: updates step counter, handles random encounters and part transitions.
4. Loops back to step 2.

## 8. Verb dispatch

The main loop dispatches on `[37b6]` via a long `CMP`/`JNZ` chain. Each entry jumps to a handler and then returns to `loc_1000_07b7` (post-action).

### 8.1 System verbs

These are handled inline in the main loop or delegate to engine functions:

| Code | Handler          | Action                        |
|------|------------------|-------------------------------|
| 0Fh  | sub_1000_0a2d    | Show score text               |
| 10h  | sub_1000_0a2d    | Show solution/hint            |
| 11h  | sub_1000_0a2d    | Show room description         |
| 12h  | sub_1000_80c2    | Toggle music                  |
| 15h  | (inline)         | List exits                    |
| 16h  | sub_1bd7_c1ac    | Save game                     |
| 17h  | sub_1000_5108    | Wait / pass time              |
| 18h  | sub_1000_50ce    | Display score details         |
| 1Ah  | sub_1bd7_df72    | Quit / restart                |
| 1Bh  | sub_1bd7_deb4    | Load game                     |
| 1Ch  | sub_1000_1fca    | Look (verbose, param FFFFh)   |
| 1Eh  | sub_1bd7_df08    | Restart game                  |
| 20h  | (inline)         | Toggle verbose/brief mode     |
| 22h  | sub_1000_1fca    | Look (brief, param 0)         |

### 8.2 Directional movement

All six directions are handled by `sub_1000_91b2`, which reads the appropriate exit from the room record:

| Code | Direction | Room record offset |
|------|-----------|--------------------|
| 19h  | North     | +08h               |
| 21h  | East      | +0Ah               |
| 14h  | South     | +0Ch               |
| 26h  | West      | +0Eh               |
| 23h  | Up        | +10h               |
| 13h  | Down      | +12h               |

### 8.3 Single-object verbs

These push `[00b0]` (object1) as a parameter:

| Code | Handler          | Verb (probable)    |
|------|------------------|--------------------|
| 24h  | sub_1000_0a2d    | Dig                |
| 25h  | sub_1000_0a2d    | Wait (variant)     |
| 27h  | sub_1000_943d    | Attach             |
| 28h  | sub_1000_b724    | Give               |
| 29h  | sub_1000_ab57    | Lock               |
| 2Ah  | sub_1000_6703    | Unlock             |
| 2Bh  | sub_1000_7ca3    | Enter              |
| 2Ch  | sub_1000_8229    | Move               |
| 2Dh  | sub_1000_a3d9    | Help               |
| 2Eh  | sub_1000_714d    | Leave              |
| 2Fh  | sub_1000_872b    | Speak              |
| 30h  | sub_1000_ba88    | Turn               |
| 31h  | sub_1000_750d    | Close              |
| 32h  | sub_1000_8432    | Destroy            |
| 33h  | sub_1000_9c4d    | Open               |

### 8.4 Two-object verbs

These push both `[00b0]` (object1) and `[00b2]` (object2):

| Code | Handler          | Verb (probable) |
|------|------------------|-----------------|
| 34h  | sub_1000_55b4    | Examine          |
| 35h  | sub_1000_65cf    | Pull             |
| 36h  | sub_1000_7dfd    | Take             |
| 37h  | sub_1000_adc0    | Press/Push       |
| 38h  | sub_1000_76d3    | Lose             |

Note: the verb-to-name mapping in sections 8.3--8.4 is approximate. The internal dispatch codes do not correspond to `VERBS.TXT` indices; they are assigned by the compiled input parser.

### 8.5 Special dispatch

Before the main verb chain, the loop checks for a few hard-coded cases:

- `[00b0] == A3h` with `[00ae]` in {2Eh, 2Bh, 32h}: calls `sub_1000_0dcb`, `sub_1000_0ade`, or `sub_1000_0c32` directly. These handle interactions with a specific object (ID A3h).
- Verb 1Dh: stores score in a table entry (high-score update).

## 9. Part / chapter loader

`sub_1000_0f0a` (disasm file `0016`) loads a game part by index. It accepts a part number (1--8) and a sub-parameter, then loads the corresponding resource data (room table, text archive, image set). After loading, it initializes the palette and display.

Part 8 has special handling (animation counter initialization), suggesting it drives the intro or endgame sequence.
  
## 10. Verb handler internals

Each verb handler in seg000 follows the same compiled-BASIC pattern:

```asm
push bp
mov bp, sp
sub sp, XXXX          ; local variable frame
push si
; clear locals with REP STOSW
mov ax, 0014h
imul word ptr [0032]  ; room_index * 20
; ... index into room table ...
; long CMP/JNZ chain on room IDs or object IDs
```

The comparison chains correspond to `SELECT CASE` and `IF/THEN/ELSEIF` blocks in the original BASIC source. Matching a case results in:
- Setting a text output ID (to display a message).
- Modifying game state (object positions, flags, score).
- Calling engine functions (display image, play sound, trigger animation).

Helper functions frequently called from verb handlers:

| Function          | Purpose                                    |
|-------------------|--------------------------------------------|
| sub_1000_0a2d     | Display a text message by ID               |
| sub_1000_2f74     | Set object position/status                 |
| sub_1000_3041     | Move object between rooms                  |
| sub_1000_333c     | Validate object accessibility              |
| sub_1bd7_8af3     | Read attribute from object/room table      |
| sub_1bd7_8acb     | Write attribute to object/room table       |
| sub_1bd7_8b65     | Arithmetic on game variables               |
| sub_1bd7_9438     | Display formatted text string              |

## 11. Relationship to C64 VM

The C64 version stores game logic as custom bytecodes (opcodes 0x80--0xFF) in sequential files (`*_vm.bin`). An interpreter in the C64 executable fetches and dispatches these bytecodes at runtime.

The DOS version has no bytecode and no interpreter. The same game logic (room descriptions, verb handling, puzzle conditions) was reimplemented in MS BASIC 7.1 and compiled to native x86. The two implementations are structurally parallel:

| Aspect              | C64                             | DOS                                    |
|---------------------|---------------------------------|----------------------------------------|
| Game logic encoding | Custom bytecode VM              | Compiled BASIC (native x86)            |
| Verb dispatch       | `SELECT CASE` in bytecode       | `CMP`/`JNZ` chain in compiled code     |
| Room/object tables  | In-memory arrays                | Far-pointer array at 0112h             |
| Text display        | `showtext()` opcode (E8h)       | `sub_1000_0a2d` / `sub_1bd7_9438`      |
| Image display       | `ShowImage()` opcode (EBh)      | Engine call in seg001                  |
| State variables     | Bytecode variables (80h--B1h)   | Fixed addresses in seg000 data         |
| Parts/chapters      | Separate `*_vm.bin` files       | All compiled into one executable       |

The decompiled C64 bytecode in `out/part*.c` can serve as a reference when reverse-engineering the DOS verb handlers, since the game logic (puzzle conditions, room connections, object interactions) is functionally identical.
