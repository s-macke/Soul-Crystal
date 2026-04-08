# DOS Cheat Mode

This document describes the built-in developer cheat mode ("Entwickler-Cheat") in the DOS version of Soul Crystal.

## 1. Overview

The game includes a hidden cheat mode mentioned in the "About" text: "Soweit wir wissen, ist dies das erste Adventure, in das ein CHEATMODE implementiert wurde." The cheat provides teleportation, object dumping, a slideshow viewer, and a sound menu.

## 2. Verb code encoding

The parser assigns verb codes as: `verb_code = VERBS.TXT_index + 14`. This was confirmed against all six directional movement verbs:

| VERBS.TXT index | Verb       | Dispatch code |
|-----------------|------------|---------------|
| 5               | Hinunter   | 13h           |
| 6               | Osten      | 14h           |
| 11              | Norden     | 19h           |
| 19              | Süden      | 21h           |
| 21              | Hinauf     | 23h           |
| 24              | Westen     | 26h           |

## 3. Activation

The cheat is **not** activated by a verb. It is triggered by failing to move in an invalid direction 10 times.

### 3.1 Failed direction counter (`[0146h]`)

The directional movement handler `sub_1000_91b2` checks the destination room. When the destination is 0 (no exit in that direction):

```asm
loc_1000_92f9:
    mov ax, 0146
    push ax
    call sub_1bd7_8aa4       ; increment [0146]
    cmp word ptr [0146], 0a  ; reached 10?
    jnz loc_1000_9330

    ; 10th failure: show cheat activation text
    mov word ptr [0070], 000f    ; text_id = 15 → COMMN text 014
    ...
    jmp loc_1000_93cc

loc_1000_9330:
    ; normal failure: "You can't go there!"
    mov word ptr [0070], 0005    ; text_id = 5 → COMMN text 004
    mov word ptr [0072], 0000    ; part_id = 0 (COMMN)
```

On the 10th failed direction attempt, the game displays COMMN text 014 ("Entwickler-Cheat aktiviert") instead of the usual "You can't go there" error.

### 3.2 Cheat command window

On the **very next turn** after the 10th failure, the main loop gate opens:

```asm
cmp word ptr [0146], 0a    ; counter still at 10?
jz loc_1000_014b           ; yes → check for Dave commands
```

If the player types a Dave command (section 4), it fires. If any other command is entered, `[0146]` resets to 0 and the player must accumulate 10 more failures.

### 3.3 Step-by-step activation

1. Walk into walls by typing invalid directions (e.g. "Norden" when there is no north exit). Any direction verb works.
2. The counter persists across turns — the failures do not need to be consecutive. Successful moves do not reset the counter.
3. On the 10th failure, the cheat activation message appears.
4. **Immediately** on the next command, type one of the Dave commands (section 4).
5. After the cheat command executes, `[0146]` resets to 0.

## 4. Cheat commands

Once active, the player types a verb with **"Dave"** as the object. Dave is the player character (object A3h = index 163 in the object table). Before the normal verb dispatch, the main loop (`loc_1000_014b`) checks:

```asm
cmp word ptr [00b0], 00a3    ; object = Dave?
jz loc_1000_0156
```

If matched, the verb code `[00ae]` selects the cheat function:

| Command          | Verb code | VERBS index | Handler          | Function              |
|------------------|-----------|-------------|------------------|-----------------------|
| **Bewege Dave**  | 2Eh       | 32 (Bewege)    | `sub_1000_0dcb`  | Teleport to room      |
| **Betrachte Dave** | 2Bh     | 29 (Betrachte) | `sub_1000_0ade`  | Recalculate game state |
| **Nimm Dave**    | 32h       | 36 (Nimm)      | `sub_1000_0c32`  | Drop all objects      |

Each handler sets `[37b2] = 0` to suppress the normal verb dispatch afterward.

## 4. Teleport (`sub_1000_0dcb`, verb 2Eh)

Calls `sub_1bd7_e074` in the engine to read a 3-digit room number via keyboard input.

### 4.1 Input handler (`sub_1bd7_e074`)

1. Displays COMMN text 016: "enter a 3-digit number between 001 and 103."
2. Shows a cursor (`_`) and reads keypresses:
   - Digits 0--9 (30h--39h): appended to input
   - Backspace (08h): deletes last digit
   - ESC (1Bh): cancels, returns 0
3. After 3 digits entered, converts ASCII to integer:
   ```
   room = digit0 * 100 + digit1 * 10 + digit2 - 5328
   ```
   (5328 = '0'\*100 + '0'\*10 + '0' = 14D0h)
4. Validates: 1 <= room <= 103 (67h). Rejects out-of-range input and loops.
5. Returns the room number, or 0 on ESC.

### 4.2 Teleport execution

```asm
call sub_1bd7_e074         ; get room number
mov [bp-14], ax
...
jg loc_1000_0df1           ; if > 0, teleport
jmp loc_1000_0e06          ; else, cancelled

loc_1000_0df1:
    mov [0032], ax         ; set room_index = entered room
    call sub_1000_50ce     ; update display
    ...
    call sub_1000_0a2d     ; show room description
```

Sets `[0032]` (room_index) directly, then refreshes the display.

## 5. Drop all objects (`sub_1000_0c32`, verb 32h)

Moves all accessible objects to the player's current room. Corresponds to COMMN text 015: "A.C.A gods send all objects from heaven."

```
for room = 1 to 103:
    if room == current_room: skip
    for object = 1 to 165:
        if object == 0xA3: skip          ; skip cheat command object
        entry = object_table[room][object]
        if accessible(entry):            ; check flag bits
            move object to current_room
```

The function iterates all 103 rooms (outer loop, `cmp ax, 0067`) and all 165 objects (inner loop, `cmp ax, 00a5`), reading each object's position from the game state table at `[00E4]`. Objects whose accessibility flags pass a bitwise check are relocated to the current room `[0032]`.

## 6. State recalculation (`sub_1000_0ade`, verb 2Bh)

Loops through all 103 rooms, reading room record field +06 and recomputing derived values. This appears to recalculate scores or game-state consistency after cheat-induced state changes (e.g., after teleporting or moving all objects).

## 7. Cheat-related COMMN texts

| Index | Text ID | Content (summary)                                     |
|-------|---------|-------------------------------------------------------|
| 013   | 14      | Game solved / completion message                      |
| 014   | 15      | "Entwickler-Cheat" activation, use at own risk        |
| 015   | 16      | All objects dropped from heaven (A.C.A gods)          |
| 016   | 17      | Teleport instructions: enter room 001--103            |
| 017   | 18      | Slideshow mode activated (SPACE = next, ESC = exit)   |
| 018   | 19      | Sound menu: enter 1--5 for music tracks               |
| 019   | 20      | Teleport cancelled ("Feigling!" = coward)             |
| 020   | 21      | Cheat extension left, returning to game               |

## 8. Key addresses

| Address | Width | Purpose                                |
|---------|-------|----------------------------------------|
| 0038h   | word  | Brief text mode flag (FFFFh = brief)  |
| 00AEh   | word  | Verb code (= VERBS.TXT index + 14)    |
| 00B0h   | word  | Object code (A3h = Dave)               |
| 0032h   | word  | Room index (written directly by teleport) |

## 9. Open questions

- The slideshow mode (COMMN text 017) and sound menu (COMMN text 018) are likely handled by additional verb+Dave combinations or by engine functions not yet traced in the three-way dispatch.
- The object drop loop explicitly skips object A3h (Dave), preventing the player character from being relocated.
- The "Lösung" verb (VERBS[16], dispatch code 1Eh) calls `sub_1bd7_df08` which shows a restart/new-game prompt, separate from the cheat system.
