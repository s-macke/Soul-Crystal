> Update 2026-11-01: Die vollständige Überarbeitung steht in [english_full_review.md](english_full_review.md). Die hier zitierten ursprünglichen Wortlaute liegen jetzt unter `texts/C64_en/original/`.

# Prüfung der englischen C64-Fanübersetzung

Stand: 2026-10-25. Unabhängige Prüfung durch den beauftragten Subagenten,
anschließend als Befundbericht festgehalten. Die unten dokumentierten Fehler
sind inzwischen in der spielbaren englischen Fassung korrigiert. Die extrahierten
Originaltexte bleiben unverändert; siehe
[separate Korrekturliste](../../texts/C64_en/corrections.json).

## Ergebnis

Die Fanübersetzung ist grundsätzlich verständlich, enthält aber echte
Bedeutungsfehler und beschädigt einzelne Lösungshinweise. Die gemeinsame
Mechanik ist spielbar: schneller und langer Replay gewinnen in beiden
Sprachen mit gleichen beobachtbaren Zuständen. Das beweist jedoch nicht,
dass ein Mensch aus den englischen Hinweisen dieselben Schlüsse ziehen kann.

## Spielrelevante Befunde

Die Angaben B1/B2/C1/C2 beziehen sich auf Datensatznummern in
`texts/C64/*.json` und `texts/C64_en/*.json`, nicht logische Text-IDs.

| Priorität | Fundstelle | Fehler | Auswirkung |
| --- | --- | --- | --- |
| Hoch | Tagebuch, Tag 3 | „drückte die Türklinke **nach oben**“ wird zu „pushed the door handle“ | Die entscheidende Richtung fehlt. Hinunterdrücken führt laut C2:364 zur tödlichen Fallgrube. Der zusätzliche Hinweis auf die abgenutzte Unterseite bleibt in C2:303 erhalten. |
| Hoch | B2:316, B2:367 | Unsichtbarkeit „einen Zug lang“ wird zu „for one puff“, Schutz „für einen Zug“ zu „for one hit“ | Spielzug wird als Rauchzug beziehungsweise Treffer verstanden. Die Dauer des Hilfsmittels ist falsch erklärt. Beim Benutzen nennt B2:376 immerhin korrekt „after the next move you will be visible again“. |
| Mittel | Objekt 5, A2 Kette 2, $C2BD | „Ledersäckchen“ wird zu „Leather socks“ | Ein Beutel heißt auf Englisch Socken. ID und bestehendes Symbol `LEDERSOECKCHEN` bleiben unverändert. |
| Mittel | B2:335 | „schnell die Platte zu putzen, bevor jemand den Diebstahl bemerkt“ wird zu „clean this plate before anyone noticed the theft“ | Nach dem Pfeifendiebstahl scheint ein Teller gereinigt werden zu sollen; gemeint ist rasches Verschwinden. |
| Mittel | B1:121, 123, 206 | „abgeschlossen“ wird zu „finished“, „nicht abschließen“ zu „can't complete THIS“, „bereits abgeschlossen“ zu „already over“ | Rückmeldungen zum Verriegeln verlieren ihre Bedeutung. B1:122 verwendet außerdem „close“ statt „lock“. Wiederholungen in anderen Archiven wurden nicht alle einzeln abschließend geprüft. |
| Niedriger | B1:196, B2:336, B2:375 | Raucherpfeife wird zu „whistle“ | Verwechslung mit einer Trillerpfeife; andere Texte verwenden korrekt „pipe“. |

## Erzählung

- Tagebuch, Tag 2: Der deutsche Zweifel, ob Zargon Charakterfestigkeit und
  Weisheit besitzt, wird mit „but he also possesses …“ zur positiven Behauptung.
- Intro, Seite 4: Dave erwägt eine Party während der Abwesenheit seiner Eltern.
  Die Übersetzung lässt stattdessen die Eltern feiern und Dave zuhause sitzen.
- Intro, Seite 6: Ungewohnter Tatendrang wird zu früher vorhandener schulischer
  Energie; Seite 7 ersetzt eine geplante Ankunftsmeldung an die Mutter durch
  eine Erzählung nach der Heimkehr.
- Tagebuch, Tag 3: Im deutschen Text lädt Simona zum Treffen ein, im englischen
  Text geht die Einladung vom Turmwächter aus.

Das achtseitige Intro und alle sechs Tage des Tagebuchs sind vorhanden. Der
fehlende Hinweis „nach oben“ ist der wichtigste Tagebuchbefund.

## Herkunft und Prüfumfang

Die Archivbefunde liegen in der Fanübersetzung; es wurde dabei kein
Extraktionsfehler festgestellt. `TestEnglishCatalogs` dekodiert alle 1486
Datensätze direkt aus den englischen D64s und vergleicht Text und
Bildschirmzeilen mit den JSON-Katalogen. Die beiden genannten Tagebuchfehler
wurden zusätzlich durch erneute Textextraktion aus der beiliegenden PDF
`data/c64_en/Soul Crystal Walkthrough and Info.pdf` bestätigt. Das Intro wurde
aus originalen Bildschirmcodes gewonnen, ohne OCR.

Sprachlich geprüft wurden rund **440 unterschiedliche Spieltextkörper** mit
Schwerpunkt A–C und zusammengefassten gemeinsamen Wiederholungen, das komplette
Intro und Tagebuch sowie gezielte Objekt- und Part-D-Stichproben. Dies ist
**keine vollständige Prüfung aller 1486 englischen Datensätze** oder aller
Wiederholungsvarianten. Teil D wurde nicht systematisch vollständig geprüft.

Die Korrekturen sind mit Fundstelle, erwartetem Originalwortlaut und Begründung
separat dokumentiert. Wiederholungen der Verriegelungs- und Pfeifentexte wurden
in allen vier Archiven berücksichtigt; zusätzlich wurde derselbe Pfeifenfehler
beim Fährmann (C2:367) korrigiert. Dies ist keine neue Vollprüfung der bisher
nicht systematisch geprüften Texte. Die Spiellogik und IDs bleiben unverändert.
