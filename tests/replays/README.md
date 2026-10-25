# Automatisches Durchspielen

```sh
./build_console.sh
./build/soul-replay tests/replays/part_a.replay
./build/soul-replay tests/replays/walkthrough.replay --verbose
./check-replay.sh
```

Der Runner verwendet den gleichen Spielkern und die gleichen Texteingaben wie
die Konsole. Er verändert keinen Spielzustand direkt. Die Zustandsarrays werden
für Prüfungen ausschließlich gelesen. Zusätzliche Bibliotheken sind nicht nötig.
`--verbose` zeigt neben den Befehlen auch alle Spieltexte.

## Drei Arten von Durchläufen

- `walkthrough.replay`: ausführlicher Erkundungslauf, 597 Befehle,
  410 Prüfstellen, Gewinn mit 5.010 Punkten.
- `fast.replay`: die ursprüngliche übersetzte PDF-Route, 334 Befehle,
  Gewinn mit 4.955 Punkten, ohne die optionalen Abstecher.
- `deaths/*.replay`: 46 eigenständige, verkürzte Anläufe zu Todesfällen.
  Jeder prüft seine konkrete Todesmeldung und endet mit `@finish dead`.
  [Liste und Grenzen der Todesabdeckung](deaths/README.md).

Dazu kommen Gewinnvarianten in `alternatives/`: fünf zeitkritische
Finaleaktionen (Kessel, Zargon und Pentagramm betrachten; Zargon Hilfe anbieten
und mit ihm sprechen), alternative Lösungsbefehle mit verdorbenem Essen sowie
ein Aktionslauf für Wiederholungen, Kleidung und weitere Antworten.
Der Rätselvariantenlauf endet wegen des Essens mit 4.930 Punkten; der
Aktionslauf erhält beim Entriegeln der Stahltür von der anderen Seite
zusätzlich 15 Originalpunkte und endet mit 4.945 Punkten;
der Schnelllauf bleibt bei 4.955 und der große Erkundungslauf bei 5.010.

`kristall_zuerst.replay` prüft den Rückteleport beim verfrühten Angriff auf
den Kristall und gewinnt danach ebenfalls. Vier weitere Varianten enden
absichtlich als geprüfter Checkpoint: `boot_verloren`, `vertrag_unverbrannt`,
`firon_getoetet` und `mylgor_eingesperrt`. Sie zeigen fehlgeschlagene oder
irreversible Entscheidungen und behaupten keinen Gewinn. Insgesamt werden
63 vollständige Replays geprüft; `.inc`-Dateien sind nur gemeinsame Bausteine.

`alternatives/part_a_controls.replay` prüft in 19 Befehlen mit 37 Assertions
Inventar, Ausgänge, erneutes Schauen, Punkte, Musik, abgebrochene
Neustart-/Beenden-/Lösungsabfragen und ungültige Richtungen. Er endet als
Checkpoint in Teil A, Raum 6, mit 0 Punkten. Keine direkte Zustandsänderung,
kein Neustart innerhalb des Ablaufs und keine Handbuchabfrage.

Der Aktionslauf ergänzt außerdem Hotelbetreten, erneutes Klingeln nach Erhalt
des Schlüssels, Verriegeln der offenen Tür, die Innenseite der Zimmertür,
Kleidung, Hilfsangebote und den westlichen Versuch hinter dem Wasserfall.
Die 79 verbleibenden nicht ausgeführten Part-A-Zeileneinträge sind einzeln
in [der Abdeckungsanalyse](../../spec/C64/replay_coverage.md#part-a-pruefung-der-verbleibenden-zeilen)
zugeordnet; die rohe Coverage wird nicht um diese Stellen bereinigt.

`alternatives/part_c_actions.replay` bündelt die weiteren C-Prüfungen:
279 Befehle und 146 Assertions vom normalen Start bis zum geöffneten
Portaltor in Raum 65, 800 Punkte, Ende als Checkpoint. Es prüft unter anderem
Kleidungswechsel, Amulett, eine Bootsrückfahrt, die Landwegsperren während der
Bootsfahrt sowie Fallgitter und Portaltor. Der Aktionslauf für B/D nutzt die
neuen gemeinsamen Bausteine `controls.inc` und `equipment_failures.inc` und
prüft zusätzlich beide Türseiten, alternative Interaktionen und den
Pentagramm-Rückweg. Alle Eingaben bleiben normale Spielbefehle.

Aktuelle Zeilenabdeckung: A **90,2 %**, B **91,8 %**, C **88,2 %**, D **90,9 %**;
gesamt **90,6 %**, Verzweigungsausgänge **67,5 %**, Katalogtexte **87,2 %**.
Die rohe Messung schließt unerreichbare und deaktivierte Stellen weiterhin ein.

`./check-replay-coverage.sh` misst die gemeinsame Skriptabdeckung mit GCC/gcov
und hinterlässt Messdaten sowie annotierte Quellen in einem neuen `/tmp`-Ordner.

## Quelle und geprüfter Umfang

Die Komplettlösung steht auf PDF-Seiten **13–14** in
[Soul Crystal Walkthrough and Info.pdf](../../data/c64_en/Soul%20Crystal%20Walkthrough%20and%20Info.pdf).
Eine bytegleiche Kopie liegt in `data/Soul_Crystal+TFDS_ONSLAUGHT/`.
SHA-256: `e21bdfcfcb6c5045ca83496bce0722ccd663300fe75167b7f8e1de02ba559319`.
Die extrahierte englische Befehlsfolge steht in `walkthrough_source_en.txt`.
Die Quelle beschreibt die englische Onslaught-Fassung mit entfernten
Handbuchabfragen. Die Handbuchabfragen sind nun auch in unserem Spielkern auf Wunsch deaktiviert.

- `part_a.replay`: geprüft vom echten Neustart bis zum Einhorn und zur
  Kristallkugel: **34 Befehle, 32 Prüfstellen, Teil A, Raum 15, 40 Punkte**.
  Das ist ein erfolgreicher Zwischenstand, noch kein Spielgewinn.
- `walkthrough.replay`: Die gesamte Hauptroute läuft mit **597 Befehlen und
  410 Prüfstellen** bis zum Gewinn durch, mit **5.010 Punkten**. Der Übergang wechselt
  nach Teil B/Raum 25; Inventar und Punkte bleiben erhalten und werden geprüft.
  Beim Haus ist außen `druecke holztuer` erforderlich, innen später
  `oeffne haustuer`: zwei unterschiedliche Originalobjekte. Das Tagebuch ist als zusätzlicher Abstecher enthalten: Schreibtisch betrachten,
  Tagebuch öffnen und lesen. Prüfungen kontrollieren Textanfang und Textende,
  den Gelesen-Zustand und die verbrauchten fünf Punkte. Zehn weitere
  Nebenaktionen sind ebenfalls enthalten (siehe unten). Der erfolgreiche Lauf belegt den
  Gewinnpfad im portierten Kern, keine vollständige Gleichheit mit dem Original.

So lässt sich die Portierung schrittweise an der echten Route überprüfen.
Bei der weiteren Validierung wird der geprüfte Abschnitt erweitert;
Abweichungen bleiben sichtbare Fehler. Separate Replay-Dateien können später
Nebenpfade und alternative Enden abdecken.

## Zusätzliche Entdeckungen in der Gewinnroute

Die Route nimmt sich zusätzlich zur PDF-Lösung Zeit für folgende Aktionen.
Vor und nach jeder neuen Belohnung wird der Punktepool des Objekts auf 5 bzw. 0
geprüft; der Endpunktestand muss 5.010 betragen. Die elf Aktionen einschließlich
Tagebuch bringen insgesamt 55 Punkte zusätzlich zur ursprünglichen Route.

| Teil | Entdeckungen |
| --- | --- |
| A | Prospekt öffnen und lesen; Speisekarte im Restaurant lesen; dem Dorfbewohner zuhören |
| B | Erdloch untersuchen und Notiz lesen; Steinaltar betrachten |
| C | Eremit in Raum 58: alle drei Gesprächsantworten; Zombie in Raum 62 betrachten und rechtzeitig nach Süden zurückkehren |
| D | Truhe betrachten; Abenteurer untersuchen und Zettel lesen; Tagebuch entdecken, öffnen und lesen; Schmierereien lesen; Marmortisch untersuchen und Brief lesen; Kräuter im Küchengarten betrachten |

Die Abstecher in Teil C vergeben keine zusätzlichen Punkte. Geprüft werden
alle Gesprächsstufen des Eremiten sowie Zombieposition, Zeitstatus und die
lebendige Rückkehr nach Raum 59. Raum 61 (westliches Moor) bleibt ausgelassen:
Sein einziger Rückweg nach Osten löst den Tod aus. Auch Strudel, Gletscher und
Treibsand bleiben außerhalb der Gewinnroute. Damit besucht der Lauf 99 der
103 Räume, ohne einen Todesweg auszuführen.

Der Küchengarten wird erst nach dem Füttern der Ratten besucht. Ein früherer
Abstecher lässt deren Zeitzähler ablaufen und endet tödlich. Die zusätzlichen
Aktionen benötigen keine Änderungen am Spielkern oder direkte Zustandseingriffe.
Der kurze `part_a.replay` bleibt als separater Test der ursprünglichen Route
mit 40 Punkten bestehen.

## Zustandsabhängige Aktionen und Wiederholungen

Zusätzlich prüft die Gewinnroute folgende Aktionen ohne Tod oder Neustart:

- Start: Dave betrachten.
- Hotel: Prospekt zweimal lesen; dem Dorfbewohner vor und nach seinem Gespräch
  Hilfe anbieten und erneut mit ihm sprechen; die offene Zimmertür erneut
  öffnen, schließen und wieder öffnen; den leeren Stuhl erneut untersuchen;
  die noch nicht getragene Badehose ablegen und wieder aufnehmen.
- Teil B: Vertrag vor und nach der Unterschrift lesen; das Schwert unbehandelt,
  nach dem Weihwasser und nach dem Versilbern betrachten; geschlossene
  Schubladen betrachten und nach Entnahme des Schlüssels erneut durchsuchen;
  das Bett nach Entnahme des Amuletts erneut untersuchen.
- Schloss: Offene Särge betrachten, die sichtbar gewordenen Mumien betrachten
  und die Särge anschließend schließen; Tagebuch und Brief erneut lesen; Bücherregale untersuchen, die
  dadurch sichtbaren Bücher lesen und die Regale erneut betrachten.

Text-, Objektzustands- und Positionsprüfungen sichern die jeweiligen Reaktionen
ab. Beispielsweise bedeutet Türzustand 2 geschlossen, aber unverschlossen,
und 1 geöffnet. Punkteprüfungen und der unveränderte Endstand von 5.010 sichern
ab, dass wiederholtes Lesen keine zusätzlichen Punkte bringt. Die Route umfasst
nun 597 Befehle und 410 Prüfstellen; die Raumabdeckung bleibt bei 99 von 103.

## Möglichst alle Objekte betrachten

Die Erkundungsroute wurde um 118 weitere Betrachtungen ergänzt. Dabei werden
auch erst dadurch entdeckte Objekte wie Kadaver, Geschirr und Speisen betrachtet.
Eine Prüfung der tatsächlich vom Parser aufgelösten IDs ergab 161 von 165
Objekt-IDs im lebend gewonnenen Erkundungslauf. Gleichnamige Objekte in anderen
Räumen wurden separat berücksichtigt. Das ist keine Abdeckung aller möglichen
Zustände desselben Objekts.

Die vier Ausnahmen sind zeitkritisch:

- Im Finale bleibt vor Kessel- und Kristallzerstörung nur Zeit für **eine**
  Betrachtung. Die Hauptdatei wählt den Kristall. Die drei eigenständigen
  Gewinnvarianten prüfen Kessel, Zargon und das zweite Pentagramm.
- Beim Werwolf führt das zusätzliche Betrachten vor der nötigen Gegenwehr zum
  Tod. `deaths/b_werwolf_zoegern.replay` betrachtet ihn und prüft diesen Tod.

Damit werden über die Gewinnvarianten und den Werwolf-Tod auch die übrigen
vier Objekt-IDs betrachtet. Kein Timer wird angehalten und keine Aktion
kostenlos gemacht. Der ausführliche Lauf bleibt ohne Tod und ohne Neustart.

## Dateiformat

`@include ../shared/b_ausgeruestet.inc` fügt eine gemeinsame Befehlsfolge an
dieser Stelle ein. Der Pfad ist relativ zur einbindenden Datei; Leerzeichen
im Pfad benötigen keine Anführungszeichen. Includes dürfen weitere Includes
enthalten und mehrfach verwendet werden. Schleifen (auch über Symlinks),
fehlende Dateien und mehr als 32 gleichzeitig geöffnete Dateiebenen werden
als Fehler gemeldet. Fehlgeschlagene Prüfungen nennen die tatsächliche Datei
und Zeile sowie die Include-Kette.

Die Dateien in `shared/` tragen die Endung `.inc` und sind keine eigenständigen
Tests. Sie enthalten normale Befehle, keinen Spielstand und keinen Neustart.
Jeder `.replay`-Test beginnt weiterhin mit einem frischen Spiel und spielt
seinen gesamten Anlauf aus. Prüfungen und Abschlussbedingungen gelten für
die vollständig expandierte Folge. Auch die Textmessung verwendet denselben
Include-Leser. Erkundungs- und Schnelllauf bleiben eigenständig lesbar.

Leerzeilen und Zeilen mit `#` werden ignoriert. `> befehl` sendet eine Eingabe,
einschließlich Antworten auf Rückfragen. Darauf folgen beliebig viele Prüfungen:

```text
> nimm kristallkugel
@part 1
@room 15
@location 36 255
@score 40
@mode ready
@finish checkpoint
```

| Prüfung | Bedeutung |
| --- | --- |
| `@part N`, `@room N` | Spielteil (1–4) und Raum-ID |
| `@score N`, `@steps N` | Aktuelle Punkte bzw. Schrittzähler |
| `@image N` | Zuletzt angeforderte logische Bild-ID |
| `@location ID N` | Objektposition: 0 verborgen, 255 im Inventar, sonst Raum |
| `@state ID N`, `@points ID N` | Objektzustand bzw. verbleibende Objektpunkte |
| `@text TEXT`, `@not-text TEXT` | Teiltext in der Ausgabe seit der letzten Eingabe vorhanden/abwesend |
| `@mode MODE` | `ready`, `restart`, `quit`, `solution`, `dead`, `won`, `ended`, `error` |

Objekt-IDs sind die Originalindizes 0–165. Vor der ersten Eingabe beziehen sich
Textprüfungen auf die Startausgabe. Textprüfungen beachten Groß-/Kleinschreibung.
Jeder vollständige Test muss mit `@finish won`, `@finish checkpoint`, `@finish dead` oder
`@finish ended` abschließen. Die Bedingung wird gegen den Spielmodus geprüft;
ein bloßes Dateiende gilt niemals als Gewinn. Nach `@finish` sind nur Kommentare
und Leerzeilen erlaubt.

## Ergebnisse

| Exitcode | Bedeutung |
| --- | --- |
| 0 | Alle Prüfungen und das ausdrücklich gewählte Abschlussziel erfüllt |
| 1 | Fehlgeschlagene Prüfung, ungültige Eingabe/Dateisyntax oder Engine-Fehler |
| 2 | Blockierte Aktion wegen einer noch fehlenden Engine-Funktion |
| 64 | Ungültiger Tool-Aufruf, Dateizugriff oder Include-Fehler |

Bei Fehlern erscheinen Dateizeile, letzter Befehl, Spielzustand und letzte
Spielausgabe. Der Regressionstest prüft den gültigen Anfang, die vollständige
Gewinnroute, Tod/Beenden und die Fehlererkennung einschließlich eines fälschlich
behaupteten Gewinns. Der Gewinn wird nur bei tatsächlich erreichtem `GameWon` bestätigt.

## Aktionsprüfung und Textabdeckung

Die Prüfung der nicht ausgeführten Skriptzweige ergänzt den Erkundungslauf um
83 Befehle gegenüber dem Stand mit 514 Befehlen. Dazu zählen Hotelbett,
Kleiderschrank und Stuhl, weitere Orkkind- und Mylgor-Gespräche, Hilfeangebote,
Graben auf dem Friedhof, Honig probieren, Schlitten ziehen, der Abschied des
Königs, das verlorene Amulett im Moor und das Wiederöffnen des Fallgitters.
Geheime Durchgänge werden geschlossen und wieder geöffnet. Jede Ergänzung
wurde mit dem vollständigen Gewinnlauf geprüft; neue Antworten werden durch
Textprüfungen abgesichert. Das ist keine Behauptung vollständiger Aktionsabdeckung.

`alternatives/puzzle_verbs.replay` prüft die alternativen Befehle zum Honig,
Eispalast, Gebet und Tresor sowie das Essen mit 25 Strafpunkten.
`alternatives/action_responses.replay` ergänzt unter anderem Aus-/Anziehen,
bereits getragene Objekte aufnehmen, erneut entriegeln, verschlossene Türen,
Beschreibungsmodi, Credits, den noch besetzten Bienenstock und Pfeife rauchen.
Zusätzlich prüft der Lauf 18 weitere Fehlversuche mit ungeeigneten Objekten,
Graben ohne Werkzeug sowie ungeeigneten und falschen Schlüsseln. Er umfasst
588 Befehle und 325 Assertions und gewinnt mit 4.945 Punkten.
Weitere 16 Befehle decken zwölf zusätzliche Texte ab: unter anderem erneutes
Verriegeln, Losgehen ohne Jeans, die magische Sperre hinter dem Wasserfall,
das wiederholte Betrachten des Restauranttischs sowie die besonderen Antworten
auf Orkfrau, Skelett und Kriegerstatue. Unreferenzierte Katalogfassungen sind
in `spec/C64/replay_coverage.md` dokumentiert.
Der Schwertversuch auf Dave ist im Original eine ausdrücklich überlebte Szene.

Die anschließende Textprüfung ergänzt 31 bislang nicht ausgegebene Inhalte.
Unter anderem bleibt der Honig nun bis zum Baumstamm verfügbar, im Aktionslauf
wird das Schwert zuerst versilbert und erst danach geweiht, und bestehende
Todesfälle prüfen Zombie-Hilfe sowie das Essen und Verschenken unvergifteten
Brotes. Der Zargon-Tod prüft außerdem die zu frühe Heilung der Infektion und
die dadurch fehlende Kraft zum Umwerfen des Kessels. Alle 46 Todes-Replays
erreichen weiterhin ihre jeweils dokumentierte Todeszuweisung.

`./check-replay-texts.sh` prüft zunächst alle Replay-Assertions und schreibt
anschließend einen Markdown-Bericht sowie eine TSV-Datei mit allen Texten nach
`/tmp/soul-replay-texts.*/report.{md,tsv}`. Gemessen wird tatsächliche Ausgabe,
nicht bloß ein Text-ID-Zugriff. Identische Inhalte auf mehreren Diskseiten zählen
nur einmal; dies beweist nicht, dass jede einzelne ID-Auslösestelle erreicht wurde.
Die TSV enthält Diskseite, Record, mögliche logische IDs und den ersten Replay,
der den Text ausgab. Intro und vollständiges Tagebuch werden separat geprüft.

Über alle Replays werden alle 103 Räume besucht. Der ohne Tod gewonnene
Erkundungslauf besucht weiterhin 99. Weitere Grenzen und fehlende Textgruppen:
[spezifischer Abdeckungsbericht](../../spec/C64/replay_coverage.md).
