# Audit des C64-Bytecode-zu-C-Konverters

Ziel ist eine dokumentierte direkte Portierung von `out/part*.c` nach Go. Der
bestehende Konverter bleibt ein Werkzeug für die Quellanalyse; es wurde keine
neue Spiel-VM eingeführt.

## Text-IDs und Kommentare

Die 574 literalen Textzuweisungen enthalten die richtigen numerischen IDs aus
den Scripts. Falsch oder unvollständig waren häufig die Kommentare: Der
Konverter verwendete manuell hinterlegte Textarrays und kommentierte nur IDs
unter 256. Außerdem sollte eine Kommentar-ID nicht aus einem möglicherweise
symbolisch dargestellten C-Ausdruck zurückgerechnet werden.

Der Konverter liest die Zahlen jetzt unmittelbar aus den C0-/C1-Literalen.
Der Go-Textexport erzeugt aus denselben dekodierten Diskdaten sowohl die JSONs
als auch den festen Header `src/C/text_comments.generated.h`. `build.sh` ruft
ausschließlich den C++-Compiler auf; der Konverter benötigt keine JSON-Dateien
und keinen Go-Schritt beim Bauen. Jede
literale Textzuweisung nennt logische ID, Scriptadresse, Seite, Datensatzindex
und den zugehörigen Text. Dynamische Zuweisungen sind entsprechend markiert.

Vergleich der vorherigen Kommentare, mit vereinheitlichten Leerzeichen:

| Teil / Seite | Gleich | Abweichend | Fehlend | Sonderfall / auf Seite nicht verfügbar |
| --- | ---: | ---: | ---: | ---: |
| A / B1 | 68 | 6 | 6 | 6 |
| B / B2 | 58 | 57 | 75 | 19 |
| C / C1 | 0 | 62 | 30 | 6 |
| D / C2 | 61 | 11 | 101 | 8 |
| Summe | 187 | 136 | 212 | 39 |

„Abweichend“ umfasst auch Zeichensetzung; nicht jede Abweichung bedeutet eine
falsche Text-ID. Die maschinenlesbaren Vorher-/Nachher-Beispiele stehen in
`texts/C64/converter_audit.json`. Ein eindeutiger Fehltext war etwa ID 46 in
Teil C: Statt der Weigerung, den Ort nackt zu verlassen, stand dort ein anderer
Text. Die gemeinsame ID 46 verweist auf Datensatz 148.

17 originale Zuweisungen referenzieren IDs, die auf ihrer jeweiligen Seite vom
gewöhnlichen Ausgabepfad nicht angezeigt werden (A: 3, B: 1, C: 7, D: 6).
Die Kommentare nennen nun ausdrücklich `not displayed ... by $3F62`. Diese
Scriptwerte wurden nicht „korrigiert“: Es sind Originaldaten, und Erreichbarkeit
bzw. möglicher Seitenwechsel müssen anhand des Spielzustands bewertet werden.

## Tatsächlicher Fehler in der erzeugten Spiellogik

SELECT ($E2, Engine $2C65) beginnt seine Fallnummerierung bei **1**. Der Konverter
begann bei 0, wodurch sämtliche erzeugten `case`-Werte um eins verschoben waren.
Die 16 SELECT-Blöcke mit insgesamt 176 Fällen beginnen jetzt korrekt bei 1;
Zieladressen bleiben unverändert. Kommentare nennen die ursprüngliche Scriptadresse.

Bei SPECIAL-Aufrufen stand außerdem das Semikolon hinter einem `//`-Kommentar
und wurde dadurch auskommentiert. Es steht jetzt vor dem Kommentar.

## Prüfung und Grenzen

`TestConverterTextIDsAndSelectCases` vergleicht alle 574 literalen Textzuweisungen
mit den originalen Snapshotbytes (Variable, Literal, Zuweisungsopcode, ID und
JSON-Kommentar). Es prüft auch alle 176 SELECT-Zieladressen und Fallnummern.
Weitere Tests prüfen das native Routing und die vollständigen JSON-Archive;
siehe [Text-ID-Mapping](text_id_mapping.md).

Der Konverter lässt sich mit `bash build.sh` bauen und kann mit einem optionalen
Ausgabeverzeichnis ausgeführt werden. Die Änderungen an `out/part*.c` wurden
gezielt übernommen: Kommentare, SELECT-Fallnummern und SPECIAL-Semikolons.
Die zusätzlichen Nullbytes der vorhandenen Datentabelle in Teil A bleiben erhalten.

Dies ist keine vollständige Validierung des gesamten C-Konverters oder eines
spielbaren Go-Ports. Unbekannte Funktionen wie `unknown2`, Strukturierung des
Kontrollflusses und weitere Engine-Aufrufe benötigen weiterhin eigene Analyse.
Die erzeugten C-Dateien sind dokumentierte Portierungsgrundlage, kein hier
kompiliertes und vollständig getestetes eigenständiges Spiel.
