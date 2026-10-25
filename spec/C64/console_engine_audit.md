# Engine-Rest für eine reine Textversion

Analyse der vier generierten Spielteile und der Originalinstruktionen in
`opcodeoracle/soul_crystal/soul_crystal.asm`. Dieser Audit entstand vor der
Implementierung; den aktuellen Umfang der inzwischen vorhandenen Konsolenbasis
beschreibt [console_application.md](console_application.md).
Ziel: direkte C/C++-Logik, später WebAssembly, keine externen Laufzeitbibliotheken,
keine JSON-Dateien zur Laufzeit. Speichern/Laden und Cheats zunächst ausgeschlossen.
Kein Spielteilauswahlmenü: Der Originalablauf wechselt intern automatisch.

## SPECIAL-Inventar

In den vier Spielteilen kommen 20 verschiedene Selektoren vor. Alle Aufrufe
verwenden konstante Zahlen. Hexzahlen in dieser Tabelle sind Selektoren.

| Selektor | Originalziel | Wirkung und Konsequenz für die Textversion |
|---|---|---|
| 01 | $4B42 | Gibt einen eingebetteten festen Hinweis über $45D1 aus. Der alte Name „run_code_query“ übertreibt: Hier wird selbst keine Handbuchantwort geprüft. |
| 02, 03 | $4616, $477B | Laden/Speichern; vorerst ausdrücklich nicht verfügbar. |
| 04 | $5174 | Neustart-Bestätigung mit Text 29; bei Zustimmung neuer Anfangszustand. |
| 05 | $5130 | Spiel-beenden-Bestätigung mit Text 30; kein allgemeiner Todeshandler. |
| 06 | $4C66 | Originaler LOESUNG-Dialog mit Text 38 und Neustart-/Ende-Pfaden. Nicht mit HILF oder einer neuen Bedienhilfe verwechseln. |
| 07 | $4CDA | Musikflag umschalten; Meldung 34/35. Audio ist für die Textversion nicht erforderlich. |
| 08 | $4440 | Vorhandene Ausgänge aus den sechs veränderlichen Raumtabellen auflisten. |
| 09 | $52D2 | Originaler Disketten-/Installationsdialog. Für fest eingebundene Daten kein Disketten-I/O nötig; nicht mit normalem Spielfortschritt verwechseln. |
| 0A | $4E62 | Inventar: Objekt-IDs 1..165 mit Standort $FF; Anzeige über den originalen Namensdecoder $4FB1. |
| 32 | $62B9 | Handbuchprüfung über $4B60; anschließend $69BF/$69C0 nach temp kopieren. Im Finale prüft das Script temp==$FF. In der Portierung auf Wunsch deaktiviert: temp=0 (Fortsetzen), ohne Rückfrage. |
| 33 | $62C9 | Gewinnstatus $CFF4=1, Übergang zum Abschlussablauf $381A. Muss die aktuelle Ausführung geordnet beenden. Laut früherer Testnotiz: Ende → Hall of Fame → Credits (siehe Quellen unten). |
| 64..6A | $305C..$362C | Sieben unten aufgeführte Zustandsprüfungen; direkt übersetzbar und nativ geprüft. |
| C8 | $2FDE | Allgemeiner Pfad für Selektoren >=200: Zahl formatieren, mit eingebettetem Präfix „EXGOSUB -“ zusammensetzen und über $45D1 ausgeben. Kein nachgewiesener Bonus-/Punktehandler. Ein Aufruf in Teil B nach der Laborexplosion. |

`$6B` und `$6C` existieren in der Engine, werden aber von den vier extrahierten
Scripts nicht aufgerufen. Für spätere Vollständigkeit sind ihre Bedingungen ebenfalls geprüft.
Der C8-Pfad ist in der Disassembly falsch als normale Instruktionsfolge nach
`JSR $0C8D` aufgelöst: Die sechs folgenden Bytes sind String-Deskriptoren
`$4820,$70FB,$699C`, danach folgt `JSR $45D1`. Nicht als `JSR $FB48` übersetzen.

## Kleidung statt vermeintlicher Raumflags

Die Kommentare `room_env_flag_group_*` sind hier irreführend. Die Adressen liegen
in `objectState`, Basis $6D04:

| Adresse | Objekt |
|---|---|
| $6D51 | JEANS |
| $6D93 | TSHIRT |
| $6D82 | TURNSCHUHE |
| $6D98 | HOSE |
| $6D81 | BAUMWOLLHEMD |
| $6D18 | FELLSTIEFEL |
| $6D9B | BADEHOSE |
| $6D97 | PURPURMANTEL |

Mit `s(x) = objectState[x]` lauten die tatsächlichen Bedingungen:

- `$64`: `(s(JEANS)==0 || s(TSHIRT)==0 || s(TURNSCHUHE)==0) &&
  (s(HOSE)==0 || s(BAUMWOLLHEMD)==0 || s(FELLSTIEFEL)==0) && s(BADEHOSE)==0`.
- `$65`: `(s(JEANS)==1 && s(TSHIRT)==1 && s(TURNSCHUHE)==1) ||
  (s(HOSE)==1 && s(BAUMWOLLHEMD)==1 && s(FELLSTIEFEL)==1)`.
- `$67`: `(s(JEANS)==0 && s(HOSE)==0) ||
  (s(BAUMWOLLHEMD)==0 && s(TSHIRT)==0 && s(PURPURMANTEL)==0) ||
  (s(FELLSTIEFEL)==0 && s(TURNSCHUHE)==0)`.

Alle liefern 0 oder 1 in `temp`. Keine zusätzliche Raumflag-Tabelle erforderlich.
Die genaue Prüfung auf 1 darf nicht durch „ungleich 0“ ersetzt werden.

### Auffälligkeit bei $66

Der native Code ab $324F ergibt für **alle 65.536 Command-Werte 1**.
Die letzte ODER-Kette enthält bereits `command != 20 || command != 22`.
Damit ist der Kommentar „is_movement_command“ keine korrekte Verhaltensbeschreibung.
Dies wurde durch Ausführung der Originalinstruktionen geprüft. Eine vermeintliche
Reparatur würde das Spielverhalten ändern; zunächst originalgetreu übernehmen.

### Raumprüfungen (dezimal)

- `$68`: Räume 3, 4, 7, 8 oder 10..15.
- `$69`: 20, 21, 23..26, 28..30, 32, 34, 35, 38 oder 40..43.
- `$6A`: 66..68 oder 75..77.
- `$6B`: Raum 25.
- `$6C`: `object2 == DAVE || (object2 == BIENENSTOCK && objectState[BIENENSTOCK] == 1)`.

## Übrige offene Engine-Schnittstellen

- **`Restart()` ist falsch benannt.** Opcode $EE bei $2FA2 ruft über den
  Inline-Dispatcher `$961B` auf: staged frontend refresh, kein Zurücksetzen des
  Spielzustands. `$977D` bearbeitet den Frontend-Puffer und kehrt zurück.
  Für den Textport als Ausgabe-Flush benennen. Echter Neustart gehört zu SPECIAL 04.
- **`Code2E5B()`** wählt Raumtexte: Raum <16 → +106, 16..50 → +153,
  51..65 → +305, ab 66 → +332. Bei Kurztextmodus (`visited[0]==0`) und schon
  besuchtem Raum setzt es den separaten Titelpfad `$6958/$6959` und ID 900.
  Sonst merkt es Text-/Raum-ID in `$69B5..$69B8`. Es ist nicht bloß `showtext()`.
- **`showtext()`** benötigt gewöhnliches Mapping, dynamische IDs 1/2/8/12,
  Raumtitelpfad und den originalen Umgang mit pendingTextID. Statische Archivtexte
  samt Mapping sind bereits in `game_texts.c` vorhanden.
- **`ShowImage()`** kann die Darstellung auslassen. Vorher die Nebenwirkungen
  des Wrappers $4087/$408D auf Text-/Raumzustand berücksichtigen.
- **Automatische Übergänge** liegen auch außerhalb des Scripts: etwa
  $5BF9 setzt Teil B/Raum 25, $5C35 Teil C/Raum 51 und $5C64 Teil D/Raum 67,
  jeweils im umgebenden Prüf-/Ladeablauf. Das sind keine Benutzermenüs.
- **Verfügbarkeit der Objekte** muss den Originalfiltern entsprechen. Der
  Inventarfilter allein genügt nicht für eine spoilerfreie Liste aller lokal
  ansprechbaren Objekte, Synonyme und gleichnamigen Objekte.

## Umfang und Umsetzung

Parser und Konsolenrahmen sind klein: `StartGame()` und
`SubmitCommand(const char*)` können über eine Ausgabe-Callback-Funktion arbeiten.
Ein dünnes natives `main()` liest Zeilen; eine spätere WebAssembly-Oberfläche
ruft dieselbe Funktion auf. Nur Standardbibliothek, kein Terminalframework,
keine blockierende Eingabe im Spielkern und keine Betriebssystem-Abbruchaufrufe.
Modale Rückfragen bekommen einen expliziten Eingabemodus. So kann der Browser
später Antworten liefern, ohne eine native Eingabeschleife nachbilden zu müssen.

Die fehlenden Engine-Teile sind überschaubar, aber leere Linker-Stubs wären kein
korrektes Spiel. Nächster Implementierungsschritt: die geprüften Prädikate,
Raumtextauswahl und korrekt benannte Ausgabeaktualisierung; danach
Dialog-/Endzustände, automatische Übergänge und Eingabeparser verbinden.
HILF bleibt ein Spielverb, Cheats sind ausgeschlossen. Speichern/Laden ist kein
Teil dieses ersten spielbaren Stands. Die Handbuchprüfung ist auf ausdrücklichen
Wunsch deaktiviert; Teilübergänge und Finale laufen ohne Codeeingabe weiter.
Die übrigen Spielbedingungen bleiben unverändert.

## Nachweis

`GO111MODULE=off go test ./src/Go/c64audit -run TestSpecialPredicates -v`
führt die originalen Prädikatroutinen in einem begrenzten 6502-Testharness aus:
alle 16-Bit-Kommandos für $66, alle 2.187 Kombinationen von sieben Kleidungszuständen
0/1/2, vier Mantelzustände, alle 256 Raumwerte und alle 16-Bit-Objektwerte für
$6C mit drei Bienenstockzuständen. Die geprüften Codebytes sind in allen vier
Part-Snapshots identisch. Dies verifiziert die Prädikate, nicht sämtliche
interaktiven SPECIAL-Abläufe oder eine komplette Spieldurchführung.

## Bereits vorhandene Vorarbeiten

Diese Analyse ergänzt die früheren Notizen und C++-Rekonstruktionen; sie ersetzt
sie nicht. Folgende Quellen wurden mit dem aktuellen Befund abgeglichen:

- [README.md](../../README.md), SPECIAL-Liste: `$33` ist bereits als
  „gewonnen: zeige das ende des spiels: danach hall of fame und dann credits“
  dokumentiert. Diese Abschlussfolge ist als frühere Beobachtung übernommen;
  der neue Prädikattest führt sie nicht aus. `$05` ist separat als „spielende“
  aufgeführt und gehört zum Bestätigungsdialog zum Beenden.
- Dieselbe Liste enthält zu `$C8` ausdrücklich „test: exgosub - 200“.
  Das stimmt mit dem jetzt untersuchten Diagnoseausgabepfad überein.
- [interpret.cpp](../../src/C/interpret.cpp), `Code324F()`: Die ursprüngliche
  C++-Übersetzung von `$66` enthält bereits dieselbe immer wahre ODER-Kette.
  Der neue Test bestätigt sie gegen sämtliche 65.536 Eingabewerte im Originalcode.
- `Code3317()` in derselben Datei enthält bereits die drei Bedingungen für `$67`.
  Die neue Analyse ordnet die bisher numerischen Adressen den Kleidungsobjekten zu.
- `Code36B3()` dokumentiert die allgemeinen SPECIAL-Ziele in einem auskommentierten
  Block. `Code4C66()` enthält die Rekonstruktion des LOESUNG-Dialogs.
- `AnalyzeSpecial()` in `interpret.cpp`, aufgerufen aus
  [Unit1.cpp](../../src/C/Unit1.cpp), ist der historische Analyse-/Testeinstieg.
  Das ist kein aktueller automatisierter Regressionstest: Mehrere Engine-Aufrufe
  sind auskommentiert, und der alte Interpreter wird hier nicht als Spielkern benutzt.

Die SPECIAL-Liste und Vorarbeiten bleiben an ihren bisherigen Stellen erhalten.
Die ausführbaren Engine-Funktionen für das Konsolenspiel sind weiterhin offen;
Dokumentation, übersetzte Altfragmente und native Regressionstests sind davon
klar zu unterscheiden.
