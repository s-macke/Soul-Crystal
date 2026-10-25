# Deutsche C64- und DOS-Texte im Vergleich

Stand: 2026-10-25. Unabhängiger Subagentenvergleich, anschließend dokumentiert.
Der Archivtext ist nahezu identisch. Es wurde keine zusätzliche oder fehlende
Spielstrecke und kein wesentlich anderer Lösungshinweis im verglichenen
Textbestand gefunden. Dies ist kein Nachweis identischer nativer Spiellogik.

## Exportfehler (inzwischen behoben)

Der bisherige `src/Go/dos/main.go`, `case "BODY"`, überschrieb `a.body` bei jedem BODY-Chunk.
Die PART-Dateien enthalten jeweils zwei Unterarchive mit eigenem BODY, TXTL
und HUFL, aber gemeinsamem Huffman-Baum. Das ist bereits in
`spec/DOS/text_display_pipeline.md`, Abschnitte 9.2–9.3, dokumentiert.
Der zweite BODY enthält die Raumtitel. Daher fehlten im damaligen Repo-Export
**490 Spieltexte**, obwohl sie auf den Original-DOS-Dateien vorhanden sind:

| Datei | Spieltexte (BODY 1) | Raumtitel (BODY 2) | Bisher exportierte Datensätze |
| --- | ---: | ---: | ---: |
| PARTA | 63 | 15 | 15 |
| PARTB | 199 | 35 | 35 |
| PARTC | 42 | 15 | 15 |
| PARTD | 186 | 38 | 38 |
| Summe | 490 | 103 | 103 |

Für diesen Vergleich wurden beide BODY-Blöcke unabhängig nach `/tmp` dekodiert.
Die Bytezahl jedes dekodierten Datensatzes einschließlich NUL stimmt mit TXTL
überein. Der produktive DOS-Exporter wurde anschließend repariert: Beide Blöcke
werden nun getrennt mit ihren HUFL-Offsets und TXTL-Längen gelesen. Alle
750 neu exportierten Texte stimmen exakt mit dem unabhängigen Decoder überein.
Regressionstests prüfen die Blockanzahlen, Indizierung, Terminatoren und
Fehlerfälle. Siehe `texts/DOS/README.md`.

## Umfang und Unterschiede

Verglichen wurden alle 750 DOS-Archivdatensätze: 490 Spieltexte, 122 gemeinsame
Texte (COMMN), 103 Raumtitel und 35 RAM-/Systemtexte. Nach Normalisierung von
Layout, Interpunktion und Groß-/Kleinschreibung entsprechen 719/750 einem
C64-Text; bei eigentlichen Spieltexten einschließlich COMMN sind es 607/612.
Zuordnung über Textinhalt und Archivposition, nicht durch Gleichsetzen der IDs.

Die fünf abweichenden Spieltexte (primäre Datensatznummern sind nullbasiert):

| DOS-Datei / primärer Datensatz | Komprimierte Dateiposition | C64-Datensatz | Unterschied |
| --- | --- | --- | --- |
| PARTC.TXT / 35 | 0x359C | C1:244 | Im Eremitenhinweis fehlt „in“ vor „einen riesigen … Kristall einsperren ließ“. Die Kristallinformation bleibt vorhanden. |
| PARTD.TXT / 3 | 0x0793 | C2:212 | „Erfurchtsvoll“ statt „Ehrfurchtsvoll“. |
| PARTD.TXT / 44 | 0x50C0 | C2:253 | „wollen immer mit dem Kopf durch die Wand“ ohne „gleich“. |
| PARTD.TXT / 176 | 0xBBC4 | C2:385 | „das die Brotscheibe vergiftet war“ statt „daß“. |
| COMMN.TXT / 5 | 0x08A8 | B1:132 | Beenden-Rückfrage ohne „wirklich schon“. |

Die ersten vier Texte fehlten im ursprünglichen `texts/DOS`-Export;
Quelle des Vergleichs sind `data/DOS/Soul/*.TXT`.

## Objekte, Räume, Plattformtexte

Alle 166 Objektplätze einschließlich Index 0 entsprechen sich. Sieben
Anzeigenamen variieren (C64 → DOS), ohne neue Objektidentität:

- 18: Bücherregale → Bücherregal
- 21: Weißbrotscheibe → Brotscheibe
- 53: Schubladen → Schublade
- 60 und 61: Weihwasserbecken → Weihw.-Becken
- 113: Elixier → Elexier
- 120: Zepter → Szepter

Quellen: `out/game_tables.c` und `texts/DOS/objects.txt`.
96/103 Raumtitel sind normalisiert gleich. Die übrigen unterscheiden sich
etwa durch „In dem Korridor“ / „Auf dem Korridor“, „Zwergmine“ / „Zwergenmine“
oder Tippfehler wie „Empfgangshalle“. Keine zusätzliche Location gefunden.

RAM-Unterschiede betreffen überwiegend Plattformfunktionen: `@u1`-/`@s1`-
Platzhalter, Disketten/Festplatten, Dateifehler, `SAVEGAME.CON`, Auswahl und
Bestätigung von Spielständen. Sie sind kein Beleg für zusätzliche Rätsel.
Auch C64-intern gibt es Schreibvarianten, z.B. B1:184 `VAÖ` statt `VAX` und
B2:98 `;uelle` statt `Quelle`; andere C64-Seiten stimmen dort mit DOS überein.

## Grenzen und Arbeitsartefakte

Gleiche Texte beweisen nicht identische Auslösebedingungen. DOS-Intro und ein
eigenständiges DOS-Tagebuch wurden nicht verglichen. Heuristische nächste
Textnachbarn der RAM-Texte sind keine gesicherte ID-Zuordnung.

Temporäre Arbeitsartefakte dieser Prüfung (nicht dauerhafte Repo-Abhängigkeiten):

- `/tmp/compare_dos_c64.py`: Decoder und Vergleich
- `/tmp/soul-dos-decoded.json`: alle dekodierten DOS-Texte
- `/tmp/soul-dos-c64-diffs.json`: Differenzkandidaten, bei RAM teils heuristisch
- `/tmp/soul-dos-comparison.txt`: Vergleichsausgabe
