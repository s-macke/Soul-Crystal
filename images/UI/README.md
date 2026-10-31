# Gemalte UI-Symbole

[Interaktive Vorschau öffnen](index.html), direkt als lokale Datei ohne Server.
Transparente PNGs, erzeugt am 27.–28.10.2026 mit dem eingebauten `image_gen`.
Der vollständige Katalog enthält 182 PNGs: 38 Befehlssymbole, 143 Objektmotive und eine UI-Aktion.
Die 143 Objektmotive decken alle 165 Objekt-IDs ab; 135 Motive wurden ergänzt.
Die einzelnen Zuordnungen enthält `manifest.json`.
Die ersten zwölf Symbole verwenden die freigegebene gemalte Amiga-HD-Rezeption als Stilreferenz. Die weiteren Symbole verwenden die freigegebenen Hand- und Tagebuchsymbole. Die jeweiligen Referenzen samt Prüfsummen stehen im Manifest.

- Verben: alle 38 Befehle der aktuellen Konsolenanwendung, nach Art gruppiert.
- Gegenstände und Personen: vollständiger Katalog der Objekt-IDs 1 bis 165.
  Gleichartige Objekte teilen teilweise ein Motiv; jede ID bleibt separat zugeordnet.

Die Dateien stehen in `verbs/` und `objects/`. Die Originalausgaben sind
quadratische PNGs (Maße je Datei im Manifest) mit echtem Alpha-Kanal. Die Vorschau zeigt sie per CSS in
48, 64 oder 96 Pixeln, ohne die Originaldateien zu verändern. Die Bilder enthalten
keine Beschriftung und keinen fest eingebrannten Buttonrahmen.

`manifest.json` ordnet jede Datei ihrer bestehenden deutschen Enum-Konstante und
numerischen ID aus `out/game_ids.h` zu. Eine Ausnahme ist Zombie (165):
Diese ID stammt aus `objectDisplayNames` in `out/game_tables.c`. Verb- und Objekt-IDs sind getrennte
Namensräume: beispielsweise ist 35 sowohl OEFFNE als auch KRISTALL. Deutsche
und englische Anzeigenamen sind enthalten. Objekt-Anzeigenamen sind keine
Parserbefehle. `prompts.json` dokumentiert die tatsächlich verwendeten Prompts.
Die Gegenstandsmotive sind neue Illustrationen, keine originalgetreuen Extrakte.

`python3 images/UI/build-preview.py` validiert IDs, PNG-Transparenz und Maße,
schreibt Prüfsummen und baut die Vorschau. Benötigt Pillow, bearbeitet keine PNGs.
Die Vorschau bietet Namen bei Hover und Tastaturfokus, eine dauerhafte
Beschriftungsoption, Auswahl per Klick/Enter sowie eine helle Vergleichsfläche.
Desktop und 390-Pixel-Layout wurden im Browser geprüft.

`objects-plan.json` enthält die Ergänzungsserie samt Prompts und Referenzen.
`register-object.py SYMBOL QUELLDATEI` kopiert ein erzeugtes PNG unverändert
und registriert auch alle IDs, die dieses Motiv teilen (`shared_with`).
Die Charakterporträts verwenden zusätzlich die vorhandenen Amiga-Animationsbilder
als Referenz; sämtliche verwendeten Referenzen sind dokumentiert.
Das Amulett orientiert sich an der Beschreibung in `out/game_texts.c` (Metallanhänger mit grün leuchtender Schlange). Musik ist als Symbol vorhanden, aktiviert aber keine Musikwiedergabe im Webport. Die Vorschau führt keine Spielbefehle aus und ihre
Objektauswahl stellt keinen tatsächlichen Raumzustand dar. Der Webport übernimmt den Katalog beim Build automatisch; seine dynamische
Objektliste verwendet die numerischen IDs. Deutsch und Englisch teilen die Motive.

`ui/save-load.png` ist das gemeinsame Symbol für Speichern/Laden (31.10.2026).
Es gehört zum separaten UI-Namensraum, nicht zu den Spielverben oder Objekten.
