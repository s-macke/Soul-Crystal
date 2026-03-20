| Token | Meaning | Operands | Notes |
| --- | --- | --- | --- |
| `0x80` | `command` | optional index | Script variable. Mapped in [interpret.cpp](/home/sebastian/projects/Soul_Crystal/src/C/interpret.cpp) / [transformbytecode.cpp](/home/sebastian/projects/Soul_Crystal/src/C/transformbytecode.cpp#L24). |
| `0x81` | `object1` | optional index | Script variable. |
| `0x82` | `object2` | optional index | Script variable. |
| `0x83` | `roomnumber` | optional index | Script variable. |
| `0x84` | `addr6963` | optional index | Script variable, still unnamed in the decompilation. |
| `0x90` | `pointsum` | optional index | Script variable. |
| `0x91` | `steps` | optional index | Script variable. |
| `0x92` | `textoutput` | optional index | Script variable. |
| `0x93` | `temp` | optional index | Script variable. |
| `0x94` | `imageno` | optional index | Script variable. |
| `0x95` | `addr6996` | optional index | Script variable, unnamed. |
| `0x96` | `addr6998` | optional index | Script variable, unnamed. |
| `0x97` | `addr699a` | optional index | Script variable, unnamed. |
| `0xA0` | `north` | indexed | Direction/array-like variable. May be followed by a constant or variable index. |
| `0xA1` | `east` | indexed | Direction/array-like variable. |
| `0xA2` | `south` | indexed | Direction/array-like variable. |
| `0xA3` | `west` | indexed | Direction/array-like variable. |
| `0xA4` | `up` | indexed | Direction/array-like variable. |
| `0xA5` | `down` | indexed | Direction/array-like variable. |
| `0xA6` | `objectposition` | indexed | Array-like variable keyed by object or room. |
| `0xA7` | `objectstatus` | indexed | Array-like variable keyed by object. |
| `0xA8` | `visited` | indexed | Array-like variable keyed by room. |
| `0xB0` | `points` | optional index | 16-bit script variable. |
| `0xB1` | `objectdescription` | optional index | 16-bit script variable, object keyed. |
| `0xC0` | 8-bit constant | 1 byte | Literal byte constant. |
| `0xC1` | 16-bit constant | 2 bytes | Literal little-endian word constant. |
| `0xD0` | `IF` | none | Starts a conditional expression/block. |
| `0xD1` | `IF ENDSTATEMENT` | none | Internal marker delimiting the condition expression. |
| `0xD2` | `ELSE` | none | Else branch. |
| `0xD3` | `ENDIF` | none | End of conditional block. |
| `0xD4` | unknown / unused | unknown | Not decoded by `transformbytecode.cpp`; interpreter treats this range as invalid. |
| `0xD5` | `+` | none | Arithmetic operator. |
| `0xD6` | `-` | none | Arithmetic operator. |
| `0xD7` | `=` | none | Assignment or equality-like operator in token stream; decompiler labels it `EQ`. |
| `0xD8` | `AND` | none | Logical operator, emitted as `&&`. |
| `0xD9` | `OR` | none | Logical operator, emitted as `||`. |
| `0xDA` | `>` | none | Comparison operator. |
| `0xDB` | `<` | none | Comparison operator. |
| `0xDC` | `==` | none | Comparison operator. |
| `0xDD` | `!=` | none | Comparison operator. |
| `0xDE` | `>=` | none | Comparison operator. |
| `0xDF` | `<=` | none | Comparison operator. |
| `0xE0` | `GOSUB` | 16-bit target | Pushes return address on the VM stack and jumps. |
| `0xE1` | `GOTO` | 16-bit target | Unconditional jump. If target starts with `0xE7`, decompiler treats it as `RETURN`. |
| `0xE2` | `SELECT CASE` | expression follows | Multi-way branch construct. Case bodies are encoded with `0xEA`. |
| `0xE3` | unknown function | 16-bit value | Decompiled as `unknown2(x)`. Semantics still unresolved. |
| `0xE4` | read table entry 8-bit | none | Reads one byte from current table pointer `addr69B3`, stores via `addr699F`, then advances. |
| `0xE5` | read table entry 16-bit | none | Reads one word from current table pointer `addr69B3`, then advances by 2. |
| `0xE6` | set table address | 16-bit address | Sets current table base/pointer `addr69B3`. |
| `0xE7` | `RETURN` | none | Returns from VM subroutine using the VM stack. |
| `0xE8` | `showtext()` | none | Calls text-display engine (`Code3C02` in comments). |
| `0xE9` | unknown / no-op-like | unknown | Not modeled in `transformbytecode.cpp`; interpreter largely falls through. |
| `0xEA` | `CASE` | 16-bit target | Case arm for `SELECT CASE`; target is invoked like a subroutine. |
| `0xEB` | `ShowImage()` | none | Calls image-display engine (`Code4087`). |
| `0xEC` | unknown / no-op-like | unknown | Not modeled in `transformbytecode.cpp`; interpreter largely falls through. |
| `0xED` | `Code2E5B()` | none | Custom engine/runtime helper. |
| `0xEE` | `Restart()` | none | Custom engine/runtime helper, likely restart/reset-related. |
| `0xEF` | `SPECIAL(const)` | 8-bit constant selector | Dispatches built-in engine actions by numeric code. |
| `0xFF` | terminator / invalid | none | `WalkCode()` treats it as end of stream; interpreter treats it as error if executed directly. |

## Indexed Variable Form

Variables `0xA0-0xA8` support an immediate index:

- next token `0xC0`: indexed by 8-bit constant
- next token `0x80-0xBF`: indexed by another variable

Examples:

- `north[roomnumber]`
- `objectposition[object1]`
- `visited[0x12]`

## SPECIAL Selectors

These selectors are documented in the decompiler in [transformbytecode.cpp](/home/sebastian/projects/Soul_Crystal/src/C/transformbytecode.cpp#L404):

| Selector | Meaning | Notes |
| --- | --- | --- |
| `0x01` | `Codeabfrage` | Likely parser/input query step. |
| `0x02` | `Laden` | Load. |
| `0x03` | `Speichern` | Save. |
| `0x04` | `Neustart` | Restart. |
| `0x05` | `Spielende` | Game over / end game. |
| `0x06` | `Loesung` | Solution / hint-related. |
| `0x07` | `Musik ein` | Music on. |
| `0x08` | `Ausgaenge listen` | List exits. |
| `0x09` | `Diskette installieren` | Disk/install related. |
| `0x0A` | `Inventar anzeigen` | Show inventory. |
| `0x33` | `Gewonnen` | Won game. |
| `0x64` | special text/game-state handler | Commented as `Habe ich keine Kleidung an, vielleicht?` in source. |

## VM Layout

| Item | Value | Notes |
| --- | --- | --- |
| Script PC variable | `$6976` | Current bytecode address in RAM snapshot. |
| Default script start | `$7600` | Documented in [transformbytecode.cpp](/home/sebastian/projects/Soul_Crystal/src/C/transformbytecode.cpp#L13). |
| Table pointer | `$69B3` | Used by `E4`, `E5`, `E6`. |
| VM stack pointer | `$69A3` | Used by `E0`/`E7`. |
| Return address scratch | `$69A5` | Used during `GOSUB`/`RETURN`. |

## Assessment

This bytecode is a custom adventure-script VM, not just an artifact of the BASIC compiler runtime.

The main indicators are:

- its own program counter and stack,
- a stable token set for variables, constants, operators, flow control, and engine calls,
- explicit decompiler support to walk control flow and reconstruct `if`, `goto`, `gosub`, and `switch/case`,
- script-oriented variables such as `command`, `object1`, `roomnumber`, `objectposition`, and `visited`.
