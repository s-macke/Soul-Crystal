# Amiga HD – vollständige Bildserie

148 Bilddateien, erstellt am 25.–26.10.2026 mit dem eingebauten `image_gen`:
133 Spielbilder aus den vier GFX-Archiven, zwölf Introillustrationen, das Titelbild
und zwei Zustände der Abschlusssequenz. [Vergleichsgalerie öffnen](index.html).
Die Galerie funktioniert lokal ohne Server; jedes Bild lässt sich auf seine
vorbereitete Originalvorlage umschalten.

Die Bilder sind KI-Neuinterpretationen, kein verlustfreies Upscaling. Neue Details
sind Interpretationen, keine wiedergewonnenen Originaldaten. Alle Ergebnisse
bleiben in der vom Werkzeug gelieferten Auflösung, ohne nachträgliche Skalierung:
Spielbilder ungefähr 2079 × 756, Introillustrationen ungefähr 1804 × 872 und
Titel/Abschluss jeweils 1586 × 992 Pixel. Die letzten beiden Formate liegen damit
unter der angefragten Breite von 1920 bzw. 2048 Pixeln.

## Ablage und Zuordnung

- `Disk 1/`: `Story1-01` bis `Story4-03` und `Title.png`.
- `Disk 2/`: alle 18 Bilder aus Teil A und alle 20 aus Teil C.
- `Disk 3/`: alle 44 Bilder aus Teil B.
- `Disk 4/`: alle 51 Bilder aus Teil D sowie `Victory-000.png` und `Victory-015.png`.
- `inputs/`: die 148 tatsächlich verwendeten Vorlagen.
- `style-references/`: die beiden freigegebenen Stilproben.
- `prompts/`: vollständige Prompts pro Bild; `extras.json` enthält Intro, Titel und Ende.
- `manifest.json`: Original, Eingabe, Ergebnis, Maße, Ausschnitt, SHA-256 und Prüfhinweise.

Die Spielbildnamen entsprechen den Amiga-Quelldateien, nicht den C64-Bild-IDs.
`A015`, `B035`, `C015` und `D038` haben pixelidentische Originalvorlagen. Die zuerst
getrennt erzeugten A-/B-Fassungen bleiben erhalten; C015 und D038 übernehmen B035.

## Vorbereitung und Export

`prepare-inputs.sh` bereitet alle 133 Spielbilder mit ImageMagick vor: Aus
352 × 64 werden durch exakte Zeilenverdopplung 352 × 128 Pixel. Die Verdopplung
findet tatsächlich vor dem Bildaufruf statt; Imagegen erhält keine gestauchten
Vorlagen.

`prepare-extras.py` schneidet zwölf Illustrationen aus den vier 640 × 200 großen
Amiga-Storytafeln aus. Die Rechtecke stehen in `prompts/extras.json`; aus 240 × 58
werden 240 × 116 Pixel. Das Titelbild wird von 640 × 200 auf 640 × 400 korrigiert.
Die Abschlussframes sind bereits Lowres-Grafiken mit 320 × 200 Pixeln und werden
nicht in der Höhe verdoppelt.

Jeder Aufruf verwendet die vorbereitete Vorlage und die zwei Stilreferenzen.
`register-image.py` kopiert das unveränderte Ergebnis in das Projekt und erfasst
seine Herkunft. Die Generierung ist nicht deterministisch. Erneutes Vorbereiten
kann PNG-Metadaten und damit Dateihashes ändern; das Manifest hält die tatsächlich
verwendeten Dateien fest.

`python3 images/Amiga_HD/update-gallery.py` prüft alle Dateihashes, die vollständige
Dateizuordnung, Maße, Seitenverhältnisse, Prompts und pixelweise die Vorbereitung.
Danach baut es die Galerie neu auf. Benötigt Pillow; es verändert keine Bilder.

## Originalanimationen

Der Go-Exporter `src/Go/amigapic` decodiert alle 13 ANIM-Dateien in 664 PNG-Frames
und 13 GIF-Vorschauen. Sie stehen unter `images/Amiga/Disk */animations/` und in der
[Originalgalerie](../Amiga/index.html). Die vollständige Gewinneranimation ist
[Victory.gif](../Amiga/Disk%204/animations/Victory/Victory.gif).

Die zwei HD-Gewinnerbilder sind eigenständige Standbilder, keine konsistente
HD-Animation. Für eine Animation bleiben die originalen Frames verfügbar.

## Prüfstatus

Alle neuen Ergebnisse wurden visuell gesichtet. Kleine Schriftzüge, Gesichter,
Objektzahlen und spielrelevante Details benötigen vor dem Einsatz im Spiel eine
gezielte Einzelprüfung; die KI verändert teilweise Formen und fügt Details hinzu.
Die Originalgrafiken bleiben erhalten. Das Webspiel wurde nicht auf HD umgestellt.
