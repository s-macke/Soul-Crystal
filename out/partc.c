#include"src/tables.h"

unsigned char data0x8345[] = {0x03, 0x05, 0x11, 0x14, 0x15, 0x16, 0x17, 0x1f, 0x20, 0x22, 0x24, 0x2d, 0x3b, 0x3e, 0x47, 0x4b, 0x4d, 0x50, 0x52, 0x54, 0x5c, 0x64, 0x65, 0x68, 0x6b, 0x6c, 0x6e, 0x71, 0x75, 0x78, 0x7d, 0x7e, 0x7f, 0x85, 0x8e, 0x8f, 0x93, 0x94, 0x97, 0x99};

unsigned char data0x836d[] = {0x05, 0x07, 0x00, 0x06, 0x03, 0x54, 0x17, 0x07, 0x00, 0x1e, 0x00, 0x00, 0x2d, 0x07, 0x00, 0x30, 0x01, 0x05, 0x31, 0x02, 0x01, 0x32, 0x02, 0x13, 0x33, 0x07, 0x00, 0x35, 0x07, 0x00, 0x40, 0x01, 0x16, 0x41, 0x01, 0x2b, 0x42, 0x02, 0x26, 0x51, 0x01, 0x31, 0x57, 0x01, 0x51, 0x58, 0x02, 0x4f, 0x5a, 0x04, 0x11, 0x63, 0x01, 0x13, 0x6f, 0x01, 0x43, 0x70, 0x00, 0x00, 0x76, 0x00, 0x00, 0x77, 0x07, 0x00, 0x8b, 0x02, 0x21, 0x8c, 0x04, 0x50, 0x8d, 0x03, 0x4f, 0x9a, 0x07, 0x00, 0xa0, 0x03, 0x10};

unsigned char data0x83be[] = {0x10, 0x11, 0x30, 0x75, 0x31, 0x75, 0x41, 0x3b, 0x42, 0x3b, 0x51, 0x52, 0x57, 0x99, 0x58, 0x99, 0x6f, 0x54, 0x8b, 0x52, 0x8c, 0x4b, 0x8d, 0x4b};

unsigned char data0x83d6[] = {0x11, 0x3b, 0x4b, 0x52, 0x54, 0x75, 0x99};

unsigned char data0x83dd[] = {0xa3, 0x00, 0x52, 0x00, 0x4a, 0x00, 0x97, 0x00, 0x62, 0x00, 0x98, 0x00, 0x37, 0x00, 0x2a, 0x01, 0x5b, 0x00, 0x2d, 0x01, 0x1a, 0x00, 0x29, 0x01, 0x61, 0x00, 0x2e, 0x01, 0x7a, 0x00, 0x2f, 0x01, 0x3a, 0x00, 0x2b, 0x01, 0x4f, 0x00, 0x2c, 0x01, 0x4c, 0x00, 0x2c, 0x01, 0x83, 0x00, 0x2c, 0x01, 0x36, 0x00, 0x83, 0x01, 0xa2, 0x00, 0x31, 0x01, 0xa5, 0x00, 0x84, 0x01, 0x01, 0x00, 0x19, 0x02, 0x25, 0x00, 0x1a, 0x02, 0x38, 0x00, 0x1b, 0x02, 0x60, 0x00, 0x1c, 0x02, 0x84, 0x00, 0x1d, 0x02, 0xa4, 0x00, 0x1e, 0x02};

unsigned char data0x8431[] = {0x4a, 0x00, 0x7c, 0x00, 0x02, 0x00, 0xe8, 0x00, 0x4f, 0x00, 0xeb, 0x00, 0x4c, 0x00, 0xeb, 0x00, 0xa5, 0x00, 0x7a, 0x01, 0x01, 0x00, 0xc7, 0x01, 0x60, 0x00, 0xce, 0x01};

unsigned char data0x844d[] = {0x36, 0x00, 0x5b, 0x00, 0x37, 0x00, 0x38, 0x01, 0x5b, 0x00, 0x41, 0x01, 0x02, 0x00, 0x34, 0x01, 0x4c, 0x00, 0x5a, 0x00, 0x4f, 0x00, 0x5a, 0x00, 0x60, 0x00, 0x5a, 0x00, 0x83, 0x00, 0x5a, 0x00, 0x84, 0x00, 0x5a, 0x00, 0x85, 0x00, 0x5a, 0x00, 0x9f, 0x00, 0x5a, 0x00, 0xa5, 0x00, 0x5a, 0x00, 0x01, 0x00, 0x2a, 0x02, 0x25, 0x00, 0x2b, 0x02, 0xa4, 0x00, 0x2d, 0x02, 0xff};

void PartC_HandleUebersoulcrystal(); // Part C, script $7835; command 1 (UEBERSOULCRYSTAL), SELECT $76e7 case 1
void PartC_HandleKurztext(); // Part C, script $783a; command 2 (KURZTEXT), SELECT $76e7 case 2
void PartC_HandleCredits(); // Part C, script $784e; command 3 (CREDITS), SELECT $76e7 case 3
void PartC_HandleGrabe(); // Part C, script $7853; command 4 (GRABE), SELECT $76e7 case 4
void PartC_HandleHinunter(); // Part C, script $7858; command 5 (HINUNTER), SELECT $76e7 case 5
void PartC_HandleOst(); // Part C, script $7887; command 6 (OST), SELECT $76e7 case 6
void PartC_HandleAusgaenge(); // Part C, script $7903; command 7 (AUSGAENGE), SELECT $76e7 case 7
void PartC_HandleDisketteinstallieren(); // Part C, script $7907; command 8 (DISKETTEINSTALLIEREN), SELECT $76e7 case 8
void PartC_HandleInventar(); // Part C, script $790b; command 9 (INVENTAR), SELECT $76e7 case 9
void PartC_HandleSchau(); // Part C, script $790f; command 10 (SCHAU), SELECT $76e7 case 10
void PartC_HandleNord(); // Part C, script $7916; command 11 (NORD), SELECT $76e7 case 11
void PartC_HandleSpielende(); // Part C, script $7a40; command 12 (SPIELENDE), SELECT $76e7 case 12
void PartC_HandleNeustart(); // Part C, script $7a44; command 13 (NEUSTART), SELECT $76e7 case 13
void PartC_HandleLaden(); // Part C, script $7a48; command 14 (LADEN), SELECT $771f case 1
void PartC_HandlePunkte(); // Part C, script $7a4c; command 15 (PUNKTE), SELECT $771f case 2
void PartC_HandleLoesung(); // Part C, script $7a51; command 16 (LOESUNG), SELECT $771f case 3
void PartC_HandleMusikein(); // Part C, script $7a55; command 17 (MUSIKEIN), SELECT $771f case 4
void PartC_HandleAusgaenge12(); // Part C, script $7a5d; command 18 (AUSGAENGE12), SELECT $771f case 5
void PartC_HandleSued(); // Part C, script $7a65; command 19 (SUED), SELECT $771f case 6
void PartC_HandleSpeichern(); // Part C, script $7b36; command 20 (SPEICHERN), SELECT $771f case 7
void PartC_HandleHinauf(); // Part C, script $7b3a; command 21 (HINAUF), SELECT $771f case 8
void PartC_HandleAusfuehrlich(); // Part C, script $7b69; command 22 (AUSFUEHRLICH), SELECT $771f case 9
void PartC_HandleWarte(); // Part C, script $7b7d; command 23 (WARTE), SELECT $771f case 10
void PartC_HandleWest(); // Part C, script $7b82; command 24 (WEST), SELECT $771f case 11
void PartC_Sub_7bd9(); // Part C, script $7bd9; command 25 (NIX1), SELECT $771f case 12
void PartC_Sub_7bda(); // Part C, script $7bda; command 26 (NIX2), SELECT $771f case 13
void PartC_HandleSchliesse(); // Part C, script $7bdb; command 27 (SCHLIESSE), SELECT $7757 case 1
void PartC_HandleZerstoere(); // Part C, script $7c68; command 28 (ZERSTOERE), SELECT $7757 case 2
void PartC_HandleVerliere(); // Part C, script $7cb0; command 29 (VERLIERE), SELECT $7757 case 3
void PartC_HandleBetritt(); // Part C, script $7d31; command 30 (BETRITT), SELECT $7757 case 4
void PartC_HandleBetrachte(); // Part C, script $7d6d; command 31 (BETRACHTE), SELECT $7757 case 5
void PartC_HandleHilf(); // Part C, script $7de1; command 32 (HILF), SELECT $7757 case 6
void PartC_HandleVerlasse(); // Part C, script $7e13; command 33 (VERLASSE), SELECT $7757 case 7
void PartC_HandleBewege(); // Part C, script $7e49; command 34 (BEWEGE), SELECT $7757 case 8
void PartC_HandleOeffne(); // Part C, script $7e4e; command 35 (OEFFNE), SELECT $7757 case 9
void PartC_HandleZiehe(); // Part C, script $7f2c; command 36 (ZIEHE), SELECT $7757 case 10
void PartC_HandleDruecke(); // Part C, script $7f54; command 37 (DRUECKE), SELECT $7757 case 11
void PartC_HandleNimm(); // Part C, script $7f59; command 38 (NIMM), SELECT $7789 case 1
void PartC_HandleSprich(); // Part C, script $7fc2; command 39 (SPRICH), SELECT $7789 case 2
void PartC_HandleWende(); // Part C, script $803d; command 40 (WENDE), SELECT $7789 case 3
void PartC_HandleBefestige(); // Part C, script $81c6; command 41 (BEFESTIGE), SELECT $7789 case 4
void PartC_HandleGib(); // Part C, script $81cb; command 42 (GIB), SELECT $7789 case 5
void PartC_HandleVerriegele(); // Part C, script $81d0; command 43 (VERRIEGELE), SELECT $7789 case 6
void PartC_HandleEntriegele(); // Part C, script $8273; command 44 (ENTRIEGELE), SELECT $7789 case 7

unsigned short command; // $6986: Parsed command
unsigned short object1; // $6988: First parsed object
unsigned short object2; // $698a: Second parsed object
unsigned short currentRoom; // $695d: Current room
unsigned short diskSide; // $6963: Active side: B1=1, B2=2, C1=3, C2=4
unsigned short score; // $698c: Current score, including deductions
unsigned short steps; // $698e: Original step counter
unsigned short pendingTextID; // $6990: Logical message ID awaiting display
unsigned short temp; // $6992: Shared temporary value
unsigned short imageID; // $6994: Selected image ID
unsigned short scratch1; // $6996: Shared scratch value; meaning depends on routine
unsigned short scratch2; // $6998: Shared scratch value; meaning depends on routine
unsigned short scratch3; // $699a: Shared scratch value; meaning depends on routine
unsigned char *tableptr;
void SPECIAL(unsigned short x);
void showtext();
void Restart();
void ShowImage();
void Code2E5B();


void Execute() {

x7600:
    pendingTextID = 0x00; // text ID 0 (0x0000), script $7600: no text
    if ( command == HINUNTER || command == OST || command == NORD || command == SUED || command == HINAUF || command == WEST ) {
        if ( currentRoom != IM_DIENERSCHLAFZIMMER ) {
            SPECIAL(0x64); // Habe ich keine Kleidung an, vielleicht?
            if ( temp == 0x01 ) {
                pendingTextID = 0x2e; // text ID 46 (0x002e), script $7632: C1 record 148: Du erwartest doch nicht allen Ernstes von mir, daß ich diesen Ort NACKT verlasse, oder?
                goto x77a0;
            } else {
                SPECIAL(0x65);
                if ( temp == 0x01 ) {
                    objectState[DAVE] = 0x64;
                }
            }
        }
    }
    SPECIAL(0x66);
    if ( temp == 0x01 ) {
        SPECIAL(0x67);
        if ( temp == 0x01 ) {
            if ( diskSide == 0x01 ) {
            } else {
                if ( diskSide == 0x02 ) {
                } else {
                    if ( diskSide == 0x03 ) {
                        if ( currentRoom >= IN_EINEM_VERWUNSCHENEN_WALD1 && currentRoom <= VOR_ZARGONS_BURGRUINE || currentRoom == UNTER_DEM_TORBOGEN ) {
                            objectState[DAVE] = objectState[DAVE] - 0x01;
                        } else {
                            objectState[DAVE] = 0x64;
                        }
                    } else {
                        if ( diskSide == 0x04 ) {
                        }
                    }
                }
            }
            if ( objectState[DAVE] == 0x4b || objectState[DAVE] == 0x32 || objectState[DAVE] == 0x19 ) {
                pendingTextID = 0x30; // text ID 48 (0x0030), script $76b5: C1 record 150: Langsam fange ich an zu frieren! Es wird immer kälter hier, also sieh Dich langsam mal nach einem warmen Plätzchen um, wo wir in Ruhe die Nacht verbringen können!
                showtext();
                Restart();
                pendingTextID = 0x00; // text ID 0 (0x0000), script $76bb: no text
                goto x76e7;
            } else {
                if ( objectState[DAVE] <= 0x00 ) {
                    imageID = 0x81;
                    objectLocation[DAVE] = 0xff;
                    ShowImage();
                    pendingTextID = 0x31; // text ID 49 (0x0031), script $76d6: C1 record 151: Also, halte mir jetzt bitte nicht vor, daß ich Dich nicht gewarnt hätte - Du hast wirklich genug Zeit gehabt, um nach jemandem zu suchen, der Dir wärmere Kleidung hätte geben können - doch nun ist es endgültig zu spät: Du erfrierst, ohne auch nur die geringste Chance gehabt zu haben, das Spiel zu lösen! Schade eigentlich...
                    showtext();
                    Restart();
                    pendingTextID = 0x00; // text ID 0 (0x0000), script $76dc: no text
                    return;
                }
            }
        }
    }

x76e7:
    switch(command) { // SELECT script $76e7; original cases are 1-based
         case 1: PartC_HandleUebersoulcrystal(); break;
         case 2: PartC_HandleKurztext(); break;
         case 3: PartC_HandleCredits(); break;
         case 4: PartC_HandleGrabe(); break;
         case 5: PartC_HandleHinunter(); break;
         case 6: PartC_HandleOst(); break;
         case 7: PartC_HandleAusgaenge(); break;
         case 8: PartC_HandleDisketteinstallieren(); break;
         case 9: PartC_HandleInventar(); break;
         case 10: PartC_HandleSchau(); break;
         case 11: PartC_HandleNord(); break;
         case 12: PartC_HandleSpielende(); break;
         case 13: PartC_HandleNeustart(); break;
    }
    if ( pendingTextID != 0x00 ) {
        goto x77a0;
    }
    temp = command - NEUSTART;
    switch(temp) { // SELECT script $771f; original cases are 1-based
         case 1: PartC_HandleLaden(); break;
         case 2: PartC_HandlePunkte(); break;
         case 3: PartC_HandleLoesung(); break;
         case 4: PartC_HandleMusikein(); break;
         case 5: PartC_HandleAusgaenge12(); break;
         case 6: PartC_HandleSued(); break;
         case 7: PartC_HandleSpeichern(); break;
         case 8: PartC_HandleHinauf(); break;
         case 9: PartC_HandleAusfuehrlich(); break;
         case 10: PartC_HandleWarte(); break;
         case 11: PartC_HandleWest(); break;
         case 12: PartC_Sub_7bd9(); break;
         case 13: PartC_Sub_7bda(); break;
    }
    if ( pendingTextID != 0x00 ) {
        goto x77a0;
    }
    temp = command - NIX2;
    switch(temp) { // SELECT script $7757; original cases are 1-based
         case 1: PartC_HandleSchliesse(); break;
         case 2: PartC_HandleZerstoere(); break;
         case 3: PartC_HandleVerliere(); break;
         case 4: PartC_HandleBetritt(); break;
         case 5: PartC_HandleBetrachte(); break;
         case 6: PartC_HandleHilf(); break;
         case 7: PartC_HandleVerlasse(); break;
         case 8: PartC_HandleBewege(); break;
         case 9: PartC_HandleOeffne(); break;
         case 10: PartC_HandleZiehe(); break;
         case 11: PartC_HandleDruecke(); break;
    }
    if ( pendingTextID != 0x00 ) {
        goto x77a0;
    }
    temp = command - DRUECKE;
    switch(temp) { // SELECT script $7789; original cases are 1-based
         case 1: PartC_HandleNimm(); break;
         case 2: PartC_HandleSprich(); break;
         case 3: PartC_HandleWende(); break;
         case 4: PartC_HandleBefestige(); break;
         case 5: PartC_HandleGib(); break;
         case 6: PartC_HandleVerriegele(); break;
         case 7: PartC_HandleEntriegele(); break;
    }

x77a0:
    if ( objectLocation[DAVE] != 0xff ) {
        if ( diskSide == 0x02 ) {
        }
        if ( diskSide == 0x03 ) {
            if ( currentRoom == IM_TREIBSAND ) {
                showtext();
                Restart();
                objectLocation[DAVE] = 0xff;
            }
            if ( currentRoom == IM_MOOR2 ) {
                if ( objectState[0xa5] >= 0x03 ) {
                    if ( pendingTextID != 0x00 ) {
                        showtext();
                        Restart();
                    }
                    objectLocation[DAVE] = 0xff;
                    imageID = 0x84;
                    ShowImage();
                    pendingTextID = 0x0175; // text ID 373 (0x0175), script $77e6: C1 record 226: Tut mir leid: Du hattest wirklich eine reelle Chance gehabt, noch einmal mit dem Schrecken davonzukommen, aber leider hast Du mal wieder ein wenig zu lange gezögert: Glücklich zieht Dich der Zombie an Dich heran und schlägt voller Genuß seine Zähne in Dein junges, zartes Fleisch! Aber nicht verzweifeln: Immerhin bis Du einem echten Gourmet zum Opfer gefallen, und sicherlich werden einige Deiner schmackhaftesten Körperteile, wie Augen, Zunge, und ähnliche Delikatessen, in seine Vorratshöhle verfrachtet und eingemacht werden, da es einfach viel zu selten vorkommt, daß sich ein unglücklicher Abenteurer in diese Gegend verirrt, als daß man solch' fette Beute gleich an Ort und Stelle verzehren sollte...
                    showtext();
                    Restart();
                    return;
                }
            }
            if ( objectState[0xa5] > 0x00 && objectState[0xa5] < 0x05 ) {
                objectState[0xa5] = objectState[0xa5] + 0x01;
            }
        }
        if ( diskSide == 0x04 ) {
        }
    }
    if ( command != INVENTAR && command != AUSGAENGE && command != LADEN && command != SPEICHERN && command != DISKETTEINSTALLIEREN ) {
        steps = steps + 0x01;
    }

x7834:
    return;
}


void PartC_HandleUebersoulcrystal() { // Part C, script $7835; command 1 (UEBERSOULCRYSTAL), SELECT $76e7 case 1
    pendingTextID = 0x1b; // text ID 27 (0x001b), script $7835: C1 record 129: "Soul Crystal" V1.5, written from 1989 to 1992 by Avantgardistic Arts. (C) 1992 by Avantgardistic Arts, Hannover & Starbyte Software, Bochum. Dieses Adventure besitzt 103 Locations, mehr als 130 hochauflösende Farbgrafiken, ungefähr 320 KBytes Text und einen ca. 30-minütigen Soundtrack. Seine Programmentwicklung hat ingesamt 16 sog. "Mann-Jahre" in Anspruch genommen. Sei also bitte so fair und "spread the word - not the disk!" Sollte dies aber doch eine Raubkopie sein (obwohl das Programm geschützt war, und das bestimmt nicht ganz ohne Grund...), dann denke bitte auch mal über die ASDG-Philosophie "A program worth using is a program worth buying" nach - allein schon die Originalverpackung sowie die Handbücher sollten Dir das Geld wert sein. Viel Spaß beim Spielen von "Soul Crystal", und - ach ja: Soweit wir wissen, ist dies das erste Adventure, in das ein CHEATMODE implementiert wurde - also solltest Du Dir Mühe geben, ihn zu finden...
    return;
}


void PartC_HandleKurztext() { // Part C, script $783a; command 2 (KURZTEXT), SELECT $76e7 case 2
    if ( visited[RAUM_NULL] == 0x01 ) {
        visited[RAUM_NULL] = 0x00;
    }
    pendingTextID = 0x25; // text ID 37 (0x0025), script $7849: C1 record 139: "Kurzbeschreibungen" aktiviert. Die Beschreibungen der einzelnen Räume werden jetzt nur noch beim erstmaligen Betreten ausgegeben.
    return;
}


void PartC_HandleCredits() { // Part C, script $784e; command 3 (CREDITS), SELECT $76e7 case 3
    pendingTextID = 0x1c; // text ID 28 (0x001c), script $784e: C1 record 130: "Soul Crystal", V1.5, written from 1989 to 1992 by Avantgardistic Arts, (C) 1992 by Avantgardistic Arts, Hannover & Starbyte Software, Bochum. A.C.A sind: Chris Link (Spielkonzept, Gamedesign, Tools, Texte, Soundtrack und Effekte), Kai Schulze (Spielkonzept, Gamedesign, Intro- und Parser-Programmierung AMIGA, Tools), Michael Niemeyer (Intro-Programmierung C-64, Tools), Carsten Jendro (Kernal- und Parserprogrammierung C-64), Henrik Fisch (Kernal- und Introprogrammierung MS-DOS), Kjersten Waldheim (Parserprogrammierung MS-DOS), Oliver Brühl (Grafiken und Animationen AMIGA & MS-DOS) und Klaus Adamovsky (Graphiken C-64). Besonderer Dank gilt Johnny, der "bayrischen Forelle" - stellvertretend für all die Leute, die mitgeholfen haben, "Soul Crystal" zu dem zu machen, was Ihr jetzt in den Händen haltet, indem sie uns Unmengen wertvoller Tips, Hinweise und Denkanstöße gaben, und uns nach jedem Nervenzusammenbruch auf's Neue halfen, uns weiter an die Verwirklichung unserer größenwahnsinnigen Ideen zu setzen. Ohne sie wäre das Projekt "Soul Crystal" wahrscheinlich niemals über die Planungsphase hinausgekommen.
    return;
}


void PartC_HandleGrabe() { // Part C, script $7853; command 4 (GRABE), SELECT $76e7 case 4
    pendingTextID = 0x33; // text ID 51 (0x0033), script $7853: C1 record 153: Also, jetzt reicht's ja wohl! Als ob es nicht schon reichen würde, daß Du blind wie ein Maulwurf durch die Gegend rennst: Jetzt versuchst Du Dich auch noch artgerecht durchs Erdreich zu buddeln! Mal ganz ehrlich: Man kann es mit der Realitätstreue in Adventures auch übertreiben...
    return;
}


void PartC_HandleHinunter() { // Part C, script $7858; command 5 (HINUNTER), SELECT $76e7 case 5
    imageID = 0xff;
    if ( down[currentRoom] != 0x00 ) {
        currentRoom = down[currentRoom];
        objectLocation[DAVE] = currentRoom;
        Code2E5B();
        imageID = currentRoom;
    } else {
        if ( down[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7878: C1 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartC_HandleOst() { // Part C, script $7887; command 6 (OST), SELECT $76e7 case 6
    imageID = 0xff;
    if ( currentRoom == IM_MOOR1 ) {
        objectLocation[DAVE] = 0xff;
        imageID = 0x84;
        ShowImage();
        pendingTextID = 0x0176; // text ID 374 (0x0176), script $789c: C1 record 227: Es war ein tödlicher Fehler, nach Deiner Begegnung von vorhin wieder hierher zurückzukehren: Ein wahres Rudel Zombies steht bereits zu Deinem Empfang bereit und kommt mit langsamen, abgehackten Bewegungen und starrem Blick direkt auf Dich zu - an der Spitze der Zombie, dem Du gerade erst knapp entronnen bist! Dieses Mal hast Du Dich allerdings etwas besser unter Kontrolle, und Deine Reaktion ist um einiges schneller als vorhin: Blitzschnell wirbelst Du herum, nimmst die Beine in die Hand und rennst um Dein Leben, so schnell es Dir auf dem weichen Moorboden überhaupt möglich ist - und direkt in die ausgestreckten Arme eines weiteren Zombies, der wohl nicht so ganz kapiert hatte, was hier draußen überhaupt abging! Zu schade, wirklich - denn Deine Zeit war schon fast weltrekordverdächtig! Nichtsdestotrotz ist der Zombie hocherfreut, Deine Bekanntschaft zu machen, da er schon seit Wochen nicht mehr in den Genuß frischen Fleisches gekommen ist - und immer nur "Konservenabenteurer" zu fressen, die im Sumpf versunken sind, ist auf die Dauer auch für einen halbverwesten Zombiemagen eine etwas zu einseitige und ungesunde Ernährung! Nach einem kurzen Tischgebet schlägt er also dankbar seine Hauer in Dein Fleisch: "Verdammt! Wer hätte gedacht, daß diese brauen Stümpfe noch so scharf sein können...", ist Dein letzter Gedanke, bevor alles vor Deinen Augen verschwimmt...
        showtext();
        Restart();
        imageID = 0xff;
        goto x78fa;
    }
    if ( east[currentRoom] != 0x00 ) {
        currentRoom = east[currentRoom];
        objectLocation[DAVE] = currentRoom;
        Code2E5B();
        imageID = currentRoom;
    } else {
        if ( east[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $78c7: C1 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    if ( currentRoom == IN_EINEM_VERWUNSCHENEN_WALD2 ) {
        if ( objectLocation[AMULETT] == 0xff && objectState[AMULETT] == 0x01 ) {
            ShowImage();
            showtext();
            Restart();
            imageID = 0xff;
            pendingTextID = 0x0178; // text ID 376 (0x0178), script $78e9: C1 record 229: Während Du unter den toten Bäumen entlangwanderst, fühlst Du plötzlich, wie etwas brutal an Deinem Hals zerrt! Zu Tode erschrocken versuchst Du, Deinen unsichtbaren Gegner abzuschütteln und wirfst Dich hin und her, bis er schließlich von Dir abläßt - und Du Dich kaum beherrschen kannst, nicht in hysterisches Gelächter auszubrechen: Dein "Gegner" war lediglich Dein Amulett, das sich von Dir unbemerkt in einem der Äste verfangen hatte und nun wie zum Hohn von einem der Bäume herunterbaumelt...
            showtext();
            objectLocation[AMULETT] = IN_EINEM_VERWUNSCHENEN_WALD2;
            goto x78fa;
        }
    }

x78fa:
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartC_HandleAusgaenge() { // Part C, script $7903; command 7 (AUSGAENGE), SELECT $76e7 case 7
    SPECIAL(0x08); // Ausgaenge listen
    return;
}


void PartC_HandleDisketteinstallieren() { // Part C, script $7907; command 8 (DISKETTEINSTALLIEREN), SELECT $76e7 case 8
    SPECIAL(0x09); // Diskette installieren
    return;
}


void PartC_HandleInventar() { // Part C, script $790b; command 9 (INVENTAR), SELECT $76e7 case 9
    SPECIAL(0x0a); // Inventar anzeigen
    return;
}


void PartC_HandleSchau() { // Part C, script $790f; command 10 (SCHAU), SELECT $76e7 case 10
    visited[currentRoom] = 0x00;
    Code2E5B();
    return;
}


void PartC_HandleNord() { // Part C, script $7916; command 11 (NORD), SELECT $76e7 case 11
    imageID = 0xff;
    if ( currentRoom == AM_UFER_EINES_SUMPFIGEN_SEES && objectState[BOOT] == 0x00 ) {
        imageID = 0x83;
        objectLocation[DAVE] = 0xff;
        ShowImage();
        pendingTextID = 0x0173; // text ID 371 (0x0173), script $7932: C1 record 224: Hmmm...: Mir ist zwar durchaus bekannt, daß es Leute gibt, die ein Moorbad aufgrund seiner gesundheitsfördernden Wirkungen sehr zu schätzen wissen, aber dies hier ist ein tiefer Sumpf - nicht bloß irgendein harmloses, kleines Moor! Hilflos sinkst Du also bis auf den Grund des Sumpfsees hinab, um dort für alle Ewigkeiten konserviert zu werden. Tja, also ich glaube trotzdem, eine Konservierung durch die "Speichern"-Funktion wäre Deiner Gesundheit zuträglicher gewesen, meinst Du nicht...?
        showtext();
        Restart();
        imageID = 0xff;
        goto x7a37;
    } else {
        if ( currentRoom == AM_UFER_EINES_SUMPFIGEN_SEES && objectState[BOOT] == 0x01 ) {
            objectLocation[BOOT] = IM_SUMPFSEE;
        }
    }
    if ( currentRoom == IM_SUMPFSEE && objectState[BOOT] == 0x01 ) {
        objectLocation[BOOT] = AM_UFER_DES_SUMPFIGEN_SEES;
    } else {
        if ( currentRoom == AM_UFER_DES_SUMPFIGEN_SEES && objectState[BOOT] == 0x01 ) {
            pendingTextID = 0x1a; // text ID 26 (0x001a), script $7977: C1 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
            goto x7a37;
        }
    }
    if ( currentRoom == VOR_ZARGONS_BURGRUINE ) {
        if ( objectState[ZIEGELSTEIN] != 0x01 ) {
            imageID = 0x85;
            objectLocation[DAVE] = 0xff;
            ShowImage();
            pendingTextID = 0x0179; // text ID 377 (0x0179), script $7999: C1 record 230: Okay, sagen wir: Es war ein Versuch - und reden wir nicht weiter darüber, denn sonderlich erfolgreich war er nicht, wie Du schmerzhaft erfahren mußt: Bevor Du auch nur die geringste Chance bekommst, unter dem Portalbogen hindurchschlüpfen zu können, hörst Du etwas von oben herunterrasseln... Naja gut, fassen wir uns ausnahmsweise mal kurz und erzählen Dir einfach, was Dich mal wieder aus dieser schnöden Welt hinweggerafft hat: Das Fallgitter, das Du aktiviert hast, indem Du auf die kleine Plattform darunter getreten bist, hat Dich mit einem einzigen, schweren Schlag erschlagen! Du bist tot - ja, wirklich: Das ist unser voller Ernst! Du bist abgekratzt, hast den Löffel aus der Hand gelegt, ins Gras gebissen, kurz: Du bist weg! Beklag' Dich jetzt bitte nicht bei uns: Hättest Du ein wenig aufmerksamer auf Deine Umgebung geachtet, so wäre Dir die kleine Plattform unter dem Gitter wohl nicht entgangen! Siehst Du? Also ist es wohl eher Deine als unsere Schuld, wenn Du mal wieder von vorn anfangen darfst! Was, das glaubst Du nicht? Naja, irgendwie kann ich Dich ja verstehen: Du hast echt nicht den geringsten Grund dazu - aber vielleicht kann Dich dies hier ja überzeugen...:
            showtext();
            Restart();
            imageID = 0xff;
            goto x7a37;
        }
    }
    if ( currentRoom == UNTER_DEM_TORBOGEN && north[UNTER_DEM_TORBOGEN] != 0x00 ) {
        pendingTextID = 0x018b; // text ID 395 (0x018b), script $79b6: C1 record 248: Es ist wieder einmal soweit: "Hi. Hier sind die A.C.A-Götter...", hörst Du ein paar Stimmen von unendlicher Güte aus dem Himmel zu Dir herunterschallen. "Weiß der Geier, wie Du es geschafft hast, zwei unserer nervtötenden Codeabfragen zu überstehen - aber diesmal bist Du endlich fällig...!"
        showtext();
        Restart();
        SPECIAL(0x01); // Codeabfrage
        showtext();
        Restart();
        pendingTextID = 0x01b4; // text ID 436 (0x01b4), script $79c2: not displayed on C1 by $3F62
        imageID = 0xff;
        objectLocation[DAVE] = currentRoom;
        goto x7a37;
    }
    if ( north[currentRoom] != 0x00 ) {
        currentRoom = north[currentRoom];
        Code2E5B();
        objectLocation[DAVE] = currentRoom;
        imageID = currentRoom;
    } else {
        if ( north[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $79f0: C1 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    temp = 0x01;

x79fa:
    temp = temp + 0x01;
    if ( temp <= 0xa5 ) {
        goto x79fa;
    }
    if ( currentRoom == IM_MOOR2 ) {
        if ( objectState[0xa5] == 0x00 ) {
            ShowImage();
            showtext();
            imageID = currentRoom;
            Restart();
            imageID = 0xff;
            objectLocation[0xa5] = IM_MOOR2;
            objectState[0xa5] = 0x01;
            pendingTextID = 0x0174; // text ID 372 (0x0174), script $7a2d: C1 record 225: Nach wenigen Metern hältst Du inne und horchst noch einmal in die trügerische Stille hinein: Nein, es war tatsächlich keine Einbildung - da sind tatsächlich Geräusche, die sich unangenehm von dem stetigen Blubbern des Moorbodens abheben! Schritte nähern sich Dir von hinten, werden lauter und lauter - langsam, aber unaufhaltsam... Erschrocken wirbelst Du herum, kannst aber nichts als dichte, waberndende Nebelschwaden erkennen, die sich zu grotesken, Dich für Deine Furcht verhöhnenden Fratzen verziehen... Plötzlich jedoch begint der Boden neben Dir zu brodeln und Blasen zu schlagen, als ob er kochte - und dann taucht das grausig entstellte Gesicht eines halbverwesten Leichnams aus der Tiefe auf! Starr vor Entsetzen und unfähig, Deinen Blick von dem grauenerregenden Schauspiel abzuwenden, mußt Du zusehen, wie sich ein Zombie aus den Tiefen des Moores erhebt! Im selben Moment, in dem Du wieder die Kontrolle über Dich selbst erlangst, schießen seine krallenbewehrten Klauen auch schon auf Deine Kehle zu! Du weißt nicht wie, aber irgendwie wirfst Du Dich noch einmal mit aller Kraft zur Seite und entgehst so dem sicheren Tod! Allerdings strauchelst Du bei Deiner Parade und landest unsanft im Matsch! Nun scheint der Schwarzblüter endlich gewonnen zu haben: Während Du Dich krampfhaft bemühst, wieder auf Die Beine zu kommen, nähert er sich Dir zischend und fauchend: Als er auf Dich zuwankt, klappen seine Kiefer mit einem knarrenden Laut auf und zu und entblößen seine widerlich-braunen Zahnstümpfe...
            goto x7a37;
        }
    }

x7a37:
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartC_HandleSpielende() { // Part C, script $7a40; command 12 (SPIELENDE), SELECT $76e7 case 12
    SPECIAL(0x05); // Spielende
    return;
}


void PartC_HandleNeustart() { // Part C, script $7a44; command 13 (NEUSTART), SELECT $76e7 case 13
    SPECIAL(0x04); // Neustart
    return;
}


void PartC_HandleLaden() { // Part C, script $7a48; command 14 (LADEN), SELECT $771f case 1
    SPECIAL(0x02); // Laden
    return;
}


void PartC_HandlePunkte() { // Part C, script $7a4c; command 15 (PUNKTE), SELECT $771f case 2
    pendingTextID = 0x01; // text ID 1 (0x0001), script $7a4c: engine $5D94: Score message assembled by the engine.
    return;
}


void PartC_HandleLoesung() { // Part C, script $7a51; command 16 (LOESUNG), SELECT $771f case 3
    SPECIAL(0x06); // Loesung
    return;
}


void PartC_HandleMusikein() { // Part C, script $7a55; command 17 (MUSIKEIN), SELECT $771f case 4
    temp = 0x00;
    SPECIAL(0x07); // Musik ein
    return;
}


void PartC_HandleAusgaenge12() { // Part C, script $7a5d; command 18 (AUSGAENGE12), SELECT $771f case 5
    temp = 0x01;
    SPECIAL(0x08); // Ausgaenge listen
    return;
}


void PartC_HandleSued() { // Part C, script $7a65; command 19 (SUED), SELECT $771f case 6
    imageID = 0xff;
    if ( currentRoom == IN_EINEM_VERWUNSCHENEN_WALD1 ) {
        if ( objectLocation[AMULETT] == 0xff && objectState[AMULETT] == 0x01 ) {
            imageID = 0x82;
            objectLocation[DAVE] = 0xff;
            ShowImage();
            pendingTextID = 0x0177; // text ID 375 (0x0177), script $7a89: C1 record 228: Während Du Dich auf den Rückweg aus dem verwunschenen Wald nach Süden machst, verfängt sich das Amulett, das Dich auf dem Hinweg durch die magische Barriere vor ihrer zerstörerischen Kraft beschützt hatte, in einem der abgestorbenen Äste: Ohne, daß Du es bemerkst, löst es sich von Deinem Hals, so daß Du - nichts Böses ahnend - frohen Mutes die Grenze zwischen den beiden Waldabschnitten durchschreitest und die andere Seite der magischen Wand zwar knackig braun, aber leider auch ziemlich tot erreichst...
            showtext();
            imageID = 0xff;
            Restart();
            imageID = 0xff;
            goto x7b2d;
        } else {
            pendingTextID = 0x2f; // text ID 47 (0x002f), script $7a9c: C1 record 149: Mutig versuchst Du Dein Glück, wirst jedoch von einer unsichtbaren Faust zurückgeschmettert. Es ist, als liefest Du gegen eine Wand: Irgendwie scheint Dich eine unfaßbar böse Macht von dort fernzuhalten! Deprimiert gibst Du nach einigen fehlgeschlagenen Versuchen auf...
            goto x7b2d;
        }
    }
    if ( currentRoom == AM_UFER_DES_SUMPFIGEN_SEES && objectState[BOOT] == 0x00 ) {
        imageID = 0x83;
        objectLocation[DAVE] = 0xff;
        ShowImage();
        pendingTextID = 0x0173; // text ID 371 (0x0173), script $7abd: C1 record 224: Hmmm...: Mir ist zwar durchaus bekannt, daß es Leute gibt, die ein Moorbad aufgrund seiner gesundheitsfördernden Wirkungen sehr zu schätzen wissen, aber dies hier ist ein tiefer Sumpf - nicht bloß irgendein harmloses, kleines Moor! Hilflos sinkst Du also bis auf den Grund des Sumpfsees hinab, um dort für alle Ewigkeiten konserviert zu werden. Tja, also ich glaube trotzdem, eine Konservierung durch die "Speichern"-Funktion wäre Deiner Gesundheit zuträglicher gewesen, meinst Du nicht...?
        showtext();
        Restart();
        imageID = 0xff;
        goto x7b2d;
    } else {
        if ( currentRoom == AM_UFER_DES_SUMPFIGEN_SEES && objectState[BOOT] == 0x01 ) {
            objectLocation[BOOT] = IM_SUMPFSEE;
        }
    }
    if ( currentRoom == IM_SUMPFSEE && objectState[BOOT] == 0x01 ) {
        objectLocation[BOOT] = AM_UFER_EINES_SUMPFIGEN_SEES;
    } else {
        if ( currentRoom == AM_UFER_EINES_SUMPFIGEN_SEES && objectState[BOOT] == 0x01 ) {
            pendingTextID = 0x1a; // text ID 26 (0x001a), script $7b02: C1 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
            goto x7b2d;
        }
    }
    if ( south[currentRoom] != 0x00 ) {
        currentRoom = south[currentRoom];
        Code2E5B();
        objectLocation[DAVE] = currentRoom;
        imageID = currentRoom;
    } else {
        if ( south[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7b27: C1 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }

x7b2d:
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartC_HandleSpeichern() { // Part C, script $7b36; command 20 (SPEICHERN), SELECT $771f case 7
    SPECIAL(0x03); // Speichern
    return;
}


void PartC_HandleHinauf() { // Part C, script $7b3a; command 21 (HINAUF), SELECT $771f case 8
    imageID = 0xff;
    if ( up[currentRoom] != 0x00 ) {
        currentRoom = up[currentRoom];
        Code2E5B();
        objectLocation[DAVE] = currentRoom;
        imageID = currentRoom;
    } else {
        if ( up[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7b5a: C1 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartC_HandleAusfuehrlich() { // Part C, script $7b69; command 22 (AUSFUEHRLICH), SELECT $771f case 9
    if ( visited[RAUM_NULL] == 0x00 ) {
        visited[RAUM_NULL] = 0x01;
    }
    pendingTextID = 0x24; // text ID 36 (0x0024), script $7b78: C1 record 138: "Ausführliche Beschreibungen" aktiviert. Zu jedem Raum, den Du von nun an betrittst, wird die vollständige Beschreibung geliefert, ganz gleich, ob Du ihn schon betreten hast oder nicht.
    return;
}


void PartC_HandleWarte() { // Part C, script $7b7d; command 23 (WARTE), SELECT $771f case 10
    pendingTextID = 0x36; // text ID 54 (0x0036), script $7b7d: C1 record 156: Die Zeit verstreicht wie der Lauf der Sonne: Langsam, aber unaufhaltsam...
    return;
}


void PartC_HandleWest() { // Part C, script $7b82; command 24 (WEST), SELECT $771f case 11
    imageID = 0xff;
    if ( currentRoom == AM_UFER_DES_SUMPFIGEN_SEES && objectState[BOOT] == 0x01 ) {
        pendingTextID = 0x1a; // text ID 26 (0x001a), script $7b93: C1 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
        return;
    }
    if ( west[currentRoom] != 0x00 ) {
        currentRoom = west[currentRoom];
        objectLocation[DAVE] = currentRoom;
        Code2E5B();
        imageID = currentRoom;
    } else {
        if ( west[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7bb7: C1 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    temp = 0x01;

x7bc1:
    temp = temp + 0x01;
    if ( temp <= 0xa5 ) {
        goto x7bc1;
    }
    if ( imageID != 0xff ) {
        ShowImage();
    }

x7bd8:
    return;
}


void PartC_Sub_7bd9() { // Part C, script $7bd9; command 25 (NIX1), SELECT $771f case 12
    return;
}


void PartC_Sub_7bda() { // Part C, script $7bda; command 26 (NIX2), SELECT $771f case 13
    return;
}


void PartC_HandleSchliesse() { // Part C, script $7bdb; command 27 (SCHLIESSE), SELECT $7757 case 1
    tableptr = data0x836d;
    temp = 0x01;

x7be2:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    scratch2 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x7c00;
    }
    temp = temp + 0x01;
    if ( temp <= 0x1c ) {
        goto x7be2;
    }

x7c00:
    if ( temp > 0x1c ) {
        pendingTextID = 0x07; // text ID 7 (0x0007), script $7c06: C1 record 109: Aber das kannst Du doch überhaupt nicht schließen!
        return;
    }
    if ( objectState[object1] == 0x02 || objectState[object1] == 0x00 ) {
        pendingTextID = 0x3a; // text ID 58 (0x003a), script $7c1b: C1 record 160: Wie willst Du denn etwas Geschlossenes noch schließen?
        return;
    }
    if ( objectState[object1] == 0x01 ) {
        objectState[object1] = 0x02;
        pendingTextID = 0x06; // text ID 6 (0x0006), script $7c2f: C1 record 108: Gut - geschlossen...
        if ( scratch3 == 0x01 ) {
            north[currentRoom] = 0x00;
        } else {
            if ( scratch3 == 0x02 ) {
                south[currentRoom] = 0x00;
            } else {
                if ( scratch3 == 0x03 ) {
                    west[currentRoom] = 0x00;
                } else {
                    if ( scratch3 == 0x04 ) {
                        east[currentRoom] = 0x00;
                    }
                }
            }
        }
    }

x7c67:
    return;
}


void PartC_HandleZerstoere() { // Part C, script $7c68; command 28 (ZERSTOERE), SELECT $7757 case 2
    tableptr = data0x8431;
    temp = 0x01;

x7c6f:
    scratch1 = *(unsigned short*)tableptr; tableptr += 2;
    pendingTextID = *(unsigned short*)tableptr; tableptr += 2;
    if ( scratch1 == object1 ) {
        goto x7c8b;
    }
    temp = temp + 0x01;
    if ( temp <= 0x07 ) {
        goto x7c6f;
    }

x7c8b:
    if ( temp <= 0x07 ) {
        return;
    }
    if ( object1 == DAVE ) {
        pendingTextID = 0x3c; // text ID 60 (0x003c), script $7c9b: C1 record 162: Eine weise, ja geradezu philosophische Entscheidung: Selbstmord heißt, Probleme aus der Welt zu schaffen, die man ohne seine Eltern gar nicht hätte! Wirklich schönes Schlußwort! Hasta la vista... - Babe! HARAKIRIIIIIIIIIIHHHHH!
        showtext();
        Restart();
        objectLocation[DAVE] = 0xff;
        return;
    }
    pendingTextID = 0x3d; // text ID 61 (0x003d), script $7cab: C1 record 163: "Dave the Destroyer", oder was? Uiuiui! Da möchte man sich ja vor Angst am liebsten hinter dem nächsten Baum verkriechen!

x7caf:
    return;
}


void PartC_HandleVerliere() { // Part C, script $7cb0; command 29 (VERLIERE), SELECT $7757 case 3
    if ( objectLocation[object1] != 0xff ) {
        pendingTextID = 0x41; // text ID 65 (0x0041), script $7cb7: C1 record 167: Nachdem Du eine halbe Stunde lang vergeblich in Deinen Taschen gewühlt hast, wird Dir klar, daß das Ding, das Du gerade so achtlos in die Gegend werfen wolltest, bereits in derselben liegt! Jaja, wenn's anfängt - dann im Kopf, gell?
        return;
    }
    if ( object1 == AMULETT || object1 == FELLSTIEFEL || object1 == JEANS || object1 == BAUMWOLLHEMD || object1 == TURNSCHUHE || object1 == TSHIRT || object1 == PURPURMANTEL || object1 == HOSE || object1 == BADEHOSE ) {
        if ( objectState[object1] == 0x01 ) {
            objectState[object1] = 0x00;
        }
    }
    if ( object1 == BLUT ) {
        pendingTextID = 0x026e; // text ID 622 (0x026e), script $7d01: not displayed on C1 by $3F62
        return;
    }
    if ( object1 == GEBET ) {
        pendingTextID = 0x026f; // text ID 623 (0x026f), script $7d10: not displayed on C1 by $3F62
        return;
    }
    if ( object1 == ZAUBERSPRUCH ) {
        pendingTextID = 0x0270; // text ID 624 (0x0270), script $7d1f: not displayed on C1 by $3F62
        return;
    }
    pendingTextID = 0x08; // text ID 8 (0x0008), script $7d28: engine $5D94: Drop-object response with object name.
    objectLocation[object1] = currentRoom;

x7d30:
    return;
}


void PartC_HandleBetritt() { // Part C, script $7d31; command 30 (BETRITT), SELECT $7757 case 4
    if ( object1 == BOOT ) {
        if ( objectState[BOOT] == 0x00 ) {
            pendingTextID = 0x09; // text ID 9 (0x0009), script $7d3f: C1 record 111: Gut: Wie Du willst...
            score = score + remainingPoints[0x0f];
            remainingPoints[0x0f] = 0x00;
            objectState[BOOT] = 0x01;
        } else {
            if ( objectState[BOOT] == 0x01 ) {
                pendingTextID = 0x18; // text ID 24 (0x0018), script $7d5e: C1 record 126: Wie soll denn DAS funktionieren?
            }
        }
        return;
    }
    pendingTextID = 0x0a; // text ID 10 (0x000a), script $7d68: C1 record 112: Könntest Du mir mal bitte erklären, wie Du DAS betreten willst?

x7d6c:
    return;
}


void PartC_HandleBetrachte() { // Part C, script $7d6d; command 31 (BETRACHTE), SELECT $7757 case 5
    pendingTextID = objectDescriptionID[object1]; // dynamic text ID, script $7d6d; resolve through texts/C64/text_ids.json
    if ( object1 == KURZSCHWERT ) {
        if ( objectState[KURZSCHWERT] == 0x01 ) {
            pendingTextID = 0x011f; // text ID 287 (0x011f), script $7d7f: not displayed on C1 by $3F62
        } else {
            if ( objectState[KURZSCHWERT] == 0x02 ) {
                pendingTextID = 0x011e; // text ID 286 (0x011e), script $7d8d: not displayed on C1 by $3F62
            } else {
                if ( objectState[KURZSCHWERT] == 0x03 ) {
                    pendingTextID = 0x4d; // text ID 77 (0x004d), script $7d9b: C1 record 179: Du betrachtest Dein Schwert: Als Du es im Licht drehst, blitzt die versilberte Klinge, die Du in der Kapelle des Klosters geweiht hast, geheimnisvoll auf. Du wiegst es prüfend in der Hand und führst ein paar unsichere Hiebe gegen einen unsichtbaren Gegner aus. "Ja!", denkst Du Dir zufrieden, "Eine wahrhaft tödliche Waffe, geführt von der Hand eines Meisters der Waffenkunst!" Mit diesem Schwert in Deiner Hand fühlst Du Dich, als ob Du es mit allen Mächten dieser Welt aufnehmen könntest. Nun, wir werden sehen, ob Dein Optimismus gerechtfertigt ist...
                }
            }
        }
        return;
    }
    if ( object1 == FALLGITTER1 && objectLocation[PLATTFORM] == RAUM_NULL ) {
        objectDescriptionID[FALLGITTER1] = 0x0b;
        pendingTextID = 0x017f; // text ID 383 (0x017f), script $7db9: C1 record 236: Direkt dort, wo die Gitterstäbe in den Boden einschlagen müßten, befindet sich eine zirka einen Quadratmeter große Plattform, die spärlich mit frischem Gras überwachsen ist.
        if ( objectLocation[PLATTFORM] == RAUM_NULL ) {
            objectLocation[PLATTFORM] = VOR_ZARGONS_BURGRUINE;
        }
        return;
    }
    if ( object1 == 0xa5 ) {
        pendingTextID = 0x0181; // text ID 385 (0x0181), script $7dd7: C1 record 238: IGITT! Während Du den Zombie betrachtest, mußt Du krampfhaft das dringende Bedürfnis unterdrücken, ihm nicht gleich direkt in die vergammelte Visage zu kotzen: Er geht Dir ungefähr bis zur Schulter, und während jeder noch so geringen Bewegung fallen Reste fauligen Fleisches von seinen Knochen...
        return;
    }

x7de0:
    return;
}


void PartC_HandleHilf() { // Part C, script $7de1; command 32 (HILF), SELECT $7757 case 6
    tableptr = data0x83dd;
    temp = 0x01;

x7de8:
    scratch1 = *(unsigned short*)tableptr; tableptr += 2;
    pendingTextID = *(unsigned short*)tableptr; tableptr += 2;
    if ( scratch1 == object1 ) {
        goto x7e04;
    }
    temp = temp + 0x01;
    if ( temp <= 0x15 ) {
        goto x7de8;
    }

x7e04:
    if ( temp <= 0x15 ) {
        return;
    }
    pendingTextID = 0x53; // text ID 83 (0x0053), script $7e0e: C1 record 185: Danke für Dein wirklich selbstloses Angebot, aber hier wird nun wirklich keine Hilfe benötigt.

x7e12:
    return;
}


void PartC_HandleVerlasse() { // Part C, script $7e13; command 33 (VERLASSE), SELECT $7757 case 7
    if ( object1 == BOOT ) {
        if ( currentRoom == IM_SUMPFSEE ) {
            pendingTextID = 0x0173; // text ID 371 (0x0173), script $7e1f: C1 record 224: Hmmm...: Mir ist zwar durchaus bekannt, daß es Leute gibt, die ein Moorbad aufgrund seiner gesundheitsfördernden Wirkungen sehr zu schätzen wissen, aber dies hier ist ein tiefer Sumpf - nicht bloß irgendein harmloses, kleines Moor! Hilflos sinkst Du also bis auf den Grund des Sumpfsees hinab, um dort für alle Ewigkeiten konserviert zu werden. Tja, also ich glaube trotzdem, eine Konservierung durch die "Speichern"-Funktion wäre Deiner Gesundheit zuträglicher gewesen, meinst Du nicht...?
            objectLocation[DAVE] = 0xff;
            imageID = 0x83;
            ShowImage();
            showtext();
            Restart();
            return;
        } else {
            objectState[BOOT] = 0x00;
            pendingTextID = 0x0f; // text ID 15 (0x000f), script $7e3b: C1 record 117: Okay: Du stehst wieder auf eigenen Beinen.
            return;
        }
    }
    pendingTextID = 0x55; // text ID 85 (0x0055), script $7e44: C1 record 187: Kannst Du mir vielleicht mal einen heißen Tip geben, wie Du DAS verlassen willst?
    return;
}


void PartC_HandleBewege() { // Part C, script $7e49; command 34 (BEWEGE), SELECT $7757 case 8
    pendingTextID = 0x10; // text ID 16 (0x0010), script $7e49: C1 record 118: Versprichst Du dir irgend etwas Bestimmtes davon, DAS durch die Gegend zu schleppen?
    return;
}


void PartC_HandleOeffne() { // Part C, script $7e4e; command 35 (OEFFNE), SELECT $7757 case 9
    if ( object1 == JEANS || object1 == HOSE ) {
        pendingTextID = 0x0268; // text ID 616 (0x0268), script $7e59: C1 record 287: Tja, was sein muß, muß sein: Hastig siehst Du Dich um, ob auch keiner zusieht, öffnest Deine Hose, und... MOMENT MAL! So nicht, Kumpel! Als ob der Saure Regen nicht schon reichte...!
        goto x7f23;
    }
    tableptr = data0x836d;
    temp = 0x01;

x7e69:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    scratch2 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x7e87;
    }
    temp = temp + 0x01;
    if ( temp <= 0x1c ) {
        goto x7e69;
    }

x7e87:
    if ( temp > 0x1c ) {
        pendingTextID = 0x58; // text ID 88 (0x0058), script $7e8d: C1 record 190: Vorsichtig öffnest Du es, bis Du nach ein paar Sekunden bemerkst, daß Du das doch eigentlich gar nicht öffnen konntest! Also schließt Du es wieder, läßt es wie es war und nimmst Dir vor, nicht weiter über Logik in Computerprogrammen nachzudenken.
        if ( object1 == FALLGITTER1 && objectState[FALLGITTER1] == 0x02 ) {
            pendingTextID = 0x0185; // text ID 389 (0x0185), script $7e9e: C1 record 242: Mühsam ziehst Du die Spitzen des Fallgitters aus dem Boden und schiebst es soweit nach oben, bis es sich im Rahmen verkantet. Nun scheint die Gefahr erst einmal gebannt, und es dürfte jetzt auch kein allzu großes Problem mehr sein, unter dem Gitter hindurch unter den Torbogen zu schlüpfen...
            objectState[FALLGITTER1] = 0x00;
            north[VOR_ZARGONS_BURGRUINE] = 0x41;
            goto x7f23;
        } else {
            if ( object1 == FALLGITTER1 ) {
                pendingTextID = 0x57; // text ID 87 (0x0057), script $7eb9: C1 record 189: Oh! Da scheint Dir wohl jemand mit dem Öffnen zuvorgekommen zu sein...
            }
        }
        goto x7f23;
    }
    if ( objectState[object1] == 0x00 ) {
        pendingTextID = 0x11; // text ID 17 (0x0011), script $7eca: C1 record 119: Hmmm... - Scheint aber verschlossen zu sein!
        goto x7f23;
    } else {
        if ( objectState[object1] == 0x01 ) {
            pendingTextID = 0x57; // text ID 87 (0x0057), script $7ed9: C1 record 189: Oh! Da scheint Dir wohl jemand mit dem Öffnen zuvorgekommen zu sein...
            goto x7f23;
        } else {
            if ( objectState[object1] == 0x02 ) {
                objectState[object1] = 0x01;
                if ( scratch3 == 0x01 ) {
                    north[currentRoom] = scratch2;
                } else {
                    if ( scratch3 == 0x02 ) {
                        south[currentRoom] = scratch2;
                    } else {
                        if ( scratch3 == 0x03 ) {
                            west[currentRoom] = scratch2;
                        } else {
                            if ( scratch3 == 0x04 ) {
                                east[currentRoom] = scratch2;
                            }
                        }
                    }
                }
                pendingTextID = 0x56; // text ID 86 (0x0056), script $7f1c: C1 record 188: Okay, geöffnet.
            }
        }
    }

x7f23:
    scratch2 = 0x00;
    scratch3 = 0x00;
    return;
}


void PartC_HandleZiehe() { // Part C, script $7f2c; command 36 (ZIEHE), SELECT $7757 case 10
    if ( object1 == FALLGITTER1 && objectState[FALLGITTER1] == 0x02 ) {
        pendingTextID = 0x0185; // text ID 389 (0x0185), script $7f39: C1 record 242: Mühsam ziehst Du die Spitzen des Fallgitters aus dem Boden und schiebst es soweit nach oben, bis es sich im Rahmen verkantet. Nun scheint die Gefahr erst einmal gebannt, und es dürfte jetzt auch kein allzu großes Problem mehr sein, unter dem Gitter hindurch unter den Torbogen zu schlüpfen...
        objectState[FALLGITTER1] = 0x00;
        north[VOR_ZARGONS_BURGRUINE] = 0x41;
        return;
    }
    pendingTextID = 0x0258; // text ID 600 (0x0258), script $7f4e: C1 record 271: Das findest Du wohl witzig, häh? Naja, vergessen wir's...

x7f53:
    return;
}


void PartC_HandleDruecke() { // Part C, script $7f54; command 37 (DRUECKE), SELECT $7757 case 11
    pendingTextID = 0x59; // text ID 89 (0x0059), script $7f54: C1 record 191: Glaube mir: Es besteht wirklich nicht der geringste Grund, das zu drücken!
    return;
}


void PartC_HandleNimm() { // Part C, script $7f59; command 38 (NIMM), SELECT $7789 case 1
    tableptr = data0x8345;
    temp = 0x01;

x7f60:
    scratch1 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x7f7a;
    }
    temp = temp + 0x01;
    if ( temp <= 0x28 ) {
        goto x7f60;
    }

x7f7a:
    if ( temp > 0x28 ) {
        pendingTextID = 0x0e; // text ID 14 (0x000e), script $7f80: C1 record 116: Tut mir leid, aber das kannst Du beim besten Willen nicht mitnehmen!
        goto x7fa0;
    }
    if ( objectLocation[object1] == 0xff ) {
        pendingTextID = 0x0d; // text ID 13 (0x000d), script $7f8f: C1 record 115: Aber das hast Du doch schon längst!
        goto x7fa0;
    }
    objectLocation[object1] = 0xff;
    pendingTextID = 0x0c; // text ID 12 (0x000c), script $7f9c: engine $5D94: Take-object response with object name.

x7fa0:
    if ( object1 == AMULETT && currentRoom == IN_EINEM_VERWUNSCHENEN_WALD2 ) {
        pendingTextID = 0x0182; // text ID 386 (0x0182), script $7fab: C1 record 239: Als Du versuchst, das Amulett vom Ast loszumachen, rutscht es Dir durch Deine immer noch etwas zittrigen Finger, fällt zu Boden - und verschwindet mit einem kurzen "Blobb!" im Morast...
        showtext();
        objectLocation[AMULETT] = 0x69;
        objectState[AMULETT] = 0x00;
        return;
    }

x7fc1:
    return;
}


void PartC_HandleSprich() { // Part C, script $7fc2; command 39 (SPRICH), SELECT $7789 case 2
    pendingTextID = 0x5b; // text ID 91 (0x005b), script $7fc2: C1 record 193: Wie merkwürdig! Keine Antwort ?!?!?
    tableptr = data0x844d;
    temp = 0x01;

x7fcd:
    scratch1 = *(unsigned short*)tableptr; tableptr += 2;
    pendingTextID = *(unsigned short*)tableptr; tableptr += 2;
    if ( scratch1 == object1 ) {
        goto x7fe9;
    }
    temp = temp + 0x01;
    if ( temp <= 0x0f ) {
        goto x7fcd;
    }

x7fe9:
    if ( temp > 0x0f ) {
        pendingTextID = 0x5b; // text ID 91 (0x005b), script $7fef: C1 record 193: Wie merkwürdig! Keine Antwort ?!?!?
    }
    if ( object1 == EREMIT ) {
        if ( objectState[EREMIT] == 0x00 ) {
            objectState[EREMIT] = 0x01;
            pendingTextID = 0x0186; // text ID 390 (0x0186), script $8008: C1 record 243: Die langen Jahre der Einsamkeit scheinen den alten Mann wohl doch schon reichlich verblödet zu haben. Dennoch fragst Du ihn, was er über diese kleine Insel zu berichten weiß. "Die Insel, die Insel...", sinniert er vor sich hin, "Wenn ich nur wüßte, welche Insel Du wohl meinen könntest! Vielleicht die Insel, die Aeneas, der göttliche Held, vor Urzeiten betreten hat? Ah, ja: Ich habe auch schon von einer Insel namens "Amerika" gehört, die von einem gewissen "Columbo", äh: "Coulomb" entdeckt worden sein soll - quatsch: "Columbos" hieß der Knabe - ach, vergiß' es wieder! Interessiert doch eh' keinen... Oder meinst Du vielleicht sogar die Insel, auf der wir im Moment stehen? Jawoll, dies hier ist nämlich auch eine Insel, ob Du es glauben willst oder nicht! Das kannst Du zum Beispiel schon daran erkennen, daß sie rundum von Wasser umgeben ist und..." Genervt verdrehst Du die Augen gen Himmel, als angesichts dieser Lektion aus der hohen Schule der Geographie unangenehme Erinnerungen an Deine "Sesamstraßen-Zeit" in Dir aufzusteigen drohen: Schon damals hast Du's nicht kapiert...
            return;
        } else {
            if ( objectState[EREMIT] == 0x01 ) {
                objectState[EREMIT] = 0x02;
                pendingTextID = 0x0187; // text ID 391 (0x0187), script $801f: C1 record 244: Mit einer wahren Engelsgeduld entscheidest Du Dich, dem dummen Gebrabbel des Alten noch einmal Gehör zu schenken, obwohl Du schon im Voraus zu bezweifeln wagst, daß Du etwas Intelligenteres zu hören bekommen wirst als beim letzten Mal. Zu Deiner Überraschung antwortet der alte Eremit diesmal jedoch relativ direkt auf Deine Frage: "Ja, doch, ich weiß etwas über diese Insel! Natürlich tu ich das: Immerhin lebe ich hier bereits seit über zehn Jahren! Du tust also sehr gut daran, Dich an mich zu wenden - ich wohne hier nämlich und...", erschrocken hält er inne und blickt auf Deine sich gerade in den verschiedensten Würgebewegungen übenden Hände, und fährt dann hastig fort: "Also, auch auf die Gefahr hin, daß Du mich für verrückt erklären wirst," - Du lachst hysterisch auf - "muß ich Dir sagen, daß die Flüsse hier um Mitternacht bergaufwärts fließen und sich bei Vollmond all die Abenteurer, die der Sumpf im Laufe der Jahrzehnte verschlungen hat, aus ihren feuchten Gräbern erheben und ausgelassene Orgien feiern! Sogar Zargon, der Dunkle Lord höchstpersönlich, der einst einen Pakt mit dem Teufel geschlossen hat, der seine Seele gefrieren und in einen riesigen, magischen Kristall einsperren ließ, ist dann hier anwesend und nimmt eine Parade seiner untoten Palastwache ab..." In Erinnerung an all die rauschenden Feste und die vielen hübschen Zombienchen, die er im Verlauf dieser schon vernascht hat, hellt ein tiefgründiges Lächeln die verrunzelten Gesichtszüge des alten Männchens auf...
                return;
            } else {
                if ( objectState[EREMIT] == 0x02 ) {
                    pendingTextID = 0x0188; // text ID 392 (0x0188), script $8030: C1 record 245: Es mag ja sein, daß Du Dich noch weiter über das ausgesprochen hirnlose Gewäsch des Alten amüsieren möchtest - aber ICH NICHT! Mannomann! Dagegen ist ja sogar DIESER Schwachsinn noch halbwegs erträglich...!
                    return;
                }
            }
        }
    }

x803c:
    return;
}


void PartC_HandleWende() { // Part C, script $803d; command 40 (WENDE), SELECT $7789 case 3
    if ( object2 == DAVE ) {
        if ( object1 == FELLSTIEFEL && objectState[FELLSTIEFEL] == 0x00 ) {
            objectState[FELLSTIEFEL] = 0x01;
            objectLocation[FELLSTIEFEL] = 0xff;
            pendingTextID = 0x5d; // text ID 93 (0x005d), script $805c: C1 record 195: Unbeholfen steigst Du in die dicken Fellstiefel, die Dir Mylgor gegeben hat. Mannomann, sind die warm! Besser, Du ziehst sie nicht in geschlossenen Räumen wieder aus...
            return;
        } else {
            if ( object1 == BAUMWOLLHEMD && objectState[BAUMWOLLHEMD] == 0x00 ) {
                objectState[BAUMWOLLHEMD] = 0x01;
                objectLocation[BAUMWOLLHEMD] = 0xff;
                pendingTextID = 0x5f; // text ID 95 (0x005f), script $807d: C1 record 197: Gut: Du streifst Dir das warme Baumwollhemd über.
                return;
            } else {
                if ( object1 == HOSE && objectState[HOSE] == 0x00 ) {
                    objectState[HOSE] = 0x01;
                    objectLocation[HOSE] = 0xff;
                    pendingTextID = 0x61; // text ID 97 (0x0061), script $809e: C1 record 199: Du bist nun mit der gefütterten, warmen Hose bekleidet.
                    return;
                }
            }
        }
        if ( object1 == AMULETT ) {
            if ( currentRoom != IN_EINEM_VERWUNSCHENEN_WALD2 ) {
                objectLocation[AMULETT] = 0xff;
                objectState[AMULETT] = 0x01;
                score = score + remainingPoints[0x03];
                remainingPoints[0x03] = 0x00;
                pendingTextID = 0x5c; // text ID 92 (0x005c), script $80cc: C1 record 194: Du legst Dir das Amulett an.
                return;
            } else {
                if ( currentRoom == IN_EINEM_VERWUNSCHENEN_WALD2 ) {
                    pendingTextID = 0x0182; // text ID 386 (0x0182), script $80da: C1 record 239: Als Du versuchst, das Amulett vom Ast loszumachen, rutscht es Dir durch Deine immer noch etwas zittrigen Finger, fällt zu Boden - und verschwindet mit einem kurzen "Blobb!" im Morast...
                    showtext();
                    objectLocation[AMULETT] = 0x69;
                    objectState[AMULETT] = 0x00;
                    return;
                }
            }
        }
    }
    if ( object1 == DAVE ) {
        if ( object2 == ABENTEURER || object2 == ORKKIND || object2 == KADAVER || object2 == CU_SATH || object2 == EREMIT || object2 == FAEHRMANN || object2 == FIRON || object2 == PORTIER || object2 == KOENIG || object2 == MYLGOR || object2 == DORFBEWOHNER || object2 == VERKAEUFER || object2 == YETI || object2 == ZARGON ) {
            pendingTextID = 0x65; // text ID 101 (0x0065), script $8140: C1 record 203: Hey, Du! Ich bin bloß ein Computer! Das wird "C-O-M-P-U-T-E-R" geschrieben! Sprich mir nach: "Kooom-Piuuu-Tääär"! Fein, und jetzt denk' Dir mal was Realistischeres aus...
            return;
        }
    }
    if ( object1 == PFEIFE ) {
    } else {
        if ( object2 == BIENENSTOCK && objectState[BIENENSTOCK] == 0x01 || object2 == DAVE ) {
            pendingTextID = 0x5e; // text ID 94 (0x005e), script $8162: C1 record 196: Vorsichtig ziehst Du an der Pfeife des Orkvaters. Ihr süßlicher Rauch versetzt Dich in eine andere Welt: Eine Welt, in der Du auf einem tiefergelegten Toaster durch die Wolken fliegst, wo rosa Elefanten den Verkehr regeln. Plötzlich fängt es an, bunte Regentropfen zu regnen - und die Sicht in Deinem Turbotoaster wird immer schlechter, weil die Scheibenwischer natürlich auch mal wieder streiken! So ein Mist! Dabei warst Du mit der Kiste doch gerade erst beim Toaster-Überwachungs-Verein (TÜV)! RUMMS! Nu isses mal wieder passiert: Kaum paßt man mal eine Weile nicht auf, da nimmt einem auch schon wieder einer von diesen blasierten Marzipankartoffelreitern die Vorfahrt! "Er war schuld!", denkst Du Dir noch, als Du mit der Rübe durch die Windschutzscheibe bretterst. Dann gehen die Lichter aus... Als Du zu Dir kommst, befindest Du Dich wieder an der Stelle, wo Du an der Pfeife gezogen hast - allerdings hast Du einen fürchterlichen Brummschädel. Mann! Was für ein Kraut...
            return;
        }
    }

    if ( object1 == KURZSCHWERT ) {
        if ( object2 == DAVE ) {
            pendingTextID = 0x60; // text ID 96 (0x0060), script $8178: C1 record 198: Na gut, wie Du meinst: Heldenhaft stürzst Du Dich in die Klinge Deines Schwertes - aber nichts passiert! Kein Blut, kein Schmerz, rein gar nichts! Frustriert unternimmst Du einen weiteren Versuch, doch wieder spürst Du nichts. Beim dritten Mal triffst Du Dich dann endlich: In Todesqualen windest Du Dich auf dem Boden, ohne daß ein Wort des Schmerzes über Deine Lippen kommt - wie es sich eben für einen echten Helden gehört. Wenn das Deine Freundin sehen könnte! So einen stilvollen Abgang legt man schließlich nicht alle Tage hin! Auf einmal ist alles vorbei, und es wird dunkel... Nach einiger Zeit erwachst Du schwebend in einem dunklen Raum. Du schauderst: Ist das das Leben nach dem Tode? Das soll wirklich alles sein? Sieht ja finster aus... Doch auf einmal wird Dir klar, was Dich geweckt hat: Leise, wie aus weiter Ferne, weht eine sanfte Stimme zu Dir herüber... "Dave Parker!", kannst Du sie wispern hören, "Du solltest wissen, daß niemand seinem Schicksal entkommen kann! Es hat keinen Sinn, vor seiner Bestimmung zu fliehen - das Schicksal holt Dich immer wieder ein! Gehe also hin und erfülle die Aufgaben, die man Dir auferlegt hat. Kraft meiner göttlichen Befugnisse werde ich Dir nun ein Extraleben schenken, um Dir noch eine Gelegenheit zu geben, Deine Bestimmung zu erfüllen..." Während die Stimme im Nichts verhallt, beginnt sich alles um Dich herum zu drehen, Dir wird schwindlig - und Du fällst in einen tiefen, traumlosen Schlaf... Als Du Deine Augen wieder öffnest, findest Du Dich genau dort wieder, wo Du Deinen Selbstmordversuch unternommen hast...
            showtext();
            Restart();
            return;
        }
    }
    if ( object1 == ZIEGELSTEIN && object2 == PLATTFORM ) {
        score = score + remainingPoints[0x16];
        remainingPoints[0x16] = 0x00;
        objectLocation[ZIEGELSTEIN] = 0x69;
        objectState[ZIEGELSTEIN] = 0x01;
        north[VOR_ZARGONS_BURGRUINE] = 0x00;
        objectState[FALLGITTER1] = 0x02;
        north[VOR_ZARGONS_BURGRUINE] = 0x00;
        pendingTextID = 0x0189; // text ID 393 (0x0189), script $81b8: C1 record 246: Schon in der weisen Voraussicht, daß sich unter der Plattform vielleicht wieder eine dieser einfallslosen Fallen verbergen könnte, von denen es in diesem Land nur so zu wimmeln scheint, läßt Du den armen, unschuldigen Ziegelstein aus sicherer Entfernung vorsichtig auf sie aufschlagen: Im selben Moment, als der Stein sein Ziel trifft, rasselt das riesige Fallgitter von oben auf ihn herab - mit einer Geschwindigkeit, die es nicht einmal einer Ratte erlaubt hätte, unversehrt auf die andere Seite des Gitters zu gelangen - und zerbröselt den Stein in tausend handliche Kiesel!!! Irgendetwas in Deiner Brust verkrampft sich und rutscht eine Etage tiefer: Wie sähest Du jetzt wohl aus, wenn es Dein Gewicht gewesen wäre, das den Mechanismus aktiviert hätte? Und noch viel wichtiger: Wer hat eigentlich den Dreck, den Deine Vorgänger hier hinterlassen haben, weggewischt ???
        return;
    }
    pendingTextID = 0x67; // text ID 103 (0x0067), script $81c1: C1 record 205: Also gut: Schwamm drüber! Vergessen wir's, und reden wir nicht mehr davon! Aber gib jetzt bitte mal etwas Sinnvolleres ein - mir wird's langsam zu langweilig!

x81c5:
    return;
}


void PartC_HandleBefestige() { // Part C, script $81c6; command 41 (BEFESTIGE), SELECT $7789 case 4
    pendingTextID = 0x18; // text ID 24 (0x0018), script $81c6: C1 record 126: Wie soll denn DAS funktionieren?
    return;
}


void PartC_HandleGib() { // Part C, script $81cb; command 42 (GIB), SELECT $7789 case 5
    pendingTextID = 0x12; // text ID 18 (0x0012), script $81cb: C1 record 120: Ist ja wirklich lieb gemeint, aber was sollte man denn DAMIT schon anfangen können...?
    return;
}


void PartC_HandleVerriegele() { // Part C, script $81d0; command 43 (VERRIEGELE), SELECT $7789 case 6
    tableptr = data0x83be;
    temp = 0x01;

x81d7:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x81f3;
    }
    temp = temp + 0x01;
    if ( temp <= 0x0c ) {
        goto x81d7;
    }

x81f3:
    if ( temp > 0x0c ) {
        pendingTextID = 0x15; // text ID 21 (0x0015), script $81f9: C1 record 123: Tut mir ja wirklich ganz fürchterlich leid, aber DAS kannst Du nun wirklich nicht abschließen!
        return;
    }
    if ( scratch3 != object2 ) {
        tableptr = data0x83d6;
        temp = 0x01;

x820d:
        scratch1 = *tableptr++;
        if ( scratch1 == object1 ) {
            goto x8227;
        }
        temp = temp + 0x01;
        if ( temp <= 0x07 ) {
            goto x820d;
        }

x8227:
        if ( temp > 0x07 ) {
            pendingTextID = 0x14; // text ID 20 (0x0014), script $822d: C1 record 122: Wie willst Du denn DAMIT etwas abschließen?
            return;
        }
        pendingTextID = 0x6a; // text ID 106 (0x006a), script $8235: C1 record 208: Mist! Entschuldige bitte, aber das hier scheint einfach nicht der richtige Schlüssel zu sein - er paßt leider nicht.
        return;
    } else {
        if ( scratch3 == object2 ) {
            if ( objectState[object1] == 0x00 ) {
                pendingTextID = 0x68; // text ID 104 (0x0068), script $8249: C1 record 206: Aber das ist doch bereits abgeschlossen!
                return;
            } else {
                if ( objectState[object1] == 0x02 || objectState[object1] == 0x01 ) {
                    if ( objectState[object1] == 0x01 ) {
                        PartC_HandleSchliesse();
                    }
                    objectState[object1] = 0x00;
                }
            }
        }
    }

x8272:
    return;
}


void PartC_HandleEntriegele() { // Part C, script $8273; command 44 (ENTRIEGELE), SELECT $7789 case 7
    tableptr = data0x83be;
    temp = 0x01;

x827a:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x8296;
    }
    temp = temp + 0x01;
    if ( temp <= 0x0c ) {
        goto x827a;
    }

x8296:
    if ( temp > 0x0c ) {
        pendingTextID = 0x18; // text ID 24 (0x0018), script $829c: C1 record 126: Wie soll denn DAS funktionieren?
        return;
    }
    if ( scratch3 != object2 ) {
        tableptr = data0x83d6;
        temp = 0x01;

x82b0:
        scratch1 = *tableptr++;
        if ( scratch1 == object2 ) {
            goto x82ca;
        }
        temp = temp + 0x01;
        if ( temp <= 0x07 ) {
            goto x82b0;
        }

x82ca:
        if ( temp > 0x07 ) {
            pendingTextID = 0x17; // text ID 23 (0x0017), script $82d0: C1 record 125: Also, DAMIT kann man ja nun wiklich nichts aufschlißen, oder?
            return;
        }
        pendingTextID = 0x6a; // text ID 106 (0x006a), script $82d8: C1 record 208: Mist! Entschuldige bitte, aber das hier scheint einfach nicht der richtige Schlüssel zu sein - er paßt leider nicht.
        return;
    } else {
        if ( scratch3 == object2 ) {
            if ( objectState[object1] > 0x00 ) {
                pendingTextID = 0x69; // text ID 105 (0x0069), script $82ec: C1 record 207: Das ist aber doch schon längst entriegelt!
                return;
            } else {
                if ( objectState[object1] == 0x00 ) {
                    objectState[object1] = 0x02;
                    pendingTextID = 0x16; // text ID 22 (0x0016), script $8300: C1 record 124: Okay, aufgeschlossen.
                    if ( object1 == PORTALTOR1 ) {
                        score = score + remainingPoints[0x6f];
                        remainingPoints[0x6f] = 0x00;
                        pendingTextID = 0x018a; // text ID 394 (0x018a), script $8316: C1 record 247: Du steckst den großen Eisenschlüssel in das riesige Schloß des gigantischen Burgtores und drehst ihn herum! Unglücklicherweise brichst Du dabei jedoch den Schlüssel im Schloß ab - woher Du diese Kraft hast, ist Dir selbst völlig schleierhaft! Nichtsdestotrotz: Zumindest ist das Tor jetzt erst einmal aufgeschlossen...
                        objectLocation[TORSCHLUESSEL] = RAUM_NULL;
                        objectState[PORTALTOR1] = 0x02;
                    }
                    if ( object1 == KAHN ) {
                        score = score + remainingPoints[0x10];
                        remainingPoints[0x10] = 0x00;
                        pendingTextID = 0x0240; // text ID 576 (0x0240), script $833a: not displayed on C1 by $3F62
                    }
                }
            }
        }
    }

x8344:
    return;
}
