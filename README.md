# Soul_Crystal

Reverse Engineering of the Game Soul Crystal

## Textkonsole

```sh
./build_console.sh
./build/soul-crystal
```

Erste spielbare Basis mit einkompilierten Texten, Intro, Verbliste und
zustandsabhängiger Objektliste. Keine Laufzeitdateien oder zusätzlichen Libraries.
Handbuchabfragen sind deaktiviert; die Teilübergänge laufen ohne Rückfrage weiter;
Speichern/Laden und Cheats sind nicht enthalten.
Details und Tests: [Konsolenanwendung](spec/C64/console_application.md).

Die vorhandene Komplettlösung dient als Grundlage für einen automatischen
[Replay-Runner](tests/replays/README.md):

```sh
./build/soul-replay tests/replays/part_a.replay
```

Die vollständige Hauptroute erreicht mit 393 Befehlen und 130 Prüfstellen den
Gewinn (5.010 Punkte). Nebenpfade sind noch nicht vollständig geprüft.

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

