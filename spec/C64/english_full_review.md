# Vollständige Prüfung der englischen C64-Spielfassung

Stand: 2026-11-01. Alle 1486 Archivdatensätze wurden gelesen und gegen die
entsprechenden deutschen Datensätze verglichen, einschließlich Raumtiteln,
allgemeinen Reaktionen, Fehlertexten, ungenutzten Texten und technischen
Platzhaltern. Die Prüfung wurde auf drei Subagenten verteilt (A/C, B, D).

| Bereich | Geprüft | Geänderte Archivtexte |
| --- | ---: | ---: |
| B1 / Teil A | 312 | 179 |
| B2 / Teil B | 448 | 239 |
| C1 / Teil C | 291 | 172 |
| C2 / Teil D | 435 | 263 |

Zusätzlich geprüft: alle acht Intro-Seiten, sechs Tagebucheinträge, 165
Objektnamen, 42 Befehle, 60 Frontend-Beschriftungen und 50 Engine-Fragmente.
Intro und Tagebuch wurden anschließend von einem weiteren Subagenten
vollständig gegengelesen. Die vorhandenen Port-Meldungen wurden mitgeprüft;
englische CLI- und Symbolbezeichnungen wurden auf die üblichen Begriffe
`look`, `examine`, `drop`, `give`, `inventory` und `exits` vereinheitlicht.

## Konkrete Sinnkorrekturen

- **B1:262:** Das Einhorn warnt davor, nach Westen weiterzugehen; es empfiehlt
  diesen Weg nicht. Der Hinweis auf die fehlende Rückkehrmöglichkeit bleibt.
- **B1:184:** Der vollständige HELP-/VAX-Witz ist wieder verständlich; wörtlich
  übersetzte Redewendungen und beschädigte Satzteile sind berichtigt.
- **B2:251:** Der zuvor verkürzte Wolfsangriff ist wieder vollständig.
- **B2:356:** Richards Ermordung und die Trennung von Kopf und Körper erklären
  wieder, warum der Spieler beide Teile finden und zusammenbringen muss.
- **B2:316/367:** Das Elixier wirkt einen Spielzug. Eisenstufen in anderen
  Passagen sind feste Sprossen, keine mitgeführten Steigeisen.
- **C1:244:** Die Zombie-Anekdote des Eremiten ist eine sexuelle Anspielung,
  kein Kannibalismus. Der Hinweis auf Zargons Seele im Kristall bleibt erhalten.
- **C2:213/225:** Fehlende Ausgänge und ein falscher Stockwerksbezug korrigiert.
- **C2:325:** Das Schloss hat sieben Kombinationsstellen, nicht zwingend Ziffern.
- **C2:328:** Rätselhinweise erhalten, Reim zum Purpurfeuer sinngemäß übertragen.
- **C2:385:** Die Sterntaler-Anspielung mit Goldmünzen wird wieder verständlich.
- **Intro:** Dave plant die Party; seine Eltern feiern sie nicht. Sein
  Tatendrang ist in der Schulzeit ungewohnt. Er will seine Mutter nach der
  Ankunft informieren, nicht erst nach der Heimkehr.
- **Tagebuch:** Boten besuchen Firon; die Gegenstimmen zur Aufnahme Zargons,
  Simonas Einladung, die Türklinke nach oben und das abgebrochene Ende sind
  vollständig und sinngemäß erhalten.

## Technische Sicherung und Grenzen

Die redigierte Fassung liegt direkt unter `texts/C64_en/`. Unveränderte
Extraktionsbelege liegen unter `texts/C64_en/original/`; Diskimages und deutsche
Texte bleiben unverändert. Die Korrekturen werden beim Export angewendet und
als C-Strings einkompiliert. Kein Laufzeitzugriff auf JSON.

Text-IDs, Objekt-IDs, Text-Routing, Spiellogik und Spielstände ändern sich nicht.
Alte englische Befehle und Objektnamen bleiben Eingabe-Aliase. Gemeinsame Texte
wurden nur bei identischem deutschem Ausgangstext vereinheitlicht.

Validierung: native Disktexte und Bildschirmzeilen, redigierte JSON-Exporte,
einkompilierte C-Strings, Konsolentests sowie kompletter schneller und langer
Replay in beiden Sprachen mit identischem beobachtbarem Zustand nach jedem Zug.
Die redaktionelle Stilbewertung bleibt eine menschlich überprüfbare Entscheidung;
die maschinellen Tests prüfen Datenkonsistenz und Mechanik, nicht literarische Qualität.

Die separat laufende Videoproduktion und deren eingesprochene Texte wurden nicht
geändert. Neue Spieltexte ändern bestehende Videos daher nicht automatisch.

Abgeschlossene Prüfungen: Go-Text-/Disk-Tests, Konsolentests, 334 bzw. 597
Replay-Befehle je Sprachvergleich, Docker-WASM-Build, Web-Build und Web-Tests,
17 Testspielstände mit erfolgreicher Fortsetzung, WASM-Replay mit Save/Load nach
jedem spielbaren Befehl sowie 338 erfolgreich ausgelieferte PNG-URLs. Eine
abschließende Gegenprüfung aller 55 gegenüber dem Teil-B-Einzelreview abweichenden
gemeinsamen Formulierungen fand keine verlorenen Hinweise oder Sinnfehler.
