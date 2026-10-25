# Geprüfte englische Übersetzungskorrekturen

`corrections.json` enthält 37 eng begrenzte Korrekturregeln mit Ziel, erwartetem
Originalwortlaut, Ersatz, erwarteter Trefferzahl und Begründung. Sie betreffen
26 Archivdatensätze, sechs Passagen in Intro/Tagebuch und einen Objektnamen.

Korrigiert werden die dokumentierten Befunde aus
`spec/C64/english_translation_review.md`:

- **Tagebuch Tag 3:** Türklinke ausdrücklich **nach oben** drücken.
- **Elixier:** Unsichtbarkeit für **one turn**, nicht „puff“ oder „hit“.
- **Verriegeln:** `lock/locked` statt „complete/finished/over/close“, auf allen Seiten.
- **Pfeife:** `pipe` statt „whistle“, auch in Wiederholungen und beim Fährmann.
- **Pfeifendiebstahl:** schnell verschwinden statt einen Teller reinigen.
- **Objekt 5:** `Leather pouch` statt `Leather socks`; ID und Symbol unverändert.
- **Tagebuch Tag 2:** Zweifel an Zargons Charakter bleibt eine Frage.
- **Tagebuch Tag 3:** Simona lädt den Turmwächter ein, nicht umgekehrt.
- **Intro Seiten 4, 6 und 7:** Daves Partyplan, ungewohnter Tatendrang während
  der Schulzeit und geplante Ankunftsmeldung an die Mutter richtiggestellt.

## Original und Spielfassung

`B1/B2/C1/C2.json/.md`, `story.txt/.json`, `diary.txt`, `objects.json/.md` und
sämtliche Intro-PNGs bleiben unveränderte Extraktionsbelege. Die Originalbilder
zeigen deshalb weiterhin die unkorrigierte Fanübersetzung. Die CLI stellt
Bilder ohnehin nicht dar; sie zeigt den korrigierten Introtext.

Der Go-Exporter liest die Korrekturen **beim Generieren**, prüft den erwarteten
Originalwortlaut und bricht bei einer Abweichung ab. Nur die englischen C-Daten
in `out/game_texts_en.c/.h` enthalten die Änderungen. Deutsche Texte, Text-IDs,
Objekt-IDs, Bytecode und Spielzustand ändern sich nicht. Die ursprüngliche
englische Namensliste bleibt ebenfalls erhalten; eine C-Funktion liefert für
Objekt 5 den korrigierten Anzeigenamen. Anzeige und Parser verwenden beide
`Leather pouch`.

```sh
GOCACHE=/tmp/soul-go-cache GO111MODULE=off go run ./src/Go/text -language en
./build_console.sh
./build/soul-crystal --language en
```

C/C++ lädt weder Korrekturliste noch andere JSON-Dateien zur Laufzeit.
Der Compiler benötigt nur die eingecheckten C-Daten.

## Prüfungen

- Alle 1486 Rohdatensätze werden weiterhin direkt gegen die englischen Disks geprüft.
- Die kompilierten englischen Textdaten werden gegen Disktexte plus Korrekturen geprüft.
- Zusätzliche feste Prüfungen sichern Verriegeln, Elixierdauer, Fluchthinweis,
  Türklinke, Zweifel an Zargon, Simona, Partyplan und den Objektnamen ab.
- Geänderte Ausgangstexte oder eine unerwartete Anzahl gleicher Fundstellen
  müssen die Korrekturanwendung scheitern lassen.
- Beide vollständigen Sprach-Durchläufe sowie die Konsolentests prüfen, dass
  korrigierte Texte/Namen die Spielmechanik nicht verändern.
