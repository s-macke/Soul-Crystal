# Text- und Logikprüfung der Komplettlösung

Stand: 25. Oktober 2026.

## Grundlage und Grenzen

Geprüft wurde das vollständige Spielprotokoll aus
`/tmp/soul-crystal-komplettloesung.txt`, einschließlich Einleitung, Tagebuch,
Handlungen und Schluss. Die erste Durchsicht betraf eine Fassung mit 2723 Zeilen,
die erste Dokumentation eine Fassung mit 2777 Zeilen. Die erneute vollständige
Durchsicht betrifft nun die erweiterte Fassung mit **3101 Zeilen, 393 Befehlen
und 130 Replay-Prüfstellen**; sie endet mit einem Gewinn und 5010 Punkten.
Alle unten angegebenen Belegzeilen beziehen sich auf diese aktuelle Fassung.
Die Replay-Prüfstellen sind kein Nachweis für die inhaltliche Richtigkeit der Texte.

SHA-256 der beim Dokumentieren vorhandenen Datei:
`da0b8776493928d747ab8cabb37d0634a3042e0861b03f7120fa040bfdd52fc2`.

Die temporäre Datei ist kein dauerhaft gesicherter Bestandteil dieser Notiz.
Deshalb nennen die Befunde zusätzlich Szene, Handlung und relevante Formulierungen.
Zeilenangaben beziehen sich ausschließlich auf dieses Protokoll, nicht auf
Text-IDs oder Quellcodedateien.

Dies ist eine inhaltliche Prüfung des protokollierten Spielverlaufs, kein Audit
der Texttabellen oder Auslösebedingungen. Es wurde nicht festgestellt, ob ein
Problem aus dem Originalspiel, einer Textübernahme oder der Konsolenumsetzung
stammt, soweit ein Befund nur auf der Textdurchsicht beruht. Die zusätzlich
protokollierten Nebenwege und Wiederholungsaktionen wurden mitgelesen. Diese
erneute Textdurchsicht enthält keine eigenen Spielversuche oder Quellcodeprüfungen.
Eine separat ergänzte technische Nachprüfung am Ende des Dokuments dokumentiert
für den Eremiten und T20 zusätzliche Code-, Originaldaten- und Laufzeitbelege.

## Neubewertung anhand der erweiterten Route

Die zusätzlichen Wege enthalten tatsächlich Hinweise. Insbesondere erklärt der
Eremit den Seelenkristall bereits vor dem Betreten der Burg. Auch die ausdrücklich
unleserliche Vertragsfassung und die unterschiedlichen Schwertbeschreibungen
liefern Kontext. Daher darf ein fehlender Hinweis in der früheren, kürzeren
Route nicht pauschal als fehlender Hinweis im Spiel gewertet werden.

- **T08 eingeschränkt:** Der Eremit erklärt den Kristall als Seelengefängnis;
  die Zelleninschrift nennt separat das Purpurfeuer als Machtquelle. Mehrere
  Funktionen sind damit vorbereitet. Unklar bleibt nur die absolute Aussage,
  beim Löschen des Feuers erlösche Zargons Macht insgesamt.
- **T03 vorsichtiger bewertet:** Ein Code muss nicht zwingend entschlüsselt
  werden, wenn sich seine Zeichen unmittelbar an einem Schloss einstellen lassen.
  Die unverständliche Papierbeschreibung und die sofort verfügbare Codenummer
  bleiben auffällig, beweisen aber kein fehlendes Rätsel.
- **T15 weiterhin offen:** Auch die erweiterte Route enthält kein
  `betrachte saerge`. Die Raumansicht nennt keine offenen Deckel; ob eine
  Objektbeschreibung den nötigen Hinweis liefert, ist weiterhin ungeprüft.
- **T20 neu:** Die erneut betrachteten, zuvor geöffneten Schubladen erhalten
  nach Entnahme des Schlüssels wieder den Text für ungeöffnete Schubladen.
  Das ist der derzeit konkreteste neue unpassende Zustandstext. Die separat
  ergänzte technische Nachprüfung unten führt ihn auf die Zustandsunterscheidung
  im Originalskript zurück, nicht auf eine vertauschte Text-ID.
- **Übrige Befunde:** Die zusätzlichen Texte beseitigen die übrigen dokumentierten
  Widersprüche nicht. Die bisher nur vermuteten Fehler bleiben Vermutungen.

### Hinweise und ihre Reichweite

| Szene / Beleg | Tatsächlicher Hinweis | Bedeutung und Grenze |
| --- | --- | --- |
| Vertrag lesen, Z. 578–597 | Fremde Schrift und unleserliches Kleingedrucktes; nach Unterzeichnung eigene Unterschrift | Bereitet die spätere Enthüllung der Seelenverpfändung vor. Dave hat keinen für ihn verständlichen Vertrag gelesen. |
| Kurzschwert betrachten, Z. 1020–1021, 1074–1075, 1166–1167 | Unbehandeltes, nur geweihtes und versilbert-geweihtes Schwert erhalten unterschiedliche Beschreibungen | Die Zustandsreaktion ist passend. Der erste Weihwassertext spottet zwar, widerspricht dem Zustand aber nicht. Die Texte bestätigen die Präparation, erklären sie nicht im Voraus. |
| Eremit, zweites Gespräch, Z. 1660–1661 | Teufelspakt; Zargons Seele ist im Kristall eingeschlossen; untote Palastwache und nächtliche Moorereignisse | Ein wesentlicher Hinweis auf die Bedeutung des Kristalls. Der anschließende Zombie im Moor passt zum Gesagten. Keine Erklärung der genauen Beziehung zwischen Kristall und Purpurfeuer. |
| Eremit, drittes Gespräch, Z. 1666–1667 | Erzähler beendet weitere Gespräche | In diesem protokollierten Gespräch folgt kein weiterer Lösungshinweis. |
| Zettel des Abenteurers, Z. 1810–1811 | Pentagramm als letzte Chance des Hexenmeisters; seine Diener schlafen niemals | Bereitet das Unterbrechen der Beschwörung vor. Kein ausdrücklicher Hinweis, dass gerade die Sargdeckel offen sind. Bereits im früheren Protokoll vorhanden. |
| Tagebuch, Z. 2186 und 2378 | Zargon bewegt die Türklinke nach oben | Hinweis auf ungewöhnliche Türbedienung. Das erneute Lesen gibt denselben Tagebuchinhalt nochmals aus; es ergänzt keine zweite Lösung. |
| Zelleninschrift, Z. 2560–2561 | „Don't push it - PULL it!“, Purpurfeuer als Machtquelle, Macht des Königs als Wegöffner | Konkrete beziehungsweise bildhafte Hinweise auf Klinke, Feuer und plausibel das Zepter. Die Zepterzuordnung ist eine Interpretation. Bereits zuvor vorhanden. |
| Brief und Bücher in Zargons Studierzimmer, Z. 2728–2753 | Brief benennt Seelenvertrag; Bücher sind unlesbar bzw. verstaubt | Weder das wiederholte Lesen des Briefs noch die Bücher erklären die Tresorkombination. |
| Zargons letztes Angebot, Z. 2938–2939 | Eine Quelle heilt die Werwolfinfektion | Die Heilung ist vor dem Quellenbesuch ausdrücklich angekündigt. T11 betrifft nur den widersprüchlich wirkenden Raumtext, keinen generell fehlenden Heilungshinweis. |

Der neue Moorbesuch endet nach Betrachtung des Zombies mit der Rückkehr zur
Lichtung. Weitere Wege durchs Moor, die Betrachtung der Särge und des Warnschilds
an der Quelle sind in dieser Fassung nicht enthalten. Aussagen über dort
möglicherweise verfügbare Hinweise bleiben deshalb offen.

## Ergebnis zur Frage nach falsch referenzierten Texten

Ein eindeutig szenenfremder Text, etwa eine Hotelbeschreibung im Schloss, wurde
nicht gefunden. Die meisten Auffälligkeiten betreffen Aussagen innerhalb eines
zur Szene passenden Textes.

Die Zustandsprüfung betrifft jetzt vier Stellen; für T20 liegt am Ende des
Dokuments bereits eine separate technische Nachprüfung vor:

| Befund | Verdacht | Nachweisstand |
| --- | --- | --- |
| T20: Schreibtischschubladen | Text für ungeöffnete Schubladen nach Öffnen und Schlüsselentnahme | Laut separater technischer Nachprüfung Fehler der Zustandsunterscheidung im Originalskript, keine vertauschte Text-ID |
| T09: Warnung in Mylgors Labor | Warnereignis läuft nach dem Übergang zur Fluchtphase weiter | Im Protokoll auffällig, Ursache ungeprüft |
| T10: Zargons Begrüßung | Dialog könnte zu einem anderen Auftragszustand gehören | Hypothese; alternative Dialogfassung nicht nachgewiesen |
| T11: Beschreibung der Quelle | Möglicherweise unpassende zustandsabhängige Beschreibung | Auch als Erzählerwitz lesbar |

Keine dieser Protokollstellen belegt allein eine falsche Text-ID. Für T09 bis T11
müssten die jeweiligen Textreferenzen, Zustandsbedingungen und verfügbaren
Alternativtexte noch mit den Originaldaten verglichen werden. Die technische
Nachprüfung zu T20 ist unten getrennt von der Textbeobachtung festgehalten.

## Widersprüche und auffällige Textübergänge

### T01 — Dave weiß von seiner Infektion und hält sie später angeblich für harmlos

- **Belege:** Z. 1295 und 2497.
- **Beobachtung:** Nach dem Werwolfkampf erkennt Dave grünes Blut und die
  beginnende Infektion. Er denkt resigniert über seine Zukunft als Werwolf nach.
  Bei der Verwandlung auf dem Turm heißt es später, er habe die Wunde zunächst
  für harmlos gehalten.
- **Bewertung:** Direkter Widerspruch bezüglich Daves Wissen. Beide Texte passen
  zur jeweiligen Szene; kein konkreter Hinweis auf eine vertauschte Textreferenz.
- **Korrekturrichtung:** Die befürchtete Verwandlung tritt jetzt tatsächlich ein.

### T02 — Tagebuchzusammenfassung nennt die falsche Abbruchstelle

- **Belege:** Zusammenfassung Z. 2101; tatsächlicher Schluss ab Z. 2263.
- **Beobachtung:** Laut Zusammenfassung enden die Aufzeichnungen bei Zargons
  Aufforderung, ihm zu dienen oder zu sterben. Der anschließend ausgegebene
  Tagebuchtext schildert danach noch die Verweigerung, das Massaker, die Suche
  nach Überlebenden und den geplanten Selbstmord des Turmwächters.
- **Bewertung:** Zusammenfassung und Volltext stimmen nicht überein. Denkbar sind
  unterschiedliche Textfassungen; deren Herkunft wurde nicht untersucht.
- **Korrekturrichtung:** Zusammenfassung an den tatsächlichen Schluss anpassen.

### T03 — Unverständlicher Code wird sofort zur nutzbaren Tresorkombination

- **Belege:** Papierbeschreibung Z. 2665; Anwendung am Tresor ab Z. 2684.
- **Beobachtung:** Die Zeichen auf dem Papier ergeben für Dave ausdrücklich
  keinen Sinn. Direkt danach erscheint „Codenummer (bei dir)“ in der Objektliste.
  `wende codenummer auf tresor` funktioniert ohne Entschlüsselungsschritt.
- **Bewertung nach erneuter Durchsicht:** Es bleibt ein unsauber erklärter Übergang,
  aber kein gesichert fehlender Entschlüsselungsschritt. Dave könnte eine
  unverständliche Zeichenfolge unverändert als Kombination übernehmen. Auch die
  nun gelesenen Bücher liefern keine weitere Erklärung. Der Satz müsste zwischen
  fehlendem Verständnis und fehlender Ablesbarkeit deutlicher unterscheiden.
- **Korrekturrichtung:** Klarstellen, dass die Zeichen lesbar und als Kombination
  ausprobierbar sind; einen zusätzlichen Rätselschritt nur nach Originalabgleich
  annehmen.

### T04 — Treppenhaus nennt den falschen Nachbarraum

- **Beleg:** Beschreibung des oberen Treppenhauses Z. 2067; die protokollierten
  Wege führen zwischen Treppenhaus und Schloßgalerie.
- **Beobachtung:** Die Osttür soll laut Beschreibung in die Empfangshalle führen.
  Tatsächlich führt sie in die Schloßgalerie. Von dort liegt die Empfangshalle
  einen weiteren Schritt nach Süden.
- **Bewertung:** Eindeutiger Fehler der Wegbeschreibung, keine insgesamt fremde
  Raumbeschreibung.
- **Korrekturrichtung:** „Empfangshalle“ an dieser Stelle durch „Schloßgalerie“ ersetzen.

### T05 — Ebenholztür heißt in der Objektliste Eichentür

- **Belege:** Korridorbeschreibung Z. 2595; `betrachte eichentuer` Z. 2600.
- **Beobachtung:** Die Raumbeschreibung nennt eine schwarze Ebenholztür, die
  Objektliste und der Befehl dagegen eine Eichentür.
- **Bewertung:** Inkonsistente Benennung beziehungsweise Materialangabe. Aus dem
  Protokoll ist nicht bestimmbar, welche Benennung ursprünglich vorgesehen war.
- **Korrekturrichtung:** Raumtext und Objektname vereinheitlichen.

### T06 — Nur das Portal soll erhalten sein, aber das Schloss ist begehbar

- **Beleg:** Außenbeschreibung der Burgruine Z. 1709; nachfolgende Schlossräume.
- **Beobachtung:** Das Eintrittsportal wird als einzig erhaltener Teil bezeichnet.
  Anschließend sind Empfangshalle, Galerie, Hauptturm, Küche und Wohnräume
  zugänglich, teilweise mit kostbarer Einrichtung.
- **Bewertung:** Die absolute Aussage passt nicht zum beschriebenen Gebäude.
- **Korrekturrichtung:** Den äußeren Eindruck einer Ruine oder die erhaltene
  Außenbefestigung beschreiben, statt sämtliche anderen Gebäudeteile auszuschließen.

### T07 — Brief behandelt den bereits gefundenen Vertrag als ungelöstes Rätsel

- **Beleg:** Mylgors Brief Z. 2729; der Vertrag wurde zuvor aus dem Tresor genommen.
- **Beobachtung:** Der Erzähler erklärt das Fehlen des Vertrags im Briefumschlag
  weiterhin zum Mysterium, obwohl Dave den Vertrag bereits besitzt.
- **Bewertung:** Der Text berücksichtigt diese mögliche Reihenfolge nicht.
  Wörtlich ist der Umschlag tatsächlich leer; unpassend ist das daraus abgeleitete
  Unwissen.
- **Korrekturrichtung:** Bei bereits gefundenem Vertrag eine passende Textvariante verwenden.

## Verdächtige Zustands- und Ereignistexte

### T08 — Zargons Macht erlischt, bleibt aber anschließend wirksam

- **Belege:** Löschen des Purpurfeuers Z. 2779; Mysterium ab Z. 2923 und folgender Kampf.
- **Beobachtung:** Mit dem Purpurfeuer erlischt laut Text auch Zargons dunkle Macht.
  Danach verleiht ihm der Seelenkristall weiterhin seine unheilige Macht, und er
  versucht, Vasallen in sein Pentagramm zu rufen.
- **Bewertung nach erneuter Durchsicht:** Der zweite Eremitendialog (Z. 1661)
  erklärt ausdrücklich den Kristall als Seelengefängnis, während die Zelleninschrift
  (Z. 2561) das Purpurfeuer als Machtquelle benennt. Die Geschichte bereitet also
  verschiedene Funktionen vor. Kein Beweis für eine falsche Textreferenz oder
  dafür, dass nach dem Löschen überhaupt keine Magie mehr möglich sein dürfte.
  Problematisch bleibt die pauschale Formulierung beim Erlöschen des Feuers.
- **Korrekturrichtung:** Präzisieren, welchen Schutz oder welche Fähigkeit das
  Purpurfeuer tatsächlich gewährt.

### T09 — Warnung vor Mylgor läuft nach ausgelöster Explosion weiter

- **Belege:** `zerstoere reagenzien` ab Z. 1510; Warnung Z. 1513.
- **Beobachtung:** Dave stürzt die Reagenzien um, löst eine Explosion aus und setzt
  das Labor in Brand. Unmittelbar danach fordert der Erzähler ihn auf, Mylgor
  endlich zur Hölle zu schicken. Der erfolgreiche Ablauf besteht nun aber aus
  Flucht und Abschließen der Labortür.
- **Bewertung:** Verdacht auf einen weiterlaufenden Warntext aus der Angriffsphase.
  Mylgor ist zu diesem Zeitpunkt noch nicht endgültig besiegt; deshalb ist der
  Text nicht zwingend sachlich falsch, aber für die nächste Handlung irreführend.
- **Prüfschritt:** Reihenfolge von Aktionsausgabe und zeitgesteuertem Ereignis sowie
  die Zustandsprüfung nach dem Umstürzen der Reagenzien untersuchen.

### T10 — Zargon behauptet, Dave habe seine Aufgabe erfüllt

- **Beleg:** Zargons Begrüßung Z. 2927.
- **Beobachtung:** „Du hast Deine Aufgabe erfüllt“ passt nicht zum ursprünglichen
  Auftrag, Firon zu beseitigen. Dave hat Firon verschont, Mylgor besiegt, den
  Vertrag verbrannt und das Purpurfeuer gelöscht.
- **Bewertung:** Möglicher Dialog für einen anderen Auftragszustand. Eine solche
  Variante ist bislang nicht nachgewiesen. Auch Sarkasmus oder eine andere
  gemeinte Aufgabe wären möglich, werden im Text aber nicht deutlich.
- **Prüfschritt:** Verwendete Text-ID, Bedingungen der Begrüßung und alternative
  Zargon-Dialoge mit den Originaldaten vergleichen.

### T11 — Quelle verneint Trinkberechtigung vor erfolgreicher Heilung

- **Beleg:** Quellbeschreibung Z. 3055; kurz danach `wende wasser auf dave`.
- **Beobachtung:** Dave erfülle die Bedingungen zum Trinken ohnehin nicht.
  Anschließend trinkt er erfolgreich und wird vom Werwolffluch geheilt.
- **Bewertung:** Verdacht auf einen unpassenden Zustandstext, falls eine echte
  Spielbedingung gemeint ist. Der Satz kann allerdings auch ein Spott über die
  zuvor erwähnten „fleißigen (!) Abenteurer“ sein. Der durchgestrichene Hundekopf
  verstärkt die Mehrdeutigkeit des Hinweises.
- **Prüfschritt:** Mögliche Varianten vor und nach Infektion, Verwandlung und
  Heilung prüfen; Erzählerwitz und mechanische Bedingung auseinanderhalten.

### T20 — Bereits geöffnete Schubladen erhalten erneut den Öffnungshinweis

- **Belege:** Betrachtungen Z. 1400, 1412 und 1424; Öffnen Z. 1406;
  Schlüsselentnahme Z. 1418.
- **Beobachtung:** Vor dem Öffnen heißt es passend: „Öffnen müßtest Du sie schon
  selbst“. Nach `oeffne schubladen` gelingt die Suche und Dave findet den
  Laborschlüssel. Nach `nimm laborschluessel` und erneuter Betrachtung erscheint
  jedoch exakt wieder der Öffnungshinweis. Ein Schließen findet dazwischen nicht
  statt; auch der Suchtext beschreibt keine abgeschlossene Schließhandlung.
- **Bewertung der Textdurchsicht:** Konkreter unpassender Zustandstext, deutlicher
  als die bisherigen Verdachtsfälle. Das Protokoll allein erklärt die Ursache nicht.
- **Separater technischer Befund:** Die Nachprüfung am Dokumentende identifiziert
  den Rückfall auf Text 258 nach Entdeckung des Schlüssels im Originalskript.
  Die Schubladen bleiben dabei offen; eine vertauschte Text-ID ist nicht die Ursache.
- **Korrekturrichtung:** Offene, bereits durchsuchte Schubladen als solche
  beschreiben, statt erneut zum Öffnen aufzufordern.

## Plausibilitäts- und Vermittlungslücken

### T12 — Festgeketteter Kahn fährt ohne erwähntes Losmachen ab

- **Belege:** Festmachen Z. 1966; Rückfahrt Z. 2005.
- **Beobachtung:** Dave befestigt den Kahn mit einer Kette am Steg. Später reichen
  Einsteigen und `west`; beschrieben wird lediglich das Abstoßen vom Steg.
- **Bewertung:** Fehlender Handlungsschritt im Text, nicht zwingend ein Fehler der
  Spielmechanik. Automatisches Losmachen kann beabsichtigt sein.
- **Korrekturrichtung:** Das Losmachen im Abfahrtstext erwähnen.

### T13 — Stillgelegte Mine enthält ein laufendes Schmelzfeuer

- **Belege:** Stilllegung Z. 753; Feuer und geschmolzenes Silber Z. 761.
- **Beobachtung:** Die seit langer Zeit aufgegebene Mine enthält weiterhin eine
  Feuerstelle, die Silber flüssig hält. Eine Betreuung oder magische Ursache
  wird nicht genannt.
- **Bewertung:** Plausibilitätslücke, kein zwingender Widerspruch in einer Fantasywelt.
- **Korrekturrichtung:** Heimliche Nutzung oder eine dauerhafte magische Wärmequelle
  erklären, falls dies zur Originalgeschichte passt.

### T14 — Firons Exil und sein vorheriger Aufenthalt im Eispalast

- **Belege:** Richards Erzählung Z. 1279; Tagebucheintrag zum ersten Tag ab Z. 2109.
- **Beobachtung:** Firon soll bei Zargons Machtübernahme emigriert sein und sich im
  Eispalast verschanzt haben. Schon vor dem Umsturz besuchen königliche Kuriere
  ihn jedoch in seinem Palast in den Eisregionen.
- **Bewertung:** Missverständliche Vorgeschichte, kein gesicherter Widerspruch.
  Ein späterer Rückzug in eine bereits vorhandene Residenz würde beides vereinbaren.
- **Korrekturrichtung:** Gegebenenfalls diese zeitliche Abfolge verdeutlichen.

### T15 — Offene Särge werden nicht als offen beschrieben

- **Belege:** Gruftbeschreibung Z. 2909; `schliesse saerge` Z. 2914.
- **Beobachtung:** Rauch quillt aus Rissen der Sarkophage. Offene Deckel werden
  nicht erwähnt, trotzdem gelingt unmittelbar danach das Schließen der Särge.
- **Bewertung nach erneuter Durchsicht:** In der gezeigten Raumansicht fehlt der
  Öffnungshinweis weiterhin. Auch die erweiterte Route betrachtet die Särge nicht.
  Zettel, Königsbericht und Tagebuch bereiten die Gefahr durch untote Diener vor,
  belegen aber nicht den aktuellen Öffnungszustand. Keine Aussage, dass im
  gesamten Spiel ein Hinweis fehlt.
- **Korrekturrichtung:** Öffnungszustand in der Raum- oder Objektbeschreibung klar angeben.

### T16 — Rückkehr nach Schottland bleibt offen

- **Belege:** Bann auf dem Weltentor Z. 1279; Spielende Z. 3097.
- **Beobachtung:** Das Ende schildert die Befreiung des Landes und Daves Verlassen
  der Burg. Seine Heimkehr und die Aufhebung des Banns auf dem Weltentor werden
  nicht bestätigt.
- **Bewertung:** Offener Erzählfaden, kein nachgewiesener Fehler der Gewinnbedingung.
- **Korrekturrichtung:** Ein kurzer Ausblick auf die Heimkehr würde die
  Ausgangsgeschichte abschließen.

## Redaktionelle und fassungsspezifische Probleme

### T17 — Speicherempfehlungen bei nicht verfügbarer Speicherfunktion

- **Belege:** Einleitung Z. 20; Hinweise Z. 1613, 1635 und 2615.
- **Beobachtung:** Speichern und Laden sind laut Einleitung nicht verfügbar.
  Mehrere Spieltexte empfehlen dennoch ausdrücklich das Abspeichern.
- **Bewertung:** Unpassende Anweisung für die protokollierte Konsolenfassung.
  Daraus folgt kein Fehler des Originalspiels.
- **Korrekturrichtung:** Bei unveränderten Originaltexten die Einschränkung klar
  kenntlich machen; bei redaktioneller Anpassung die Hinweise passend formulieren.

### T18 — Bearbeitungsreste und viele Tippfehler im Tagebuch

- **Beleg:** Tagebuch ab Z. 2109.
- **Beobachtung:** Sichtbare Reste wie „(dies ist Zeile1)“ und eine isolierte Zeile
  „wg“. Daneben unter anderem „Jedocj“, „selbsr“, „gehaofft“, „akuern“ und „Famielien“.
- **Bewertung:** Unbereinigter Textbestand. Ob diese Fehler aus der Vorlage oder
  ihrer Übertragung stammen, ist ungeprüft.
- **Korrekturrichtung:** Gegen Originaldarstellung beziehungsweise Quelldokument
  abgleichen, bevor historische Originaltexte verändert werden.

### T19 — Weitere Schreib- und Benennungsfehler

- **Beispiele:** „Ostwad“ (Z. 1743), „Spritismus“ (Z. 2615), „Buthakönigs“
  (Z. 1883, sonst Butah), „auf auf“ (Z. 2067), „der der Körper“ (Z. 1295).
- **Bewertung:** Redaktionelle Fehler unabhängig vom gewollt flapsigen Erzählstil.
- **Korrekturrichtung:** Schreibweisen vereinheitlichen und versehentliche
  Dopplungen entfernen; Originaltreue und bereinigte Fassung gegebenenfalls trennen.

## Einschätzung der Sprache

Die folgenden Aussagen sind eine stilistische Einschätzung, keine technischen
Fehlerbefunde.

Die Sprache hat eine markante, freche Erzählerstimme. Direkte Spieleransprache,
Computerwitze, Autorenauftritte und Anspielungen verankern sie deutlich in der
Computerspielkultur der frühen Neunziger. Besonders wirksam sind Stellen, an
denen eine glaubhafte Gruselszene mit einem kurzen, trockenen Kommentar gebrochen
wird. Auch die Ansprache des Spielers kann Nähe und Wiedererkennungswert schaffen.

Häufig überdehnt der Text diese Mittel jedoch. Lange Schachtelsätze, viele
verstärkende Adjektive und wiederholte Selbstkommentare darüber, wie langweilig
ein Raum oder wie einfallslos die Autoren seien, bremsen den Spielfluss. Manche
Raumbeschreibungen widmen der Entschuldigung für ihren Inhalt mehr Platz als dem
Ort selbst. Der Erzähler unterbricht die Atmosphäre oft, bevor sie wirken kann.

Die wiederholten Beschimpfungen des Spielers und manche Frauenwitze wirken heute
teilweise bemüht oder herablassend. Zusammen mit den häufigen abrupten Wechseln
zwischen Bedrohung, Klamauk und technischer Metaebene kann dies die Figuren und
ihre Notlage weniger glaubwürdig erscheinen lassen. Diese Wirkung ist eine Frage
des Tons und Publikums, kein Beleg für falsch referenzierte Texte.

Für eine sprachliche Überarbeitung wäre sinnvoll:

- Die eigenständige Erzählerstimme erhalten, statt sie vollständig zu neutralisieren.
- Wiederholte Selbstabwertungswitze und Füllsätze kürzen.
- Lange Sätze teilen und Häufungen ähnlicher Adjektive reduzieren.
- Gruselszenen gelegentlich ohne sofortige Pointe stehen lassen.
- Ausgänge, Objektzustände und rätselrelevante Hinweise eindeutig formulieren.
- Daves Wissen und die Reaktionen des Erzählers am aktuellen Spielzustand ausrichten.

## Priorität einer späteren Prüfung

1. T09, T10 und T11 auf falsche Ereignisbedingungen oder Dialogvarianten prüfen.
   Die bereits separat dokumentierte technische Klärung zu T20 berücksichtigen.
2. T01 bis T07 gegen Originaltexte und den tatsächlichen Spielzustand abgleichen.
3. T08 und T12 bis T16 als Plausibilitäts- und Vermittlungsfragen behandeln,
   ohne daraus vorschnell Enginefehler abzuleiten.
4. T17 bis T19 im Rahmen einer ausdrücklich gewünschten Textbereinigung behandeln.

Diese Dokumentation hält Beobachtungen und offene Prüffragen fest. Sie nimmt
keine Änderungen an Spieltexten, Spielregeln oder Textreferenzen vor.

## Nachprüfung: Eremitenhinweis und offene Schubladen

Diese separate technische Nachprüfung bezieht sich auf die erweiterte Route mit
393 Befehlen und 5.010 Punkten. Sie ergänzt die Textdurchsicht um Originaldaten-
und Laufzeitbelege. Die Textdurchsicht oben wurde inzwischen ebenfalls auf die
3101-zeilige Fassung aktualisiert; ihre Prüfsumme und Belegzeilen stehen am Anfang.

### Eremit: Information über Zargons Seele ist vor dem Schloss vorhanden

In Teil C liefert das zweite `sprich eremit` den Text 391 (`$0187`, C1-Datensatz
244). Er erklärt ausdrücklich, dass Zargon einen Pakt mit dem Teufel geschlossen
hat, der seine Seele gefrieren und in einen riesigen magischen Kristall
«einsperren ließ». Die erste Antwort setzt `objectState[EREMIT]` von 0 auf 1,
die zweite von 1 auf 2. Quelle: `PartC_HandleSprich` in `out/partc.c`.

Die aktuelle Route besucht den Eremiten vor dem Schloss und prüft beide
Zustandswechsel sowie die Textstelle über den Kristall. Der Spieler erhält
somit einen konkreten Hinweis auf die Bedeutung des Kristalls. Dieser Hinweis
ist optional: Die ursprüngliche PDF-Hauptroute ließ den Eremiten aus. Aus seiner
Abwesenheit im früheren Protokoll lässt sich daher kein fehlender Originaltext
ableiten. Er beweist allerdings nicht, dass damit jede Einzelheit des späteren
Rätsels ausdrücklich erklärt wäre.

### Technischer Nachweis zu T20 — Offene Schubladen und Öffnungshinweis

**Bestätigt: fehlerhafte Zustandsunterscheidung im Originalskript, keine
versehentlich geschlossenen Schubladen und keine vertauschte Text-ID.**

`PartB_HandleBetrachte` (`out/partb.c`) unterscheidet nur:

```c
if (objectLocation[LABORSCHLUESSEL] == 0 && objectState[SCHUBLADEN] == 1) {
    objectLocation[LABORSCHLUESSEL] = currentRoom;
    pendingTextID = 259; // Schlüssel entdecken
} else {
    pendingTextID = 258; // Aufforderung, die Schubladen erst zu öffnen
}
```

Die zweite Bedingung bedeutet «offen». Die erste bedeutet «Schlüssel noch
verborgen». Sobald der Schlüssel entdeckt ist, wird also der unpassende
Öffnungshinweis gewählt, selbst wenn die Schubladen weiterhin offen sind.
Dafür muss der Schlüssel nicht einmal mitgenommen werden: Schon seine Position
im Raum statt 0 genügt. Die Aktion schreibt keinen neuen Schubladenzustand.

**Originalnachweis:** Die gesamte B2-Skriptkette aus
`data/C64/d64/Soul Crystal SideB2.d64` stimmt bytegenau mit dem Skriptbereich im
Snapshot `data/C64/snapshots/diskb2.vsf` überein. Der relevante Abschnitt lautet:

```text
$83EB: D0 A6 C0 52 DC C0 00 D8 A7 C0 35 DC C0 01 D1
       IF location[$52] == 0 AND state[$35] == 1
$83FA: A6 C0 52 83 D7
       location[$52] = currentRoom
$83FF: 92 C1 03 01 D7
       pendingTextID = $0103
$8404: D2 92 C1 02 01 D7 D3
       ELSE pendingTextID = $0102; ENDIF
```

**Laufzeitnachweis:** Eine temporäre Variante der Gewinnroute unter
`/tmp/soul-drawer-audit.replay` prüfte zusätzlich Zustand 1 nach Öffnen,
Durchsuchen, Schlüsselaufnahme und erneutem Betrachten. Bei der letzten Aktion
erschien trotzdem der Öffnungshinweis. Der Lauf gewann mit 393 Befehlen,
136 Prüfstellen und unveränderten 5.010 Punkten. Diese temporäre Testdatei ist
kein dauerhaftes Repository-Artefakt; die zusätzlichen Prüfungen beschrieben
hier den aktuellen Originalfehler, keine korrigierte Soll-Reaktion.

**Mögliche spätere Korrektur:** Geschlossen, offen mit verborgenem Schlüssel und
offen nach dessen Entdeckung als drei Fälle unterscheiden. Im dritten Fall
passt ein neutraler Hinweis, dass nichts Neues gefunden wurde. Die Prüfung
ändert ausdrücklich weder Originalbytecode noch generierten Spielcode oder
Texte. Eine bewusste Korrektur der Portierung wäre separat zu kennzeichnen.

## Unabhängige Zweitprüfung des gesamten Protokolls

Ein separat gestarteter Subagent las ohne vorherigen Gesprächskontext und ohne
bestehende Review-Dokumente oder Quellcode alle 3.101 Zeilen / 286.714 Bytes der
393-Befehle-Fassung, einschließlich beider Tagebuchausgaben. SHA-256:
`da0b8776493928d747ab8cabb37d0634a3042e0861b03f7120fa040bfdd52fc2`.
Diese unveränderte Fassung liegt temporär unter
`/tmp/soul-crystal-review-393-befehle.txt`. Die normale Ausgabedatei wird inzwischen
weiterentwickelt; die folgenden Zeilennummern gelten ausschließlich für die
gesicherte Fassung. Der Subagent änderte keine Dateien.

Er fand keinen sicher nachweisbaren spielblockierenden Mechanikfehler.
Seine wichtigsten unabhängig ermittelten Kandidaten:

| Beobachtung | Zeilen | Einordnung |
| --- | --- | --- |
| Quelle verneint Trinkvoraussetzungen, heilt Dave unmittelbar danach dennoch | 3052–3055, 3072–3073 | Klarer Text-/Zustandswiderspruch; unbedingter Raumtext als mögliche Ursache, Heilungsmechanik nicht widerlegt |
| Offene, durchsuchte Schubladen verlangen erneut Öffnen | 1400–1425 | Klarer Ablaufwiderspruch; durch separate Quellprüfung in T20 als Originalfehler bestätigt |
| Mylgors Angriffswarnung folgt noch nach Explosion und Abwehr | 1501–1513 | Verdacht auf weiterlaufenden Angriffstimer; könnte aber bewusst zum noch nötigen Einschließen drängen |
| Einhorn beschreibt Übergabe, Kugel liegt zunächst nur im Raum | 433–441 | Text-/Besitzdifferenz; bewusste Adventure-Konvention bleibt möglich |
| Oberes Treppenhaus nennt Empfangshalle als Ostziel, tatsächlich folgt Schlossgalerie | 2056–2067, 2814–2815, 3022–3029 | Klarer Navigationshinweisfehler; Raumgraph selbst konsistent |

Schwächere, ausdrücklich nicht bewiesene Mechanikverdachte: festgemachter Kahn
fährt ohne explizites Losmachen ab (1966–1967, 1992–2007); Laborverriegelung
schließt eine offene Tür implizit (1494–1525); eingerastetes Zepter bleibt im
Inventar (2992–2995). Implizite Handlungen können diese Abläufe erklären.
Die Chronologie von Firons Exil und die Stärke vor der vollständigen
Werwolfverwandlung wurden nicht als belastbare Logikfehler eingestuft.

Die Zweitprüfung begründet weitere gezielte Quellprüfungen, keine automatischen
Korrekturen am Spiel. Insbesondere unterscheidet das Protokoll allein nicht
zwischen Fehlern im Original und in der Portierung.

## Herkunftsprüfung der fünf Hauptbefunde

Die folgenden Aussagen gehen über die reine Protokolldurchsicht hinaus.
Abgeglichen wurden die unveränderten D64-Skriptketten mit den Snapshotbytes,
die betreffenden Bytecodebedingungen mit dem generierten C, die Textkataloge
mit den komprimierten D64-Texten sowie die Raumverbindungen mit dem originalen
Anfangszustand. Die Go-Tests in `src/Go/text` und `src/Go/c64audit` bestanden bei
dieser Nachprüfung. Es wurde kein kompletter Original-C64-Durchlauf ausgeführt.

**Ergebnis: Für keinen dieser fünf Befunde wurde eine von der Portierung neu
verursachte Abweichung gefunden.** Das bedeutet nicht, dass jeder Befund ein
Mechanikfehler ist: Einige sind ungenaue Erzähltexte oder widersprüchliche
Rückmeldungen im Original.

| Befund | Originalnachweis | Bewertung |
| --- | --- | --- |
| Quelle: angeblich fehlende Trinkvoraussetzung, danach Heilung | Native Raumtextauswahl `$2E5B..$2F85` setzt für Raum 99 die ID 431 (99+332), C2-Datensatz 242. Sie prüft dabei keinen Werwolfzustand. Dieser Originaltext enthält die verneinten Voraussetzungen. C2-Bytecode ab `$8A53` heilt bei Werwolfzustand 4, setzt Zustand 99 und Text 558, unabhängig von einer zusätzlichen Trinkberechtigung. | Originaler Beschreibungstext passt nicht zur tatsächlich erlaubten Aktion. Kein Hinweis auf eine falsch portierte Heilungsbedingung. Ob als Erzählerwitz gemeint, ist aus Code nicht entscheidbar. |
| Offene Schubladen verlangen Öffnen | B2 `$83EB..$840A`, siehe T20: Fundtext nur bei verborgenem Schlüssel UND offenen Schubladen; sonst pauschal Text 258. | Originaler Fehler in der Auswahl der Rückmeldung. Offenstatus bleibt korrekt. |
| Mylgors Warnung nach Reagenzienzerstörung | B2 `$78AA` prüft Mylgor-Zustand 6, wählt bei `$78BB` Text 214 und gibt ihn aus, ohne Reagenzienzustand zu prüfen. Die Zerstörungsaktion setzt Reagenzien auf 1, nicht Mylgor auf einen anderen Zustand. | Bereits original. Die alte Warnung bleibt aktiv, obwohl die folgende Angriffstodesprüfung zusätzlich `Reagenzien == 0` verlangt. Die Todesfrist wurde also nicht einfach unverändert weiterportiert; nach dem Gegenangriff läuft eine gesonderte Reagenzien-/Explosionsfrist. |
| Kristallkugel trotz beschriebener Übergabe im Raum | B1 `$7FC0`: `A6 C0 24 83 D7`, also `objectLocation[36] = currentRoom`, nicht 255. Danach Text 160, B1-Datensatz 262, der die Übergabe beschreibt. | Text-/Besitzdifferenz bereits im Original; möglicherweise bewusstes explizites Aufnehmen als Adventure-Konvention. Kein verlorenes Inventarereignis unserer Umsetzung. |
| Ostziel im oberen Treppenhaus falsch benannt | Originalinitialisierung: `east[70]=71`, `west[71]=70`, `south[71]=69`. Raum 70 ist oberes Treppenhaus, 71 Schlossgalerie, 69 Empfangshalle. Der native Raumtext ist ID 402 (70+332), C2-Datensatz 213; er nennt als Ostziel dennoch die Empfangshalle. | Originaler Wegbeschreibungstext widerspricht den Originalverbindungen. Kein Beleg für eine falsche Raum-ID oder einen falsch portierten Ausgang. |

### Prüfumfang und Quellen

- B1: 3.491 Skriptbytes, B2: 7.865 Skriptbytes, C2: 6.915 Skriptbytes
  wurden erneut vollständig zwischen D64-Kette und Snapshot verglichen.
- `TestJSONCatalogsMatchDisks` dekodiert die Textdatensätze erneut aus den
  Original-D64-Dateien; `TestConverterTextIDsAndSelectCases` prüft die
  Textzuweisungen gegen Bytecodebytes. `TestRouteAgainstOriginal6502` prüft
  die Text-ID-Routen gegen die native Routine.
- `TestInitialStateAgainstNativeInitializer` prüft die Raumtabellen gegen
  die ausgeführte originale Initialisierung und den generierten C-State.
- Native Raumtextauswahl: `opcodeoracle/soul_crystal/soul_crystal.asm`,
  Routine `script_vm_special_room_logic` ab `$2E5B`. Für Räume ab 66 wird
  unmittelbar `currentRoom + $014C` gewählt; anschließend wird nur die
  Kurz-/Langbeschreibung anhand der Besuchsflags berücksichtigt.
- Portierte Gegenstücke: `Code2E5B` in `src/console/game.cpp`,
  `PartA_HandleSprich`, `PartB_HandleBetrachte`, der Nachlauf von
  `PartB_Execute` und `PartD_HandleWende` in den vier generierten C-Dateien.

Es wurden keine Originaltexte oder Spielbedingungen korrigiert. Die schwächeren
Verdachtsmomente der unabhängigen Prüfung (Kahn, implizites Türschließen,
Zepter) sind durch diese fünf Herkunftsprüfungen nicht automatisch geklärt.

## T21 — Todestests entdecken echten Portierungsfehler beim Aufwärmen

Beim Erstellen der Kälte-Todesreplays wurde eine andere, tatsächlich von unserer
Portierung verursachte Abweichung gefunden: Der native Nachlauf `$3B0B..$3B1D`
setzt `objectState[DAVE]` auf 100, **wenn** `currentRoom == 2` (Lobby). Die
Konsolenbasis hatte dafür irrtümlich `currentRoom != 2` verwendet. So wurde Dave
außerhalb der Lobby nach fast jeder Aktion wieder warm, wodurch der Kältetod in
Teil A nicht regulär erreichbar war.

`src/console/game.cpp` verwendet jetzt die originale Gleichheitsbedingung.
Der Konsolentest prüft Abkühlen auf der Straße und Aufwärmen in der Lobby.
`tests/replays/deaths/a_kaelte.replay` erreicht den Kältetod durch normale
Eingaben vom echten Anfang aus. Auch die vollständige Erkundungsroute gewinnt
mit dieser Korrektur weiterhin. Das Ergebnis betrifft die nachträglich geprüfte
Wärmelogik, nicht die fünf zuvor auf Originalherkunft geprüften Textbefunde.
