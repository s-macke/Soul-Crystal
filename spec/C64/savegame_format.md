# C64: gespeicherter Spielzustand

Quelle: `opcodeoracle/soul_crystal/soul_crystal.asm` und die tatsächlichen
6502-Bytes in den vier Snapshots. Einstieg Speichern: $477B, Serializer: $5934.
Einstieg Laden: $4616, Deserializer: $56FD. Die Kommentare „metadata block“ bei
$56FD sind zu eng: Der Aufrufpfad und die Schreibzugriffe zeigen, dass die Routine
auch den Spielstand wiederherstellt.

## Exakte Nutzdatenfolge

Es werden **1.719 Bytes** serialisiert. 16-Bit-Werte sind little-endian.

| Streambereich | Inhalt | Größe |
| --- | --- | ---: |
| 0–1338 | Für jeden Index 1–103: sieben Raumwerte, danach sechs Objektbytes | 103 × 13 |
| 1339–1710 | Für jeden Objektindex 104–165: sechs Objektbytes | 62 × 6 |
| 1711 | `visited[0]` / $7027 | 1 |
| 1712 | aktueller Raum / $695D | 1 |
| 1713–1714 | Schritte / $698E–$698F | 2 |
| 1715–1716 | Punktestand / $698C–$698D | 2 |
| 1717 | Engine-Zustand $69BF (Bedeutung noch nicht abschließend benannt) | 1 |
| 1718 | Spielteil, aus der Sicherung $70CA des ursprünglichen $6963 | 1 |

Die sieben Raumwerte pro Index stehen in dieser Reihenfolge:

1. Nordausgang: $6DAA + Index
2. Ostausgang: $6EE2 + Index
3. Südausgang: $6E12 + Index
4. Westausgang: $6E7A + Index
5. Aufwärts: $6F4A + Index
6. Abwärts: $6FB2 + Index
7. Besuchsmarkierung: $7027 + Index

Die sechs Objektbytes pro Index stehen in dieser Reihenfolge:

1. Beschreibungs-/Text-ID: Wort bei $69C6 + 2×Index
2. Noch verfügbare Punkte: Wort bei $6B12 + 2×Index
3. Standort: Byte bei $6C5E + Index
4. Objektzustand: Byte bei $6D04 + Index

Die erste Schleife verschachtelt also Raum- und Objektinformationen mit demselben
Index; sie schreibt nicht erst alle Raumarrays und dann alle Objektarrays.
Die Objektroutine ist $5A9C, ihr Gegenstück beim Laden $582F.

## Umfang und ausgelassene Werte

Der globale Zustand benötigt Platz für **104 Raumindizes (0–103)** und
**166 Objektindizes (0–165)**. Nicht jeder dieser Indizes hat einen vorhandenen
symbolischen Enum-Namen.

Die Objektarrays werden nur für 1–165 gespeichert; ihre Einträge 0 nicht.
Die sechs Ausgangsarrays werden nur für 1–103 gespeichert; Index 0 nicht.
`visited[0]` wird hingegen separat angehängt. $69BF wird als einzelnes Byte
persistiert: Beim Laden wird $69C0 auf null gesetzt.

Nicht enthalten sind beispielsweise Parserbefehl, aktuelle Eingabeobjekte,
Scratch-Werte, ausstehende Text-ID, Bild-ID, Scriptcode oder die sieben
Script-Nachschlagetabellen. Auch die Snapshot-Datei als Ganzes ist kein Savegame.
Laden initialisiert bzw. rekonstruiert weiteren Engine-Zustand außerhalb dieser
Nutzdatenroutine.

## Puffer und Disk-I/O

$5B21 schreibt ein Byte in den Puffer $9500–$95FF. Bei 256 Bytes wird über $5BD8
und den Vektor $CB06 geschrieben; anschließend wird der Sektorparameter $6960
erhöht. Nach den letzten Nutzdaten wird nochmals ein kompletter Block geschrieben.
Damit entstehen **sieben 256-Byte-Blöcke = 1.792 Bytes**, davon **73 abschließende
Bytes ohne zusätzliche Zustandsfelder**. Der Rest des letzten Puffers wird hier
nicht eigens genullt und kann alte Pufferinhalte enthalten.

$58AA liest mit dem Gegenstück $5BCE/$CB03. $5B64 und $5903 behandeln die
little-endian Wörter. Der Save-Wrapper setzt $6963 vorübergehend auf null und
bewahrt den ursprünglichen Spielteil in $70CA auf; deshalb schreibt der Serializer
am Ende $70CA und nicht den vorübergehenden Wert $6963.

Die genaue Slot-/Spurzuordnung der Speicherdiskette und der vollständige
Lade-/Speicherdialog sind nicht Teil dieser Payload-Rekonstruktion. Es wird kein
gewöhnliches PRG-Dateiformat oder allgemeiner Dateikopf unterstellt.

## Verifikation

```sh
GO111MODULE=off go test -v ./src/Go/c64audit
```

`TestNativeSaveAndLoad` führt die Originalinstruktionen von $5934 und $56FD in
einem begrenzten Test-Harness aus. Nur die Laufzeit-FOR/NEXT-Deskriptoren und die
256-Byte-Diskoperationen werden abgefangen; die Serializer-/Deserializer-,
Wortkonvertierungs- und Pufferinstruktionen werden ausgeführt. Unbekannte Opcodes
führen zum Testfehler. Dies ist ausschließlich ein Testwerkzeug, keine Spiel-VM.

Alle vier Snapshots werden jeweils mit ihrem vorhandenen Zustand und zusätzlich
mit auffälligen Testwerten geprüft. Die Tests vergleichen die 1.719 Nutzbytes,
sieben Blockausgaben, native Wiederherstellung sowie das Nichtüberschreiben
ungespeicherter Index-0-Werte. Sie beweisen das Payload-Layout, nicht die vollständige
Interaktion mit einer echten Speicherdiskette.

## Konsequenz für Go

Die veränderlichen Arrays gehören in einen gemeinsamen `GameState`, der über
Spielteilwechsel erhalten bleibt. Die Nachschlagetabellen gehören dagegen in die
Spieldaten. Savegame und kompletter Laufzeitzustand sind nicht identisch: Ein
Serializer muss bewusst festlegen, welche Werte gespeichert und welche beim
Laden rekonstruiert werden.

Snapshot-Unterschiede sind zunächst gespielter Zustand, keine unterschiedlichen
Defaultwerte eines Spielteils. Der [kanonische Startzustand](initial_state.md) ist separat aus den
Initialdaten auf Disk B1 und der Originalroutine $569D gewonnen und geprüft.
