# C64: logische Text-IDs und Archivdatensätze

Quelle ist `opcodeoracle/soul_crystal/soul_crystal.asm` mit dem zugehörigen
64-KiB-Speicherabbild, abgeglichen mit den vier VICE-Snapshots. Die folgenden
Regeln gelten für den gewöhnlichen Meldungspfad; der Raumtitelpfad ist separat.

## Zwei Nummernräume

Die Scripts schreiben eine **logische ID** nach `textoutput` ($6990/$6991).
`script_vm_show_text` ($3C02) übersetzt diese zur **Datensatznummer** für
`svc_decode_indexed_record` ($CB00). $4022 übergibt die Nummer über $030C/$030D,
setzt I/O-Modus $82 und ruft über $0CDB mit Inline-Ziel $CB00 den Decoder auf.

`text_ids.json` enthält die fertige Zuordnung. Die Seitenkataloge enthalten die
originalen Datensätze einschließlich Raum-/Objektnamen, nicht nur Meldungen.
Alle Quellen liegen unter `texts/C64/`; jeder Seitenkatalog nennt D64-Pfad,
SHA-256, Datensatzindex und absoluten Byteoffset im D64.

## Umrechnung

Aktive Seite: $6963 = 1 (B1), 2 (B2), 3 (C1), 4 (C2).
`t` bezeichnet den seitenabhängigen Beginn des gemeinsamen Schlussblocks.

| Logische ID | Seite | Datensatzindex |
| --- | --- | --- |
| 0 | alle | keine gewöhnliche Meldung |
| 1–24 | alle | ID + 102, außer dynamischen IDs 1/2/8/12 |
| 25–106 | alle | ID + 102 |
| 107–168 | B1 | ID + 102 |
| 169–355 | B2 | ID + 40 |
| 356–397 | C1 | ID − 147 |
| 398–579 | C2 | ID − 189 |
| 580–619 | alle | t + ID − 580 |
| 620 | B1 | t + ID − 580 |
| 621–632 | B2 | t + ID − 581 |
| 633–636 | C2 | t + ID − 593 |

`t`: B1 = 271, B2 = 396, C1 = 251, C2 = 391. Der Wert steht little-endian
im D64 bei $02FA/$02FB, entsprechend $CAFA/$CAFB im Speicher. $54EB lädt ihn
abzüglich 126 nach $70BB/$70BC; $3FEE addiert am Ende wieder 126.

Die Bereichsvergleiche beginnen bei $3CF2. Ihre Grenzen sind **strikt größer**:
397 bleibt C1, erst 398 gehört zu C2. Einzelne vorhandene Assemblerkommentare
formulieren diese Grenze ungenau. Die Modi sind 1–9 und 11; Modus 10 wird nicht
verwendet. $3F62 lässt die gemeinsamen Modi 2/7 auf jeder Seite zu, sonst nur
`mode - 2 == side` oder `mode - 7 == side`. Andere Seiten liefern keine Meldung.

## Sonderfälle für eine Go-Portierung

- $5D94 behandelt IDs 1 (Punktestand), 2 (Handbuchabfrage), 8 (Ablegen) und
  12 (Aufnehmen) als dynamische Ausgaben. Das JSON markiert sie mit
  `engine_formatted`; Objektname, Zahlen und Zustand müssen eigene Go-Funktionen
  ergänzen. Die Archivplatzhalter sind nicht die fertige Meldung.
- Andere originale Platzhalter wie `r04` bleiben unverändert erhalten. Keine
  stillschweigende Ersetzung durch Texte aus Amiga oder DOS.
- Der vorgeschaltete Raumtitelpfad verwendet den Zustand $6958 und den Index
  `$6959 - 1`. ID 900 ($0384) interagiert mit diesem Sonderpfad. Eine alleinige
  `Lookup(id)`-Funktion bildet daher nicht die gesamte Engine-Ausgabe ab.
- IDs oberhalb 636 gehören nicht zum gewöhnlichen Meldungskatalog; sie dürfen
  nicht durch einen beliebigen gültigen Text ersetzt werden.

Für direkt übersetzte Spielfunktionen können die bisherigen numerischen IDs
unverändert bleiben: `ShowText(side, id, state)` trennt Archivlookup, dynamische
Ausgaben und Raumtitel. Die Spiellogik selbst wird direkt in Go geschrieben;
diese Daten verlangen keinen Bytecode-Interpreter.

## Decoder und Nachweis

Der Go-Exporter liest die 3-Byte-Zeiger ab D64-Offset $0300 und dekodiert den
Huffman-Strom mit den Tabellen bei $0200/$0280. Er prüft Zeiger, Streamgrenzen,
Baumtiefe und Ausgabelänge. Die vorhandene Markdown-Ausgabe bleibt als Lesefassung.

`GO111MODULE=off go test -v ./src/Go/text` prüft:

1. Alle 2.448 Kombinationen aus IDs 25–636 und vier Seiten gegen die originalen
   6502-Instruktionen ab $3CF2, bis zum Decoderaufruf oder Rücksprung. Der kleine,
   begrenzte Instruktionsharness existiert ausschließlich im Test.
2. Identische Routingbytes und Huffman-Tabellen in den Snapshot-/D64-Quellen.
3. Alle 1.486 JSON-Datensätze gegen erneute Dekodierung und alle Mappingeinträge.
4. Die Textzuweisungen und SELECT-Ziele der C-Ausgabe gegen die Snapshotbytes.

Der Test des gewöhnlichen Routingcodes beweist nicht die vollständigen dynamischen
Ausgaben oder den Raumtitelpfad; diese sind oben ausdrücklich getrennt beschrieben.
