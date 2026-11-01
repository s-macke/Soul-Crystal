# Geprüfte englische Spielfassung

Alle 1486 Archivdatensätze wurden vollständig gegen Deutsch geprüft. 853
Archivdatensätze sind geändert: B1 179, B2 239, C1 172, C2 263. Hinzu kommen
Intro, Tagebuch, Objektnamen, Befehls- und Engine-Texte. Insgesamt enthält
`corrections.json` 963 Regeln mit erwartetem Ausgangstext und Trefferzahl.

## Dateien und Reproduktion

- `original/`: unveränderte Extraktionsbelege, einschließlich Bildschirmzeilen.
- `B1/B2/C1/C2.json/.md`, `story.txt/.json`, `diary.txt`, Begriffsdateien:
  redigierte lesbare Fassung, identisch mit der für das Spiel erzeugten Prosa.
- `review-a-c.json`, `review-b.json`, `review-d.json`, `review-documents.json`:
  vollständige Prüflisten und begründete Änderungsvorschläge. Gemeinsame Texte
  werden beim Zusammenführen vereinheitlicht; einzelne Vorschläge können daher
  von der ausgewählten Formulierung abweichen.
- `review-coverage.json`: maschinenlesbare Abdeckung und Änderungszahlen.
- `corrections.json`: ausgewählte Ersatzregeln; Änderungen am Ausgangstext führen
  beim Export zu einem Fehler statt still zu einer falschen Zuordnung.

```sh
python3 src/Python/merge_english_review.py
GOCACHE=/tmp/soul-go-cache GO111MODULE=off go run ./src/Go/text -language en
./build_console.sh
./build_wasm_docker.sh
npm run build --prefix web
```

Archivexporte werden stets aus den originalen Disks gewonnen, dann korrigiert.
Intro, Tagebuch und Begriffe werden aus `original/` gelesen. `screen_lines`,
Quelladressen und Byte-Längen beschreiben weiterhin ausschließlich die Originale.
Die Diskimages selbst bleiben unverändert. C/C++ liest keine JSON-Dateien.

## Stil und Bedeutung

Idiomatisches Englisch mit jugendlichem Spott, gelegentlich bissigem Erzähler
und den ursprünglichen Wortspielen. Keine zusätzliche Handlung, keine neuen
Rätselhinweise, keine aktuelle Internetsprache. Die Figuren behalten eigene
Stimmen; insbesondere wird das Tagebuch nicht in Teenager-Slang umgeschrieben.

Gemeinsame Archivtexte werden anhand identischer deutscher Ausgangstexte
vereinheitlicht, niemals pauschal anhand gleicher Datensatznummern. Namen und
Befehle behalten ihre IDs; bisherige englische Eingaben bleiben Parser-Aliase.

Die neuen Texte werden gegen die Korrekturregeln und die einkompilierten C-Daten
geprüft; native Bildschirmzeilen zusätzlich gegen die Disks. Beide Sprachfassungen
werden mit schnellem und ausführlichem Replay Zug für Zug verglichen.

Weitere Beispiele: [Vollständiger Prüfbericht](../../spec/C64/english_full_review.md).
