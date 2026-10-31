# Soul Crystal im Browser

Kleine TypeScript-/Vite-Oberfläche für den vorhandenen C/C++-Spielkern als
WebAssembly. Deutsche und englische Texte, vollständiges Intro, Symbolsteuerung, Punkte und gemalte Amiga-HD-Bilder. Alle vier Spielteile verwenden
bereits denselben Kern wie die CLI. Lokale Browser-Spielstände und Autosaves; keine Musik oder Cheats.

## Starten

Voraussetzungen: Docker mit BuildKit, Node.js 22.12+ und npm.
Vom Repository-Verzeichnis:

```sh
./build_wasm_docker.sh
cd web
npm ci
npm run dev
```

Dann die von Vite angegebene Adresse öffnen (normalerweise
http://127.0.0.1:5173). Sprache wählen und das Abenteuer beginnen. Mit `west`,
`nord`, `betrachte tresen` gelangt man zur Rezeption und entdeckt die Klingel.
`verben` und `objekte` zeigen die entsprechenden Listen. Das Intro steht vollständig unter
„Vorgeschichte & Spielanleitung“. Neuladen beginnt ein neues Spiel.

## Spielstart

Der Startbildschirm füllt das Fenster ohne Seitenscrollen. Zwei Schaltflächen,
Deutsch und English, starten direkt in der gewählten Sprache. Der Klick fordert
Browser-Vollbild an, sofern unterstützt; bei Ablehnung bleibt das Spiel im
fensterfüllenden Layout bedienbar.

## Spielstände

„Menü → Speichern / Laden“ öffnet die lokale Spielstandliste. Am Startbildschirm
und nach einem Todesfall lässt sich ebenfalls laden. Jeder Titel enthält Raum
und Spielteil; Datum, Punkte und Sprache stehen darunter. Die Sprache wird beim
Laden mit wiederhergestellt. Speichern ist nur zwischen Spielzügen möglich,
nicht in einer laufenden Rückfrage oder nach dem Tod.

Es bleiben bis zu 20 manuelle Spielstände und die letzten acht Autosaves erhalten.
Autosaves entstehen bei Raum- und Teilwechseln sowie mit dem
letzten spielbaren Zustand unmittelbar vor einem Todesfall. Spielstart und Neustart
erzeugen keinen Autosave. Im Startbildschirm wird nur Laden angeboten. Manuelle Spielstände
werden nie automatisch überschrieben. Löschen benötigt einen zweiten Klick.
Browserdaten liegen unter `soul-crystal.saves.v1` in localStorage, getrennt pro
Origin (Browserprofil, Host und Port). Es gibt keine Serverübertragung. Gelöschte
Browserdaten löschen auch die Spielstände; Export/Import ist noch nicht enthalten.

Der Kern stellt `GameSave`/`GameLoad` bereit. Inhalt und native Reihenfolge folgen
[dem belegten C64-Savegame](../spec/C64/savegame_format.md): 1719 Bytes plus vier
Port-Metadatenbytes, Versionskennung und Prüfsumme. Laden führt keinen Spielbefehl
aus. Die CLI erhält damit noch keine Dateiverwaltung. Der WASM-Replaytest lädt
nach jedem spielbaren Befehl erneut und prüft identischen Zustand und Endergebnis.

## Symbolsteuerung

Während des Spiels füllt die Oberfläche die Fensterhöhe (`100dvh`); die Seite
scrollt nicht. Das Raumbild füllt den Hintergrund. Eine gemeinsame transparente
Fläche enthält links die Verben, mittig die aktuelle Spielantwort und rechts
Raumobjekte und Inventar. Bis 760 Pixel Breite stehen die Verben über dem Text
und die Objekte darunter. Das Buch
oben rechts öffnet den vollständigen Verlauf samt Intro; Escape schließt ihn.
Lange Texte und aufgeklappte Symbolauswahlen scrollen innerhalb ihrer Flächen. Ein Texteingabefeld gibt es nicht mehr; auch Rückfragen bieten Schaltflächen.

„Mehr Verben“ ersetzt die Basisverben durch die zusätzlichen Aktionen;
„Basisverben“ wechselt zurück. „Menü“ öffnet separat Punkte, Lösung, Neustart,
Spielende und Anzeigeoptionen.

Verbsymbol wählen und anschließend ein erreichbares Objekt anklicken. Ohne
gewähltes Verb betrachtet ein Objektklick den Gegenstand. Befehle mit zwei
Objekten (etwa „Wende an“, „Gib“, „Entriegele“) sammeln zuerst Gegenstand und
Ziel und übergeben dann den vollständigen Befehl an denselben Parser wie die
CLI. „Abbrechen“ verwirft eine angefangene Auswahl ohne Spielzug.

„Hier“ und „Inventar“ stammen aus dem aktuellen Spielzustand. Verborgene
Objekte erscheinen erst nach ihrer Entdeckung. Die
Gegenstands- und Personensymbole werden über Objekt-IDs aus
`images/UI/manifest.json` zugeordnet. Gleichartige Objekte können ein Motiv teilen. Verben sind nach Art
sortiert; „Mehr Verben“ öffnet die zusätzlichen Aktionen und Spielbefehle.
Musik bleibt deaktiviert und hat keine Schaltfläche.

Namen erscheinen beim Hover und Tastaturfokus; „Namen“ blendet alle dauerhaft
ein. Touch-Geräte zeigen die Beschriftungen automatisch. Bestätigungsfragen
bieten Ja/Nein. Deutsch und Englisch verwenden dieselben IDs, aber die
jeweiligen Parserwörter und aktuellen Objektnamen.

## Bauen

```sh
./build_wasm_docker.sh
npm ci --prefix web
npm run build --prefix web
```

`build/web/` ist die vollständige statische Website. Per HTTP bereitstellen;
ein direkt geöffnetes `file://`-Dokument kann das WebAssembly-Modul nicht laden.
Zum lokalen Test des fertigen Builds: `npm run preview --prefix web`.
Relative Assetpfade erlauben auch die Bereitstellung unter einem Unterverzeichnis.

`Dockerfile.wasm` verwendet Emscripten 4.0.20 mit festem Image-Digest. Der
abschließende Scratch-Stage exportiert nur `soul-crystal.mjs` und
`soul-crystal.wasm` nach `build/wasm/`; Docker ist zur Laufzeit nicht nötig.
Mit lokal eingerichtetem Emscripten ist alternativ `./build_wasm.sh` möglich.
Nach Änderungen am C/C++-Kern den WASM-Build erneut ausführen und Vite neu starten
(bzw. den Web-Build erneut ausführen), damit die Kopien aktualisiert werden.

## Aufbau

- `src/web/bridge.cpp`: schmale C-Schnittstelle mit `web_start` und `web_submit`.
  Callback-Ereignisse liefern Text, Bilder und den aktuellen Status an TypeScript.
- `web/src/main.ts`: Befehlsausführung, Intro und Anzeige; keine Spiellogik.
- `web/src/controls.ts`: Symbolauswahl und Befehlszusammensetzung. Die Bridge
  liefert sichtbare Objekte über die lesende Schnittstelle in `game.h`.
- `web/src/images.ts`: übersetzt C64-Bildanforderungen in die Amiga-HD-Serie.
  Die 103 Räume stehen pro Teil zuerst im GFX-Archiv, dann das Todesbild und
  die Spezialbilder. Raumzahlen: 15/35/15/38; globale Offsets: 0/15/50/65.
  Raumindex = Raum − Offset − 1; Tod (129) = Raumzahl;
  Spezialindex = Raumzahl + Bild-ID − 129. Die Originalbildpaare aller 133
  Spielbilder wurden visuell verglichen. 254/255 erhalten das bisherige Bild.
  Beim Gewinn zeigt die Oberfläche `Victory-015.png`.
- `web/scripts/prepare-assets.mjs`: kopiert das gebaute Modul, die 133 Spielbilder
  und das Abschlussbild aus den **Ausgabepfaden** von `images/Amiga_HD/manifest.json`
  sowie die UI-Symbole in das ignorierte `web/public/`. Die Quellen bleiben an
  ihrem bisherigen Ort. Beide Sprachen verwenden dieselben Bilder.

Die HD-Bilder werden mit ihrem eigenen Seitenverhältnis und normaler Glättung
vollständig angezeigt (`object-fit: contain`, oben zentriert). Das Seitenverhältnis
bleibt erhalten; übrige Bildschirmfläche bleibt dunkel, statt Bildränder abzuschneiden. Sie sind KI-Neuinterpretationen der Amiga-Vorlagen. Introillustrationen
und Titelbild bleiben vorerst in der Bildgalerie; der Introtext ist im Spiel.
Texte werden als Textknoten ausgegeben, nicht als HTML interpretiert.

## Prüfen

```sh
npm test --prefix web
npm run test:wasm --prefix web
npm run build --prefix web
```

Der WASM-Test spielt die vorhandene schnelle Route bis zum Gewinn (4.955 Punkte),
prüft die angeforderten Bilddateien und startet anschließend die englische
Fassung. Zusätzlich prüft er verborgene/entdeckte Gegenstände und Inventaränderungen. Er benötigt den vorherigen WASM-Build. Der TypeScript-Build prüft die
Typen; die Bildtests prüfen Teilwechsel und Spezialbilder.

Bildauslieferung bei laufendem Vite prüfen (einschließlich eines parallelen Builds):

```sh
npm run test:assets --prefix web
npm run build --prefix web
npm run test:assets --prefix web
```

Der Test prüft alle 134 HD-Bildadressen und alle UI-Symbole auf PNG-Content-Type und PNG-Signatur.
Ein HTTP-200 allein reicht wegen Vites HTML-Fallback nicht aus. Das Kopieren
behält deshalb vorhandene Bildverzeichnisse bei; Löschen und Neuanlegen während
Vite läuft kann dessen Cache für öffentliche Dateien ungültig machen.
