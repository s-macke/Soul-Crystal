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
- `walkthrough.replay`: Die gesamte Hauptroute läuft mit **393 Befehlen und
  130 Prüfstellen** bis zum Gewinn durch, mit **5.010 Punkten**. Der Übergang wechselt
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

- Hotel: Prospekt zweimal lesen; dem Dorfbewohner vor und nach seinem Gespräch
  Hilfe anbieten und erneut mit ihm sprechen; die offene Zimmertür erneut
  öffnen, schließen und wieder öffnen; den leeren Stuhl erneut untersuchen;
  die noch nicht getragene Badehose ablegen und wieder aufnehmen.
- Teil B: Vertrag vor und nach der Unterschrift lesen; das Schwert unbehandelt,
  nach dem Weihwasser und nach dem Versilbern betrachten; geschlossene
  Schubladen betrachten und nach Entnahme des Schlüssels erneut durchsuchen;
  das Bett nach Entnahme des Amuletts erneut untersuchen.
- Schloss: Tagebuch und Brief erneut lesen; Bücherregale untersuchen, die
  dadurch sichtbaren Bücher lesen und die Regale erneut betrachten.

Text-, Objektzustands- und Positionsprüfungen sichern die jeweiligen Reaktionen
ab. Beispielsweise bedeutet Türzustand 2 geschlossen, aber unverschlossen,
und 1 geöffnet. Punkteprüfungen und der unveränderte Endstand von 5.010 sichern
ab, dass wiederholtes Lesen keine zusätzlichen Punkte bringt. Die Route umfasst
nun 393 Befehle und 130 Prüfstellen; die Raumabdeckung bleibt bei 99 von 103.

## Dateiformat

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
Jede Datei muss mit `@finish won`, `@finish checkpoint`, `@finish dead` oder
`@finish ended` abschließen. Die Bedingung wird gegen den Spielmodus geprüft;
ein bloßes Dateiende gilt niemals als Gewinn. Nach `@finish` sind nur Kommentare
und Leerzeilen erlaubt.

## Ergebnisse

| Exitcode | Bedeutung |
| --- | --- |
| 0 | Alle Prüfungen und das ausdrücklich gewählte Abschlussziel erfüllt |
| 1 | Fehlgeschlagene Prüfung, ungültige Eingabe/Dateisyntax oder Engine-Fehler |
| 2 | Blockierte Aktion wegen einer noch fehlenden Engine-Funktion |
| 64 | Ungültiger Tool-Aufruf oder Dateizugriff fehlgeschlagen |

Bei Fehlern erscheinen Dateizeile, letzter Befehl, Spielzustand und letzte
Spielausgabe. Der Regressionstest prüft den gültigen Anfang, die vollständige
Gewinnroute, Tod/Beenden und die Fehlererkennung einschließlich eines fälschlich
behaupteten Gewinns. Der Gewinn wird nur bei tatsächlich erreichtem `GameWon` bestätigt.
