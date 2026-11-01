# Amiga music selection

## Native evidence

Source: `data/Amiga/extracted/Disk 3/Code/Main` (Amiga HUNK).
Addresses below are relative to the CODE/DATA hunks, not file offsets.

- CODE `$222c`: music selection/loading routine; `$2674` invokes it before graphic loading when music is enabled.
- A5 offset `-$7e10` is **current room**, not the special-image selector: movement at `$52d0..$52f2` reads a room exit and writes the destination back; `$530e` also updates Dave's location.
- DATA `$1d2b..$1e35`: 103 NUL-separated decimal track numbers, indexed from room 1. `$2332..$2360` restores that DATA pointer and reads up to the current room. The next independently referenced DATA block starts at `$1e36`.
- `$2364..$2372`: compare requested music with cached current track (`-$7dfd`); unchanged music is not restarted.
- `$2282..$232c`: Dave's location 255 selects track 20 (death).
- `$2400` onwards constructs `SCMusic` plus track number and loads the module through `medplayer.library`.

`Code/Intro` contains loads for `Cast.MUS` and `Credits.MUS`. `Code/Endpart` dispatches `WIN[` to CODE `$20e`; this loads `Data/Music/16` at `$268`. Other end-program phases reference 18, 19 and `Hell.MUS`. Their complete animation timing has not been reconstructed; Hell is **not** used for every ordinary death.

## Assets and web behavior

All 18 unique module tracks have MP3 exports under `music/Amiga/`.
Number aliases: 6 → 14, 15 → Cast, 17 → 14, 18 → 08, 19 → 13.
See that directory's README for original source disks and durations.

The web port selects music from the final room/mode published by the engine, including loaded games, death/revival and victory. Temporary illustration changes do not select new music. Identical MP3s keep playing, including aliased native track numbers. Tracks loop; volume is 35%. A persistent music switch under Menu → Game & display allows muting, with golden-note and crossed-note icons. Audio starts only with user interaction; denied playback can be retried with the switch. Hiding the browser tab pauses playback.

The existing expandable introduction uses Cast while open (a web presentation choice, not a reconstruction of the native intro sequence). Closing it restores current game music. Credits.MUS and Hell.MUS are shipped but there is currently no corresponding animated credits/hell presentation in the web UI. Victory uses 16. No claim of sample-accurate native looping/fades or complete native cutscene synchronization is made.

## Room mapping

Room IDs are shared with `out/game_ids.h`. `web/src/music-map.ts` contains the same numeric table.

| Room | Symbol | Native track | MP3 |
|---|---|---|---|
| 1 | IM_GAESTEZIMMER | 1 | 01.mp3 |
| 2 | IN_DER_LOBBY | 1 | 01.mp3 |
| 3 | AUF_DER_STRASSE1 | 1 | 01.mp3 |
| 4 | AUF_DER_STRASSE2 | 2 | 02.mp3 |
| 5 | IN_DEM_KORRIDOR | 1 | 01.mp3 |
| 6 | AN_DER_REZEPTION | 1 | 01.mp3 |
| 7 | IM_STRUDEL | 20 | 20.mp3 |
| 8 | AM_UFER_DES_BERGSEES | 2 | 02.mp3 |
| 9 | IM_ESSZIMMER | 1 | 01.mp3 |
| 10 | IM_SEE1 | 3 | 03.mp3 |
| 11 | IM_SEE2 | 3 | 03.mp3 |
| 12 | VOR_DEM_WASSERFALL | 3 | 03.mp3 |
| 13 | HINTER_DEM_WASSERFALL | 3 | 03.mp3 |
| 14 | AM_UFER | 4 | 04.mp3 |
| 15 | AUF_EINER_LICHTUNG1 | 4 | 04.mp3 |
| 16 | IN_MYLGORS_STUDIERZIMMER | 5 | 05.mp3 |
| 17 | IM_DIENERSCHLAFZIMMER | 5 | 05.mp3 |
| 18 | IN_DER_ORKHOEHLE | 10 | 10.mp3 |
| 19 | IM_KAMINZIMMER | 5 | 05.mp3 |
| 20 | AUF_EINER_LICHTUNG2 | 10 | 10.mp3 |
| 21 | AUF_EINEM_HUEGEL1 | 10 | 10.mp3 |
| 22 | VOR_MYLGORS_HAUS | 5 | 05.mp3 |
| 23 | AUF_DEM_MARKTPLATZ | 5 | 05.mp3 |
| 24 | AUF_EINEM_PFAD | 10 | 10.mp3 |
| 25 | IM_TIEFEN_WALD | 10 | 10.mp3 |
| 26 | AUF_EINEM_SCHNEEBEDECKTEN_BERG | 7 | 07.mp3 |
| 27 | IM_EQUIPMENT_SHOPPE | 5 | 05.mp3 |
| 28 | AUF_DEM_PFAD | 5 | 05.mp3 |
| 29 | AUF_EINEM_HUEGEL2 | 10 | 10.mp3 |
| 30 | IN_EINEM_SCHNEEBEDECKTEN_TAL | 7 | 07.mp3 |
| 31 | VOR_EINER_ALTEN_ZWERGMINE | 5 | 05.mp3 |
| 32 | AUF_EINEM_HUEGEL3 | 5 | 05.mp3 |
| 33 | VOR_EINEM_VERFALLENEN_KLOSTER | 6 | 14.mp3 |
| 34 | VOR_FIRONS_EISPALAST | 7 | 07.mp3 |
| 35 | IN_DER_EISWUESTE | 7 | 07.mp3 |
| 36 | IN_EINEM_VERSCHUETTETEN_GANG | 5 | 05.mp3 |
| 37 | IN_DER_EHEMALIGEN_MUENZE | 5 | 05.mp3 |
| 38 | IM_KLOSTERGARTEN | 6 | 14.mp3 |
| 39 | IM_SPEISESAAL_DES_KLOSTERS | 6 | 14.mp3 |
| 40 | IN_FIRONS_THRONSAAL | 7 | 07.mp3 |
| 41 | IN_EINEM_GLETSCHER | 20 | 20.mp3 |
| 42 | VOR_EINER_GRUFT | 9 | 09.mp3 |
| 43 | AUF_DEM_FRIEDHOF | 9 | 09.mp3 |
| 44 | IN_DER_KLOSTERSCHMIEDE | 6 | 14.mp3 |
| 45 | IN_DER_KOENIGSGRUFT | 9 | 09.mp3 |
| 46 | IN_DER_KLEINEN_KAPELLE | 8 | 08.mp3 |
| 47 | IN_MYLGORS_SCHLAFZIMMER | 6 | 14.mp3 |
| 48 | IN_EINEM_KURZEN_KORRIDOR | 6 | 14.mp3 |
| 49 | IN_MYLGORS_GEHEIMLABOR | 6 | 14.mp3 |
| 50 | IN_EINER_KLEINEN_DUNKLEN_KRYPTA | 8 | 08.mp3 |
| 51 | IN_EINEM_VERWUNSCHENEN_WALD1 | 11 | 11.mp3 |
| 52 | IN_EINEM_VERWUNSCHENEN_WALD2 | 11 | 11.mp3 |
| 53 | IM_SUMPF | 11 | 11.mp3 |
| 54 | AM_UFER_EINES_SUMPFIGEN_SEES | 11 | 11.mp3 |
| 55 | IM_SUMPFSEE | 11 | 11.mp3 |
| 56 | IM_TREIBSAND | 20 | 20.mp3 |
| 57 | AM_UFER_DES_SUMPFIGEN_SEES | 12 | 12.mp3 |
| 58 | IN_DER_HUETTE_DES_EREMITEN | 12 | 12.mp3 |
| 59 | AUF_EINER_LICHTUNG | 12 | 12.mp3 |
| 60 | AUF_EINEM_BEWALDETEN_HUEGEL | 12 | 12.mp3 |
| 61 | IM_MOOR1 | 13 | 13.mp3 |
| 62 | IM_MOOR2 | 13 | 13.mp3 |
| 63 | VOR_ZARGONS_BURGRUINE | 12 | 12.mp3 |
| 64 | IM_TORHAUS | 14 | 14.mp3 |
| 65 | UNTER_DEM_TORBOGEN | 14 | 14.mp3 |
| 66 | IM_SCHLOSSGARTEN | 15 | Cast.mp3 |
| 67 | AUF_DEM_BURGHOF | 15 | Cast.mp3 |
| 68 | IN_DEN_STAELLEN | 15 | Cast.mp3 |
| 69 | IN_DER_EMPFANGSHALLE | 16 | 16.mp3 |
| 70 | IM_OBEREN_TREPPENHAUS | 16 | 16.mp3 |
| 71 | IN_DER_SCHLOSSGALERIE | 16 | 16.mp3 |
| 72 | IM_VORRATSRAUM | 16 | 16.mp3 |
| 73 | IN_DER_SCHLOSSKUECHE | 16 | 16.mp3 |
| 74 | IM_SPEISESAAL | 16 | 16.mp3 |
| 75 | IM_KUECHENGARTEN | 16 | 16.mp3 |
| 76 | AUF_DEM_DACH_DES_HAUPTTURMES | 15 | Cast.mp3 |
| 77 | IM_HAUS_DES_TURMWAECHTERS | 15 | Cast.mp3 |
| 78 | IN_EINEM_DUNKLEN_SCHACHT | 15 | Cast.mp3 |
| 79 | IN_EINER_VERLIESZELLE | 18 | 08.mp3 |
| 80 | IM_AMTSZIMMER_DES_TORWAECHTERS | 18 | 08.mp3 |
| 81 | IM_ZIMMER_DES_DUNGEON_MASTERS | 18 | 08.mp3 |
| 82 | IM_UNTEREN_TREPPENHAUS | 18 | 08.mp3 |
| 83 | IN_DER_WAFFENKAMMER | 18 | 08.mp3 |
| 84 | IN_EINER_DUNKLEN_HALLE | 17 | 14.mp3 |
| 85 | IM_WEINKELLER | 17 | 14.mp3 |
| 86 | IN_EINEM_KORRIDOR | 18 | 08.mp3 |
| 87 | IN_EINEM_FINSTEREN_GRUFTGEWOELBE | 17 | 14.mp3 |
| 88 | IN_ZARGONS_SCHLAFGEMACH | 18 | 08.mp3 |
| 89 | IN_EINER_SCHWARZEN_BIBLIOTHEK | 18 | 08.mp3 |
| 90 | IN_ZARGONS_WOHNGEMACH | 18 | 08.mp3 |
| 91 | IN_EINEM_ALTARRAUM | 18 | 08.mp3 |
| 92 | IN_ZARGONS_STUDIERZIMMER | 18 | 08.mp3 |
| 93 | IN_ZARGONS_MYSTERIUM | 18 | 08.mp3 |
| 94 | IN_DER_HUETTE_DES_TORWAECHTERS | 19 | 13.mp3 |
| 95 | IN_DER_HUETTE_DES_FAEHRMANNS | 19 | 13.mp3 |
| 96 | AM_UFER_EINES_UNTERIRDISCHEN_SEES | 19 | 13.mp3 |
| 97 | AUF_EINER_KLEINEN_INSEL | 19 | 13.mp3 |
| 98 | IN_EINEM_HOEHLENTUNNEL1 | 19 | 13.mp3 |
| 99 | AN_EINER_UNTERIRDISCHEN_QUELLE | 19 | 13.mp3 |
| 100 | IM_THRONSAAL_DES_BUTHAKOENIGS | 19 | 13.mp3 |
| 101 | IN_DER_HOEHLE_DES_CUSATHS | 19 | 13.mp3 |
| 102 | IN_EINEM_HOEHLENTUNNEL2 | 19 | 13.mp3 |
| 103 | IN_EINER_WOHNHOEHLE | 19 | 13.mp3 |
