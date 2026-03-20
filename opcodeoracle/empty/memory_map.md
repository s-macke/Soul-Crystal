| Region | Classification | Evidence | Notes |
| --- | --- | --- | --- |
| `$0000-$0078` | Zero page / system workspace | Standard C64/BASIC workspace usage | Includes pointers and FAC-related scratch locations used by BASIC ROM-compatible routines. |
| `$0079-$0079` | Helper subroutine | `SUB_0079` | Tiny support routine used by higher-level BASIC-style helpers. |
| `$007A-$0AC4` | Data | Opcode Oracle data region | General data and tables. |
| `$0AC5-$191A` | BASIC ROM-facing helper code plus data | Routines such as `SUB_1A72`/`SUB_1A9D` manipulate FAC layout at `$61-$70` | Strong indicator of code interfacing with Commodore BASIC floating-point/string internals. |
| `$191B-$1B26` | BASIC ROM-facing helper/entry code | `SUB_191B`, `SUB_1922`, `ENTRY_1A72`, `SUB_1A9D`, `ENTRY_1AC8`, `ENTRY_1AE0` | More compiler support glue around BASIC numeric/string descriptors and temporary string handling. |
| `$1B27-$1D70` | Data | Opcode Oracle data region | Tables and constants. |
| `$1D71-$3763` | Main adventure/game logic | Dense application subroutines with many callers, not obviously generic compiler runtime | Likely core game logic built on top of compiler/runtime support. |
| `$3764-$3B93` | Mixed data/code | Sparse code islands and data | Transition area between game logic and later engine systems. |
| `$3B94-$62FB` | Custom engine code | Large handwritten-looking routines, hardware-facing code, asset/tables management | Likely custom graphics, text, and engine services rather than generic compiler output. |
| `$62FC-$75FF` | Data/assets | Large continuous data area before VM script start | Likely packed game data, tables, text, or graphics resources. |
| `$7600-$9608` | Custom adventure-script bytecode | `transformbytecode.cpp` documents script PC `$6976` starting at `$7600` | Separate VM layer with variables `0x80-0xBF`, constants `0xC0/0xC1`, control flow `0xD0-0xEF`, and engine calls such as `showtext()`, `ShowImage()`, `SPECIAL()`. |
| `$9609-$992C` | Custom IRQ/input/UI front-end | Joystick polling at `$DC00/$DC01`, IRQ handlers, raster work at VIC registers | Handwritten machine code for menu/input/display control. This sits beside the script VM rather than being part of it. |
| `$992D-$9A31` | Banking helpers | `SUB_99B1`, `SUB_99D0`, `SUB_99F2`, `SUB_9A03` push/pop `$01` memory config | Shared support for ROM/RAM banking used by the runtime and engine. |
| `$9A32-$9A5B` | Runtime signature/data | Contains literal `FREE-END` string | Useful signature for the compiled BASIC runtime area. |
| `$9A5C-$9C1B` | P-code runtime / interpreter control | Dispatch-style control flow and runtime state management | Strong candidate for compiled BASIC runtime logic. |
| `$9C1C-$A069` | P-code runtime / interpreter helpers | Small runtime helpers, token/state walkers, indirect dispatch | Continues the interpreter-style runtime region. |
| `$A06A-$A11F` | Runtime tables plus text/graphics decode helpers | Table-driven decoding and copy helpers | Probably runtime support data used by the interpreter/game VM. |
| `$A125-$A169` | Input/runtime bridge | Called by runtime dispatch code | Connects runtime state to engine/input services. |
| `$A16B-$A446` | Custom sprite/input engine | Reads CIA/SID pot registers and updates VIC sprite state | Handwritten engine code, not generic compiler output. |
| `$A449-$A4A3` | Engine/runtime tables | Dense data referenced by nearby routines | Lookup/configuration data. |
| `$A4A4-$A631` | Overlay/resource switching helpers | Repeated stateful page/resource selection logic | Plausibly part of game-specific overlay/resource management layered on top of the runtime. |
| `$A632-$AA2B` | Graphics/tile/screen resource code | Copies blocks into screen/color RAM, manipulates `$01`, VIC-visible memory | Custom renderer/resource loader. |
| `$A77A-$AA2B` | Music/resource management | `A77A` and `A92B` build/copy AV resources and walk descriptor tables near `$AA2C` | High-level soundtrack and display resource loader used by the game engine. |
| `$AA2C-$AED1` | Tables/data for renderer/runtime | Accessed heavily by `$A92B` and related code | Resource descriptors and decode tables. |
| `$AED2-$AFAC` | Initialization / startup helper | Early entry from `ENTRY_9635` | Startup support, likely game-specific initialization. |
| `$AFAD-$BC1A` | Data | Opcode Oracle data region | General data/resources. |
| `$BC1B-$BCF4` | BASIC helper stubs | `SUB_BC1B`, `SUB_BCF3` referenced by BASIC-facing helpers | Likely support glue used by compiled BASIC support code. |
| `$BCF5-$CB28` | Data | Opcode Oracle data region | Tables/resources. |
| `$CB29-$CD10` | Engine/helper code | Isolated helper routines | Additional handwritten support code. |
| `$CD11-$E096` | Data/assets | Large continuous data area | Likely late-game resources, text, or packed asset data. |
| `$D800-$DBE7` | Color RAM | Fixed C64 color memory | Used for the visible character display; paired with screen RAM at `$FC00`. |
| `$D4A0-$D4FF` | Probable SID music tables | Referenced by music/resource code around `$A92B/$AE00` | Likely pitch, instrument, or compact control data for the soundtrack engine. |
| `$E097-$E0A7` | Helper subroutine | `SUB_E097` | Isolated utility routine. |
| `$B040-$B910` | Probable SID player core | Raw code writes directly to `$D400-$D418`, including init and register flush steps | Low-level music playback/update engine with per-voice state around `$B1xx`. |
| `$F800-$FBFF` | Display buffer region | Runtime writes to `$F800`, `$F940`, and nearby addresses during screen/image setup | Display-related buffer area inside the active VIC bank `$C000-$FFFF`. |
| `$FC00-$FFE7` | Active screen RAM | Derived from init code `DD00=$94`, `D018=$F8` at `$AED2` | Main screen matrix for the game display. |
| `$E0A8-$FFFF` | Data, vectors, ROM-facing entry area | Includes jump to `$FE66` from `ENTRY_9843` | Late image contains data and top-of-memory entry/vector-related content. |

## Summary

| Region | Interpretation |
| --- | --- |
| `$1A72-$1B26` | BASIC floating-point/string descriptor helper code. |
| `$7600-$9608` | Custom adventure-script bytecode interpreted by the game-specific VM. |
| `$9609-$992C` | Handwritten IRQ, joystick, and front-end code. |
| `$992D-$9A31` | Memory configuration helpers for banking BASIC ROM and I/O in/out. |
| `$9A32-$A169` | Best candidate for the compiled BASIC runtime, likely `Blitz!` / `Austro-Speed 88` family. |
| `$A16B-$AA2B` | Custom engine and renderer code used by the game, not generic compiler output. |
| `$A77A-$AA2B` | High-level soundtrack/resource loader. |
| `$B040-$B910` | Probable low-level SID playback engine. |
| `$FC00-$FFE7` | Main screen matrix (screen RAM) in the active VIC bank. |
| `$D800-$DBE7` | Color RAM for the visible character display. |

## Assessment

The strongest compiler-related region is `$9A32-$A169`. It contains:

- the `FREE-END` runtime string,
- clear interpreter/P-code style control flow,
- heavy dependence on Commodore BASIC internals,
- surrounding banking helpers that toggle `$01` to expose ROM routines.

That combination is a good match for a `Blitz!`-style compiled BASIC runtime, or a very close relative such as `Austro-Speed 88`.

Separately, `$7600-$9608` is now identified as a custom script-bytecode area. The accompanying interpreter/decompiler sources use:

- script PC `$6976`,
- default script start `$7600`,
- VM stack pointer `$69A3`,
- table pointer `$69B3`.

So the binary contains both:

- a compiler/runtime layer tied to BASIC internals, and
- a distinct game-specific adventure VM for higher-level logic.

The display layout is also identified from the VIC setup at `$AED2`:

- `DD00=$94` selects VIC bank `$C000-$FFFF`,
- `D018=$F8` places the active screen matrix at `$FC00`,
- color RAM remains fixed at `$D800`,
- nearby writes to `$F800`/`$F940` indicate additional display buffers or staging areas in the same VIC bank.

Music is split similarly into two layers:

- `$A77A-$AA2B` handles soundtrack/resource selection and buffer preparation,
- `$B040-$B910` appears to be the actual SID playback engine, because it writes directly to `$D400-$D418`,
- game text describes an approximately 30-minute soundtrack and a sound menu offering tracks `1-5` for the current section.
