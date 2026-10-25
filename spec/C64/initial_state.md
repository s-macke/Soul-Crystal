# Belegter C64-Anfangszustand

Der Zustand stammt aus `data/C64/d64/Soul Crystal SideB1.d64`, Spur 35,
Sektoren 0 bis 6 (D64-Offset `0x29a00`). Die ersten 1.719 Bytes dieser sieben
256-Byte-Blöcke haben das [Savegame-Layout](savegame_format.md).

Die Originalroutine `$569D` setzt Spur/Sektor und Lesepuffer zurück, lädt diese
Daten über `$56FD` und setzt anschließend Punkte auf 0, Schritte auf 1 sowie
alle Besuchsmarkierungen auf 0. Der exportierte Zeitpunkt ist unmittelbar nach
Rückkehr aus `$569D`, **vor** der ersten Raumanzeige, Besuchsmarkierung und dem
Einleitungstext durch den Aufrufer. Er ist kein Snapshot der ersten Eingabe.

Der Start ist Raum 3 (`AUF_DER_STRASSE1`), Spielteil A (1), mit 0 Punkten und
Schrittzähler 1. Alle elf veränderlichen Arrays werden vollständig ausgegeben:
sechs Raumverbindungen, Besuchsmarkierungen und vier Objektarrays. Ihre
Kapazitäten sind 104 Raumplätze und 166 Objektplätze einschließlich Index 0.

## Dateien und Herkunft

- `data/C64/state/initial_payload.bin`: unveränderte 1.719 Nutzbytes vom Diskimage.
- `data/C64/state/new_game.json`: dekodierter Zustand nach der Initialisierung,
  mit Quellpfad, SHA-256-Prüfsummen, Zeitpunkt und dokumentierten Konventionen.
- `out/game_state.c`: beschreibbare C-Definitionen mit denselben Anfangswerten.
  Die unveränderlichen Nachschlagetabellen bleiben in `out/game_tables.c`.

Nicht gespeicherte Index-0-Plätze der Objekt- und Verbindungstabellen erhalten
explizit 0 als Port-Konvention. Auch transiente Scriptvariablen und der
Tabellencursor werden für den Port mit 0 initialisiert. Diese Werte sind keine
behaupteten Original-Scratchinhalte. Das gespeicherte Engine-Feld `$69BF` bleibt
als `engineState69BF` erhalten; seine Bedeutung ist noch nicht vollständig benannt.

## Reproduktion und Prüfung

Vom Repository-Verzeichnis aus:

```sh
GO111MODULE=off go run ./src/Go/c64audit -state
GO111MODULE=off go test ./src/Go/c64audit
./check-generated-c.sh
clang -std=c11 -pedantic-errors -I. src/C/tests/game_state_test.c \
  out/game_state.c -o /tmp/soul-game-state-test
/tmp/soul-game-state-test data/C64/state/initial_payload.bin
```

Der State-Export ist ein separater Schritt. Der C++-Bytecode-Konverter liest
weiterhin kein JSON und benötigt zum Bauen kein Go. Er erzeugt Scriptteile,
Header und konstante Tabellen; der State-Export erzeugt die drei State-Dateien.

`TestInitialStateAgainstNativeInitializer` führt die Originalinstruktionen ab
`$569D` mit den Diskblöcken aus und vergleicht alle Arrays und gespeicherten
Skalare mit dem Export. Die Zustandsarrays werden vorher geleert, damit kein
gespielter Snapshotzustand einfließt; der Snapshot liefert den ausführbaren
Originalcode. Der Test prüft außerdem die reproduzierbaren Exportdateien.
Der C-Test vergleicht die tatsächlich kompilierten Initialisierer mit dem
Diskpayload und den Initialisierungsregeln und prüft ihre Beschreibbarkeit.
