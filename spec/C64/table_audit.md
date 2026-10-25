# C64-Tabellen: Grenzen, Herkunft und Spielzustand

Reproduzierbar mit:

```sh
GO111MODULE=off go run ./src/Go/c64audit
GO111MODULE=off go test -v ./src/Go/c64audit
```

Der Report `table_audit.json` enthält alle 28 Script-Tabellen, ihre 40 Leser,
Originaladressen, Datensatzbreiten, physische Ausdehnung, maximale Lesegröße,
SHA-256-Vergleiche und die elf veränderlichen Zustandsarrays. Der Auditor liest
die originalen D64-Sektorketten über den Root bei $0260 und prüft jeden Scriptbyte
gegen den jeweiligen Snapshot. Für alle vier Teile gilt vollständige Gleichheit.
Die Tabellengrenzen ergeben sich aus den nächsten Tabellenstarts bzw. dem $FF
am Scriptende; die Lesegrenzen werden unabhängig aus den Script-Schleifen geprüft.

## Ergebnis für alle sieben Script-Tabellenarten

| Tabelle | Struktur | Physische Einträge | Gelesen | Vergleich der vier Originaldisks |
| --- | --- | ---: | ---: | --- |
| TakeableObjects | Objekt-ID, 1 Byte | 40 | 40 | identisch |
| OpenCloseObjects | Objekt, Richtung, Zielraum, je 1 Byte | 27 | **28** | A/B/C gleich; D hat zwei abweichende Bytes |
| LockKeyPairs | Objekt, Schlüsselobjekt, je 1 Byte | 12 | 12 | identisch |
| LockingExceptions | Objekt-ID, 1 Byte | 7 | 7 | identisch |
| HelpResponses | Objekt-ID, Text-ID, je 16 Bit LE | 21 | 21 | identisch |
| DestroyResponses | Objekt-ID, Text-ID, je 16 Bit LE | 7 | 7 | identisch |
| TalkResponses | Objekt-ID, Text-ID, je 16 Bit LE | 15 | 15 | identisch |

Das nachfolgende $FF ist der Scriptabschluss, kein 16. Gesprächsdatensatz.
Es wird in keinem der vier Teile länger als Tabellenwert ausgegeben.
Mehrfeldrige Rohdatensätze stehen jetzt jeweils in einer eigenen Zeile.

### Reale Abweichung in Teil D

OpenCloseObjects, Datensatzindex 19 (20. Eintrag), Objekt $70 / PORTALTOR2:

- Teile A/B/C: `70 00 00`
- Teil D: `70 02 41`

Das ist kein gespielter Snapshot-Zustand: Die ursprünglichen D64-Dateien enthalten
bereits diese Werte. Deshalb dürfen nicht alle sieben Tabellen blind zu einer
identischen globalen Kopie zusammengelegt werden. Sechs Arten können zukünftig
als gemeinsame konstante Spieldaten modelliert werden; die siebte benötigt diese
belegte Variante. Die Präfixe PartA–PartD kennzeichnen derzeit die Herkunft.

### Native Überlappung bei Öffnen/Schließen

Alle acht Öffnen-/Schließen-Leser suchen 28 Tripel. Zwischen Tabellenstart und
LockKeyPairs liegen aber nur 81 Bytes, also 27 Tripel. Das Original liest als
28. Tripel die ersten drei Bytes von LockKeyPairs: **`10 11 30`**.

In diesem Kontext ist das Objekt $10 (KAHN), während $11 und $30 als Richtung
und Zielraum interpretiert werden, obwohl diese Bytes zur Schloss-/Schlüsselliste
gehören. Das wird hier nicht als beabsichtigte Spielregel behauptet.

Die alte getrennte C-Arrayausgabe hatte dadurch einen Zugriff außerhalb des Arrays.
Der Generator bildet nun eine 84-Byte-Leseansicht mit diesen drei Originalbytes
als ausdrücklich kommentiertem Kompatibilitätseintrag. Der originale Grenzwert
28 bleibt erhalten; eine Änderung auf 27 wäre eine Verhaltensänderung. Die separate
LockKeyPairs-Tabelle bleibt unverändert. Der Go-Test vergleicht sämtliche in `out/game_tables.c` erzeugten
Tabellenbytes einschließlich dieser Überlappung mit den Originaldisketten.

## Elf Arrays gehören tatsächlich zum globalen Spielzustand

| Arrays | Basisadressen | Native Kapazität je Array |
| --- | --- | ---: |
| objectDescriptionID, remainingPoints | $69C6, $6B12 | 166 Wörter |
| objectLocation, objectState | $6C5E, $6D04 | 166 Bytes |
| north, south, west, east, up, down | $6DAA, $6E12, $6E7A, $6EE2, $6F4A, $6FB2 | 104 Bytes |
| visited | $7027 | 104 Bytes |

Diese Arrays werden von der Engine und den Scripts verändert und vom
[Save-/Load-Pfad](savegame_format.md) übertragen. Sie sind kein separater
Initialzustand pro Spielteil. Ein VICE-Snapshot enthält bereits gespielten Zustand;
Unterschiede zwischen den Snapshot-Hashes sind **kein** Beleg für unterschiedliche
Defaults. Der Bericht kennzeichnet die Hashes entsprechend.

Das alte `src/C/tables.h` enthält noch 359 Werte pro Objektarray und nur 103
pro Raumarray. Die überschüssigen Objektwerte stammen aus einer zu großen
Speicherauslesung; bei den Räumen fehlt Index 103. Diese Legacy-Datendefinitionen
werden nicht mehr von der generierten C-Referenz eingebunden und wurden nicht
still durch Werte aus einem beliebigen gespielten Snapshot ersetzt.

Der gemeinsame C-Header deklariert nun feste Kapazitäten `ObjectStateCount = 166`
und `RoomStateCount = 104`. Die tatsächlichen
Startwerte stehen inzwischen in `out/game_state.c`, gewonnen aus dem
[Original-Initialisierungspfad](initial_state.md). Die alte Headerkopie ist
dafür keine autoritative Quelle.

Die Script-Nachschlagetabellen stehen außerhalb dieser Zustandsbereiche und
werden vom Save-Serializer nicht geschrieben. Gemeinsame Spieldaten, globaler
Laufzeitzustand und gespeicherter Teilzustand sind drei verschiedene Dinge.
