# Soul_Crystal

Reverse Engineering of the Game Soul Crystal

## Textkonsole

```sh
./build_console.sh
./build/soul-crystal --language de
./build/soul-crystal --language en
```

Deutsch (Standard) und die englische C64-Fanübersetzung verwenden dieselbe
Spiellogik. Spielbare Basis mit einkompilierten Texten, Intro, Verbliste und
zustandsabhängiger Objektliste. Keine Laufzeitdateien oder zusätzlichen Libraries.
Handbuchabfragen sind deaktiviert; die Teilübergänge laufen ohne Rückfrage weiter;
Speichern/Laden und Cheats sind nicht enthalten.
Details und Tests: [Konsolenanwendung](spec/C64/console_application.md).

Die vorhandene Komplettlösung dient als Grundlage für einen automatischen
[Replay-Runner](tests/replays/README.md):

```sh
./build/soul-replay tests/replays/part_a.replay
```

Die vollständige Hauptroute erreicht mit 597 Befehlen und 410 Prüfstellen den
Gewinn (5.010 Punkte). Zusätzlich gibt es `tests/replays/fast.replay` mit der
ursprünglichen 334-Befehle-Route sowie 46 eigenständige Todesfall-Replays.
`./check-replay.sh` prüft alle Läufe; `./check-replay-coverage.sh` misst ihre
kombinierte Skriptabdeckung. `./check-replay-texts.sh` listet tatsächlich
ausgegebene und noch fehlende Originaltexte. Ergebnisse und Grenzen:
[Abdeckungsbericht](spec/C64/replay_coverage.md).

## Webport (TypeScript, Vite und WebAssembly)

```sh
./build_wasm_docker.sh
npm ci --prefix web
npm run dev --prefix web
```

Spielbarer Browserport mit Amiga-HD-Bildern, deutscher/englischer Sprachwahl und
Symbolsteuerung. Der vorhandene C/C++-Kern wird im Dockerfile zu WebAssembly gebaut.
Ohne Musik und Spielstände. Details: [Webport](web/README.md).

## Frühere SPECIAL-Notizen


      3 SPECIAL(0x0001);    coderequest? passwortabfrage?
      4 SPECIAL(0x0002);    laden
      4 SPECIAL(0x0003);    speichern
      4 SPECIAL(0x0004);    neustart 
      4 SPECIAL(0x0005);    spielende
      4 SPECIAL(0x0006);    Loesung
      4 SPECIAL(0x0007);    Musik ein
      8 SPECIAL(0x0008);    Ausgaenge anzeigen
      4 SPECIAL(0x0009);    Diskette installieren
      4 SPECIAL(0x000a);    Inventar anzeigen
      1 SPECIAL(0x0032);    Der Code ist Ok Text
      1 SPECIAL(0x0033);    gewonnen: zeige das ende des spiels: danach hall of fame und dann credits
      4 SPECIAL(0x0064);    
      4 SPECIAL(0x0065);
      4 SPECIAL(0x0066);    // compares command variable
      4 SPECIAL(0x0067);
      1 SPECIAL(0x0068);    // compares room numbers
      1 SPECIAL(0x0069);
      1 SPECIAL(0x006a);
      1 SPECIAL(0x00c8);  // test: exgosub - 200

