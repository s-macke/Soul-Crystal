# C64-Konverter: Trennung von Dekodierung und C-Ausgabe

Dieser erste Refactoring-Schritt ändert Namen und Modulgrenzen, nicht die
Spielregeln, Kontrollflussstruktur, Zahlenformate oder Datentabellenwerte.

- `src/C/transformbytecode.cpp`: Snapshots laden, Codebereiche verfolgen und
  Tokens dekodieren. `DecodeToken()` ersetzt den mit dem Typ kollidierenden
  Funktionsnamen `Token()`.
- `src/C/bytecode_tokens.h`: gemeinsame Token-Typen. Die Token-Struktur enthält
  weiterhin teilweise C-Ausdrücke als Strings; dies ist noch kein vollständiger,
  sprachunabhängiger Syntaxbaum.
- `src/C/script_symbols.h`: zentrale Zuordnung von Variablenopcode zu Name,
  C-Typ, Beschreibung und ursprünglicher skalarer Speicheradresse.
  Arrayadressen sind hier noch nicht erfasst (`address = 0`). Die C-Typen sind
  die bisherigen Ausgabetypen, keine neue Aussage über native Speicherbreiten.
- `src/C/c_output.h/.cpp`: `WriteC()` bekommt Tokens, Tabellen-/Funktionsmarken
  und Befehlsnamen als explizite, nur lesbare Eingabe. Tabellen, Deklarationen
  und Anweisungen werden hier ausgegeben. Keine Snapshot- oder JSON-Zugriffe.
- `src/C/tables.h`: vorhandene Arraydaten mit angepassten Bezeichnern. Die
  älteren Tabellen-/Analysewerkzeuge verwenden dieselben neuen Arraynamen.

## Namen

| Vorher | Jetzt |
| --- | --- |
| pointsum | score |
| points | remainingPoints |
| roomnumber | currentRoom |
| addr6963 | diskSide |
| textoutput | pendingTextID |
| imageno | imageID |
| addr6996 / addr6998 / addr699a | scratch1 / scratch2 / scratch3 |
| objectposition | objectLocation |
| objectstatus | objectState |
| objectdescription | objectDescriptionID |

`score` berücksichtigt auch Punktabzüge. `remainingPoints` bezeichnet den
Punktevorrat, dessen Einträge nach Vergabe häufig gelöscht werden. Die drei
Scratch-Variablen bleiben bewusst allgemein: Ihre Bedeutung wechselt zwischen
Routinen. `objectState` ist kein boolescher Wert.

## Validierung

Vom Repository-Hauptverzeichnis:

```sh
bash build.sh
./transformbytecode /tmp/soul-converted
clang++ -std=c++17 -Wall -Wextra src/C/tests/c_output_test.cpp src/C/c_output.cpp -o /tmp/soul-c-output-test
/tmp/soul-c-output-test /tmp/soul-c-output-test.c
GO111MODULE=off go test ./src/Go/...
```

Der C++-Test verwendet den Ausgabeteil unabhängig vom Decoder. Er prüft
Symbol-Eindeutigkeit, Deklarationen, Byte-/Wortdarstellung, Textkommentare,
SELECT-Fallnummern und Ziele, SPECIAL-Semikolons und unveränderte Tabellenbytes.
Die bestehenden Go-Tests prüfen weiterhin die C-Textzuweisungen und SELECT-Ziele
gegen die Original-Snapshots.

Zusätzlich wurde die vollständige Ausgabe aller vier Teile vor/nach dem Umbau
verglichen: Nach Rücknahme der Namensänderungen sind die Anweisungen, Kommentare,
Zahlen und Daten identisch. Lediglich die skalaren Deklarationen werden neu
sortiert und mit Adresse/Beschreibung versehen. Die zusätzlichen Daten am Ende
der vorhandenen `out/parta.c` wurden bei der Aktualisierung erhalten.

Die erzeugten C-Dateien bleiben eine Portierungsreferenz; vollständige
Kompilierbarkeit und Engine-Implementierung sind mit diesem Schritt nicht
hergestellt. Ein sprachunabhängiger Syntaxbaum und eine Go-Ausgabe folgen separat.

## Funktionsnamen pro Spielteil

`function_symbols.h` baut für jeden Spielteil eine eigene Zuordnung auf. Es
prüft die Originalbytes der vier SELECT-Blöcke und der vorgeschalteten
Subtraktionen (`command`, danach `command - 13`, `command - 26`, `command - 37`).
Die Gruppen haben 13, 13, 11 und 7 Fälle, insgesamt die Befehle 1–44.

| Teil / Seite | SELECT-Adressen |
| --- | --- |
| A / B1 | $76E0, $7718, $7750, $7782 |
| B / B2 | $7702, $773A, $7772, $77A4 |
| C / C1 | $76E7, $771F, $7757, $7789 |
| D / C2 | $7715, $774D, $7785, $77B7 |

Namen wie `PartA_HandleNimm` bedeuten ausschließlich „Behandler des Befehls NIMM
in Teil A“. Sie behaupten nicht, dass die Funktion immer erfolgreich etwas
aufnimmt. Die Schreibweise wird aus den bestehenden deutschen Befehlsnamen
abgeleitet. Ungeklärte Befehlsplätze NIX1/NIX2 behalten `PartA_Sub_XXXX` usw.
Die ungewöhnliche Bezeichnung `HandleAusgaenge12` erhält den vorhandenen
Befehlsnamen, ohne die Bedeutung dieser Variante zu erraten.

Alle vier Ausgaben enthalten derzeit je 44 Funktionen: 42 benannte Behandler
und zwei Adressnamen für die Platzhalter. Weitere markierte Hilfsfunktionen
würden ebenfalls einen teilbezogenen Adressnamen erhalten. Dieselbe Adresse
in zwei Teilen wird niemals als dieselbe Funktion behandelt.

Definitionen und Prototypen nennen Spielteil, Scriptadresse, Befehlsnummer,
SELECT-Adresse und Fallnummer. GOSUB-Aufrufe und SELECT-Ziele verwenden dieselbe
Zuordnung. Der frühere globale Fallzähler wird nicht mehr als vermeintlicher
Befehlsindex benutzt. Unerwartete Dispatcherbytes oder mehrdeutige Zieladressen
brechen die Namenszuordnung ab, statt einen geratenen Namen zu erzeugen.

Die Go-Prüfung gleicht die Namen mit dem Befehlsvokabular und den jeweiligen
Snapshot-Dispatchern ab und prüft Definitionen sowie teilbezogene Aufrufe.
Ein vollständiger Vorher-/Nachher-Vergleich bestätigt, dass nur Funktionsnamen
und ihre Herkunftskommentare geändert wurden.
