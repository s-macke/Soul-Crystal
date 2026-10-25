# Deutsche DOS-Texte

Quelle: `data/DOS/Soul/*.TXT`. Reproduzieren vom Repository-Verzeichnis aus:

```sh
GOCACHE=/tmp/soul-go-cache GO111MODULE=off go run ./src/Go/dos
GOCACHE=/tmp/soul-go-cache GO111MODULE=off go test ./src/Go/dos
```

| Ausgabe | Spieltexte / primärer Block | Raumtitel | Gesamt |
| --- | ---: | ---: | ---: |
| PARTA.txt | 63 | 15 | 78 |
| PARTB.txt | 199 | 35 | 234 |
| PARTC.txt | 42 | 15 | 57 |
| PARTD.txt | 186 | 38 | 224 |
| COMMN.txt | 122 | 0 | 122 |
| RAM.txt | 35 | 0 | 35 |
| Gesamt | 647 | 103 | 750 |

Hinzu kommen 166 Objektplätze in `objects.txt` (einschließlich Index 0) und
56 Verbeinträge in `VERBS.txt`.

Die PART-Archive enthalten zwei Unterarchive mit eigenem TXTL/BODY/HUFL und
gemeinsamem Huffman-Baum. `Game texts` enthält den ersten Block, `Room titles`
den zweiten. Datensatznummern beginnen **in jedem Abschnitt separat bei 0**;
sie sind weder globale DOS-Text-IDs noch C64-Text-IDs. Der Abschnitt `Rooms`
erhält die ROOM-Tabelle des Originals.

Jeder Text wird an seinem HUFL-Byteoffset im zugehörigen BODY gelesen. TXTL
gibt die dekodierte Bytezahl einschließlich abschließendem NUL vor; der
Exporter prüft diese Länge sowie die Datensatzanzahlen aus HUHD. Er bricht bei
fehlenden Blöcken, ungültigen Offsets oder abgeschnittenen Daten ab. Textinhalt
und abschließende Leerzeichen werden erhalten; CP437-Umlaute werden zu UTF-8.

Der frühere Export überschrieb den ersten BODY und enthielt bei PARTA–D nur
die Raumtitel. Die bisher fehlenden 490 Spieltexte sind jetzt enthalten.
Alle 750 Texte wurden nach der Reparatur exakt gegen den unabhängigen Decoder
des [C64/DOS-Vergleichs](../../spec/C64/dos_text_comparison.md) abgeglichen.
