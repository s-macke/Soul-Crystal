# Englische Begriffe aus Disk A2

Die Extraktion verwendet `src/C/extract_vocabulary.cpp` und die bestehende
Routine `DecodeObjectDisplayNames` aus `src/C/object_names.h`. Die vorhandenen
deutschen Symbolnamen stammen unverändert aus `src/C/tables.h`.

| Datei | Inhalt |
| --- | --- |
| `objects.json`, `objects.md` | 165 Objektnamen mit numerischer ID, vorhandenem Symbol und RAM-Adresse |
| `verbs.json`, `verbs.md` | 42 Command-IDs mit vorhandenem Symbol, englischer Menübeschriftung und Frontend-Code |
| `frontend_labels.json` | 60 Beschriftungen aus dem Tastatur-Frontend, einschließlich Navigation und Menügruppen |
| `engine_texts.json` | 50 nichtleere konstante String-Fragmente aus den bekannten Engine-Textbereichen |

## Identität bleibt sprachunabhängig

Die Objekte werden **nicht umbenannt oder zusammengelegt**. Beispiele:

| ID | Vorhandener Bezeichner | Englischer Anzeigename |
| ---: | --- | --- |
| 7 | `GAESTEBETT` | `Bed` |
| 8 | `BETT1` | `bed` |
| 9 | `BETT2` | `bed` |
| 45 | `TAGEBUCH` | `Diary` |
| 163 | `DAVE` | `Dave` |

Ebenso bleibt `NIMM` Command-ID 38; die englische Beschriftung lautet `TAKE`.
Die Sprachfassung bestimmt Anzeigenamen und Eingabewörter, niemals die IDs.
Bei mehrfachen Anzeigenamen muss der Parser anhand erreichbarer Objekte
auflösen oder nachfragen. Dies ist keine neue Vergabe englischer Enum-Namen.
Für Datensatz 165 (`Zombie`) existiert noch kein Symbol: sowohl die
Konverter-Symbolliste als auch `enum OBJECTS` enden bei `ZARGON` (164).
Deshalb steht dort `symbol: null`; die Extraktion erfindet keinen Bezeichner.

## Herkunft und Zuordnung

- A2 Kette 2, Ladeadresse `$C000`: die 165 Namen. Geteilte Offsettabellen
  `$C0A5`/`$C14A`, Textbasis `$C294`, Bit 7 beendet einen Namen. Exakt dieselbe
  Dekodierung wie für die deutschen Anzeigenamen.
- A2 Kette 9, Ladeadresse `$9600`: Menüpointer `$AADD`, Keyboard-Lookup-Pointer
  `$AEBB`, jeweils aus der Originaldatei gelesen. Die Menüzeile A..F wird über
  die native Tastentabelle einem Frontend-Code zugeordnet. Richtungen kommen
  aus dem gemeinsamen K..P-Lookup. Command-IDs entstehen nach `$42F2..$4432`:
  `$21` und `$35` tauschen, dann Argumentklasse `$20`/`$40`/`$60` entfernen
  und die jeweilige Basis-ID addieren. Kein Matching übersetzter Wörter.
- Die Hauptmenü- und Richtungsbeschriftungen stimmen mit Ketten 7 und 8
  überein; die Keyboard-Codes zusätzlich mit Kette 8. Statuszeilen können
  andere grafische Abschlusszeichen haben; `frontend_labels.json` enthält
  hierfür ausdrücklich die Bytes von Kette 9. `[` und `\` sind dort teilweise
  Spezialglyphen, keine natürliche englische Interpunktion.
- A2 Kette 10, Ladeadresse `$0A00`: String-Deskriptoren in den Bereichen
  `$4811..$49D4`, `$5E6A..$604F`, `$6877..$6902`. Format: Längenbyte,
  absoluter Zeiger auf die folgenden Zeichen, PETSCII-Zeichen. Leerzeichen
  bleiben erhalten, auch vollständig ausgeblendete Texte. Leere Deskriptoren
  und veränderliche Stringpuffer sind nicht als konstante Texte exportiert.

Der Test führt für sämtliche 42 exportierten Befehle die **englische native
6502-Umrechnung** von `$42D1` bis `$4433` aus und vergleicht das Ergebnis in
`$6986/$6987`. Vorhandene Objekte werden dabei als Eingabe gesetzt; getestet
wird die Command-Zuordnung, nicht die gesamte Eingabelogik. IDs 25/26 sind
keine Menübefehle. Die existierenden Symbole bleiben auch bei irreführenden
Namen unangetastet: `MUSIC` ist ID 18 (`AUSGAENGE12`), `SID TYPE` ID 17
(`MUSIKEIN`). Diese Zuordnung folgt dem Original, nicht den Enum-Namen.

## Übersetzungsreste bewusst erhalten

`GIV`, `TUG`, `LOSE`, `CONSIDER`, `BACKPACK` sind Originalbeschriftungen.
`Leather socks` für `LEDERSOECKCHEN` ist ebenso unverändert übernommen wie
identische Namen für mehrere Betten, Boote, Schreibtische oder Türen.
Unter den Engine-Texten sind weiterhin deutsche Fragmente, insbesondere die
Handbuchabfrage und `Sehr viele...`. Es wurden keine Ersatzübersetzungen erfunden.
Die Ausgabe ist kein vollständiger Dump aller Zeichenfolgen des Frontends:
zusätzliche unreferenzierte/alternative Inline-Labels außerhalb der Menüs sind
nicht Teil der Befehlsliste.

## Reproduktion und Prüfung

Vom Repository-Verzeichnis aus; C++17 und Python-Standardbibliothek genügen:

```sh
GOCACHE=/tmp/soul-go-cache GO111MODULE=off go run ./src/Go/disk -english -out /tmp/soul-c64-en A2
clang++ -std=c++17 -Wall -Wextra -pedantic src/C/extract_vocabulary.cpp -o /tmp/soul-extract-vocabulary
/tmp/soul-extract-vocabulary /tmp/soul-c64-en texts/C64_en out/game_vocabulary_en.h
python3 src/Python/check_c64_en_vocabulary.py /tmp/soul-c64-en
clang++ -std=c++17 src/C/tests/object_names_test.cpp -o /tmp/soul-object-names-test
/tmp/soul-object-names-test
```

JSON ist ausschließlich ein Extraktionsformat. Der Konsolencode wurde hier
nicht auf JSON-Dateien umgestellt. `--language en` verwendet einkompilierte
Texte und die generierte Namensliste `out/game_vocabulary_en.h`. Für die
Konsolenbedienung bezeichnet `music` die bisherige Port-Funktion zum Umschalten
des Musikflags (ID 17); die originale SID-Menükonfiguration wird nicht emuliert.
