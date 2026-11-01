# Szenen (Cutscenes)

Vertonte Szenen mit den Amiga-HD-Bildern und den gemalten Story-Bildern aus
`images/Stories/`, die der Browser live abspielt: Bilder
mit langsamem Zoom und Schwenk, Überblendungen, Untertitel, Erzählstimme und die
Originalmusik. Es werden keine Videos gerendert.

Jede Szene entspricht genau einem Spieltext und soll im Spiel laufen, wenn dieser
Text erscheint. 35 Szenen in Spielreihenfolge (Liste mit Titeln in
`cutscenes/<lang>/index.json`):

| Erzähldatei | Szenen (ein Spieltext je Szene) | Im Spiel |
|---|---|---|
| `narration` | `intro` | vor Spielbeginn |
| `sage` | `sage` | Teil A, Eßzimmer, „sprich Dorfbewohner“ |
| `wasserfall` | `see`, `wasserfall`, `fremde_welt`, `ufer` | Teil A, See: west, nord, nord, ost |
| `einhorn` | `einhorn_kampf`, `einhorn_gerettet`, `kristallkugel` | Teil A, Lichtung; „hilf Einhorn“, „sprich Einhorn“ |
| `mylgor` | `mylgor_tuer`, `mylgor_vertrag`, `mylgor_kaminzimmer`, `mylgor_nacht`, `mylgor_auftrag` | Teil B, Mylgors Haus: Tür, Gespräch, Vertrag, Bett, Kaminzimmer |
| `firon` | `firon_thron`, `firon_prophezeiung`, `firon_schluessel` | Teil B, Firons Thronsaal, dreimal „sprich Firon“ |
| `jack` | `jack_geist`, `jack_auftrag` | Teil B, kleine Kapelle im Kloster: Gebet am Altar (Text 377), „sprich Jack“ (Text 356) |
| `richard` | `richard_erscheint`, `richard_geschichte`, `richard_bestimmung`, `richard_zauberspruch`, `richard_abschied` | Teil B, Königsgruft: Schädel auf das Skelett, viermal „sprich König“ |
| `werwolf` | `werwolf`, `werwolf_kampf` | Teil B, vor der Gruft; „wende Kurzschwert auf Werwolf“ |
| `mylgorende` | `mylgor_labor`, `mylgor_explosion`, `mylgor_ende` | Teil B, Geheimlabor; „zerstöre Reagenzien“, Labortür verriegeln |
| `burgtor` | `burgtor` | Teil C, unter dem Torbogen |
| `tagebuch` | `tagebuch` | Teil D, „lese Tagebuch“ |
| `vollmond` | `vollmond` | Teil D, Dach des Hauptturmes, „betrachte Vollmond“ |
| `ending` | `zargon`, `seelenkristall`, `zepter`, `quelle`, `gate` | Teil D: Zargons Mysterium, Kristall, Slot, Quelle, Portaltor |

## Erzeugen

```sh
python3 src/Python/cutscenes/make_cutscenes.py --lang de en   # alle Szenen
python3 src/Python/cutscenes/make_cutscenes.py mylgor_nacht    # eine Szene, Deutsch
python3 src/Python/cutscenes/make_cutscenes.py richard --lang en   # alle Szenen einer Datei
python3 src/Python/cutscenes/make_cutscenes.py intro \
    --voice 5KvpaGteYkNayiswuX2h --suffix helmut           # andere Stimme ausprobieren
```

Ergebnis pro Szene und Sprache: `cutscenes/<lang>/<szene>.json` und
`<szene>.mp3`, dazu `cutscenes/<lang>/index.json` mit allen Szenen in
Spielreihenfolge. Die MP3 enthält nur die Stimme (Mono, 48 kbit/s), still vor und
zwischen den Abschnitten; vor dem ersten Satz läuft also nur die Musik. Die
Musik (`music/Amiga/`) lädt der Player getrennt. Benötigt ffmpeg, ffprobe und
Pillow sowie `ELEVENLABS_API_KEY` in der Umgebung oder in der `.env`.

Jede Aufnahme wird mit Zeitstempeln unter `build/cutscenes/cache/<lang>/`
abgelegt. Der Schlüssel ist ein Hash aus Stimme, Modell, Einstellungen und Text;
nur geänderter Text kostet erneut Zeichen. Alle Szenen einer Erzähldatei werden
gemeinsam gesprochen (bis 5000 Zeichen je Aufnahme) und danach zwischen den
Abschnitten geschnitten; eine Szene allein zu exportieren kostet also nichts,
solange ihr Text unverändert ist. Die Generierung ist nicht
deterministisch: Der Cache ist die einzige Kopie einer gelungenen Aufnahme.

## Ansehen

```sh
python3 -m http.server   # im Repository
# http://localhost:8000/src/Python/cutscenes/player.html
```

`player.html` listet alle exportierten Szenen aus den `index.json` und spielt sie ab; Escape oder
„Überspringen“ beendet eine Szene. Eine Szene startet von selbst, sobald alles
geladen ist. Sie öffnet sich in derselben Seite, weil der Klick in der Liste
dem Browser den Ton erlaubt; nur wenn er Ton blockiert (Szenen-Adresse direkt
aufgerufen), erscheint ein Start-Knopf. `?t=cutscenes/de/intro.json&at=<Sekunden>`
zeigt ein einzelnes Bild ohne Ton. Der Player ist zugleich die Vorlage für den
Webport.

Zeitbalken (erscheint bei Mausbewegung): Ziehen springt, Leertaste pausiert,
Pfeiltasten springen 5 s zurück oder vor. Bild, Stimme und Untertitel folgen; die
Musik wird nie zurückgesetzt, sie pausiert nur mit der Szene. Die Stimme wird
dafür ganz in den Speicher geladen, so ist sie auch ohne HTTP-Range-Anfragen
spulbar. Das Spiel soll den Zeitbalken ebenfalls bekommen.

## Format

Das JSON enthält pro Bild Start, Ende und zwei Kamerarechtecke `from`/`to` in
Bildpixeln, zwischen denen linear interpoliert wird, das Fallgitter (`wipe`),
Überblend- und Schwarzblendzeiten, die Sprechabschnitte (`speech`), die Musik mit
Lautstärke, Ein-/Ausblendung und Absenkung unter der Stimme (`duck`), die
Untertitel als Text mit Zeiten und unter `images` jedes Bild einmal, als Pfad
unter `images/` ohne `.png` (`Amiga_HD/…` oder `Stories/…`; Version 3). Die Stimme
ist die Uhr; die Musik läuft unsynchronisiert in Schleife. Ein Player muß vor
dem Start alle Bilder laden und dekodieren und Stimme und Musik puffern, sonst
ruckelt es beim ersten Überblenden. Die genauen Regeln stehen in
`write_timeline()`.

Credits und Besetzung (`make_vorspann.py`) nutzen zusätzliche Felder: `voice` ist `null`
(die Uhr ist dann die Echtzeit), `music` ist eine Liste von Stücken mit eigenem
`start` und `end`, Bilder haben eigene `fadeIn`/`fadeOut` statt der Überblendung,
`frames` (Bildfolge mit `step` und `delay`) und `pixelated` (ohne Glättung), und
`loop` springt vom Ende zum Anfang der Schleife zurück, bis eine Taste oder ein
Klick ausblendet.

## Vorspann

`make_vorspann.py` baut den Vorspann des Amiga-Intros nach (`Code/Intro` auf
Disk 1), ohne Sprecher, als zwei Szenen für beide Sprachen: `credits.json`
(Logos, Titel, Credits-Tafeln) und `cast.json` (die Besetzung, endlos). Sie
stehen im Index vor allen anderen Szenen.

- Starbyte-Logo (6 s), dann startet `Credits.mp3`; ACA-Logo (8 s), Titelbild (4 s).
  Die gemalten Logos aus `images/Amiga_HD/Intro/logos/` haben Vorrang vor den Originalen.
- 15 Credits-Tafeln: erst die Überschriften, 1 s später die Namen, 4 s stehen,
  ausblenden. Die gemalten Tafeln aus `images/Amiga_HD/Intro/credits/` haben
  Vorrang vor den Originalen. Die Varianten nur mit Überschriften erzeugt das
  Skript: aus den HD-Tafeln in `images/Amiga_HD/Intro/credits-headings/` (die
  silbernen Namen haben kaum Farbsättigung und werden schwarz), aus den
  Originalen über die Palette in `images/Amiga/Disk 1/credits/`.
- Besetzung mit `Cast.mp3`: zwölf animierte Porträts über `Cast.PIC` in der
  Reihenfolge des Originals, ein Bild alle 0,14 s, endlos bis Taste oder Klick.
- Die Zeiten sind PAL-Bilder aus dem Code (Wartezeit +0x9c6, Blende +0xa9a);
  die Kopfzeile des Skripts nennt die Stellen.
- Logos und Credits-Tafeln sind die Originale ohne Glättung. Für die Besetzung
  nimmt das Skript die gemalten Bilder aus `images/Amiga_HD/Intro/`, wenn es sie
  gibt: Das Porträt liegt unter der transparenten Öffnung im Rahmen von
  `Cast.png`, die Kamera zoomt langsam hinein, und die Bildunterschrift ist Schrift
  (MedievalSharp) an der Stelle des Originals, englisch wie im Original („Kai
  Schulze / as / Brother Jack“), deutsch mit den Rollen aus den Spieltexten
  („Kai Schulze / als / Bruder Jack“). Die Zeiten bleiben die der Original-Animationen. Ohne die HD-Bilder
  laufen die Original-Animationen.

## Texte

- `narration_*.txt`: Vorgeschichte. Deutsch aus `texts/C64/story.txt`, Englisch
  aus `texts/C64_en/story.txt` mit korrigierten Tippfehlern; den Satz über die
  Party hat die C64-Übersetzung umgekehrt, er folgt dem deutschen Original.
- `sage_*.txt`: Deutsch aus dem Replay der Hauptroute, Englisch Text 260 aus
  `texts/C64_en/B1.md`.
- `richard_*.txt`: Deutsch aus dem Replay und Text 360 aus `texts/C64/B2.md`,
  Englisch Texte 384 und 357–360 aus `texts/C64_en/B2.md`.
- `wasserfall`, `einhorn`, `mylgor`, `firon`, `jack`, `werwolf`, `mylgorende`, `burgtor`,
  `tagebuch`, `vollmond`: Deutsch wörtlich aus `texts/C64/*.md`, Englisch aus
  denselben Textnummern in `texts/C64_en/`, für das Sprechen geglättet (die
  C64-Übersetzung ist stellenweise wörtlich und holprig). Reine Wegbeschreibungen
  („Du kannst … schwimmen“, „hier sind die Ausgänge …“) fehlen. Die Kopfzeile
  jeder Datei nennt die Textnummern.
- `ending_*.txt`: die letzten Spieltexte von Teil D; Deutsch aus dem Replay,
  Englisch Texte 254, 269, 379, 369 und 258 aus `texts/C64_en/C2.md`.
- Die alte Rechtschreibung des Spiels bleibt erhalten.
- `### <id> <Titel>` beginnt eine Szene, also einen Spieltext; deutsche und
  englische Datei müssen dieselben Szenen und Bilder haben.
- `## <Bild>` beginnt einen Abschnitt innerhalb der Szene. Namen ohne Pfad liegen in
  `images/Amiga_HD/Disk 1/`, `Stories/…` unter `images/Stories/`, alle anderen
  Pfade unter `images/Amiga_HD/`.
- `##+ <Bild>` wechselt das Bild mitten im Absatz: Der Text läuft ohne Pause weiter
  und wird mit einem Leerzeichen angehängt, die Anfrage an ElevenLabs bleibt also
  gleich und die Aufnahme kommt weiter aus dem Cache. Nur `focus=` ist erlaubt.
- `Stories/finale/gate-01` hat dieselbe Geometrie wie `Victory-000`, damit das
  Fallgitter (`Victory-015`) darüber paßt.
  `focus=x0,y0,x1,y1` begrenzt die Kamera auf einen Bildausschnitt (im englischen
  Intro bleibt so „DIE STORY“ außerhalb), `pause=<s>` ersetzt die Stille davor.
- Eckige Klammern wie `[sarcastic]` sind Regieanweisungen für `eleven_v3` und
  fehlen in den Untertiteln. Sie bleiben englisch, auch im deutschen Text.

## Stimmen und Musik

- Deutsch „Marcel – Friendly German Explainer“, Englisch „Lukas – Excited
  youthful young man“, jeweils `eleven_v3` mit Stabilität 0 („Creative“).
- Intro: 5 s Titelbild, sonst 2,5 s erstes Bild mit Musik allein, dann pro
  Abschnitt ein Bild, 0,7 s Pause vor jedem Abschnitt, 1,6 s Überblendung,
  5 s Ausklang.
- `gate`: Nach dem letzten Satz senkt sich wie in `Victory.ANIM` das Fallgitter:
  `Victory-015` („The End“) gleitet in 4 s von oben über `Victory-000`.
- `gate` hält nach „The End“ an (`hold`): Die Musik läuft weiter, bis eine Taste
  oder ein Klick die Ausblendung startet.
- Musik je Erzähldatei (`FILES` im Skript): Intro `Cast.mp3`; `ending` `16.mp3`,
  die `Endpart` (+0x268) direkt vor `Victory.ANIM` lädt. Alle anderen haben einen
  Platzhalter je Spielteil (A `02`, B `05`, C `04`, D `13`), bis die Musik des
  jeweiligen Raums bekannt ist.
