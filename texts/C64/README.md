# C64-Texte für die direkte Go-Portierung

Die JSON-Dateien dokumentieren die Texte und ihre Zuordnung für die Go-Portierung.
Der Textexport erzeugt aus denselben dekodierten Originaldaten außerdem
`out/game_texts.c` und `out/game_texts.h` für die C-Laufzeit sowie
`src/C/text_comments.generated.h` für die Konverter-Kommentare.
Das C-Spiel liest keine JSON-Dateien; alle 1.486 Archivtexte werden einkompiliert.
Der C++-Konverter verwendet diesen festen Header: Zum Bauen und Ausführen sind
weder Go noch JSON-Dateien erforderlich. Die alten Textarrays in `src/C/tables.h`
sind für seine Kommentare nicht mehr maßgeblich. Die logischen IDs in
`out/part*.c` bleiben erhalten.

| Datei | Originalseite | Datensätze |
| --- | --- | ---: |
| [B1.json](B1.json) | Spielteil A | 312 |
| [B2.json](B2.json) | Spielteil B | 448 |
| [C1.json](C1.json) | Spielteil C | 291 |
| [C2.json](C2.json) | Spielteil D | 435 |

Das sind 1.486 Datensätze einschließlich gemeinsamer Texte, Raum-/Objektnamen
und originaler Platzhalter. Wiederholungen zwischen den Seiten bleiben erhalten.
`text` ist die lesbare Fassung mit vereinheitlichten Leerzeichen; `screen_lines`
erhält die dekodierten 40-Spalten-Zeilen einschließlich Leerzeichen.

[text_ids.json](text_ids.json) ordnet die logischen IDs 0–636 den Datensätzen je
Seite zu. **Datensatzindex und logische Text-ID sind verschiedene Zahlen.**
Für eine Go-Portierung zuerst `messages[id]`, dann `records[side]` und schließlich
im jeweiligen Seitenkatalog `records[index].text` nachschlagen. JSON-Objektschlüssel
sind Dezimalzahlen als Strings; Go kann sie auch in `map[int]...` einlesen.

- `disk_text`: Text auf den ausdrücklich aufgeführten Seiten vorhanden.
- `engine_formatted`: IDs 1, 2, 8, 12; dynamische Engine-Ausgaben. Sie müssen in Go
  als dokumentierte Funktionen umgesetzt werden, nicht als feste Archivtexte.
- `no_text`: ID 0, im gewöhnlichen Ausgabepfad keine Meldung.
- Eine fehlende Seite bedeutet keine Ausgabe auf dieser Seite, keinen automatischen
  Rückgriff auf eine andere Seite.

Die Dateien enthalten alle Datensätze der vier Spieltextarchive, nicht sämtliche
im Programm eingebetteten UI-Zeichenketten oder bereits fertig zusammengesetzte
Laufzeitmeldungen. Sonderbehandlung für Raumtitel siehe
[Text-ID-Spezifikation](../../spec/C64/text_id_mapping.md).

Vom Repository-Hauptverzeichnis aus:

```sh
GO111MODULE=off go run ./src/Go/text
bash build.sh
./transformbytecode /tmp/soul-converted
GO111MODULE=off go test -v ./src/Go/text
```

Ohne Ausgabeparameter schreibt der Konverter nach `out/`. Die Textdateien
`game_texts.c/.h` erzeugt separat der Go-Textexport, direkt aus den Diskimages.

[converter_audit.json](converter_audit.json) protokolliert den Vergleich der
vorherigen Kommentare mit dem neuen Mapping; die Auswertung steht im
[Konverter-Audit](../../spec/C64/converter_audit.md).

## C-Zugriff ohne Laufzeitdateien

- `GameTextRecord(part, record)` liefert einen UTF-8-Archivtext; ungültige
  Spielteile oder Datensatznummern liefern `NULL`.
- `GameTextRecordCount(part)` nennt die Anzahl der Datensätze.
- `GameTextLookup(part, id)` übersetzt die logische Meldungs-ID. Das Ergebnis
  unterscheidet `TextLiteral`, `TextNone`, `TextUnavailable` und
  `TextEngineFormatted`. Nur `TextLiteral` enthält einen Textzeiger.

Die Spielteile sind 1 bis 4. Es gibt keinen Rückgriff auf Texte anderer Teile.
Die dynamischen IDs 1, 2, 8 und 12 benötigen weiterhin Engine-Code. Der
Raumtitelpfad verwendet eigene Datensatznummern und ist nicht Teil des gewöhnlichen
Meldungs-Lookups. Die C-Fassung verwendet die lesbare `text`-Darstellung mit
vereinheitlichten Leerzeichen; die originalen Bildschirmzeilen bleiben im JSON.
Im Programm eingebettete UI-Texte sind damit noch nicht vollständig extrahiert.

`TestCompiledCTexts` kompiliert und linkt die C-Textdatei mit einem Testprogramm.
Es vergleicht sämtliche tatsächlich ausgegebenen Strings und alle 2.548
Kombinationen aus Spielteil und Meldungs-ID gegen die erneut dekodierten Diskdaten
und das geprüfte Routing. Ungültige Zugriffe werden ebenfalls geprüft.
