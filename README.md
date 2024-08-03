# Soul_Crystal

Reverse Engineering of the Game Soul Crystal


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
      4 SPECIAL(0x0066);
      4 SPECIAL(0x0067);
      1 SPECIAL(0x0068);
      1 SPECIAL(0x0069);
      1 SPECIAL(0x006a);
      1 SPECIAL(0x00c8);  // test: exgosub - 200

```C
// Disk B1
//      ßx2ßß - 0x300 Huffmann tree
//      0x300 - 0x900 offset table
//      0x900 -       start of variable length entries
//            0 - 103   Room Names
//          104 - 311   text
//          312 - 330   images
//    0x13d00 - ???   story as compiled byte code (Basic?) (track 16, sector 2)
//    0x16500 -       disk directory (track 18, sector 0)
//
// Disk B2
//      ßx2ßß - 0x300 Huffmann tree
//      0x300 - 0x900 offset table
//      0x900 -       start of variable length entries
//            0 - 103   Room Names
//          104 - 447   text
//          448 - 476   images  (475 backward hopping in offset)
//          477 - 492   unknown
//      0x16500 -       disk directory (track 18, sector 0)
//      0x25800 - ???   story as compiled byte code (Basic?) (track 32, sector 4)
//
// Disk C1
//      ßx2ßß - 0x300 Huffmann tree
//      0x300 - 0x900 offset table
//      0x900 -       start of variable length entries
//            0 - 103   Room Names
//          104 - 290   text
//          291 - 311   images
//      0x15700 - ???   story as compiled byte code (Basic?) (track 17, sector 7)
//      0x16500 -       disk directory (track 18, sector 0)
//
// Disk C2
//      ßx2ßß - 0x300 Huffmann tree
//      0x300 - 0x900 offset table
//      0x900 -       start of variable length entries
//            0 - 103   Room Names
//          104 - 434   text
//          435 - 465   images  (465 backward hopping in offset)
//          466 - 486   unknown
//      0x16500 -       disk directory (track 18, sector 0)
//      0x26900 - ???   story as compiled byte code (Basic?) (track 33, sector 4)
```
