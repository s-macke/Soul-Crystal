# Erste Konsolenbasis

```sh
./build_console.sh
./build/soul-crystal
```

Zum Bauen genügen ein C11- und ein C++17-Compiler sowie die Standardbibliotheken.
Keine zusätzlichen Bibliotheken, kein Go beim Build, kein JSON- oder Diskzugriff
zur Laufzeit. Das Binary läuft auch außerhalb des Repository-Verzeichnisses.
`CC` und `CXX` können die Compiler festlegen. Artefakte liegen ignoriert in `build/`.

## Bedienung

Beim Start erscheinen Verben, der vollständige Introtext und die erste
Raumbeschreibung. Danach wird jeweils eine Textzeile eingegeben, etwa:

```text
nimm dave
betrachte hinweisschild
west
nord
betrachte tresen
nimm prospekt
druecke klingel
sprich mit portier
wende t-shirt auf dave
```

`n/s/o/w`, Umlaute und `ae/oe/ue` sowie Groß-/Kleinschreibung werden unterstützt.
`lies`/`lese`/`untersuche` sind Aliase für `betrachte`. Zwei Objekte können durch
`auf`, `an`, `mit`, `zu` oder `in` getrennt werden. Artikel vor Objektnamen sind
optional. Nicht eindeutige Namen werden abgelehnt, statt ein beliebiges Objekt
zu wählen. Die Oberfläche ist ein neuer Textparser, keine vollständige
Rekonstruktion des alten grafischen Parsers und seines gesamten Synonymvorrats.

`verben` wiederholt die Bedienliste, `objekte` nennt ansprechbare Objekte im Raum
und im Inventar. Die Liste folgt `objectLocation`: 0 ist verborgen, die aktuelle
Raumnummer ist lokal, 255 ist mitgeführt. Beispielsweise erscheinen Klingel und
Prospekt erst nach dem Betrachten des Tresens. `hilf`/`hilfe` führt weiterhin den
originalen Spielbefehl aus. Cheat-Eingaben sind nicht implementiert.

Speichern/Laden ist ausdrücklich nicht verfügbar. Neustart setzt dagegen den
bekannten Anfangszustand zurück und benötigt keinen gespeicherten Spielstand.

## Gemeinsamer Spielkern für Konsole und spätere Weboberfläche

`src/console/game.h` bietet eine C-Schnittstelle:

- `GameStart(callback, context)`: Anfangszustand, Intro und erste Raumausgabe.
- `GameSubmit(line)`: eine Befehlszeile bzw. eine Antwort auf die aktuelle Rückfrage.
- `GameGetView()`: Eingabemodus und knappe Angaben zu Raum, Teil, Punkten,
  Schritten sowie zuletzt angeforderter Bild-ID und ihrem Spielteil. Zusätzlich
  meldet `inputResult`, ob die letzte Eingabe angenommen, abgelehnt, ignoriert
  oder durch eine fehlende Engine-Funktion blockiert wurde. Angenommen bedeutet
  dabei nur eine gültige Eingabe; eine Spielaktion kann trotzdem erfolglos sein.

Der Kern ist eine einzelne Spielinstanz über den vorhandenen globalen Zustand.
Keine Aufrufe von `stdin`, Dateien, `exit()`, Threads oder Betriebssystemfunktionen
im Kern. Nur der dünne Adapter `main.cpp` liest Terminalzeilen. Callbacks liefern
Text, Bildanforderungen und Ausgabe-Flushes. Textzeiger gelten während des
Callbacks; der Aufrufer darf den Kern aus einem Callback nicht erneut betreten.

Alle vier C-Scriptteile werden unverändert aus ihrem Bytecode abgeleitet,
mit separaten `PartA_Execute` bis `PartD_Execute`. Nach Funktionsaufrufen
propagiert `ScriptInterrupted()` einen modalen oder terminalen Zustand durch die
normalen C-Rücksprünge. Keine VM, kein `longjmp`, kein Exception-Trick zur
Ablaufsteuerung. `Restart()` wurde entsprechend seiner tatsächlichen Bedeutung
in `FlushOutput()` umbenannt. Echter Neustart bleibt `SPECIAL(4)`.

Die Symbolquelle bleibt `src/C/game_ids.h`; der Konverter kopiert sie nach
`out/game_ids.h`. Damit benötigen die generierten Dateien keine Includes aus
`src/C/`. Ein versehentliches Komma im Krypta-Bezeichner erzeugte früher zwei
Enumwerte und verschob alle Räume ab 51. Das ist korrigiert und mit Assertions
für die Raumgrenzen 50, 51, 65 und 103 abgesichert.

## Texte und Bilder

Die Handlungsroutinen behalten ihre Bildzuweisungen. `ShowImage()` übergibt
Spielteil, logische Bild-ID und Raum an den Callback. Die Konsole ignoriert nur
das Zeichnen. Die native Anforderungs-ID wird danach wie im Original auf 255
zurückgesetzt; `GameView` behält die zuletzt angezeigte Auswahl. Eine Anfrage 255
ändert sie nicht. Die spätere Grafikoberfläche muss die logische Bild-ID auf die
passende Datei abbilden; diese Basis enthält noch keinen Bildrenderer.

Der Introtext ist in `texts/C64/story.txt` abgelegt und in `game_texts.c` eingebettet.
Quelle ist die vorhandene Abschrift `images/C64/story/story.txt`; deren kaputte
Umlautdarstellungen (`#`, `ï¿½`) wurden in der neuen Textfassung repariert, mit
Kontrolle der Storybilder 0 und 4. Die alte Abschrift bleibt unverändert.
Der normale Copyright-Text (ID 25) und der Anfangsraum folgen dem Startpfad.

`data/tagebuch.txt` wird ebenfalls einkompiliert. Seine Seiten-/Zeilenangaben und
bestehenden Abschreibfehler bleiben erhalten; nur CRLF wird zu LF normalisiert.
In Teil D wird das Tagebuch durch die Scriptlogik am Schreibtisch sichtbar.
`lies tagebuch`/`betrachte tagebuch` führt bei offenem/gelesenem Buch die originale
Aktion aus und ergänzt den vollständigen Tagebuchtext. Die Originalpunkte werden
weiterhin nur einmal vergeben. Das Tagebuch wird beim Start nicht vorweggenommen.

## Validierter Gewinnpfad und verbleibende Grenzen

Die Hauptroute erreicht im Replay nach 393 Befehlen den Gewinn mit 5.010 Punkten.
Das Tagebuch, zehn weitere Nebenaktionen sowie Eremit und der sichere
Moor-Abstecher in Teil C sind geprüft; weitere Nebenpfade
und vollständige Originaltreue sind damit noch nicht validiert.
Bekannte Grenzen dieser Basis:

- Die Handbuchabfragen sind auf Wunsch deaktiviert. Die ursprünglichen
  Übergangsbedingungen bleiben erhalten; sie führen direkt nach Teil B/Raum 25,
  Teil C/Raum 51 und Teil D/Raum 67. Der gemeinsame Spielzustand bleibt bestehen.
  Auch die letzte Prüfung (`SPECIAL(0x32)`) liefert ohne Rückfrage den Wert 0
  für Fortsetzen; 255 wäre Abbruch. Ihre Ankündigung wird nicht ausgegeben.
- `SPECIAL(0x33)` meldet den Gewinn und beendet die Aktion. Die beobachtete
  Abschlussfolge mit Hall of Fame und Credits ist noch nicht portiert.
- Dynamische Meldungen 1/8/12 verwenden vorerst schlichte deutsche Formatierung;
  eingebettete Engine-Texte sind noch nicht durchgängig wortgetreu übernommen.
- Keine Musik, keine Grafikdarstellung und keine Speicherung. Die vollständigen
  Sichtbarkeits-/Synonymregeln des Original-Frontends und die Semantik aller
  Dialog-Abbrüche sind noch nicht als Ganzes gegen das Original geprüft.

## Tests

Der [Replay-Runner](../../tests/replays/README.md) spielt Textdateien über dieselbe
Schnittstelle wie die Konsole ab und prüft dabei Raum, Punkte, Texte und Objekte.
Die Komplettlösung aus dem vorhandenen PDF läuft mit 393 Befehlen und 130
Prüfstellen bis zum Gewinn durch. Der separate Anfangstest umfasst 34 Befehle
und 32 Prüfstellen. Außen vor Mylgors Haus heißt die Tür `holztuer`, innen
`haustuer`; die Route verwendet entsprechend die getrennten Originalobjekte.

```sh
./check-console.sh
./check-replay.sh
./check-generated-c.sh
GO111MODULE=off go test ./src/Go/...
```

Der Konsolentest linkt die echten vier C-Spielteile, State und Texte mit dem
C++-Kern. Er prüft echte Eingaben im Anfangsbereich, versteckte Objekte,
Klingel/Portier, zwei Objekte, HILF, deaktiviertes Speichern/Cheats, modale
Rückfragen, Neustart, Tagebuch samt einmaligen Punkten, Bildereignisse und
Spielende. Späte Zustände werden ausschließlich im Test direkt vorbereitet;
die Spieloberfläche hat dafür keinen Cheat-Zugang. AddressSanitizer und
UndefinedBehaviorSanitizer bleiben aktiv; LeakSanitizer ist standardmäßig wegen
der eingeschränkten Prozessinspektion im Sandbox-Tracer ausgeschaltet.

Der Textexporttest vergleicht auch die tatsächlich kompilierten Intro- und
Tagebuchbytes mit ihren Quellen. Ein weiterer Test linkt die produktive C++-Implementierung und vergleicht ihre
SPECIAL-Ergebnisse direkt mit den Originalinstruktionen (alle 16-Bit-Kommandos,
Kleidungskombinationen, Räume und Objekt-IDs). Die bisherigen Tabellen-, Text-ID-
und Initialzustandstests bleiben zusätzlich bestehen. Emscripten ist in der
aktuellen Umgebung nicht vorhanden; ein WebAssembly-Build ist noch nicht geprüft.
