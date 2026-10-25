# Text- und Logikprüfung der Komplettlösung

Stand: 25. Oktober 2026.

## Grundlage und Grenzen

Geprüft wurde das vollständige Spielprotokoll aus
`/tmp/soul-crystal-komplettloesung.txt`, einschließlich Einleitung, Tagebuch,
Handlungen und Schluss. Die erste Durchsicht betraf eine Fassung mit 2723 Zeilen.
Beim Dokumentieren enthielt dieselbe Datei 2777 Zeilen. Die unten angegebenen
Zeilennummern wurden auf diese spätere Fassung abgeglichen; die genannten
auffälligen Passagen sind dort weiterhin vorhanden.

SHA-256 der beim Dokumentieren vorhandenen Datei:
`b0c16ca026005adea2eece0d60e3f5f5b739c8660062744d6cdc4db9f9cdcc84`.

Die temporäre Datei ist kein dauerhaft gesicherter Bestandteil dieser Notiz.
Deshalb nennen die Befunde zusätzlich Szene, Handlung und relevante Formulierungen.
Zeilenangaben beziehen sich ausschließlich auf dieses Protokoll, nicht auf
Text-IDs oder Quellcodedateien.

Dies ist eine inhaltliche Prüfung des protokollierten Spielverlaufs, kein Audit
der Texttabellen oder Auslösebedingungen. Es wurde nicht festgestellt, ob ein
Problem aus dem Originalspiel, einer Textübernahme oder der Konsolenumsetzung
stammt. Alternative Spielverläufe wurden nicht getestet.

## Ergebnis zur Frage nach falsch referenzierten Texten

Ein eindeutig szenenfremder Text, etwa eine Hotelbeschreibung im Schloss, wurde
nicht gefunden. Die meisten Auffälligkeiten betreffen Aussagen innerhalb eines
zur Szene passenden Textes.

Drei Stellen verdienen eine gezielte Prüfung ihrer Auslösebedingungen:

| Befund | Verdacht | Nachweisstand |
| --- | --- | --- |
| T09: Warnung in Mylgors Labor | Warnereignis läuft nach dem Übergang zur Fluchtphase weiter | Im Protokoll auffällig, Ursache ungeprüft |
| T10: Zargons Begrüßung | Dialog könnte zu einem anderen Auftragszustand gehören | Hypothese; alternative Dialogfassung nicht nachgewiesen |
| T11: Beschreibung der Quelle | Möglicherweise unpassende zustandsabhängige Beschreibung | Auch als Erzählerwitz lesbar |

Keine dieser Stellen belegt allein eine falsche Text-ID. Zur Klärung müssten die
jeweiligen Textreferenzen, Zustandsbedingungen und verfügbaren Alternativtexte
mit den Originaldaten verglichen werden.

## Klare Widersprüche und Textfehler

### T01 — Dave weiß von seiner Infektion und hält sie später angeblich für harmlos

- **Belege:** Z. 1205 und 2197.
- **Beobachtung:** Nach dem Werwolfkampf erkennt Dave grünes Blut und die
  beginnende Infektion. Er denkt resigniert über seine Zukunft als Werwolf nach.
  Bei der Verwandlung auf dem Turm heißt es später, er habe die Wunde zunächst
  für harmlos gehalten.
- **Bewertung:** Direkter Widerspruch bezüglich Daves Wissen. Beide Texte passen
  zur jeweiligen Szene; kein konkreter Hinweis auf eine vertauschte Textreferenz.
- **Korrekturrichtung:** Die befürchtete Verwandlung tritt jetzt tatsächlich ein.

### T02 — Tagebuchzusammenfassung nennt die falsche Abbruchstelle

- **Belege:** Zusammenfassung Z. 1993; tatsächlicher Schluss ab Z. 2155.
- **Beobachtung:** Laut Zusammenfassung enden die Aufzeichnungen bei Zargons
  Aufforderung, ihm zu dienen oder zu sterben. Der anschließend ausgegebene
  Tagebuchtext schildert danach noch die Verweigerung, das Massaker, die Suche
  nach Überlebenden und den geplanten Selbstmord des Turmwächters.
- **Bewertung:** Zusammenfassung und Volltext stimmen nicht überein. Denkbar sind
  unterschiedliche Textfassungen; deren Herkunft wurde nicht untersucht.
- **Korrekturrichtung:** Zusammenfassung an den tatsächlichen Schluss anpassen.

### T03 — Unverständlicher Code wird sofort zur nutzbaren Tresorkombination

- **Belege:** Papierbeschreibung Z. 2365; Anwendung am Tresor ab Z. 2384.
- **Beobachtung:** Die Zeichen auf dem Papier ergeben für Dave ausdrücklich
  keinen Sinn. Direkt danach erscheint „Codenummer (bei dir)“ in der Objektliste.
  `wende codenummer auf tresor` funktioniert ohne Entschlüsselungsschritt.
- **Bewertung:** Der beschriebene Wissensstand passt nicht zur freigeschalteten
  Handlung. Ein fehlendes Rätsel ist nicht bewiesen; ebenso könnte lediglich
  der Betrachtungstext falsch formuliert sein.
- **Korrekturrichtung:** Entweder die Kombination erkennbar machen oder den
  tatsächlich vorgesehenen Entschlüsselungsschritt prüfen.

### T04 — Treppenhaus nennt den falschen Nachbarraum

- **Beleg:** Beschreibung des oberen Treppenhauses Z. 1959; die protokollierten
  Wege führen zwischen Treppenhaus und Schloßgalerie.
- **Beobachtung:** Die Osttür soll laut Beschreibung in die Empfangshalle führen.
  Tatsächlich führt sie in die Schloßgalerie. Von dort liegt die Empfangshalle
  einen weiteren Schritt nach Süden.
- **Bewertung:** Eindeutiger Fehler der Wegbeschreibung, keine insgesamt fremde
  Raumbeschreibung.
- **Korrekturrichtung:** „Empfangshalle“ an dieser Stelle durch „Schloßgalerie“ ersetzen.

### T05 — Ebenholztür heißt in der Objektliste Eichentür

- **Belege:** Korridorbeschreibung Z. 2295; `betrachte eichentuer` Z. 2300.
- **Beobachtung:** Die Raumbeschreibung nennt eine schwarze Ebenholztür, die
  Objektliste und der Befehl dagegen eine Eichentür.
- **Bewertung:** Inkonsistente Benennung beziehungsweise Materialangabe. Aus dem
  Protokoll ist nicht bestimmbar, welche Benennung ursprünglich vorgesehen war.
- **Korrekturrichtung:** Raumtext und Objektname vereinheitlichen.

### T06 — Nur das Portal soll erhalten sein, aber das Schloss ist begehbar

- **Beleg:** Außenbeschreibung der Burgruine Z. 1601; nachfolgende Schlossräume.
- **Beobachtung:** Das Eintrittsportal wird als einzig erhaltener Teil bezeichnet.
  Anschließend sind Empfangshalle, Galerie, Hauptturm, Küche und Wohnräume
  zugänglich, teilweise mit kostbarer Einrichtung.
- **Bewertung:** Die absolute Aussage passt nicht zum beschriebenen Gebäude.
- **Korrekturrichtung:** Den äußeren Eindruck einer Ruine oder die erhaltene
  Außenbefestigung beschreiben, statt sämtliche anderen Gebäudeteile auszuschließen.

### T07 — Brief behandelt den bereits gefundenen Vertrag als ungelöstes Rätsel

- **Beleg:** Mylgors Brief Z. 2429; der Vertrag wurde zuvor aus dem Tresor genommen.
- **Beobachtung:** Der Erzähler erklärt das Fehlen des Vertrags im Briefumschlag
  weiterhin zum Mysterium, obwohl Dave den Vertrag bereits besitzt.
- **Bewertung:** Der Text berücksichtigt diese mögliche Reihenfolge nicht.
  Wörtlich ist der Umschlag tatsächlich leer; unpassend ist das daraus abgeleitete
  Unwissen.
- **Korrekturrichtung:** Bei bereits gefundenem Vertrag eine passende Textvariante verwenden.

## Verdächtige Zustands- und Ereignistexte

### T08 — Zargons Macht erlischt, bleibt aber anschließend wirksam

- **Belege:** Löschen des Purpurfeuers Z. 2455; Mysterium ab Z. 2599 und folgender Kampf.
- **Beobachtung:** Mit dem Purpurfeuer erlischt laut Text auch Zargons dunkle Macht.
  Danach verleiht ihm der Seelenkristall weiterhin seine unheilige Macht, und er
  versucht, Vasallen in sein Pentagramm zu rufen.
- **Bewertung:** Unklare Abgrenzung verschiedener Machtquellen. Kein Beweis, dass
  nach dem Löschen überhaupt keine Magie mehr möglich sein dürfte.
- **Korrekturrichtung:** Präzisieren, welchen Schutz oder welche Fähigkeit das
  Purpurfeuer tatsächlich gewährt.

### T09 — Warnung vor Mylgor läuft nach ausgelöster Explosion weiter

- **Belege:** `zerstoere reagenzien` ab Z. 1402; Warnung Z. 1405.
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

- **Beleg:** Zargons Begrüßung Z. 2603.
- **Beobachtung:** „Du hast Deine Aufgabe erfüllt“ passt nicht zum ursprünglichen
  Auftrag, Firon zu beseitigen. Dave hat Firon verschont, Mylgor besiegt, den
  Vertrag verbrannt und das Purpurfeuer gelöscht.
- **Bewertung:** Möglicher Dialog für einen anderen Auftragszustand. Eine solche
  Variante ist bislang nicht nachgewiesen. Auch Sarkasmus oder eine andere
  gemeinte Aufgabe wären möglich, werden im Text aber nicht deutlich.
- **Prüfschritt:** Verwendete Text-ID, Bedingungen der Begrüßung und alternative
  Zargon-Dialoge mit den Originaldaten vergleichen.

### T11 — Quelle verneint Trinkberechtigung vor erfolgreicher Heilung

- **Beleg:** Quellbeschreibung Z. 2731; kurz danach `wende wasser auf dave`.
- **Beobachtung:** Dave erfülle die Bedingungen zum Trinken ohnehin nicht.
  Anschließend trinkt er erfolgreich und wird vom Werwolffluch geheilt.
- **Bewertung:** Verdacht auf einen unpassenden Zustandstext, falls eine echte
  Spielbedingung gemeint ist. Der Satz kann allerdings auch ein Spott über die
  zuvor erwähnten „fleißigen (!) Abenteurer“ sein. Der durchgestrichene Hundekopf
  verstärkt die Mehrdeutigkeit des Hinweises.
- **Prüfschritt:** Mögliche Varianten vor und nach Infektion, Verwandlung und
  Heilung prüfen; Erzählerwitz und mechanische Bedingung auseinanderhalten.

## Plausibilitäts- und Vermittlungslücken

### T12 — Festgeketteter Kahn fährt ohne erwähntes Losmachen ab

- **Belege:** Festmachen Z. 1858; Rückfahrt Z. 1897.
- **Beobachtung:** Dave befestigt den Kahn mit einer Kette am Steg. Später reichen
  Einsteigen und `west`; beschrieben wird lediglich das Abstoßen vom Steg.
- **Bewertung:** Fehlender Handlungsschritt im Text, nicht zwingend ein Fehler der
  Spielmechanik. Automatisches Losmachen kann beabsichtigt sein.
- **Korrekturrichtung:** Das Losmachen im Abfahrtstext erwähnen.

### T13 — Stillgelegte Mine enthält ein laufendes Schmelzfeuer

- **Belege:** Stilllegung Z. 681; Feuer und geschmolzenes Silber Z. 689.
- **Beobachtung:** Die seit langer Zeit aufgegebene Mine enthält weiterhin eine
  Feuerstelle, die Silber flüssig hält. Eine Betreuung oder magische Ursache
  wird nicht genannt.
- **Bewertung:** Plausibilitätslücke, kein zwingender Widerspruch in einer Fantasywelt.
- **Korrekturrichtung:** Heimliche Nutzung oder eine dauerhafte magische Wärmequelle
  erklären, falls dies zur Originalgeschichte passt.

### T14 — Firons Exil und sein vorheriger Aufenthalt im Eispalast

- **Belege:** Richards Erzählung Z. 1189; Tagebucheintrag zum ersten Tag ab Z. 2001.
- **Beobachtung:** Firon soll bei Zargons Machtübernahme emigriert sein und sich im
  Eispalast verschanzt haben. Schon vor dem Umsturz besuchen königliche Kuriere
  ihn jedoch in seinem Palast in den Eisregionen.
- **Bewertung:** Missverständliche Vorgeschichte, kein gesicherter Widerspruch.
  Ein späterer Rückzug in eine bereits vorhandene Residenz würde beides vereinbaren.
- **Korrekturrichtung:** Gegebenenfalls diese zeitliche Abfolge verdeutlichen.

### T15 — Offene Särge werden nicht als offen beschrieben

- **Belege:** Gruftbeschreibung Z. 2585; `schliesse saerge` Z. 2590.
- **Beobachtung:** Rauch quillt aus Rissen der Sarkophage. Offene Deckel werden
  nicht erwähnt, trotzdem gelingt unmittelbar danach das Schließen der Särge.
- **Bewertung:** In der gezeigten Raumansicht fehlt der Hinweis für diese Handlung.
  Ob eine zusätzliche Objektbetrachtung ihn liefern würde, wurde nicht geprüft.
- **Korrekturrichtung:** Öffnungszustand in der Raum- oder Objektbeschreibung klar angeben.

### T16 — Rückkehr nach Schottland bleibt offen

- **Belege:** Bann auf dem Weltentor Z. 1189; Spielende Z. 2773.
- **Beobachtung:** Das Ende schildert die Befreiung des Landes und Daves Verlassen
  der Burg. Seine Heimkehr und die Aufhebung des Banns auf dem Weltentor werden
  nicht bestätigt.
- **Bewertung:** Offener Erzählfaden, kein nachgewiesener Fehler der Gewinnbedingung.
- **Korrekturrichtung:** Ein kurzer Ausblick auf die Heimkehr würde die
  Ausgangsgeschichte abschließen.

## Redaktionelle und fassungsspezifische Probleme

### T17 — Speicherempfehlungen bei nicht verfügbarer Speicherfunktion

- **Belege:** Einleitung Z. 20; Hinweise Z. 1505, 1527 und 2315.
- **Beobachtung:** Speichern und Laden sind laut Einleitung nicht verfügbar.
  Mehrere Spieltexte empfehlen dennoch ausdrücklich das Abspeichern.
- **Bewertung:** Unpassende Anweisung für die protokollierte Konsolenfassung.
  Daraus folgt kein Fehler des Originalspiels.
- **Korrekturrichtung:** Bei unveränderten Originaltexten die Einschränkung klar
  kenntlich machen; bei redaktioneller Anpassung die Hinweise passend formulieren.

### T18 — Bearbeitungsreste und viele Tippfehler im Tagebuch

- **Beleg:** Tagebuch ab Z. 2001.
- **Beobachtung:** Sichtbare Reste wie „(dies ist Zeile1)“ und eine isolierte Zeile
  „wg“. Daneben unter anderem „Jedocj“, „selbsr“, „gehaofft“, „akuern“ und „Famielien“.
- **Bewertung:** Unbereinigter Textbestand. Ob diese Fehler aus der Vorlage oder
  ihrer Übertragung stammen, ist ungeprüft.
- **Korrekturrichtung:** Gegen Originaldarstellung beziehungsweise Quelldokument
  abgleichen, bevor historische Originaltexte verändert werden.

### T19 — Weitere Schreib- und Benennungsfehler

- **Beispiele:** „Ostwad“ (Z. 1635), „Spritismus“ (Z. 2315), „Buthakönigs“
  (Z. 1775, sonst Butah), „auf auf“ (Z. 1959), „der der Körper“ (Z. 1205).
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

1. T09, T10 und T11 auf falsche Ereignisbedingungen oder Dialogvarianten prüfen,
   wenn die konkrete Frage nach falschen Textreferenzen geklärt werden soll.
2. T01 bis T07 gegen Originaltexte und den tatsächlichen Spielzustand abgleichen.
3. T08 und T12 bis T16 als Plausibilitäts- und Vermittlungsfragen behandeln,
   ohne daraus vorschnell Enginefehler abzuleiten.
4. T17 bis T19 im Rahmen einer ausdrücklich gewünschten Textbereinigung behandeln.

Diese Dokumentation hält Beobachtungen und offene Prüffragen fest. Sie nimmt
keine Änderungen an Spieltexten, Spielregeln oder Textreferenzen vor.
