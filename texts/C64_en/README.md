# Englische C64-Texte

Quelle: englische Fanübersetzung in `data/c64_en/SoulCrystal*.d64`.
Die deutschen Kataloge bleiben unverändert. Die Konsole startet die englische
Fassung mit `./build/soul-crystal --language en`.

| Archiv | Datensätze | Beginn des gemeinsamen Textblocks | Bytecode-Größe |
| --- | ---: | ---: | ---: |
| B1 / Teil A | 312 | 271 | 3493 Bytes |
| B2 / Teil B | 448 | 396 | 7867 Bytes |
| C1 / Teil C | 291 | 251 | 3724 Bytes |
| C2 / Teil D | 435 | 391 | 6917 Bytes |

Alle **1486 Archivdatensätze** liegen jeweils als JSON und Markdown vor.
Die Dateien in diesem Verzeichnis enthalten die vollständig geprüfte englische
Spielfassung. Unveränderte Extraktionsbelege liegen in `original/`. JSON behält
Quellpfad, Disk-SHA-256, Datensatznummer, Byteposition und originale
`screen_lines`; nur `text` ist redigiert. Die Datensatznummer ist nicht die
logische Text-ID. Siehe [vollständige Prüfung](../../spec/C64/english_full_review.md).

## Intro und Tagebuch

- `story.txt`: Text aller acht Intro-Seiten, mit Seitengrenzen. Aus den
  Zeichendaten gelesen, ohne OCR. Einrückungen für Illustrationen entfernt;
  Seitengrenzen erhalten, Sprache und Sinn anhand des deutschen Intros überarbeitet.
- `story.json`: redigierter Seitentext plus jeweils 25 originale 40-Zeichen-Zeilen.
- `../../images/C64_en/story/story0.png` bis `story7.png`: die acht Intro-Seiten,
  aus den originalen Zeichen und Illustrationen zusammengesetzt. 320×200 Pixel,
  ohne Emulator-Rand; feste C64-Palette, keine CRT-Filter oder PAL-Korrektur.
- `diary.txt`: vollständiges englisches Turmwächter-Tagebuch, Tage 1–6 des
  Jahres 713, aus Seiten 10–12 der beiliegenden Datei
  `data/c64_en/Soul Crystal Walkthrough and Info.pdf`.
  PDF-SHA-256: `e21bdfcfcb6c5045ca83496bce0722ccd663300fe75167b7f8e1de02ba559319`.

Das Intro liegt auf **A2, interne Kette 11**, Start Track 3 / Sektor 14,
20133 Bytes einschließlich PRG-Ladeadresse `$0817`. Der englische Packer
unterscheidet sich vom deutschen. Das begrenzte Python-Werkzeug führt nur den
Unpacker bis `$2080` und anschließend die native Bildaufbereitung ab `$1299`
aus. Es benötigt keine Zusatzbibliotheken und ist kein vollständiger Emulator.
Die acht Seiten liegen nach dem Entpacken ab `$4000` in 1024-Byte-Blöcken:
1000 Zeichencodes plus Illustrationsplatzierung. Die Überschrift „THE STORY“
ist Bestandteil der Grafik und wird im Transkript separat angegeben.

## Vergleich mit Deutsch / gemeinsame Spiellogik

Die VM-Ketten der vier Spielteile wurden direkt aus beiden Disk-Editionen
extrahiert: **alle vier sind vollständig bytegleich**. Damit sind auch die im
Bytecode enthaltenen Text-IDs, Bedingungen und Aktionen gleich. Der Test
`TestEnglishScriptsMatchGerman` sichert diesen Befund direkt an den Disks ab.
Das beweist keine Gleichheit aller nativen Engine-Routinen oder Parserdaten.

Die Kataloge haben identische Datensatzanzahlen, gemeinsame Textblock-Anfänge
und Positionen der `rXX`-Platzhalter. Stichproben gleicher Datensatznummern:

| Datensatz | Deutsch | Englisch |
| --- | --- | --- |
| 0 | [Im Gästezimmer] | [In the guest room] |
| 1 | [In der Lobby] | [In the lobby] |
| 50 | [In einem verwunschenen Wald] | [In an enchanted forest] |
| 102 | [In einer Wohnhöhle] | [In a cave dwelling] |
| 126 | Wie soll denn DAS funktionieren? | How is that supposed to work? |
| gemeinsamer Textblock, erster Eintrag | Ausgänge führen nach: | Outputs lead to: |

Der ursprüngliche Strukturvergleich wurde durch die vollständige sprachliche
Prüfung aller Datensätze ergänzt (siehe Prüfbericht). Die native Text-ID-Umrechnung
`$3C02..$4001` wurde inzwischen direkt aus A2 Kette 10 verglichen und ist
bytegleich. `TestEnglishTextIDRoutingMatchesGerman` sichert das ab. Deshalb
enthält `text_ids.json` die gleiche ID-Zuordnung wie Deutsch.

Beide Sprachen sind mit gemeinsamer C-Spielmechanik spielbar. Der Go-Exporter
erzeugt die englischen C-Texte separat unter `out/game_texts_en.c/.h`; die
Objektnamen kommen aus `out/game_vocabulary_en.h`. JSON bleibt ausschließlich
Extraktions-/Dokumentationsformat. Details: [Begriffe und Zuordnung](vocabulary.md)
und [Sprachwahl der Konsole](../../spec/C64/console_application.md).

## Reproduktion

Vom Repository-Verzeichnis aus:

```sh
GOCACHE=/tmp/soul-go-cache GO111MODULE=off go run ./src/Go/text -language en
GOCACHE=/tmp/soul-go-cache GO111MODULE=off go run ./src/Go/disk -english -out /tmp/soul-c64-en A2
python3 src/Python/extract_c64_en_intro.py /tmp/soul-c64-en/A2_seq11.bin
GOCACHE=/tmp/soul-go-cache GO111MODULE=off go test ./src/Go/text ./src/Go/disk
```

Für das Tagebuch (benötigt Popplers `pdftotext`):

```sh
pdftotext -layout -f 10 -l 12 'data/c64_en/Soul Crystal Walkthrough and Info.pdf' /tmp/soul-diary.txt
python3 - <<'PY'
from pathlib import Path
text = Path('/tmp/soul-diary.txt').read_text()
Path('texts/C64_en/original/diary.txt').write_text(text.replace('\f', '\n').strip() + '\n')
PY
```

Die Archivtexte werden durch `objects.json`, `verbs.json`,
`frontend_labels.json` und `engine_texts.json` ergänzt. Herkunft, Grenzen und
Reproduktionsbefehle stehen in [vocabulary.md](vocabulary.md).

## Qualität der Fanübersetzung

Alle Archivtexte, acht Intro-Seiten, sechs Tagebucheinträge, 165 Objektnamen,
42 Befehlsbezeichnungen, 60 Frontend-Beschriftungen und 50 Engine-Fragmente
wurden gegen ihre Bedeutung geprüft. Drei Subagenten teilten sich die vier
Spielteile; gemeinsame Texte wurden anschließend vereinheitlicht. Der freche,
jugendliche Erzählton bleibt erhalten, das Tagebuch behält seine eigene Stimme.

`corrections.json` enthält quelltextgeprüfte Ersatzregeln. Der Export erzeugt
sowohl die redigierten JSON-/Markdown-/Textdateien hier als auch die C-Daten
in `out/`. Es gibt weiterhin kein JSON-Laden zur Laufzeit. Die Originaldisks,
Originalbilder und deutschen Texte werden nicht verändert.

Nach einer erneuten Intro-/Begriffsextraktion nach `original/` den Go-Export
oben erneut ausführen. Einzelheiten: [Korrekturen](corrections.md).
