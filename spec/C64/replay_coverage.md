# Replay-, Aktions- und Textabdeckung

Stand: 2026-10-25. Alle Zahlen beziehen sich auf die portierte C64-Logik,
nicht auf einen Durchlauf im Originalemulator. Es werden ausschließlich normale
Spielbefehle verwendet, keine Savegames, Teleports oder Zustands-Fixtures.

## Aktueller geprüfter Umfang

| Messung | Ergebnis |
| --- | --- |
| Erkundungslauf | 597 Befehle, 410 Assertions, Gewinn mit 5.010 Punkten |
| Schnelllauf | 334 Befehle, 4 Assertions, Gewinn mit 4.955 Punkten |
| Alternative Lösungsbefehle und verdorbene Speisen | 338 Befehle, 12 Assertions, 4.930 Punkte |
| Zusätzlicher Aktionslauf | 377 Befehle, 57 Assertions, 4.930 Punkte |
| Alle eingecheckten Replays zusammen | 61 erfolgreich geprüfte Dateien |
| Besuchte Räume | 103/103 zusammen; 99/103 im lebend gewonnenen Erkundungslauf |
| Direkte Todeszuweisungen | 46/48 |
| Ausführbare Skriptzeilen (gcov JSON) | 3.362/4.824 = 69,7 % |
| Verzweigungsausgänge | 2.075/3.998 = 51,9 % |
| Verschiedene ausgegebene Katalogtexte mit normaler Text-ID-Zuordnung | 517/633 = 81,7 % |

Vor dieser Aktionsprüfung lag die gemeinsame Codeabdeckung bei 61,9 % der
Zeilen und 45,3 % der Verzweigungsausgänge. Raumabdeckung ist keine
Aktionsabdeckung; auch vollständige Textabdeckung würde nicht beweisen,
dass alle Bedingungen und Zustandsübergänge getestet wurden.

## Prüfung der fehlenden Aktionen

Ausgangspunkt waren die nicht ausgeführten Textzuweisungen in den vier
gcov-Dateien, ihre umgebenden Bedingungen sowie die Gesprächs- und Hilfetabellen.
83 zusätzliche Befehle passen in den großen Gewinnlauf. Beispiele:

- Hotel: Schlafversuch im Gästebett, Verstecken im Kleiderschrank, Hinsetzen,
  Speisekarte mitnehmen wollen und eine weitere Klingelreaktion.
- Teil B: drei Orkkind-Gesprächsstufen, mehrere Mylgor-Antworten, den
  unsignierten Vertrag anbieten, erneut schlafen wollen, Friedhofsgrabung,
  Honig probieren, Schlitten ziehen und König Richards Abschied.
- Teil C: das abgelegte Amulett wieder nehmen wollen und das heruntergelassene
  Fallgitter öffnen. Die weiterhin erfolgreiche Route sichert diese Änderungen ab.
- Teil D: Truhe öffnen wollen, Bücher und Brief mitnehmen wollen, weitere
  Hilfeangebote und Gespräche sowie Vorhang und Bücherdurchgänge wieder schließen
  und öffnen. Die Speisen bleiben im Hauptlauf unangetastet.

Alternative Eingaben für dieselbe Lösung erhalten einen eigenen Lauf:
`befestige honig an fellstiefel`, `betritt eispalast`, `sprich gebet` und
`entriegele tresor mit codenummer`. Das Probieren verdorbener Speisen kostet
dort wie im Original 25 Punkte. Ein weiterer Gewinnlauf prüft unter anderem
Aus-/Anziehen, wiederholtes Aufnehmen/Entriegeln, den besetzten Bienenstock,
Pfeife rauchen, Credits und Beschreibungsmodi. Kein Spielcode wurde dafür geändert.

Nicht jede Aktion ist im großen Lauf kombinierbar: Beim Finale erlauben die
Timer nur eine zusätzliche Aktion. Gespräche und Hilfe für Zargon stehen deshalb
wie die alternativen Betrachtungen in separaten Gewinn-Replays. Aktionen wie
das Essen des für die Ratten benötigten Brotes können hingegen die Lösung
verhindern, ohne unmittelbar einen Tod auszulösen. Solche nicht abgedeckten
Zweige bleiben offen und werden nicht durch bloße Parserakzeptanz als getestet
gezählt.

## Was die Textmessung aussagt

`./check-replay-texts.sh` validiert zuerst sämtliche Replay-Assertions. Danach
vergleicht ein separater Host-Collector die tatsächlichen `GameTextEvent`-Ausgaben
mit den einkompilierten Originaltexten. Es gibt weder Laufzeit-JSON noch eine
Änderung der Engine oder ihrer Ausgabeereignisse.

Identische Inhalte auf mehreren Diskseiten werden einmal gezählt. Die Liste
der IDs bei einem Text nennt mögliche Zuordnungen, **nicht** den Nachweis, dass
jede dieser IDs ausgeführt wurde. Intro und vollständiges Tagebuch werden
zusätzlich separat erkannt; beide wurden ausgegeben.

Es fehlen derzeit 116 unterschiedliche Texte aus dem Pool mit normaler
Text-ID-Zuordnung. Der Pool umfasst auch Daten, für die der normale Spielverlauf
keinen Aufruf besitzt. Die fehlenden Texte sind daher nicht pauschal 116
fehlende Spielszenen. Sie werden nicht aus dem Nenner herausgerechnet.

Die Ausnahmen gehen über Handbuchabfrage und Cheatmodus hinaus:

- Handbuchabfragen und ihre richtigen/falschen Antworten sind absichtlich
  deaktiviert; Cheat-, Slideshow- und Teleportmodus sind nicht eingebaut.
- Speichern/Laden und die ursprünglichen Disketten-/Dateifehlerdialoge fehlen
  in der bisherigen Konsolenbasis. Speichern/Laden ist ausdrücklich vertagt.
- Manche originale Engine-/Menütexte werden durch eigene Konsolenausgabe
  ersetzt, beispielsweise Teile der Abschluss- und Bedienungsdialoge.
- Es fehlen weiterhin alternative Spielantworten und Fehlerfälle, etwa eine
  andere Reihenfolge der Schwertbehandlung oder das unverbrauchte Brot essen.
- Der Katalog enthält alte oder nicht verwendete Varianten. Ein konkretes
  Beispiel ist der Titel `[An einer unterirdischen ;uelle]` auf B2: Dort wird
  dieser Raum nicht besucht. Die korrekte spätere Variante wurde ausgegeben.

Von 95 verschiedenen Raumtitel-Inhalten wurden 94 ausgegeben; die obige
B2-Variante erklärt die Differenz trotz 103 besuchter Räume. Die vier weiteren
Kataloginhalte ohne normale Text-ID-Zuordnung und ohne Raumtitel sind lediglich
die Platzhalter `r01`, `r02`, `r08` und `r12`. Dynamisch formatierte Meldungen
und neue Konsolentexte sind nicht Teil dieses Literalvergleichs.

## Gezielte Prüfung bisher fehlender Spieltexte

Die anschließende Textprüfung ergänzt **31 weitere verschiedene Textinhalte**
gegenüber 486/633. Die zehn zuvor konkret genannten Spielreaktionen sind jetzt
alle ausgegeben und durch Textprüfungen abgesichert:

| Situation | Diskseite:Text-ID | Replay |
| --- | --- | --- |
| Honig auf den ganzen Baumstamm schmieren wollen | B2:630 | `walkthrough` |
| Warnung vor weiterem Reden im Labor | B2:329 | `deaths/b_mylgor_spritze` |
| Versilbertes, noch nicht geweihtes Schwert betrachten | B2:286 | `alternatives/action_responses` |
| Dem Zombie Hilfe anbieten | C1:388 | `deaths/c_zombie_zoegern` |
| Unvergiftetes Brot selbst essen | C2:560 | `deaths/d_ratten_durchqueren` |
| Den Ratten unvergiftetes Brot geben | C2:575 | `deaths/d_ratten_zoegern` |
| Vergiftetes Brot betrachten | C2:475 | `alternatives/puzzle_verbs` |
| Ein ungesichertes Boot wegtreiben sehen | C2:463 | `alternatives/boot_verloren` |
| Den Kristall vor dem Kessel zerstören wollen | C2:459 | `alternatives/kristall_zuerst` |
| Die Burg mit unverbranntem Vertrag verlassen wollen | C2:449 | `alternatives/vertrag_unverbrannt` |

Der Honig wird im Erkundungslauf erst am Baumstamm auf die Stiefel aufgetragen:
Vorher bleibt genug davon für den erfolglosen Versuch am Stamm übrig. Die
alternative Schwert-Reihenfolge enthält einen echten Rückweg vom Silber zur
Kapelle; keine Objektzustände werden gesetzt oder zurückgedreht.

Weitere neu ausgegebene Antworten betreffen unter anderem das leere
Ledersäckchen, den Fährmann ohne getragenen Purpurmantel, die Eichentür,
die verzogene Labortür, das Vergessenwollen von Gebet und Zauberspruch sowie
den noch aktiven Zargon, der Dave zunächst wieder hinausschickt.

Auch Fehlentscheidungen sind jetzt geprüft: Firon töten, Mylgor einsperren,
das Orkkind angreifen und die Werwolf-Infektion zu früh heilen. Bei der frühen
Heilung bleibt die Verwandlung aus; dadurch erscheint die bisher fehlende
Vollmondbeschreibung (C2:505), und der Kessel ist zu schwer (C2:461).
Der bestehende Zargon-Tod prüft nun diese Variante und erreicht weiterhin
seine ursprüngliche Todeszuweisung D:325.

`boot_verloren`, `vertrag_unverbrannt`, `firon_getoetet` und
`mylgor_eingesperrt` enden ausdrücklich als **Checkpoint**, nicht als Gewinn.
Sie prüfen Text und Zustand der Fehlentscheidung. Das beweist noch nicht für
jeden Fall, dass eine Erholung über beliebige andere Befehlsfolgen unmöglich
ist. `kristall_zuerst` kehrt nach dem Rückteleport zu Zargon zurück und gewinnt.
Gemeinsame Anläufe liegen weiterhin in `.inc`-Dateien.

### Auffällige Aufrufbedingung bei Mylgor

Im derzeit portierten Skript löst im Labor `sprich mylgor` nicht Text 329 aus,
sondern die Standardantwort ohne Reaktion. Die Laborwarnung liegt im
`else`-Zweig zu `object1 == MYLGOR`; `sprich dave` erreicht sie tatsächlich.
Der Todes-Replay prüft genau diesen Befehl. Das ist kein Beleg, dass die
Bedingung im Original korrekt ist: Originalbytecode/Interpreter und
Konverterausgabe müssen dafür noch getrennt verglichen werden. Die Spiellogik
wurde bei dieser Texterweiterung nicht verändert.

### Verbleibende Spieltexte

Nicht jeder fehlende Katalogtext hat einen offensichtlichen aktiven Aufruf.
Noch offen sind beispielsweise besondere Fassungen zum Öffnen des Tagebuchs
(C2:549), Bücherlesen (C2:548), Schlafen im Hotel (B1:164), Öffnen des
Friedhofstors (B2:331) und zur Entnahme aus dem besetzten Bienenstock (B2:294).
Die normalen Aktionen existieren im Replay, erzeugen aber andere Antworten.
Diese Unterschiede dürfen nicht durch direkte Textausgabe oder manipulierten
State als abgedeckt markiert werden. Es bleiben außerdem die offene
Mumien-Rückkehr und weitere Sonderreaktionen. Der vollständige aktuelle
Messbericht listet alle 116 fehlenden Inhalte unverändert auf.

## Offene Todeszweige

Die 46 Todes-Replays testen nicht 46 notwendigerweise verschiedene Todesarten,
sondern 46 direkte Todeszuweisungen. Zwei weitere Auslösestellen sind offen:

- **B:790 – Baumstamm-Rückweg:** Der Hinweg verlangt bereits Honig und
  Fellstiefel. Ohne Stiefel blockiert die Kleidungsprüfung die Bewegung.
- **D:237 – Mumien nach Rückteleport:** Offene Särge führen schon beim Zugang
  zu Zargon zum Tod; bei geschlossenen Särgen wird das Rückkehrflag gelöscht.

Das sind Hinweise auf möglicherweise unerreichbare Zweige, kein abschließender
Beweis. Ein normaler Eingabeablauf zu genau diesen Stellen wurde nicht gefunden.
Baumstammsturz und Mumientod sind jeweils auf einem anderen Auslöseweg getestet.
Details und Quellen: [Todesfall-Replays](../../tests/replays/deaths/README.md).

## Reproduzieren

```sh
./check-replay.sh
./check-replay-coverage.sh
./check-replay-texts.sh
./build/soul-replay tests/replays/walkthrough.replay --verbose > /tmp/soul-crystal-komplettloesung.txt
```

Die Coverage-Werkzeuge nennen ihre jeweiligen temporären Ergebnisverzeichnisse.
Der Textbericht enthält eine lesbare Liste fehlender Meldungen und eine TSV
mit vollständigem Text, Disk-Records, möglichen IDs und erstem ausgebendem Replay.
