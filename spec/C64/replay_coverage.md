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
| Zusätzlicher Aktionslauf | 588 Befehle, 325 Assertions, 4.945 Punkte |
| Alle eingecheckten Replays zusammen | 63 erfolgreich geprüfte Dateien |
| Besuchte Räume | 103/103 zusammen; 99/103 im lebend gewonnenen Erkundungslauf |
| Direkte Todeszuweisungen | 46/48 |
| Ausführbare Skriptzeilen (gcov JSON) | 4.371/4.824 = 90,6 % |
| Verzweigungsausgänge | 2.700/3.998 = 67,5 % |
| Verschiedene ausgegebene Katalogtexte mit normaler Text-ID-Zuordnung | 552/633 = 87,2 % |

Aktueller Stand pro Teil nach den gezielten Aktionsprüfungen:

| Teil | Ausgeführte gcov-Zeileneinträge | Verzweigungsausgänge | Fehlende Zeileneinträge |
| --- | --- | --- | ---: |
| A | 727/806 = 90,2 % | 452/664 = 68,1 % | 79 |
| B | 1.517/1.653 = 91,8 % | 950/1.370 = 69,3 % | 136 |
| C | 761/863 = 88,2 % | 463/730 = 63,4 % | 102 |
| D | 1.366/1.502 = 90,9 % | 835/1.234 = 67,7 % | 136 |

Die Nenner enthalten weiterhin deaktivierte und unerreichbare Stellen.
Messung: `./check-replay-coverage.sh`, zuletzt
`/tmp/soul-replay-coverage.Obsat9/`. Alle 63 Replays und die
Include-/Fehlerregressionen bestehen; Textbericht:
`/tmp/soul-replay-texts.PveeYQ/report.{md,tsv}`.

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

Es fehlen derzeit 81 unterschiedliche Texte aus dem Pool mit normaler
Text-ID-Zuordnung. Der Pool umfasst auch Daten, für die der normale Spielverlauf
keinen Aufruf besitzt. Die fehlenden Texte sind daher nicht pauschal 81
fehlende Spielszenen. Sie werden nicht aus dem Nenner herausgerechnet.

Die Ausnahmen gehen über Handbuchabfrage und Cheatmodus hinaus:

- Handbuchabfragen und ihre richtigen/falschen Antworten sind absichtlich
  deaktiviert; Cheat-, Slideshow- und Teleportmodus sind nicht eingebaut.
- Speichern/Laden und die ursprünglichen Disketten-/Dateifehlerdialoge fehlen
  in der bisherigen Konsolenbasis. Speichern/Laden ist ausdrücklich vertagt.
- Manche originale Engine-/Menütexte werden durch eigene Konsolenausgabe
  ersetzt, beispielsweise Teile der Abschluss- und Bedienungsdialoge.
- Es bleiben Sonderreaktionen und offene Erreichbarkeitsfragen. Die andere
  Reihenfolge der Schwertbehandlung und unvergiftetes Brot sind inzwischen geprüft.
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

### Allgemeine Fehlversuche

Der zusätzliche Aktionslauf prüft 18 weitere Fehlversuche, darunter ungeeignete
Objekte beim Öffnen, Bewegen, Drücken, Ziehen, Sprechen, Geben, Anwenden und
Befestigen, Graben ohne Werkzeug sowie ungeeignete und falsche Schlüssel.
Text- und Zustandsprüfungen sichern die Antworten ab; der Lauf gewinnt weiterhin
mit 4.930 Punkten. Alle 61 Replays bestehen. Damit steigt die gemessene
Textabdeckung von 517 auf 535 der 633 Inhalte.

### Weitere allgemeine und besondere Spielreaktionen

Der Aktionslauf ergänzt anschließend 16 Befehle und 29 Assertions für zwölf
weitere Inhalte. Er gewinnt mit unverändert 4.930 Punkten; alle 61 Replays
bestehen einschließlich der Include-/Fehlerregressionen. Gemessen mit
`./check-replay-texts.sh` und `./check-replay-coverage.sh`.

| Text-ID | Getestete Aktion |
| --- | --- |
| 61 | `zerstoere hinweisschild` |
| 46 | Nach Ablegen der Jeans losgehen; Dave bleibt in Raum 3 |
| 101 | `wende dave auf portier`, bevor das Gespräch den Portier entfernt |
| B1:144 | Restaurant-Esstisch erneut betrachten, nachdem die Speisekarte entdeckt wurde |
| 19 | Zimmertür wieder verriegeln; Zustand 0 prüfen, danach erneut entriegeln |
| 47 | Hinter dem Wasserfall nach Süden gehen; Dave bleibt in Raum 13 |
| B2:345 | `wende dave auf orkfrau` |
| 84 | Dachsschlitten verlassen, bevor Dave eingestiegen ist |
| 90 | Mit dem Skelett sprechen |
| 100 | `wende dave auf skelett` |
| 26 | Am unterirdischen See nach Osten gehen, bevor der Kahn bereit ist |
| C2:572 | `wende dave auf kriegerstatue` |

B1:144 ist eine wiederholte **Objektbeschreibung des Esstischs**, kein
Portier-Dialog. Die zusätzliche Restaurant-Runde nimmt keine Punkte weg.
Die Textabdeckung steigt damit von 535 auf 547/633.

### Unreferenzierte Katalogfassungen und verbleibende Spieltexte

Die folgenden Texte haben im aktuellen C-Code keine Textreferenz:

| IDs | Kataloginhalt | Tatsächliche Verwendung |
| --- | --- | --- |
| 55, 56 | Andere Warteantworten | Die Warte-Handler setzen Text 54. |
| 57, 59 | Andere Schließen-Antworten | Die allgemeinen Handler verwenden 6/7/58. |
| 62, 63, 64 | Weitere Kampf-Kommentare | Kein entsprechender Textaufruf oder Antworttabelleneintrag. |
| 102 | Weitere Antwort auf das Anwenden von Dave | Kein entsprechender Textaufruf oder Antworttabelleneintrag. |
| B1:164 | Andere Hotelschlaf-Antwort | `wende dave auf gaestebett` verwendet Text 99. |
| B2:331 | Knarrendes Friedhofstor | Öffnen läuft über den allgemeinen Tür-Handler. |
| B2:294 | Hand in den besetzten Bienenstock stecken | Keine Referenz auf diese Text-ID. |
| B2:290 | Andere Weihwasserbeschreibung | Keine Referenz auf diese Text-ID. |
| C2:548 | Andere Bücherlese-Antwort | Keine Referenz auf diese Text-ID. |
| C2:549 | Besondere Tagebuchöffnung | Keine Referenz auf diese Text-ID; Lesen verwendet 489. |

Geprüft wurden `out/part*.c`, `out/game_tables.c`, `out/game_state.c` und
`src/console/game.cpp`: direkte Textzuweisungen, Objektbeschreibungen und
Antworttabellen einschließlich Little-Endian-Textwörtern. Bloße Zahlentreffer
als Objekt-/Raum-ID, Punktindex oder SPECIAL-Nummer sind keine Textreferenzen.
Das ist eine Aussage über den aktuellen C64-Port, nicht über andere
Originalversionen. Diese Inhalte werden weder künstlich ausgegeben noch aus
dem Nenner der Messung entfernt.

B2:621 hat dagegen eine Zuweisung in `PartD_HandleVerliere`, ist auf dessen
Diskseite C2 aber nicht verfügbar. Die offene Mumien-Rückkehr und weitere
Sonderreaktionen bleiben gesondert zu prüfen. Der vollständige aktuelle
Messbericht listet alle 81 fehlenden Inhalte unverändert auf.

## Part A: Pruefung der verbleibenden Zeilen

Nach den zusätzlichen Aktionen und dem neuen Bedienungs-Replay bestehen alle
62 Replays. Der Aktionslauf gewinnt mit 430 Befehlen, 155 Assertions und
unverändert 4.930 Punkten. `part_a_controls.replay` endet nach 19 Befehlen und
37 Assertions als Checkpoint. Die Änderungen betreffen nur Replays und
Dokumentation, nicht die Spiellogik.

| Messung | Vorher | Jetzt |
| --- | --- | --- |
| Part-A-Zeileneinträge mit Ausführung | 637/806 = 79,0 % | 727/806 = 90,2 % |
| Part-A-Verzweigungsausgänge | 386/664 = 58,1 % | 452/664 = 68,1 % |
| Nicht ausgeführte Part-A-Zeileneinträge | 169 | 79 |

Die Gewinnroute prüft nun `betritt hotel`, ein allgemeines Hilfsangebot,
erneute Einhornhilfe, Klingeln nach Erhalt des Schlüssels und erneutem Betreten
der Rezeption (Klingel 1 → 2 → 0, Portier bleibt verschwunden), Entriegeln eines
ungeeigneten Objekts, das automatische Schließen beim Verriegeln sowie das
Schließen/Öffnen der separaten inneren Zimmertür. Versuchte Bewegungen prüfen,
dass geschlossene Türen ihre Ausgänge tatsächlich sperren. Die Badehose über
der Jeans wird abgewiesen; unvollständige Kleidung im Zimmer setzt den
Kältezähler auf 100. Hinter dem Wasserfall bleibt Dave beim West-Versuch mit
nur angezogener Badehose am Leben. Der Bedienungs-Replay prüft zusätzlich die
oben genannten Menüfunktionen und die fehlenden Richtungs-Fehlversuche.

### Vollständige Zuordnung der 79 offenen Zeileneinträge

Zeilennummern beziehen sich auf das unveränderte `out/parta.c`. Jede nicht
ausgeführte gcov-JSON-Zeile gehört genau einer Zeile der folgenden Tabelle an;
die Vereinigung wurde gegen die Messdaten geprüft (79 Einträge, keine Lücke
und keine Doppelzählung).

| Status / Ursache | Anzahl | Zeilen in `out/parta.c` | Beleg |
| --- | ---: | --- | --- |
| In Part A unerreichbar: vertikale Raumwechsel | 14 | 240–244, 251–252, 479–483, 490–491 | `up` und `down` sind für Räume 1–15 null; Part A schreibt keine Verbindungen hinein. Die Fehlversuche sind jetzt getestet. |
| In Part A unerreichbar: Türen nach Ost/West | 4 | 620, 623, 880, 883 | Die verfügbaren Zimmertürobjekte 48/49 steuern Nord/Süd; die Ost-/West-Türen der allgemeinen Tabelle gehören zu späteren Teilen. |
| Noch offene erreichbare Variante: Schließen ohne Richtung | 2 | 619, 622 | Die Vergleiche werden auch für ein Objekt mit Richtungscode 7 wie den Prospekt erreicht. Öffnen und anschließendes Schließen des Prospekts ist noch nicht getestet; auf Wunsch endet die Erweiterung bei rund 90 %. |
| In Part A unerreichbar: spätere Gegenstände/Gesprächspartner | 7 | 681–682, 685–686, 689–690, 984 | Blut, Gebet und Zauberspruch sind in A nicht erhältlich. Kein Objekt der allgemeinen Gesprächstabelle ist in A verfügbar; Portier, Dorfbewohner und Einhorn haben separate Fälle. |
| In Part A unerreichbar: anderer echter Schlüssel | 3 | 1188, 1200–1201 | Nur Zimmerschlüssel 117 ist in A erhältlich, und er passt zu beiden Zimmertüren. Die anderen Schlüssel stammen aus späteren Teilen. |
| Im Port unerreichbar: anderer Teil im Part-A-Dispatcher | 3 | 85, 87, 89 | Der Host ruft `PartA_Execute` nur bei `gamePart == PartA` auf. |
| Strukturell unerreichbare Verriegelungs-Ausnahme | 3 | 1126, 1138–1139 | `HandleVerriegele` vergleicht hier `object1` (Schloss) mit `LockingExceptions` (Schlüssel). Die Schloss-IDs aus `LockKeyPairs` und die Ausnahmeliste haben keine Schnittmenge. Keine Korrektur der Original-/Konverterlogik vorgenommen. |
| Noch nicht implementiert / nicht angeboten | 15 | 129, 141, 147, 286–289, 393–396, 469–472 | Laden/Speichern wird vor dem Dispatcher blockiert; Disketteninstallation ist kein angebotener Konsolenbefehl. |
| Bewusst deaktiviert: Handbuchabfrage | 9 | 553–561 | Der Host vollzieht den Partwechsel vor dem Originalhandler. |
| Nicht angebotene interne Befehle | 12 | 145, 152–153, 421–425, 575–576, 580–581 | `AUSGAENGE12` ist eine zweite interne Ausgänge-Variante; `NIX1`/`NIX2` sind leere Befehlsplätze. Der Parser bietet diese IDs nicht an. Der reguläre Ausgänge-Befehl ist getestet. |
| Durch das Unterbrechungsmodell nicht erreicht | 3 | 382, 389, 409 | Spielende, Neustart und Lösung setzen einen Dialogmodus; der unmittelbar vorherige `ScriptInterrupted()`-Test kehrt deshalb bereits zurück. Auch Abbrechen setzt den alten C-Aufruf nicht fort. |
| gcov-Zuordnung zu Sprunglabels | 4 | 630, 893, 1156, 1220 | Labelzeilen `x7b38`, `x7e49`, `x81b4`, `x825d`; keine eigenständigen Spielaktionen. Sie bleiben im rohen Nenner enthalten. |

Damit sind alle **79 fehlenden Zeileneinträge zugeordnet**. Zwei davon
bleiben als erreichbare, noch nicht getestete Variante offen; bei den übrigen
77 handelt es sich um die oben abgegrenzten Fälle. Auf Wunsch wird bei rund
90 % die weitere Erweiterung von Part A beendet. Diese Aussage betrifft den aktuellen Port mit
normaler Eingabe ab dem kanonischen Anfangszustand. Sie beweist weder die
Gleichheit mit allen Originalversionen noch vollständige Bedingungs- oder
Zustandskombinationsabdeckung. Insbesondere werden die 68,1 % gemessenen
Verzweigungsausgänge nicht als 100 % ausgegeben. Eine gesonderte vollständige
Klassifikation der noch fehlenden Verzweigungsausgänge steht aus.

Die Rohdaten stammen aus `./check-replay-coverage.sh`, Verzeichnis
`/tmp/soul-replay-coverage.XwPnyI/`; die Textmessung aus
`/tmp/soul-replay-texts.sxbkEl/report.{md,tsv}`. Temporäre Pfade sind lokale
Nachweise; beide Skripte erzeugen neue reproduzierbare Berichte.

## Part C: gezielte Aktionsprüfung

`alternatives/part_c_actions.replay` startet über `shared/c_wald.inc` regulär
und endet nach **279 Befehlen und 146 Assertions** vor dem Partwechsel:
Teil C, Raum 65, geöffnetes Portaltor, 800 Punkte, Modus `ready`. Der Checkpoint
behauptet keinen Spielgewinn. Die Abdeckung steigt von **483/863 (56,0 %)** auf
**761/863 (88,2 %)** Zeileneinträge und von **281/730 (38,5 %)** auf
**463/730 (63,4 %)** Verzweigungsausgänge.

Neu geprüft sind Bedienfunktionen, allgemeine Fehlversuche, Aus-/Anziehen,
Bewegung ohne ausreichende Kleidung, erneutes Anlegen des Amuletts im ersten
Wald und sein Verlust beim Anlegen im zweiten Wald. Danach wird die südliche
Barriere ohne Amulett getestet. Die Bootsfahrt führt vollständig über den See
und zurück; Standorte und Einsteigezustand werden geprüft, ebenso die
blockierten Landwege, solange Dave im Boot sitzt. Hinzu kommen der warme
Torhaus-Aufenthalt, Fallgitter-Wiederholungen, ungeeignete/falsche Schlüssel,
Schließen und Wiederöffnen des Portaltors und der dabei gesperrte Nordausgang.
Der noch mitgeführte Zauberspruch bleibt bei `verliere zauberspruch` im Inventar;
seine Originalantwort 624 ist auf C1 nicht verfügbar und wird nicht erfunden.

Die 102 verbliebenen gcov-Zeileneinträge wurden vollständig und ohne
Doppelzählung den folgenden Gruppen zugeordnet. Nummern: `out/partc.c`.

| Kategorie | Anzahl | Zeilen | Begründung / Grenze |
| --- | ---: | --- | --- |
| Keine vertikalen Raumwechsel in C | 14 | 262–266, 273–274, 591–595, 602–603 | Räume 51–65 haben keine Auf-/Abverbindungen; Fehlversuche sind getestet. |
| Anderer Spielteil im C-Dispatcher | 1 | 87 | Der Host ruft diesen Handler nur für C auf. |
| Nicht angebotene Installation, Laden/Speichern | 15 | 127, 139, 145, 339–342, 478–481, 581–584 | Wie in A vor dem Dispatcher ausgeschlossen. |
| Deaktivierte Handbuchabfrage | 15 | 404–418 | Partwechsel wird vorher vom Host abgewickelt. |
| Interne Ausgänge-Variante und leere Befehle | 12 | 143, 150–151, 506–510, 658–659, 663–664 | Keine Eingabezuordnung; reguläre Ausgänge sind getestet. |
| Rückkehr nach modaler Unterbrechung | 3 | 467, 474, 494 | Neustart/Beenden/Lösung kehren bereits beim Unterbrechungstest zurück. |
| Selbstangriff bereits durch Engine abgefangen | 7 | 1128–1134 | `game.cpp` behandelt Kurzschwert auf Dave vor dem Skriptdispatch. |
| Verriegelungs-Ausnahmeliste | 3 | 1194, 1206–1207 | Schloss- statt Schlüsselvergleich; keine Schnittmenge der Tabellen. |
| Wiederverriegeln/erneutes Entriegeln mit verbrauchtem Schlüssel | 7 | 1214–1216, 1218, 1225, 1273–1274 | Das einzige in C vorhandene passende Schloss ist das Portaltor; Entriegeln entfernt den Torschlüssel sofort. |
| Kahn-Entriegelung aus D | 3 | 1287–1289 | Der Kahn ist erst in D verfügbar. Das Boot in C ist ein anderes Objekt. |
| Andere Richtungen bei Öffnen/Schließen | 12 | 699–700, 702–703, 705–706, 942–943, 945–946, 948–949 | Das allgemeine verfügbare Türpaar in C reduziert sich auf das Portaltor mit Nordausgang. Das Fallgitter hat einen Sonderhandler. |
| Voraussetzungen aus B noch ungeklärt | 6 | 764–765, 768–769, 808, 811 | Blut/Gebet nach C mitbringen oder mit nur einfach behandeltem Schwert C erreichen. Nicht ohne weiteren Nachweis als unerreichbar eingestuft. |
| gcov auf Sprunglabels | 4 | 572, 713, 959, 1224 | Keine eigenständigen Spielaktionen; bleiben im Nenner. |

Die sechs offenen Einträge hängen an früheren Entscheidungen. Ihre Einstufung
bezieht sich auf den Erkenntnisstand dieser Prüfung; die erfolgreiche
Standardroute allein beweist keine Unerreichbarkeit.

## Part B und D: weitere Aktionsprüfung

Der bestehende Gewinnlauf `alternatives/action_responses.replay` bündelt die
Erweiterungen für B/D. Die neuen Bausteine `shared/controls.inc` und
`shared/equipment_failures.inc` vermeiden doppelte Befehlslisten für die
allgemeinen Bedienfunktionen, Fehlversuche und Kleidungswechsel. Es gibt keine
Zustandsinjektion. Die Spiellogik und der Konverter wurden nicht verändert.

| Teil | Vor dieser Erweiterung | Nachher |
| --- | --- | --- |
| B: Zeilen | 1.286/1.653 = 77,8 % | 1.517/1.653 = 91,8 % |
| B: Verzweigungsausgänge | 818/1.370 = 59,7 % | 950/1.370 = 69,3 % |
| D: Zeilen | 1.089/1.502 = 72,5 % | 1.366/1.502 = 90,9 % |
| D: Verzweigungsausgänge | 676/1.234 = 54,8 % | 835/1.234 = 67,7 % |

In B umfasst dies zusätzlich die Rückgabe des Messers vor dem Blutabnehmen,
das Elixier am falschen Ort, `wende dave auf holztuer`, Mylgors Einwand beim
Bewegen des Kamins, den Verkäufer nach dem Kauf, den Yeti vor dem Palast und
den blockierten Ausgang bei Firon. Das Friedhofstor wird von beiden Seiten
geöffnet, geschlossen, verriegelt und entriegelt; beide Objektzustände werden
geprüft. Auch Sarkophag, Westtür, Kamin und Labortür bekommen zusätzliche
Wiederholungen. Der König wird über `befestige totenschaedel an skelett`
wiederhergestellt, der Werwolf mit `zerstoere werwolf` besiegt.

In D werden Schacht und Fass ausdrücklich betreten. Kahn-Wiederholungen,
blockierte Bewegung während der Bootsfahrt, erneutes Festmachen, die warme
Verlieszelle und beide Seiten von Gitter-/Stahltür sind geprüft. Dazu kommen
das erneute Schließen der Eichentür, Skelett/Fährmann, wiederholte Beutelprüfung
und ein lebendiger Rückweg durch das Pentagramm, gefolgt von der erneuten Reise
zu Zargon und dem vollständigen Sieg.

**Punktedifferenz:** Das Entriegeln von Stahltürobjekt 141 vergibt in
`PartD_HandleEntriegele` die bislang ungenutzten 15 Punkte aus
`remainingPoints[140]`. Die neue Runde verriegelt und entriegelt die Tür auch
von dieser Seite. Assertions prüfen den Übergang **15 → 0**. Deshalb gewinnt
der Aktionslauf jetzt mit **4.945 statt 4.930 Punkten**, weiterhin inklusive
der 25 Strafpunkte für verdorbene Speisen. Das ist Verhalten der unveränderten
Logik, keine nachträgliche Punkteanpassung im Spiel. Der große Erkundungslauf
bleibt bei 5.010 Punkten; daraus folgt keine neu bewiesene Maximalpunktzahl.

B und D haben je 136 noch nicht ausgeführte gcov-Zeileneinträge. Darunter sind
die bekannten technischen Ausschlüsse, partfremde Objektfälle und
Engine-Vorprüfungen, aber auch weiterhin mögliche Aktionsvarianten (etwa
Schlittenumwege in B, zusätzliche Labor-Türfolgen und weitere Objekt-/Bootsvarianten
in D). Eine vollständige Klassifikation aller Reststellen wie für A/C wird
hier **nicht** behauptet. Die offenen Todeszweige bleiben separat dokumentiert.

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
