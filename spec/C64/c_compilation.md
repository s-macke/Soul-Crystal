# Kompilierbare C-Referenz und strukturierte Tabellen

Alle vier Dateien `out/part[a-d].c` können einzeln als C11 in Objektdateien
übersetzt werden. Es werden keine Ersatzimplementierungen für Engine-Aufrufe
in den Produktionscode eingebaut.

```sh
bash build.sh
./transformbytecode /tmp/soul-converted
./check-generated-c.sh
```

`check-generated-c.sh` prüft die eingecheckten Dateien mit `clang -std=c11 -c`,
strikten Prototypen und Fehlern für implizite Funktionen sowie inkompatible
Pointer. Die temporären Objektdateien werden wieder entfernt. Für neue Ausgaben
funktioniert entsprechend `clang -std=c11 -I. -c /tmp/soul-converted/parta.c`.
Der Include-Suchpfad `-I.` bezeichnet dabei das Repository-Hauptverzeichnis.

## Gemeinsame Typen und Deklarationen

- `src/C/game_ids.h`: unverändert übernommene numerische Enums für Räume,
  Befehle und Objekte, zusätzlich Spielteile `PartA`–`PartD` mit Werten 1–4.
  Der alte `tables.h` bindet dieselben Enums ein, statt sie zu duplizieren.
- `out/game_script.h`: vom Konverter erzeugte Schnittstelle. Enthält feste
  8-/16-Bit-Typen, semantische ID-Aliase, externe Zustands-/Arraydeklarationen
  und vollständige Engine-Prototypen. Die Symboltabelle bestimmt die Namen
  und Typen dieser Deklarationen.
- `gamePart` ersetzt `diskSide`; die C64-Herkunft B1/B2/C1/C2 bleibt in den
  Quellen und Dokumentationen erhalten.

Die ID-Aliase bleiben zunächst 16 Bit, wie im bisherigen C-Modell; Bytearrays
bleiben 8 Bit. C-Enums dienen zur Benennung der Werte, nicht zur Festlegung der
Speicherbreite. `ObjectID` und `TextID` sind in C Aliase, noch keine voneinander
abgeschotteten Typen wie später in Go.

Die C-Dateien binden nicht mehr den großen `tables.h` mit dessen Daten-
**Definitionen** ein. Initialzustände und Engine-Funktionen müssen später wirklich
implementiert werden. Außerdem haben die vier Referenzdateien weiterhin jeweils
eine Funktion `Execute`: Zusammenlinken ist ausdrücklich nicht das Ziel dieses
Schritts. Erfolgreiches Kompilieren beweist noch keine vollständige Spielfunktion.

## Strukturierte ZERSTOERE-Antworten in Teil A

Originaltabelle $834A–$8365: sieben Datensätze zu vier Bytes, jeweils
little-endian `object` und `text` als 16-Bit-Werte.

Der Leser beginnt bei $7B39, liest die beiden Wörter bei $7B40/$7B42,
vergleicht das Objekt mit `object1` und durchsucht höchstens sieben Einträge.
Die nun erzeugte Tabelle lautet schematisch:

```c
static const ObjectTextEntry PartA_DestroyResponses[] = {
    {0x004a, 0x007c},
    /* weitere sechs Originaleinträge */
};
```

Der Leser verwendet `PartA_DestroyResponses[temp - 1].object` beziehungsweise
`.text`. Schleifenindex, Sprungziele, Scratch-Wert, Text-ID und Sonderbehandlung
von DAVE bleiben erhalten. Der rohe Bytecursor wird für diese Tabelle nicht mehr
benötigt: Er war hier lediglich die technische Umsetzung des sequentiellen Lesens.
Ein späterer Engine-Adapter darf diesen Cursor nicht als Spielzustand behandeln.

Diese Spezialisierung gilt nur für `PartA_HandleZerstoere`, nicht für dieselben
Adressen anderer Teile. Der Konverter prüft Leser, Grenzen und Tabellengröße,
bevor er die strukturierte Form ausgibt. Weitere Tabellen werden nur nach eigener Prüfung strukturiert.

Alle verbleibenden 16-Bit-Tabellenzugriffe verwenden `ReadTableWord(&tableptr)`:
explizites Little-Endian-Lesen mit anschließendem Fortschalten um zwei Bytes.
Der frühere Cast auf `unsigned short*` setzte Host-Byteordnung und Alignment voraus.

## Prüfung der ersten Tabelle

```sh
clang -std=c11 -pedantic-errors -I. -ffunction-sections -fdata-sections \
  src/C/tests/destroy_table_test.c out/game_tables.c -Wl,--gc-sections -o /tmp/soul-destroy-table-test
/tmp/soul-destroy-table-test data/C64/snapshots/diskb1.vsf
```

Der Test führt den **tatsächlich erzeugten C-Behandler** aus. Er vergleicht alle
sieben strukturierten Datensätze mit den Snapshotbytes und prüft alle 65.536
möglichen Objekt-IDs gegen den ursprünglichen Suchablauf: Treffer, Nichttreffer,
finaler Index, Scratch-Wert, Meldung und DAVE-Sonderfall. Nur im Test werden
Textausgabe und Neustart als zählende Testdoubles bereitgestellt. Unbenutzte
Spielfunktionen werden beim Testlink entfernt; es entsteht kein vorgetäuschtes
vollständiges Spiel. Zusätzlich prüft der Test unaligned Little-Endian-Lesen.

Die bestehenden Go-Tests prüfen weiterhin die Textzuweisungen, Funktionsnamen
und SELECT-Ziele gegen die Original-Snapshots. Der separate C++-Ausgabetest prüft
auch den erzeugten Schnittstellenheader.

## Tabellennamen statt Speicheradressen

`src/C/table_symbols.h` leitet die Namen aus den zuvor geprüften, teilbezogenen
Befehlsbehandlern ab. Es prüft den Beginn des Lesers und die Anzahl/Breite seiner
Felder. Mehrere Leser derselben Tabelle müssen dieselbe Zuordnung ergeben.
Unklassifizierte Daten würden `PartX_Table_XXXX` heißen; die aktuell verwendeten
sieben Tabellen jedes Teils sind zugeordnet.

| Namenssuffix (Präfix `PartA_` bis `PartD_`) | Teil A | Teil B | Teil C | Teil D |
| --- | --- | --- | --- | --- |
| TakeableObjects | $825E | $9374 | $8345 | $8FBE |
| OpenCloseObjects | $8286 | $939C | $836D | $8FE6 |
| LockKeyPairs | $82D7 | $93ED | $83BE | $9037 |
| LockingExceptions | $82EF | $9405 | $83D6 | $904F |
| HelpResponses | $82F6 | $940C | $83DD | $9056 |
| DestroyResponses | $834A | $9460 | $8431 | $90AA |
| TalkResponses | $8366 | $947C | $844D | $90C6 |

`TakeableObjects` ist die erste Objektprüfung des NIMM-Behandlers, keine Garantie,
dass jeder nachfolgende Sonderfall das Objekt tatsächlich im Inventar belässt.
`LockingExceptions` wählt besondere Antworten bei nicht passendem Schlüssel;
die Leser für Verriegeln und Entriegeln vergleichen dabei unterschiedliche
Eingabeobjekte. Der Name behauptet keine weitergehende Objektklassifikation.

`PartA_TalkResponses`, ehemals `data0x8366`, wird im SPRICH-Behandler als 15
Objekt/Text-Paare gelesen. Sonderfälle können die gefundene Antwort anschließend
überschreiben. Die tatsächliche Tabelle belegt nur 60 Bytes ($8366–$83A1).
Bei $83A2 folgt das Script-Endbyte $FF. Die vorherige C-Datei enthielt hier
insgesamt 4.763 Bytes: Die zusätzlichen 4.703 Bytes bis einschließlich $9600
waren ein unveränderter Snapshot-Anhang, keine Gesprächseinträge. Dieser Anhang
wird nicht mehr als Teil der Tabelle ausgegeben; sämtliche Bytes sind weiterhin
in `data/C64/snapshots/diskb1.vsf` vorhanden (RAM beginnt bei Dateioffset $99).
Der Vergleich vor der Umstellung bestätigte die vollständige Bytegleichheit.

Die Originaladressen stehen weiterhin an den Definitionen. Außer `PartA_DestroyResponses` und `PartA_TalkResponses` bleiben dies Bytearrays.
Die reinen Namensänderungen ändern weder Tabellenwerte noch Leselogik.


## Strukturierte Gesprächsantworten in Teil A

`PartA_TalkResponses` enthält jetzt genau 15 `ObjectTextEntry`-Zeilen mit
Objektkonstante und dezimaler logischer Text-ID. Kommentare nennen die
Originaladresse, den B1-Archivdatensatz und einen kurzen Textauszug. Bei IDs,
die auf B1 nicht angezeigt werden, steht stattdessen der Hinweis auf $3F62.
Die originale Objekt-ID $A5 besitzt im bisherigen Enum keinen Namen und bleibt
daher ausdrücklich numerisch erhalten.

Der Leser bei $7F31/$7F38/$7F3A verwendet die Strukturfelder und den unveränderten
1-basierten Index `temp`. Der Generator prüft den Leser und die 15er-Grenze,
sowie exakt 60 Datenbytes plus das folgende $FF. Sonderfälle nach dem Lookup
bleiben unverändert.

```sh
clang -std=c11 -pedantic-errors -I. -ffunction-sections -fdata-sections \
  src/C/tests/talk_table_test.c out/game_tables.c -Wl,--gc-sections -o /tmp/soul-talk-table-test
/tmp/soul-talk-table-test data/C64/snapshots/diskb1.vsf
```

Der Test vergleicht alle 15 strukturierten Einträge mit dem Snapshot und führt
den erzeugten SPRICH-Behandler für alle 65.536 Objekt-IDs mit sechs Kombinationen
des Dorfbewohner-/Wolfzustands aus (393.216 Fälle). Geprüft werden Meldung,
Suchindex, Scratch-Wert, Punktvergabe und die Seiteneffekte der Portier-,
Dorfbewohner- und Einhorn-Sonderfälle. Der allgemeine Bytecursor ist auch hier
nur ein ersetztes Implementierungsdetail, kein zu erhaltender Spielzustand.

## Vollständiger Tabellen- und Savegame-Audit

Der nachfolgende [Tabellenaudit](table_audit.md) prüft alle 28 Script-Tabellen
anhand der originalen D64-Dateien und ihrer 40 Leser. Er dokumentiert die native
Überlappung der Öffnen/Schließen-Tabelle (27 vorhandene, 28 gelesene Datensätze).
Die C-Ausgabe enthält dafür nun eine explizite, bytegetreue 28. Lesezeile. Die
übrigen Script-Endmarker werden nicht mehr als Gesprächsdatensätze ausgegeben.

Die Zustandsdeklarationen haben feste, durch Save/Load geprüfte Kapazitäten:
104 Raumplätze und 166 Objektplätze. Das [Savegame-Format](savegame_format.md)
erklärt die 1.719 gespeicherten Nutzbytes. Es werden ausdrücklich keine neuen
Startwerte aus einem gespielten Snapshot übernommen.


## Eigene Übersetzungseinheit für konstante Spieldaten

`out/game_tables.c` enthält ausschließlich die unveränderlichen
Script-Nachschlagetabellen als `const`-Definitionen. `out/game_tables.h` deklariert
sie mit `extern const` und fester Länge. Die vier `part*.c` enthalten keine
Tabellendefinitionen mehr, sondern binden den Header ein. Der Konverter erzeugt
alle Dateien gemeinsam; `check-generated-c.sh` übersetzt auch die Tabellendatei.

Die Part-Präfixe bleiben vorerst als Herkunftsangabe bestehen, auch bei identischen
Inhalten. Diese Trennung dedupliziert die identischen Tabellen noch nicht und
ändert weder Werte noch Leser. Die geprüfte Variante von OpenCloseObjects in
Teil D bleibt ausdrücklich erhalten.

Veränderliche Zustandsarrays gehören nicht in diese Datei. Ihre Deklarationen stehen in
`game_script.h`, ihre beschreibbaren Definitionen mit den belegten Anfangswerten
in `out/game_state.c`. Der separate [State-Export](initial_state.md) gewinnt diese
Werte aus den Originaldaten auf Disk B1 und der Initialisierungsroutine. Die historischen Datenkopien in
`src/C/tables.h` werden weiterhin nicht in die generierten Spielteile eingebunden.

## Originale Objekt-Anzeigenamen

`game_tables.c` enthält zusätzlich `const char *const objectDisplayNames[ObjectStateCount]`.
Die 165 Namen werden vom C++-Konverter direkt aus dem C64-Speicher dekodiert,
entsprechend der Originalroutine `$4FB1`: High-Offsets bei `$C0A4 + ID`,
Low-Offsets bei `$C149 + ID`, Namensdaten relativ zu `$C294`, Bit 7 als Endmarker.
Die Zeichen werden mit dem Spielzeichensatz nach UTF-8 übersetzt. Index 0 ist
als Port-Konvention leer; IDs 1 bis 165 bleiben unverändert.

Der Konverter vergleicht die dekodierten Namen aller vier Part-Snapshots und
bricht bei Abweichungen ab. Sie sind gemeinsame Spieldaten und werden nicht
in `game_state.c` abgelegt. Die symbolischen C-Bezeichner aus `game_ids.h`
bleiben davon getrennt: `BETT1` und `BETT2` haben beide den Anzeigenamen „Bett“.
Originalschreibweisen wie „Faß“ werden beibehalten. Kein JSON-Lesen im C++-Build.

```sh
clang++ -std=c++17 src/C/tests/object_names_test.cpp -o /tmp/soul-object-names-test
/tmp/soul-object-names-test
```

Der Test vergleicht alle vier Snapshots mit dem Speicherabbild des Disassemblies
und prüft konkrete Namen, Umlaute, doppelte Anzeigenamen und ungültige Offsets.
