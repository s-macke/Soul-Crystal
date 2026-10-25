#include"src/tables.h"

unsigned char data0x9374[] = {0x03, 0x05, 0x11, 0x14, 0x15, 0x16, 0x17, 0x1f, 0x20, 0x22, 0x24, 0x2d, 0x3b, 0x3e, 0x47, 0x4b, 0x4d, 0x50, 0x52, 0x54, 0x5c, 0x64, 0x65, 0x68, 0x6b, 0x6c, 0x6e, 0x71, 0x75, 0x78, 0x7d, 0x7e, 0x7f, 0x85, 0x8e, 0x8f, 0x93, 0x94, 0x97, 0x99};

unsigned char data0x939c[] = {0x05, 0x07, 0x00, 0x06, 0x03, 0x54, 0x17, 0x07, 0x00, 0x1e, 0x00, 0x00, 0x2d, 0x07, 0x00, 0x30, 0x01, 0x05, 0x31, 0x02, 0x01, 0x32, 0x02, 0x13, 0x33, 0x07, 0x00, 0x35, 0x07, 0x00, 0x40, 0x01, 0x16, 0x41, 0x01, 0x2b, 0x42, 0x02, 0x26, 0x51, 0x01, 0x31, 0x57, 0x01, 0x51, 0x58, 0x02, 0x4f, 0x5a, 0x04, 0x11, 0x63, 0x01, 0x13, 0x6f, 0x01, 0x43, 0x70, 0x00, 0x00, 0x76, 0x00, 0x00, 0x77, 0x07, 0x00, 0x8b, 0x02, 0x21, 0x8c, 0x04, 0x50, 0x8d, 0x03, 0x4f, 0x9a, 0x07, 0x00, 0xa0, 0x03, 0x10};

unsigned char data0x93ed[] = {0x10, 0x11, 0x30, 0x75, 0x31, 0x75, 0x41, 0x3b, 0x42, 0x3b, 0x51, 0x52, 0x57, 0x99, 0x58, 0x99, 0x6f, 0x54, 0x8b, 0x52, 0x8c, 0x4b, 0x8d, 0x4b};

unsigned char data0x9405[] = {0x11, 0x3b, 0x4b, 0x52, 0x54, 0x75, 0x99};

unsigned char data0x940c[] = {0xa3, 0x00, 0x52, 0x00, 0x4a, 0x00, 0x97, 0x00, 0x62, 0x00, 0x98, 0x00, 0x37, 0x00, 0x2a, 0x01, 0x5b, 0x00, 0x2d, 0x01, 0x1a, 0x00, 0x29, 0x01, 0x61, 0x00, 0x2e, 0x01, 0x7a, 0x00, 0x2f, 0x01, 0x3a, 0x00, 0x2b, 0x01, 0x4f, 0x00, 0x2c, 0x01, 0x4c, 0x00, 0x2c, 0x01, 0x83, 0x00, 0x2c, 0x01, 0x36, 0x00, 0x83, 0x01, 0xa2, 0x00, 0x31, 0x01, 0xa5, 0x00, 0x84, 0x01, 0x01, 0x00, 0x19, 0x02, 0x25, 0x00, 0x1a, 0x02, 0x38, 0x00, 0x1b, 0x02, 0x60, 0x00, 0x1c, 0x02, 0x84, 0x00, 0x1d, 0x02, 0xa4, 0x00, 0x1e, 0x02};

unsigned char data0x9460[] = {0x4a, 0x00, 0x7c, 0x00, 0x02, 0x00, 0xe8, 0x00, 0x4f, 0x00, 0xeb, 0x00, 0x4c, 0x00, 0xeb, 0x00, 0xa5, 0x00, 0x7a, 0x01, 0x01, 0x00, 0xc7, 0x01, 0x60, 0x00, 0xce, 0x01};

unsigned char data0x947c[] = {0x36, 0x00, 0x5b, 0x00, 0x37, 0x00, 0x38, 0x01, 0x5b, 0x00, 0x41, 0x01, 0x02, 0x00, 0x34, 0x01, 0x4c, 0x00, 0x5a, 0x00, 0x4f, 0x00, 0x5a, 0x00, 0x60, 0x00, 0x5a, 0x00, 0x83, 0x00, 0x5a, 0x00, 0x84, 0x00, 0x5a, 0x00, 0x85, 0x00, 0x5a, 0x00, 0x9f, 0x00, 0x5a, 0x00, 0xa5, 0x00, 0x5a, 0x00, 0x01, 0x00, 0x2a, 0x02, 0x25, 0x00, 0x2b, 0x02, 0xa4, 0x00, 0x2d, 0x02, 0xff};

void PartB_HandleUebersoulcrystal(); // Part B, script $79d4; command 1 (UEBERSOULCRYSTAL), SELECT $7702 case 1
void PartB_HandleKurztext(); // Part B, script $79d9; command 2 (KURZTEXT), SELECT $7702 case 2
void PartB_HandleCredits(); // Part B, script $79ed; command 3 (CREDITS), SELECT $7702 case 3
void PartB_HandleGrabe(); // Part B, script $79f2; command 4 (GRABE), SELECT $7702 case 4
void PartB_HandleHinunter(); // Part B, script $7a2f; command 5 (HINUNTER), SELECT $7702 case 5
void PartB_HandleOst(); // Part B, script $7a5e; command 6 (OST), SELECT $7702 case 6
void PartB_HandleAusgaenge(); // Part B, script $7ab1; command 7 (AUSGAENGE), SELECT $7702 case 7
void PartB_HandleDisketteinstallieren(); // Part B, script $7ab5; command 8 (DISKETTEINSTALLIEREN), SELECT $7702 case 8
void PartB_HandleInventar(); // Part B, script $7ab9; command 9 (INVENTAR), SELECT $7702 case 9
void PartB_HandleSchau(); // Part B, script $7abd; command 10 (SCHAU), SELECT $7702 case 10
void PartB_HandleNord(); // Part B, script $7ac4; command 11 (NORD), SELECT $7702 case 11
void PartB_HandleSpielende(); // Part B, script $7d01; command 12 (SPIELENDE), SELECT $7702 case 12
void PartB_HandleNeustart(); // Part B, script $7d05; command 13 (NEUSTART), SELECT $7702 case 13
void PartB_HandleLaden(); // Part B, script $7d09; command 14 (LADEN), SELECT $773a case 1
void PartB_HandlePunkte(); // Part B, script $7d0d; command 15 (PUNKTE), SELECT $773a case 2
void PartB_HandleLoesung(); // Part B, script $7d12; command 16 (LOESUNG), SELECT $773a case 3
void PartB_HandleMusikein(); // Part B, script $7d16; command 17 (MUSIKEIN), SELECT $773a case 4
void PartB_HandleAusgaenge12(); // Part B, script $7d1e; command 18 (AUSGAENGE12), SELECT $773a case 5
void PartB_HandleSued(); // Part B, script $7d26; command 19 (SUED), SELECT $773a case 6
void PartB_HandleSpeichern(); // Part B, script $7e56; command 20 (SPEICHERN), SELECT $773a case 7
void PartB_HandleHinauf(); // Part B, script $7e5a; command 21 (HINAUF), SELECT $773a case 8
void PartB_HandleAusfuehrlich(); // Part B, script $7ee7; command 22 (AUSFUEHRLICH), SELECT $773a case 9
void PartB_HandleWarte(); // Part B, script $7efb; command 23 (WARTE), SELECT $773a case 10
void PartB_HandleWest(); // Part B, script $7f00; command 24 (WEST), SELECT $773a case 11
void PartB_Sub_7f93(); // Part B, script $7f93; command 25 (NIX1), SELECT $773a case 12
void PartB_Sub_7f94(); // Part B, script $7f94; command 26 (NIX2), SELECT $773a case 13
void PartB_HandleSchliesse(); // Part B, script $7f95; command 27 (SCHLIESSE), SELECT $7772 case 1
void PartB_HandleZerstoere(); // Part B, script $80aa; command 28 (ZERSTOERE), SELECT $7772 case 2
void PartB_HandleVerliere(); // Part B, script $81ac; command 29 (VERLIERE), SELECT $7772 case 3
void PartB_HandleBetritt(); // Part B, script $822d; command 30 (BETRITT), SELECT $7772 case 4
void PartB_HandleBetrachte(); // Part B, script $8296; command 31 (BETRACHTE), SELECT $7772 case 5
void PartB_HandleHilf(); // Part B, script $843f; command 32 (HILF), SELECT $7772 case 6
void PartB_HandleVerlasse(); // Part B, script $849b; command 33 (VERLASSE), SELECT $7772 case 7
void PartB_HandleBewege(); // Part B, script $84f8; command 34 (BEWEGE), SELECT $7772 case 8
void PartB_HandleOeffne(); // Part B, script $8558; command 35 (OEFFNE), SELECT $7772 case 9
void PartB_HandleZiehe(); // Part B, script $86d9; command 36 (ZIEHE), SELECT $7772 case 10
void PartB_HandleDruecke(); // Part B, script $86f3; command 37 (DRUECKE), SELECT $7772 case 11
void PartB_HandleNimm(); // Part B, script $871f; command 38 (NIMM), SELECT $77a4 case 1
void PartB_HandleSprich(); // Part B, script $8884; command 39 (SPRICH), SELECT $77a4 case 2
void PartB_HandleWende(); // Part B, script $8b82; command 40 (WENDE), SELECT $77a4 case 3
void PartB_HandleBefestige(); // Part B, script $8fdc; command 41 (BEFESTIGE), SELECT $77a4 case 4
void PartB_HandleGib(); // Part B, script $9053; command 42 (GIB), SELECT $77a4 case 5
void PartB_HandleVerriegele(); // Part B, script $9199; command 43 (VERRIEGELE), SELECT $77a4 case 6
void PartB_HandleEntriegele(); // Part B, script $92b7; command 44 (ENTRIEGELE), SELECT $77a4 case 7

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
                pendingTextID = 0x2e; // text ID 46 (0x002e), script $7632: B2 record 148: Du erwartest doch nicht allen Ernstes von mir, daß ich diesen Ort NACKT verlasse, oder?
                goto x77bb;
            } else {
                SPECIAL(0x65);
                if ( temp == 0x01 ) {
                    objectState[DAVE] = 0x64;
                }
            }
        }
        if ( currentRoom == VOR_EINER_GRUFT && objectState[WERWOLF] == 0x02 ) {
            pendingTextID = 0xef; // text ID 239 (0x00ef), script $7659: B2 record 279: Auf Deiner panischen Flucht über den Friedhof stolperst Du unglücklicherweise: Die kalte, modrige Hand eines Ghouls, den Du durch Dein Geschrei beim Abendessen gestört hast, ist aus einem Grab geschossen und umklammert nun wie ein Schraubstock Dein Fußgelenk! "Komm', Herr Jesus, und sei unser Gast...", denkst Du Dir noch, als Du feststellst, daß sich der Leichenfresser bereits an Deinen anscheinend recht delikaten Waden zu schaffen macht, während Du - ohne die geringste Chance davonzukommen - zusehen mußt, wie der Werfolf sich Dir mit langsamen, stampfenden Schritten nähert...
            imageID = 0x85;
            objectLocation[DAVE] = 0xff;
            ShowImage();
            showtext();
            Restart();
            return;
        }
    }
    SPECIAL(0x66);
    if ( temp == 0x01 ) {
        SPECIAL(0x67);
        if ( temp == 0x01 ) {
            if ( diskSide == 0x01 ) {
            } else {
                if ( diskSide == 0x02 ) {
                    SPECIAL(0x69);
                    if ( temp == 0x01 ) {
                        objectState[DAVE] = objectState[DAVE] - 0x01;
                    } else {
                        objectState[DAVE] = 0x64;
                    }
                } else {
                    if ( diskSide == 0x03 ) {
                    } else {
                        if ( diskSide == 0x04 ) {
                        }
                    }
                }
            }
            if ( objectState[DAVE] == 0x4b || objectState[DAVE] == 0x32 || objectState[DAVE] == 0x19 ) {
                pendingTextID = 0x30; // text ID 48 (0x0030), script $76d0: B2 record 150: Langsam fange ich an zu frieren! Es wird immer kälter hier, also sieh Dich langsam mal nach einem warmen Plätzchen um, wo wir in Ruhe die Nacht verbringen können!
                showtext();
                Restart();
                pendingTextID = 0x00; // text ID 0 (0x0000), script $76d6: no text
                goto x7702;
            } else {
                if ( objectState[DAVE] <= 0x00 ) {
                    imageID = 0x81;
                    objectLocation[DAVE] = 0xff;
                    ShowImage();
                    pendingTextID = 0x31; // text ID 49 (0x0031), script $76f1: B2 record 151: Also, halte mir jetzt bitte nicht vor, daß ich Dich nicht gewarnt hätte - Du hast wirklich genug Zeit gehabt, um nach jemandem zu suchen, der Dir wärmere Kleidung hätte geben können - doch nun ist es endgültig zu spät: Du erfrierst, ohne auch nur die geringste Chance gehabt zu haben, das Spiel zu lösen! Schade eigentlich...
                    showtext();
                    Restart();
                    pendingTextID = 0x00; // text ID 0 (0x0000), script $76f7: no text
                    return;
                }
            }
        }
    }

x7702:
    switch(command) { // SELECT script $7702; original cases are 1-based
         case 1: PartB_HandleUebersoulcrystal(); break;
         case 2: PartB_HandleKurztext(); break;
         case 3: PartB_HandleCredits(); break;
         case 4: PartB_HandleGrabe(); break;
         case 5: PartB_HandleHinunter(); break;
         case 6: PartB_HandleOst(); break;
         case 7: PartB_HandleAusgaenge(); break;
         case 8: PartB_HandleDisketteinstallieren(); break;
         case 9: PartB_HandleInventar(); break;
         case 10: PartB_HandleSchau(); break;
         case 11: PartB_HandleNord(); break;
         case 12: PartB_HandleSpielende(); break;
         case 13: PartB_HandleNeustart(); break;
    }
    if ( pendingTextID != 0x00 ) {
        goto x77bb;
    }
    temp = command - NEUSTART;
    switch(temp) { // SELECT script $773a; original cases are 1-based
         case 1: PartB_HandleLaden(); break;
         case 2: PartB_HandlePunkte(); break;
         case 3: PartB_HandleLoesung(); break;
         case 4: PartB_HandleMusikein(); break;
         case 5: PartB_HandleAusgaenge12(); break;
         case 6: PartB_HandleSued(); break;
         case 7: PartB_HandleSpeichern(); break;
         case 8: PartB_HandleHinauf(); break;
         case 9: PartB_HandleAusfuehrlich(); break;
         case 10: PartB_HandleWarte(); break;
         case 11: PartB_HandleWest(); break;
         case 12: PartB_Sub_7f93(); break;
         case 13: PartB_Sub_7f94(); break;
    }
    if ( pendingTextID != 0x00 ) {
        goto x77bb;
    }
    temp = command - NIX2;
    switch(temp) { // SELECT script $7772; original cases are 1-based
         case 1: PartB_HandleSchliesse(); break;
         case 2: PartB_HandleZerstoere(); break;
         case 3: PartB_HandleVerliere(); break;
         case 4: PartB_HandleBetritt(); break;
         case 5: PartB_HandleBetrachte(); break;
         case 6: PartB_HandleHilf(); break;
         case 7: PartB_HandleVerlasse(); break;
         case 8: PartB_HandleBewege(); break;
         case 9: PartB_HandleOeffne(); break;
         case 10: PartB_HandleZiehe(); break;
         case 11: PartB_HandleDruecke(); break;
    }
    if ( pendingTextID != 0x00 ) {
        goto x77bb;
    }
    temp = command - DRUECKE;
    switch(temp) { // SELECT script $77a4; original cases are 1-based
         case 1: PartB_HandleNimm(); break;
         case 2: PartB_HandleSprich(); break;
         case 3: PartB_HandleWende(); break;
         case 4: PartB_HandleBefestige(); break;
         case 5: PartB_HandleGib(); break;
         case 6: PartB_HandleVerriegele(); break;
         case 7: PartB_HandleEntriegele(); break;
    }

x77bb:
    if ( objectLocation[DAVE] != 0xff ) {
        if ( diskSide == 0x02 ) {
            if ( currentRoom == IN_DER_ORKHOEHLE && objectState[ORKMANN] < 0x07 ) {
                objectState[ORKMANN] = objectState[ORKMANN] + 0x01;
            }
            if ( currentRoom == IN_DER_ORKHOEHLE && objectState[ORKMANN] == 0x06 ) {
                if ( pendingTextID != 0x00 ) {
                    showtext();
                }
                Restart();
                pendingTextID = 0xcd; // text ID 205 (0x00cd), script $77f6: B2 record 245: Während Ihr auf Euer Mittagessen wartet, schauen Du und der Orkvater dem kleinen Kind zu, das in der Ecke der Höhle sitzt und überglücklich mit der Kristallkugel spielt, die Du ihm geschenkt hast. Plötzlich rutscht sie ihm durch die Finger! Sofort springt der Kleine hinterher und verfolgt sie fröhlich quiekend und krakeelend durch die ganze Höhle - bis er sie endlich mit einem todesmutigen Hechtsprung kurz vor dem Kamin zu fassen bekommt! Doch im selben Moment, als sich die Finger des Jungen um die Kugel schließen, gerät er direkt zwischen die Beine seiner Mutter, die gerade den Tisch decken wollte, so daß sie über ihr Kind stolpert und das gesamte Geschirr auf seinen Rücken scheppern läßt! Inmitten eines riesigen Scherbenhaufens sitzend, beginnt der kleine Ork lauthals loszubrüllen, und auf einen kurzen, befehlenden Blick des Vaters hin tritt die Mutter auf ihren Sohn zu und verpaßt ihm zu allem Überfluß noch eine deftige linke Gerade. Das hilft: Verdutzt hört das Orkkind auf zu schreien und blickt verlegen in die Runde... Einen kurzen Moment lang blickt die gesamte Orkfamilie ärgerlich auf ihren Sohn hinab, der sich mit unglücklicher Miene die letzten Scherben aus dem Pelz zupft, und ist erst einmal völlig von Dir abgelenkt...
                objectState[ORKMANN] = 0x06;
                showtext();
                pendingTextID = 0x00; // text ID 0 (0x0000), script $7801: no text
            }
            if ( objectState[ELIXIER] == 0x01 ) {
                objectState[ELIXIER] = 0x02;
            } else {
                if ( objectState[ELIXIER] == 0x02 ) {
                    objectState[ELIXIER] = 0x00;
                }
            }
            if ( currentRoom == VOR_EINER_GRUFT ) {
                if ( objectState[WERWOLF] == 0x00 ) {
                    objectState[WERWOLF] = 0x01;
                } else {
                    if ( objectState[WERWOLF] == 0x01 ) {
                        if ( pendingTextID != 0x00 ) {
                            showtext();
                            Restart();
                        }
                        pendingTextID = 0xd4; // text ID 212 (0x00d4), script $784b: B2 record 252: Himmel! Es ist wohl schon zu spät, um noch an Flucht zu denken: Starr vor Entsetzen mußt Du zusehen, wie sich hinter einem verwitterten Grabstein ein riesiger, schwarzer Schatten erhebt - nur einige Meter neben Dir! Zu keiner Bewegung fähig, mußt Du mit ansehen, wie er lautlos größer und größer wird... Plötzlich reißt die Wolkendecke, die den Vollmond für kurze Zeit verdeckt hatte, auseinander - und Du schreist in panischer Todesangst auf: Dein Gegner ist ein riesiger, grauer Werwolf, der siegesgewiß seine scharfen, gelben Zähne bleckt! Heiser fauchend und mit ausgestreckten Armen setzt er sich in Bewegung - Schritt für Schritt, denn er kennt keine Eile... Doch plötzlich bleibt er stehen! Für Bruchteile von Sekunden treffen sich Eure Blicke und Du spürst die Mordlust und den abgrundtiefen Haß, die in seinen Augen lodern...
                        showtext();
                        objectLocation[WERWOLF] = VOR_EINER_GRUFT;
                        objectState[WERWOLF] = 0x02;
                    } else {
                        if ( objectState[WERWOLF] == 0x02 ) {
                            if ( pendingTextID != 0x00 ) {
                                showtext();
                                Restart();
                            }
                            objectLocation[DAVE] = 0xff;
                            imageID = 0x85;
                            ShowImage();
                            imageID = 0xff;
                            pendingTextID = 0xee; // text ID 238 (0x00ee), script $787d: B2 record 278: Mehr instinktiv als beabsichtigt wirbelst Du herum und schlägst nach dem Kopf Deines Gegners - aber entweder ist er schmerzunempfindlich oder er besitzt eine sehr ausgeprägte masochistische Ader: Statt sich zu trollen oder zumindest mal brav "Aua" zu sagen, attackiert er Dich nur umso wilder! Das war wohl nix: Das letzte, was Du in diesem Leben zu Gesicht bekommst, sind die Zähne einer grausig entstellten Wolfsschnauze, die sich Deinem Brustkorb wie in Zeitlupe nähern... Tja, Du bist mal wieder tot! Wenn Du tatsächlich einen längeren Kommentar über die Art und Weise Deines plötzlichen, wenn auch zu erwartenden Ablebens lesen möchtest, dann versuch' den Werwolf beim nächsten Mal doch einfach mal mit etwas anderem zu töten...
                            showtext();
                            Restart();
                        }
                    }
                }
            }
            if ( currentRoom == IN_MYLGORS_GEHEIMLABOR ) {
                if ( objectState[MYLGOR] == 0x04 ) {
                    objectState[MYLGOR] = 0x05;
                    if ( pendingTextID != 0x00 ) {
                        showtext();
                    }
                    Restart();
                    pendingTextID = 0xd5; // text ID 213 (0x00d5), script $78a4: B2 record 253: Also, ich an Deiner Stelle würde mich langsam mal beeilen, einen Weg zu finden, dem wahnsinnigen, alten Alchemisten Einhalt zu gebieten, bevor es zu spät ist! Es trennen Euch nur noch wenige Meter...
                    showtext();
                } else {
                    if ( objectState[MYLGOR] == 0x06 ) {
                        if ( pendingTextID != 0x00 ) {
                            showtext();
                        }
                        Restart();
                        pendingTextID = 0xd6; // text ID 214 (0x00d6), script $78bb: B2 record 254: A.C.A breaking in for a chat: "Dies ist unsere ALLERLETZTE Warnung: Schick' Mylgor endlich zur Hölle - langsam gehen uns die Texte aus!" A.C.A chat end.
                        showtext();
                    } else {
                        if ( objectState[MYLGOR] >= 0x07 && objectState[REAGENZIEN] == 0x00 ) {
                            if ( pendingTextID != 0x00 ) {
                                showtext();
                            }
                            Restart();
                            objectLocation[DAVE] = 0xff;
                            imageID = 0x87;
                            ShowImage();
                            pendingTextID = 0xd8; // text ID 216 (0x00d8), script $78e4: B2 record 256: Tja, also ich glaube, Du hast etwas zu lange gezögert: Hysterisch wiehernd packt Mylgor Deinen rechten Arm, sticht die Injektionsnadel in eine Vene und "drückt ab", indem er mit der rechten Handfläche einmal brutal gegen den Kolben schlägt! "Wenigstens die Luftblasen hätte er vorher entfernen können..." ist der letzte halbwegs klare Gedanke, den zu fassen Du unter dem Einfluß des Giftes noch in der Lage bist... Mit einem letzten erstickten Röcheln brichst Du zusammen und stirbst einen langsamen, schmerzvollen Tod... Sorry, aber das mußte jetzt wirklich mal sein...
                            showtext();
                            Restart();
                        }
                    }
                }
                if ( objectState[REAGENZIEN] > 0x02 ) {
                    if ( pendingTextID != 0x00 ) {
                        showtext();
                    }
                    imageID = 0x87;
                    objectLocation[DAVE] = 0xff;
                    ShowImage();
                    pendingTextID = 0xd8; // text ID 216 (0x00d8), script $7908: B2 record 256: Tja, also ich glaube, Du hast etwas zu lange gezögert: Hysterisch wiehernd packt Mylgor Deinen rechten Arm, sticht die Injektionsnadel in eine Vene und "drückt ab", indem er mit der rechten Handfläche einmal brutal gegen den Kolben schlägt! "Wenigstens die Luftblasen hätte er vorher entfernen können..." ist der letzte halbwegs klare Gedanke, den zu fassen Du unter dem Einfluß des Giftes noch in der Lage bist... Mit einem letzten erstickten Röcheln brichst Du zusammen und stirbst einen langsamen, schmerzvollen Tod... Sorry, aber das mußte jetzt wirklich mal sein...
                    showtext();
                    Restart();
                }
            }
            if ( objectState[REAGENZIEN] >= 0x01 && objectState[MYLGOR] != 0x09 ) {
                if ( objectState[REAGENZIEN] < 0x04 ) {
                    objectState[REAGENZIEN] = objectState[REAGENZIEN] + 0x01;
                } else {
                    if ( objectState[REAGENZIEN] == 0x04 ) {
                        if ( pendingTextID != 0x00 ) {
                            showtext();
                            Restart();
                        }
                        objectState[REAGENZIEN] = 0x05;
                        if ( objectState[LABORTUER] == 0x00 ) {
                            pendingTextID = 0x015f; // text ID 351 (0x015f), script $7950: B2 record 391: Hastig verschließt Du die Labortür mit dem Schlüssel aus Mylgors Studierzimmer und hörst zu Deiner Beruhigung, wie das riesige Spezialschloß mit einem leisen Klicken schließt - keine Sekunde zu früh: Im selben Moment, als Du den Schlüssel herumdrehst, erschüttert eine fürchterliche Explosion im Labor das ganze Haus bis in die Grundmauern - aber die massive und klugerweise verschlossene Tür hält die schlimmsten Auswirkungen der Druckwelle glücklicherweise von Dir ab! Putz rieselt von der Decke, der Boden und die Wände beben bedrohlich - und plötzlich wird es sehr still: Nur das knisternde Lecken der Flammen an der Labortür ist noch zu hören... Als sich der Staub nach einer Weile gelegt hat, schaust Du Dich um: Die Labortür ist noch immer verschlossen - nur aus kleinen Ritzen in ihrem Rahmen quillt schwarzer Rauch... Du schickst ein Dankgebet dafür zum Himmel, daß Du die Explosion unversehrt überlebt hast - im krassen Gegensatz zu Mylgor übrigens, der jetzt wahrscheinlich mehr oder minder gleichmäßig über die gesamte Laborfläche verteilt sein dürfte... WELL DONE: BONUS AWARDED! ...NOW PREPARE FOR NEXT STAGE... Ähem: Kleiner Scherz...!
                            objectState[MYLGOR] = 0x09;
                            SPECIAL(0xc8);
                        } else {
                            if ( objectState[LABORTUER] != 0x00 && objectState[MYLGOR] != 0x09 ) {
                                objectLocation[DAVE] = 0xff;
                                imageID = 0x89;
                                ShowImage();
                                pendingTextID = 0xd9; // text ID 217 (0x00d9), script $7979: B2 record 257: Hmmm...: War wohl irgendwie nicht so toll, Dein Plan: Die Druckwelle, die von der Explosion der Reagenzien in Mylgors Labor verursacht wurde, sprengt die massive Labortür auf und läßt die gesamte Hütte über Dir zusammenbrechen! Ziemlich blöder Fehler, Mann! Vielleicht sicherst Du die Tür beim nächsten Mal einfach mal besser ab...? Aber unter Umständen tröstet Dich ja die Tatsache, daß Mylgor "noch viel toter" ist als Du: DEIN Körper kann zumindest noch begraben werden - Mylgors Überreste hingegen müßte man erst von den Wänden abkratzen...
                                showtext();
                                imageID = 0xff;
                                Restart();
                            }
                        }
                    }
                }
            }
            if ( objectState[MYLGOR] >= 0x05 ) {
                if ( objectState[MYLGOR] < 0x07 ) {
                    objectState[MYLGOR] = objectState[MYLGOR] + 0x01;
                }
            }
        }
        if ( diskSide == 0x03 ) {
        }
        if ( diskSide == 0x04 ) {
        }
    }
    if ( command != INVENTAR && command != AUSGAENGE && command != LADEN && command != SPEICHERN && command != DISKETTEINSTALLIEREN ) {
        steps = steps + 0x01;
    }

x79d3:
    return;
}


void PartB_HandleUebersoulcrystal() { // Part B, script $79d4; command 1 (UEBERSOULCRYSTAL), SELECT $7702 case 1
    pendingTextID = 0x1b; // text ID 27 (0x001b), script $79d4: B2 record 129: "Soul Crystal" V1.5, written from 1989 to 1992 by Avantgardistic Arts. (C) 1992 by Avantgardistic Arts, Hannover & Starbyte Software, Bochum. Dieses Adventure besitzt 103 Locations, mehr als 130 hochauflösende Farbgrafiken, ungefähr 320 KBytes Text und einen ca. 30-minütigen Soundtrack. Seine Programmentwicklung hat ingesamt 16 sog. "Mann-Jahre" in Anspruch genommen. Sei also bitte so fair und "spread the word - not the disk!" Sollte dies aber doch eine Raubkopie sein (obwohl das Programm geschützt war, und das bestimmt nicht ganz ohne Grund...), dann denke bitte auch mal über die ASDG-Philosophie "A program worth using is a program worth buying" nach - allein schon die Originalverpackung sowie die Handbücher sollten Dir das Geld wert sein. Viel Spaß beim Spielen von "Soul Crystal", und - ach ja: Soweit wir wissen, ist dies das erste Adventure, in das ein CHEATMODE implementiert wurde - also solltest Du Dir Mühe geben, ihn zu finden...
    return;
}


void PartB_HandleKurztext() { // Part B, script $79d9; command 2 (KURZTEXT), SELECT $7702 case 2
    if ( visited[RAUM_NULL] == 0x01 ) {
        visited[RAUM_NULL] = 0x00;
    }
    pendingTextID = 0x25; // text ID 37 (0x0025), script $79e8: B2 record 139: "Kurzbeschreibungen" aktiviert. Die Beschreibungen der einzelnen Räume werden jetzt nur noch beim erstmaligen Betreten ausgegeben.
    return;
}


void PartB_HandleCredits() { // Part B, script $79ed; command 3 (CREDITS), SELECT $7702 case 3
    pendingTextID = 0x1c; // text ID 28 (0x001c), script $79ed: B2 record 130: "Soul Crystal", V1.5, written from 1989 to 1992 by Avantgardistic Arts, (C) 1992 by Avantgardistic Arts, Hannover & Starbyte Software, Bochum. A.C.A sind: Chris Link (Spielkonzept, Gamedesign, Tools, Texte, Soundtrack und Effekte), Kai Schulze (Spielkonzept, Gamedesign, Intro- und Parser-Programmierung AMIGA, Tools), Michael Niemeyer (Intro-Programmierung C-64, Tools), Carsten Jendro (Kernal- und Parserprogrammierung C-64), Henrik Fisch (Kernal- und Introprogrammierung MS-DOS), Kjersten Waldheim (Parserprogrammierung MS-DOS), Oliver Brühl (Grafiken und Animationen AMIGA & MS-DOS) und Klaus Adamovsky (Graphiken C-64). Besonderer Dank gilt Johnny, der "bayrischen Forelle" - stellvertretend für all die Leute, die mitgeholfen haben, "Soul Crystal" zu dem zu machen, was Ihr jetzt in den Händen haltet, indem sie uns Unmengen wertvoller Tips, Hinweise und Denkanstöße gaben, und uns nach jedem Nervenzusammenbruch auf's Neue halfen, uns weiter an die Verwirklichung unserer größenwahnsinnigen Ideen zu setzen. Ohne sie wäre das Projekt "Soul Crystal" wahrscheinlich niemals über die Planungsphase hinausgekommen.
    return;
}


void PartB_HandleGrabe() { // Part B, script $79f2; command 4 (GRABE), SELECT $7702 case 4
    if ( currentRoom == IN_EINEM_VERSCHUETTETEN_GANG ) {
        if ( objectState[TOTENSCHAEDEL] == 0x01 && objectLocation[SCHAUFEL] == 0xff ) {
            objectLocation[TOTENSCHAEDEL] = currentRoom;
            objectState[TOTENSCHAEDEL] = 0x00;
            pendingTextID = 0xe7; // text ID 231 (0x00e7), script $7a12: B2 record 271: Erwartungsvoll gräbst Du den harten Boden auf - genau an der Stelle, die Dir Bruder Jack genannt hat. Nach wenigen Spatenstichen stößt Du auch schon auf etwas Hartes...: Mit zitternden Fingern greifst Du vorsichtig in das Loch - und ziehst einen grinsenden, vergilbten Totenschädel daraus hervor!
            return;
        }
    }
    if ( currentRoom == AUF_DEM_FRIEDHOF ) {
        pendingTextID = 0x0275; // text ID 629 (0x0275), script $7a21: B2 record 444: Du buddelst ein wenig im Erdreich herum, doch außer einer mumifizierten Hand, die Dir den ausgestreckten Mittelfinger zeigt, und einigen vergilbten Knochen, die zweifelsohne menschlicher Herkunft zu sein scheinen, kannst Du nichts Interessantes finden. Enttäuscht wirfst Du Deine Funde hinter Dich ins Gebüsch.
        return;
    }
    pendingTextID = 0x33; // text ID 51 (0x0033), script $7a2a: B2 record 153: Also, jetzt reicht's ja wohl! Als ob es nicht schon reichen würde, daß Du blind wie ein Maulwurf durch die Gegend rennst: Jetzt versuchst Du Dich auch noch artgerecht durchs Erdreich zu buddeln! Mal ganz ehrlich: Man kann es mit der Realitätstreue in Adventures auch übertreiben...

x7a2e:
    return;
}


void PartB_HandleHinunter() { // Part B, script $7a2f; command 5 (HINUNTER), SELECT $7702 case 5
    imageID = 0xff;
    if ( down[currentRoom] != 0x00 ) {
        currentRoom = down[currentRoom];
        objectLocation[DAVE] = currentRoom;
        Code2E5B();
        imageID = currentRoom;
    } else {
        if ( down[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7a4f: B2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartB_HandleOst() { // Part B, script $7a5e; command 6 (OST), SELECT $7702 case 6
    imageID = 0xff;
    if ( currentRoom == VOR_FIRONS_EISPALAST ) {
        if ( objectState[DACHSSCHLITTEN] == 0x01 ) {
            objectLocation[DACHSSCHLITTEN] = IN_DER_EISWUESTE;
        }
    }
    if ( currentRoom == IM_TIEFEN_WALD ) {
        pendingTextID = 0xdf; // text ID 223 (0x00df), script $7a7e: B2 record 263: Merkwürdig: Der Weg, von dem aus Du diesen Teil des Waldes betreten hast, ist nicht mehr zu erkennen! Dickes, dorniges Gestrüpp versperrt Dir den Weg, als ob niemals etwas anderes dort gewesen wäre...
        goto x7aa8;
    }
    if ( east[currentRoom] != 0x00 ) {
        currentRoom = east[currentRoom];
        objectLocation[DAVE] = currentRoom;
        Code2E5B();
        imageID = currentRoom;
    } else {
        if ( east[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7aa2: B2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }

x7aa8:
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartB_HandleAusgaenge() { // Part B, script $7ab1; command 7 (AUSGAENGE), SELECT $7702 case 7
    SPECIAL(0x08); // Ausgaenge listen
    return;
}


void PartB_HandleDisketteinstallieren() { // Part B, script $7ab5; command 8 (DISKETTEINSTALLIEREN), SELECT $7702 case 8
    SPECIAL(0x09); // Diskette installieren
    return;
}


void PartB_HandleInventar() { // Part B, script $7ab9; command 9 (INVENTAR), SELECT $7702 case 9
    SPECIAL(0x0a); // Inventar anzeigen
    return;
}


void PartB_HandleSchau() { // Part B, script $7abd; command 10 (SCHAU), SELECT $7702 case 10
    visited[currentRoom] = 0x00;
    Code2E5B();
    return;
}


void PartB_HandleNord() { // Part B, script $7ac4; command 11 (NORD), SELECT $7702 case 11
    imageID = 0xff;
    if ( currentRoom == IM_KAMINZIMMER ) {
        if ( north[IM_KAMINZIMMER] != 0x00 && objectState[KOENIG] < 0x02 ) {
            objectState[HAUSTUER] = 0x00;
        }
    }
    if ( currentRoom == IN_EINEM_SCHNEEBEDECKTEN_TAL ) {
        if ( objectState[HUNDESCHLITTEN] == 0x00 && objectState[DACHSSCHLITTEN] == 0x00 ) {
            pendingTextID = 0xe0; // text ID 224 (0x00e0), script $7afa: B2 record 264: Eis und Schnee soweit das Auge reicht - willst Du die Eiswüste wirklich zu Fuß durchqueren? Das kann doch wohl nicht Dein Ernst sein, oder?
            goto x7cf8;
        } else {
            if ( objectState[HUNDESCHLITTEN] == 0x01 ) {
                objectLocation[HUNDESCHLITTEN] = IN_DER_EISWUESTE;
            } else {
                if ( objectState[DACHSSCHLITTEN] == 0x01 ) {
                    objectLocation[DACHSSCHLITTEN] = IN_DER_EISWUESTE;
                }
            }
        }
    }
    if ( currentRoom == VOR_FIRONS_EISPALAST && objectState[ELIXIER] == 0x00 ) {
        pendingTextID = 0xe4; // text ID 228 (0x00e4), script $7b30: B2 record 268: Der Yeti macht aber ganz und gar nicht den Eindruck, als hätte er vor, Dich bei Deinem Vorhaben zu unterstützen...
        goto x7cf8;
    } else {
        if ( currentRoom == VOR_FIRONS_EISPALAST && objectState[ELIXIER] == 0x02 ) {
            score = score + remainingPoints[0xa2];
            remainingPoints[0xa2] = 0x00;
            pendingTextID = 0xe3; // text ID 227 (0x00e3), script $7b51: B2 record 267: Unbemerkt schleichst Du Dich an dem Yeti vorbei in den Thronsaal - keinen Moment zu früh: Kaum hast Du die Halle erreicht, werden aus dem Nichts Deine Konturen sichtbar...
            showtext();
            Restart();
            currentRoom = IN_FIRONS_THRONSAAL;
            objectLocation[DAVE] = IN_FIRONS_THRONSAAL;
            Code2E5B();
            showtext();
            imageID = currentRoom;
            goto x7cf8;
        }
    }
    if ( currentRoom == IM_TIEFEN_WALD && objectLocation[AMULETT] == 0xff && objectState[AMULETT] == 0x01 ) {
        pendingTextID = 0xde; // text ID 222 (0x00de), script $7b7f: B2 record 262: Dir wird etwas flau im Magen, als Du die magische Barriere durchschreitest, aber Mylgors Amulett schützt Dich vor ihrer zerstörerischen Kraft: Sicher und unversehrt betrittst Du also den verfluchten Teil des Waldes...
        showtext();
        Restart();
        pendingTextID = 0x0161; // text ID 353 (0x0161), script $7b85: B2 record 393: Als Du die magische Barriere durchschreitest, die Dich bisher von dem verfluchten Wald im Norden getrennt hat, hörst Du eine Stimme aus den Baumkronen herausdröhnen! Es ist ein Waldgeist, der Dich bittet, einen bestimmten Code aus dem Handbuch einzugeben, um sicherzustellen, daß Du auch wirklich authorisiert bist, Deine Reise fortzusetzen...
        showtext();
        Restart();
        SPECIAL(0x01); // Codeabfrage
        objectLocation[DAVE] = currentRoom;
        goto x7cf8;
    }
    if ( north[currentRoom] != 0x00 ) {
        currentRoom = north[currentRoom];
        Code2E5B();
        objectLocation[DAVE] = currentRoom;
        imageID = currentRoom;
    } else {
        if ( north[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7bb4: B2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    temp = 0x01;

x7bbe:
    temp = temp + 0x01;
    if ( temp <= 0xa5 ) {
        goto x7bbe;
    }
    if ( currentRoom == IM_TIEFEN_WALD && objectState[AMULETT] == 0x00 ) {
        pendingTextID = 0xdd; // text ID 221 (0x00dd), script $7bda: B2 record 261: Eine starke und unsagbar böse Aura hält Dich von dem verfluchten Waldabschnitt im Norden fern...
        goto x7cf8;
    }
    if ( currentRoom == IM_KAMINZIMMER && objectState[HAUSTUER] == 0x00 && objectState[BETT1] == 0x00 ) {
        pendingTextID = 0xdb; // text ID 219 (0x00db), script $7bf6: B2 record 259: Nun denk' doch mal nach! Wer würde nachts schon seine Tür offenstehen lassen?
        goto x7cf8;
    }
    if ( currentRoom == VOR_MYLGORS_HAUS && objectLocation[MYLGOR] == IM_KAMINZIMMER ) {
        objectState[HAUSTUER] = 0x00;
        objectLocation[MYLGOR] = IN_MYLGORS_GEHEIMLABOR;
        objectState[MYLGOR] = 0x04;
        goto x7cf8;
    }
    if ( currentRoom == AUF_EINEM_HUEGEL3 ) {
        if ( objectState[HONIG] == 0x14 && objectState[FELLSTIEFEL] == 0x01 ) {
            pendingTextID = 0xe1; // text ID 225 (0x00e1), script $7c36: B2 record 265: Vorsichtig balancierst Du auf dem dicken Baumstamm: Zwei, drei Mal rutschst Du ab, fängst Dich jedoch im letzten Augenblick wieder, bevor Du in die Tiefe fallen kannst! Hättest Du Deine Stiefel nicht mit dem klebrigen Honig präpariert, wäre es wahrscheinlich nicht so glimpflich verlaufen: Zitternd, aber unversehrt, erreichst Du das andere Ende des Baumstamms und springst ab - froh, wieder festen Boden unter den Füßen zu haben...
            showtext();
            Restart();
            Code2E5B();
            imageID = currentRoom;
            goto x7cf8;
        } else {
            if ( objectState[HONIG] != 0x14 || objectState[FELLSTIEFEL] != 0x01 ) {
                imageID = 0x84;
                objectLocation[DAVE] = 0xff;
                ShowImage();
                pendingTextID = 0xe2; // text ID 226 (0x00e2), script $7c5e: B2 record 266: Du versuchst, auf dem dicken Baumstamm zu balancieren, aber auf halbem Wege, genau über dem tiefen Abgrund, rutschst Du ab und fällst... und fällst... und fäll... MAAATSCH! Daß Du es aber auch immer gleich übertreiben mußt! Der ganze Fluß war frei - mußtest Du Dir denn unbedingt den einzigen Felsen für Deine Landung aussuchen? Na okay, das war's dann wohl mal wieder. Eigentlich schade, daß wir uns entschieden haben, doch keine Geräuscheffekte in diese Version zu integrieren, denn Dein langgezogener Schrei sowie der dumpfe Aufprall in dem ca. zweihundert Meter tiefer gelegenen Tal waren wirklich hörenswert! Aber es hätte die Produktionskosten in schwindelerregende Höhen getrieben, Freiwillige zu finden, die sich zur Erzeugung dieser Geräusche bereit erklärt hätten... Naja gut, ich gebe zu: Wir HATTEN jemanden, der es gewagt hat, aber dummerweise vergaß Chris den Sampler einzuschalten! Mit der Witwe prozessieren wir bis heute...
                showtext();
                Restart();
                imageID = 0xff;
                goto x7cf8;
            }
        }
    }
    if ( currentRoom == IN_DER_EISWUESTE && objectLocation[HUNDESCHLITTEN] == IN_DER_EISWUESTE ) {
        imageID = currentRoom;
        ShowImage();
        showtext();
        Restart();
        imageID = 0xff;
        pendingTextID = 0xd3; // text ID 211 (0x00d3), script $7c85: B2 record 251: Während Deiner langen Reise durch die Eiswüste ist Dir leider das Wolfsrudel entgangen, das die ganze Zeit lang der Spur Deines Schlittens gefolgt ist! Nun, als Du den Schlitten anhältst, um Deinen Hunden ein paar Minuten Erholung zu gönnen, fangen die Wölfe an, Euch zu umzingeln! Nach einigen Sekunden beginnt der größte und stärkste Wolf, ein riesiges Tier mit schmutzig-grauem Fell, laut zu heulen - und ein schauriges Geheul wie aus tausend Kehlen fällt mit ein! Diese Bestien scheinen seit Wochen nichts mehr zu fressen bekommen zu haben: Ohne jede Vorwarnung greifen sie Deinen Schlitten an! Zu lange sind Deine Schlittenhunde schon gelaufen, zu sehr hast Du sie angetrieben, als daß sie noch wirkungsvollen Widerstand leisten könnten: Hilflos mußt Du mit ansehen, wie sie zu einer widerlichen, blutigen Masse zerfleischt werden... Nachdem sie die Eingeweide aus den noch im Todeskrampf zuckenden Hunden herausgerissen haben, verschwindet das Wolfsrudel genauso schnell wieder, wie es gekommen ist...
        objectLocation[HUNDESCHLITTEN] = RAUM_NULL;
        objectState[HUNDESCHLITTEN] = 0x00;
        goto x7cf8;
    }
    if ( currentRoom == IN_EINEM_GLETSCHER ) {
        objectLocation[DAVE] = 0xff;
        imageID = currentRoom;
        ShowImage();
        Code2E5B();
        showtext();
        Restart();
        imageID = 0xff;
        goto x7cf8;
    }
    if ( currentRoom == IN_MYLGORS_GEHEIMLABOR ) {
        if ( objectState[REAGENZIEN] > 0x00 ) {
            imageID = 0x88;
            objectLocation[DAVE] = 0xff;
            ShowImage();
            pendingTextID = 0xe5; // text ID 229 (0x00e5), script $7ccd: B2 record 269: Unvorsichtigerweise öffnest Du noch einmal die Tür zu Mylgors Geheimlabor: Gnadenlos schlägt Dir die Feuersbrunst ins Gesicht und raubt Dir den Atem! Du schaust Dich um, um Dich zu vergewissern, daß Mylgor auch wirklich tot ist, kannst ihn aber nirgendwo entdecken! "Okay!", sagst Du Dir selbstzufrieden, "Sieht ganz so aus, als hätte ich ganze Arbeit geleistet! Friede seiner Asche!", und willst das Labor gerade wieder verlassen, als sich eine von Brandwunden fürchterlich entstellte Hand um Dein Fußgelenk schließt - MYLGORS HAND! Der wahnsinnige Alchemist hat es noch geschafft, sich kurz bevor Du eintratst zur Tür zu schleppen! Unter hysterischem Gelächter reißt er Dich zu Boden, springt schneller auf, als Du es ihm jemals zugetraut hättest, rennt aus dem Labor und wirft die Tür hinter sich ins Schloß! In Deinem panischen Versuch, den Flammen zu entkommen, stößt Du unvorsichtigerweise gegen ein kleines Tischchen, auf dem verschiedene Chemikalienbehälter stehen - einer von ihnen mit der Aufschrift "N-I-T-R-O - NICHT RAUCHEN!" Daß man Nitro nicht rauchen kann, bedauerst Du zwar außerordentlich, aber was Dich im Moment viel mehr beunruhigt ist der Gedanke, der Dir kommt, als Du das Fläschchen kippeln und umfallen siehst - denn: Nitroglyzerin ist explosiv! Ein wirklich beruhigendes Gefühl, nicht ganz unwissend aus dieser Welt zu scheiden...
            showtext();
            Restart();
            imageID = 0xff;
            goto x7cf8;
        } else {
            if ( objectState[MYLGOR] == 0x07 && objectState[REAGENZIEN] == 0x00 ) {
                pendingTextID = 0x00; // text ID 0 (0x0000), script $7cea: no text
                imageID = 0xff;
                goto x7cf8;
            }
        }
    }

x7cf8:
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartB_HandleSpielende() { // Part B, script $7d01; command 12 (SPIELENDE), SELECT $7702 case 12
    SPECIAL(0x05); // Spielende
    return;
}


void PartB_HandleNeustart() { // Part B, script $7d05; command 13 (NEUSTART), SELECT $7702 case 13
    SPECIAL(0x04); // Neustart
    return;
}


void PartB_HandleLaden() { // Part B, script $7d09; command 14 (LADEN), SELECT $773a case 1
    SPECIAL(0x02); // Laden
    return;
}


void PartB_HandlePunkte() { // Part B, script $7d0d; command 15 (PUNKTE), SELECT $773a case 2
    pendingTextID = 0x01; // text ID 1 (0x0001), script $7d0d: engine $5D94: Score message assembled by the engine.
    return;
}


void PartB_HandleLoesung() { // Part B, script $7d12; command 16 (LOESUNG), SELECT $773a case 3
    SPECIAL(0x06); // Loesung
    return;
}


void PartB_HandleMusikein() { // Part B, script $7d16; command 17 (MUSIKEIN), SELECT $773a case 4
    temp = 0x00;
    SPECIAL(0x07); // Musik ein
    return;
}


void PartB_HandleAusgaenge12() { // Part B, script $7d1e; command 18 (AUSGAENGE12), SELECT $773a case 5
    temp = 0x01;
    SPECIAL(0x08); // Ausgaenge listen
    return;
}


void PartB_HandleSued() { // Part B, script $7d26; command 19 (SUED), SELECT $773a case 6
    imageID = 0xff;
    if ( currentRoom == IM_KAMINZIMMER && objectLocation[MYLGOR] == IM_KAMINZIMMER ) {
        if ( objectState[BETT1] == 0x00 ) {
            pendingTextID = 0xce; // text ID 206 (0x00ce), script $7d3f: B2 record 246: Nachdem Du die Dienerkammer betreten hast, steckt Mylgor noch einmal kurz seinen Kopf durch den Türspalt, wünscht Dir eine angenehme Nachtruhe, verläßt den Raum - und schließt die Tür hinter sich ab!
            showtext();
            Restart();
        }
        Code2E5B();
    }
    if ( currentRoom == IN_DER_EISWUESTE ) {
        if ( objectState[HUNDESCHLITTEN] == 0x00 && objectState[DACHSSCHLITTEN] == 0x00 ) {
            pendingTextID = 0xe0; // text ID 224 (0x00e0), script $7d5d: B2 record 264: Eis und Schnee soweit das Auge reicht - willst Du die Eiswüste wirklich zu Fuß durchqueren? Das kann doch wohl nicht Dein Ernst sein, oder?
            goto x7e4d;
        } else {
            if ( objectState[HUNDESCHLITTEN] == 0x01 ) {
                objectLocation[HUNDESCHLITTEN] = IN_EINEM_SCHNEEBEDECKTEN_TAL;
            } else {
                if ( objectState[DACHSSCHLITTEN] == 0x01 ) {
                    objectLocation[DACHSSCHLITTEN] = IN_EINEM_SCHNEEBEDECKTEN_TAL;
                }
            }
        }
    }
    if ( currentRoom == IN_EINEM_SCHNEEBEDECKTEN_TAL ) {
        if ( objectState[HUNDESCHLITTEN] == 0x01 || objectState[DACHSSCHLITTEN] == 0x01 ) {
            pendingTextID = 0x1a; // text ID 26 (0x001a), script $7d9b: B2 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
            goto x7e4d;
        }
    }
    if ( currentRoom == IN_FIRONS_THRONSAAL ) {
        pendingTextID = 0xe4; // text ID 228 (0x00e4), script $7daa: B2 record 268: Der Yeti macht aber ganz und gar nicht den Eindruck, als hätte er vor, Dich bei Deinem Vorhaben zu unterstützen...
        goto x7e4d;
    }
    if ( currentRoom == VOR_MYLGORS_HAUS && objectState[KOENIG] > 0x02 && objectState[KOENIG] < 0x05 ) {
        if ( objectState[HOLZTUER] == 0x01 ) {
            objectState[KOENIG] = 0x05;
            pendingTextID = 0xd0; // text ID 208 (0x00d0), script $7dd4: B2 record 248: Als Du wieder das Kaminzimmer betrittst, wunderst Du Dich, weshalb Mylgor die Tür eigentlich nicht verschlossen hat. Irgendetwas in diesem Haus scheint nicht in Ordnung zu sein - ganz und gar nicht in Ordnung... Du fragst Dich ebenfalls, warum Mylgor nicht anwesend ist, um Dich zu begrüßen: Vielleicht ist dies bloß eine Falle, weil er gemerkt hat, daß Du Dein Versprechen, Firon zu beseitigen, nicht gehalten hast? Oder haben König Richard und sein Bruder Dir vielleicht doch nicht die volle Wahrheit gesagt und Mylgor umbringen lassen, bevor Du sie durchschauen und Deinen Fehler, Firon am Leben zu lassen, wiedergutmachen könntest? Dir kommen starke Zweifel und Gewissensbisse, als Du Dir vor Augen hältst, daß durch Dein Verschulden vielleicht ein unschuldiger Mensch sterben mußte...
            showtext();
            Restart();
        }
    }
    if ( south[currentRoom] != 0x00 ) {
        currentRoom = south[currentRoom];
        Code2E5B();
        objectLocation[DAVE] = currentRoom;
        imageID = currentRoom;
    } else {
        if ( south[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7df8: B2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    if ( currentRoom == AUF_EINER_LICHTUNG2 ) {
        pendingTextID = 0xdc; // text ID 220 (0x00dc), script $7e04: B2 record 260: Leider kann ich keinen Weg durch die dicken Büsche und das dichte Gestrüpp finden - aber vielleicht könnten wir ja einen Ortskundigen finden, der uns hindurchführt?
        goto x7e4d;
    }
    if ( currentRoom == AUF_EINEM_HUEGEL2 ) {
        if ( objectState[FELLSTIEFEL] != 0x01 || objectState[HONIG] != 0x14 ) {
            imageID = 0x84;
            objectLocation[DAVE] = 0xff;
            ShowImage();
            imageID = 0xff;
            pendingTextID = 0xe2; // text ID 226 (0x00e2), script $7e30: B2 record 266: Du versuchst, auf dem dicken Baumstamm zu balancieren, aber auf halbem Wege, genau über dem tiefen Abgrund, rutschst Du ab und fällst... und fällst... und fäll... MAAATSCH! Daß Du es aber auch immer gleich übertreiben mußt! Der ganze Fluß war frei - mußtest Du Dir denn unbedingt den einzigen Felsen für Deine Landung aussuchen? Na okay, das war's dann wohl mal wieder. Eigentlich schade, daß wir uns entschieden haben, doch keine Geräuscheffekte in diese Version zu integrieren, denn Dein langgezogener Schrei sowie der dumpfe Aufprall in dem ca. zweihundert Meter tiefer gelegenen Tal waren wirklich hörenswert! Aber es hätte die Produktionskosten in schwindelerregende Höhen getrieben, Freiwillige zu finden, die sich zur Erzeugung dieser Geräusche bereit erklärt hätten... Naja gut, ich gebe zu: Wir HATTEN jemanden, der es gewagt hat, aber dummerweise vergaß Chris den Sampler einzuschalten! Mit der Witwe prozessieren wir bis heute...
            showtext();
            Restart();
            imageID = 0xff;
            goto x7e4d;
        }
        pendingTextID = 0xe1; // text ID 225 (0x00e1), script $7e3e: B2 record 265: Vorsichtig balancierst Du auf dem dicken Baumstamm: Zwei, drei Mal rutschst Du ab, fängst Dich jedoch im letzten Augenblick wieder, bevor Du in die Tiefe fallen kannst! Hättest Du Deine Stiefel nicht mit dem klebrigen Honig präpariert, wäre es wahrscheinlich nicht so glimpflich verlaufen: Zitternd, aber unversehrt, erreichst Du das andere Ende des Baumstamms und springst ab - froh, wieder festen Boden unter den Füßen zu haben...
        showtext();
        Code2E5B();
        Restart();
        imageID = currentRoom;
        showtext();
        goto x7e4d;
    }

x7e4d:
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartB_HandleSpeichern() { // Part B, script $7e56; command 20 (SPEICHERN), SELECT $773a case 7
    SPECIAL(0x03); // Speichern
    return;
}


void PartB_HandleHinauf() { // Part B, script $7e5a; command 21 (HINAUF), SELECT $773a case 8
    imageID = 0xff;
    if ( currentRoom == IN_EINEM_KURZEN_KORRIDOR ) {
        if ( objectState[LABORTUER] != 0x00 && objectState[REAGENZIEN] >= 0x01 && objectState[MYLGOR] < 0x09 ) {
            imageID = 0x89;
            objectLocation[DAVE] = 0xff;
            ShowImage();
            pendingTextID = 0xd9; // text ID 217 (0x00d9), script $7e85: B2 record 257: Hmmm...: War wohl irgendwie nicht so toll, Dein Plan: Die Druckwelle, die von der Explosion der Reagenzien in Mylgors Labor verursacht wurde, sprengt die massive Labortür auf und läßt die gesamte Hütte über Dir zusammenbrechen! Ziemlich blöder Fehler, Mann! Vielleicht sicherst Du die Tür beim nächsten Mal einfach mal besser ab...? Aber unter Umständen tröstet Dich ja die Tatsache, daß Mylgor "noch viel toter" ist als Du: DEIN Körper kann zumindest noch begraben werden - Mylgors Überreste hingegen müßte man erst von den Wänden abkratzen...
            showtext();
            Restart();
            return;
        } else {
            if ( objectState[LABORTUER] != 0x00 && objectState[MYLGOR] >= 0x05 && objectState[REAGENZIEN] == 0x00 ) {
                imageID = 0x86;
                objectLocation[DAVE] = 0xff;
                ShowImage();
                pendingTextID = 0xd7; // text ID 215 (0x00d7), script $7eb0: B2 record 255: Als Du gerade die Steigeisen erklimmen willst, um wieder in Mylgors Kaminzimmer hinaufzuklettern, hörst Du, wie hinter Dir die Labortür geöffnet wird, und siehst Mylgor herauskommen, wie wild mit der Pferdespritze herumfuchtelnd! Vielen Dank: Du botest ihm gerade genau die richtige Position, um seinen "Schuß" zu plazieren - obwohl die Injektion, die er Dir verpaßt, wirklich alles andere als heilsam ist...
                showtext();
                Restart();
                return;
            }
        }
    }
    if ( up[currentRoom] != 0x00 ) {
        currentRoom = up[currentRoom];
        Code2E5B();
        objectLocation[DAVE] = currentRoom;
        imageID = currentRoom;
    } else {
        if ( up[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7ed8: B2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    if ( imageID != 0xff ) {
        ShowImage();
    }

x7ee6:
    return;
}


void PartB_HandleAusfuehrlich() { // Part B, script $7ee7; command 22 (AUSFUEHRLICH), SELECT $773a case 9
    if ( visited[RAUM_NULL] == 0x00 ) {
        visited[RAUM_NULL] = 0x01;
    }
    pendingTextID = 0x24; // text ID 36 (0x0024), script $7ef6: B2 record 138: "Ausführliche Beschreibungen" aktiviert. Zu jedem Raum, den Du von nun an betrittst, wird die vollständige Beschreibung geliefert, ganz gleich, ob Du ihn schon betreten hast oder nicht.
    return;
}


void PartB_HandleWarte() { // Part B, script $7efb; command 23 (WARTE), SELECT $773a case 10
    pendingTextID = 0x36; // text ID 54 (0x0036), script $7efb: B2 record 156: Die Zeit verstreicht wie der Lauf der Sonne: Langsam, aber unaufhaltsam...
    return;
}


void PartB_HandleWest() { // Part B, script $7f00; command 24 (WEST), SELECT $773a case 11
    imageID = 0xff;
    if ( currentRoom == IN_DER_EISWUESTE ) {
        if ( objectState[DACHSSCHLITTEN] == 0x01 ) {
            objectLocation[DACHSSCHLITTEN] = VOR_FIRONS_EISPALAST;
        }
    }
    if ( currentRoom == AUF_EINEM_HUEGEL1 && objectLocation[ORKKIND] == AUF_EINER_LICHTUNG2 ) {
        currentRoom = AUF_EINER_LICHTUNG2;
        objectLocation[DAVE] = AUF_EINER_LICHTUNG2;
        imageID = currentRoom;
        ShowImage();
        Code2E5B();
        showtext();
        Restart();
        pendingTextID = 0xd1; // text ID 209 (0x00d1), script $7f38: B2 record 249: In der Mitte der Lichtung spielt ein kleiner Orkjunge "Ameisenbomber", ein unter den Orks sehr beliebtes Jagdspiel. Er scheint so um die achtzig Jahre alt zu sein und noch nicht vollständig ausgewachsen - aber warte noch ein paar Jahrhunderte, und er wird Dich mühelos mit der linken Hand erwürgen... Ein paar Augenblicke lang schaust Du dem Kind bei seinem Spiel zu: Seine rechte Hand schwebt hoch in der Luft über einem Ameisenloch, während es mit der Linken die auf dem Boden herumkrabbelnden Waldameisen in Richtung des Loches scheucht. Jedesmal, wenn eine Ameise versucht, in ihren Bau zu schlüpfen, läßt der Kleine einen Kiesel auf sie fallen! Viel Glück scheint der junge Ork bei dieser Partie bisher jedoch noch nicht gehabt zu haben, bemerkst Du beruhigt, als er angesichts einer Ameise, die er kurz vor dem Loch verfehlt hat, zerknirscht knurrt: "Okay, 23 : 4 für Euch! Aber jetzt geht's rund, Leute!" Irgendwann hast Du genug davon, dem Ork bei seinen sadistischen Machenschaften zuzusehen, und trittst auf ihn zu. Als er Dich bemerkt, reicht der Kleine Dir ein paar Kiesel: "Hier! Laß uns ein Match machen: Ich setze zwei Goldstücke!" Ohne auf sein Angebot einzugehen, nimmst Du dem Jungen die Kiesel aus der Hand und wirfst sie mit Nachdruck ins Gebüsch. Der Ork scheint zu verstehen, zieht eine Schnute und murmelt: "Dann eben nicht..."
        return;
    }
    if ( west[currentRoom] != 0x00 ) {
        currentRoom = west[currentRoom];
        objectLocation[DAVE] = currentRoom;
        Code2E5B();
        imageID = currentRoom;
    } else {
        if ( west[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7f5c: B2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    temp = 0x01;

x7f66:
    temp = temp + 0x01;
    if ( temp <= 0xa5 ) {
        goto x7f66;
    }
    if ( currentRoom == IM_DIENERSCHLAFZIMMER && objectState[WESTTUER] == 0x00 ) {
        pendingTextID = 0xda; // text ID 218 (0x00da), script $7f82: B2 record 258: Würde ich ja nur zu gern, wenn ich könnte - aber da steht uns leider eine magische Wand im Weg! So ein Ärger aber auch, was?
        return;
    }
    if ( imageID != 0xff ) {
        ShowImage();
    }

x7f92:
    return;
}


void PartB_Sub_7f93() { // Part B, script $7f93; command 25 (NIX1), SELECT $773a case 12
    return;
}


void PartB_Sub_7f94() { // Part B, script $7f94; command 26 (NIX2), SELECT $773a case 13
    return;
}


void PartB_HandleSchliesse() { // Part B, script $7f95; command 27 (SCHLIESSE), SELECT $7772 case 1
    tableptr = data0x939c;
    temp = 0x01;

x7f9c:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    scratch2 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x7fba;
    }
    temp = temp + 0x01;
    if ( temp <= 0x1c ) {
        goto x7f9c;
    }

x7fba:
    if ( temp > 0x1c ) {
        pendingTextID = 0x07; // text ID 7 (0x0007), script $7fc0: B2 record 109: Aber das kannst Du doch überhaupt nicht schließen!
        return;
    }
    if ( objectState[object1] == 0x02 || objectState[object1] == 0x00 ) {
        pendingTextID = 0x3a; // text ID 58 (0x003a), script $7fd5: B2 record 160: Wie willst Du denn etwas Geschlossenes noch schließen?
        return;
    }
    if ( objectState[object1] == 0x01 ) {
        objectState[object1] = 0x02;
        pendingTextID = 0x06; // text ID 6 (0x0006), script $7fe9: B2 record 108: Gut - geschlossen...
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
        if ( object1 == FRIEDHOFSTOR1 ) {
            objectState[FRIEDHOFSTOR2] = 0x02;
            north[IM_KLOSTERGARTEN] = 0x00;
        } else {
            if ( object1 == FRIEDHOFSTOR2 ) {
                objectState[FRIEDHOFSTOR1] = 0x02;
                south[AUF_DEM_FRIEDHOF] = 0x00;
            }
        }
        if ( object1 == SARKOPHAG ) {
            objectLocation[SKELETT1] = RAUM_NULL;
        }
        if ( object1 == LABORTUER && objectState[REAGENZIEN] != 0x00 ) {
            pendingTextID = 0xe6; // text ID 230 (0x00e6), script $8061: B2 record 270: Hastig wirfst Du die Labortür ins Schloß! Durch die exothermischen Reaktionen, die im Labor stattfinden, und die daraus resultierende extreme Hitze verzieht sich die Stahltür sofort in ihrem Rahmen, so daß menschliche Kraft wohl nicht mehr ausreichen dürfte, sie wieder zu öffnen...
            return;
        }
        if ( object1 == LABORTUER ) {
            north[IN_EINEM_KURZEN_KORRIDOR] = 0x00;
            south[IN_MYLGORS_GEHEIMLABOR] = 0x00;
            objectState[LABORTUER] = 0x02;
            objectState[STAHLTUER1] = 0x02;
        } else {
            if ( object1 == STAHLTUER1 ) {
                north[IN_EINEM_KURZEN_KORRIDOR] = 0x00;
                south[IN_MYLGORS_GEHEIMLABOR] = 0x00;
                objectState[LABORTUER] = 0x02;
                objectState[STAHLTUER1] = 0x02;
            }
        }
    }

x80a9:
    return;
}


void PartB_HandleZerstoere() { // Part B, script $80aa; command 28 (ZERSTOERE), SELECT $7772 case 2
    tableptr = data0x9460;
    temp = 0x01;

x80b1:
    scratch1 = *(unsigned short*)tableptr; tableptr += 2;
    pendingTextID = *(unsigned short*)tableptr; tableptr += 2;
    if ( scratch1 == object1 ) {
        goto x80cd;
    }
    temp = temp + 0x01;
    if ( temp <= 0x07 ) {
        goto x80b1;
    }

x80cd:
    if ( temp <= 0x07 ) {
        return;
    }
    if ( object1 == DAVE ) {
        pendingTextID = 0x3c; // text ID 60 (0x003c), script $80dd: B2 record 162: Eine weise, ja geradezu philosophische Entscheidung: Selbstmord heißt, Probleme aus der Welt zu schaffen, die man ohne seine Eltern gar nicht hätte! Wirklich schönes Schlußwort! Hasta la vista... - Babe! HARAKIRIIIIIIIIIIHHHHH!
        showtext();
        Restart();
        objectLocation[DAVE] = 0xff;
        return;
    }
    if ( object1 == ORKKIND && currentRoom == AUF_EINER_LICHTUNG2 ) {
        pendingTextID = 0xe9; // text ID 233 (0x00e9), script $80f8: B2 record 273: Freundlich lächelnd gehst Du auf das Kind zu, das Dich aus großen, erwartungsvollen Augen anblickt. Ein paar Meter vor ihm verwandelt sich Dein Lächeln jedoch in ein boshaftes Grinsen: Mit hämischem Gelächter legst Du Deine Hände um seine Kehle und drückst zu! "Das ist für die Ameisen, Du Schwein!", stößt Du verbissen zwischen Deinen Zähnen hervor, als das arme, kleine Ding seine letzten Worte krächtzt, als ob es Dich noch nach dem Grund für Dein feindseliges Betragen fragen wollte. Schließlich sinkt es mit einem letzten anklagenden Blick in seinen Augen zu Boden und haucht sein Leben zu Deinen Füßen aus (..."Say Live And Let Die"!)...
        objectLocation[ORKKIND] = RAUM_NULL;
        return;
    }
    if ( object1 == MYLGOR && currentRoom == VOR_MYLGORS_HAUS ) {
        objectLocation[DAVE] = 0xff;
        imageID = 0x83;
        ShowImage();
        pendingTextID = 0xec; // text ID 236 (0x00ec), script $811c: B2 record 276: Du versuchst, Mylgors Nase zu fassen zu bekommen, um ihn zu zwingen, endlich die Tür zu öffnen, auf daß Du ihn leichter meucheln könntest, aber der Kerl besitzt tatsächlich die ungeheuerliche Dreistigkeit, Dir zeigen zu wollen, daß er mit Deinem Vorhaben nicht so ganz einverstanden ist - und unglücklicherweise ist er etwas schneller als Du! Bevor Du ihn berührst, duckt er sich, und Deine Hände schießen ins Leere! Aber im selben Augenblick, als sie im Raum auftauchen, packt Mylgor sie und bricht Dir über den Lukenrahmen beide Arme! Du brüllst vor Schmerz, aber Dein Gegner ist noch nicht fertig mit Dir: Mit geradezu übermenschlicher Kraft zieht Mylgor Dich nach und nach durch die Luke - zwar nicht ganz vollständig, aber was nicht durchpaßt, muß halt draußen bleiben! Und das ist bei einer ca. 20 X 20 Zentimeter großen Luke ziemlich viel! Nun weißt Du auch endlich, wie einer Kartoffel zumute sein muß, die zu Pommes Frites verarbeitet wird - eine Frage, die Dich seit Urzeiten bewegt hat: Man fühlt sich eben ziemlich "gesiebt" - aber das ist dann auch schon die letzte Erkenntnis, die sich Dir in diesem Leben noch offenbart - denn ein Kopf, der als ein Haufen aus Blut und gebrochenen Knochen den Boden vor einer Haustür ziert, ist schließlich nicht mehr in der Lage, noch an irgendetwas zu denken, oder?
        showtext();
        Restart();
        return;
    }
    if ( object1 == FIRON ) {
        objectLocation[FIRON] = RAUM_NULL;
        pendingTextID = 0xea; // text ID 234 (0x00ea), script $8132: B2 record 274: Der alte Elfenkönig schien bereits auf Dein Vorhaben gefaßt zu sein: Ruhig und ohne zu klagen geht er in den Tod - und verschwindet in einer hellblauen Rauchwolke...
        return;
    }
    if ( object1 == WERWOLF ) {
        if ( objectState[KURZSCHWERT] == 0x03 && objectLocation[KURZSCHWERT] == 0xff ) {
            score = score + remainingPoints[0x9f];
            remainingPoints[0x9f] = 0x00;
            pendingTextID = 0xf0; // text ID 240 (0x00f0), script $815b: B2 record 280: Bevor Dein untoter Gegner Gelegenheit zum Angriff bekommt, fichst Du mit einer gewandten Bewegung gegen seine Brust! Kurz bevor Deine Klinge jedoch ihr Ziel findet, läßt Du sie überraschend nach oben, gegen den Hals der Bestie, schwingen, wo sie eine klaffende, rauchende Wunde hinterläßt, ohne daß der Werwolf auch nur die geringste Chance gehabt hätte, Deinen wahrhaft mörderisch guten Hieb abzuwehren! Die untote Kreatur sinkt, schwer verwundet durch Deine geweihte Waffe, mit einem ungläubigen Blick in ihren Augen zu Boden und haucht ihr "Leben" aus. "K.O. wegen vorzeitigen Ablebens in der ersten Runde!" - selbstzufrieden steckst Du Dein Schwert zurück in die Scheide und pustest Dir über die Fingernägel, als Dir der Gedanke kommt, daß dies auch eine Finte sein könnte: Vorsichtig, und mit einer Hand den Schwertgriff fest umklammernd, kniest Du neben dem Wolfskörper nieder, um zu sehen, ob Dein Gegner wirklich tot ist... Deine Sorge war unbegründet: Dampfendes, grünliches Blut rinnt aus einer langen, weit aufklaffenden Wunde aus seiner Kehle. Etwas anderes, was Du allerdings auch sehen mußt, ist etwas rotes Blut, das an einer der Wolfsklauen klebt - und als Du Dich, von bösen Vorahnungen geplagt, untersuchst, kannst Du eine kleine, aber dennoch ziemlich tiefe Wunde an Deinem linken Bein erkennen, die der Wolf wohl noch im Fallen gerissen haben muß, und aus der nun - GRÜNES Blut sickert! SCHEISSE! Jetzt, wo Du sie bemerkt hast, beginnt die Wunde höllisch zu brennen: Die Infektion hat begonnen, und es wird nur noch eine Frage der Zeit sein, bis auch Du beginnst, bei Vollmond zur Bestie zu werden! Während Du Dich resignierend auf einem der umgefallenen Grabsteine niederläßt, um über Dein ungewisses Schicksal nachzusinnen, verwandelt sich der der Körper des Wolfes in den verwesenden Leichnam einer einst wohl einmal wunderschönen, jungen Frau, die dankbar zu Dir aufzublicken scheint! Als Du sie berühren willst - zerfällt sie zu Staub...
            objectLocation[WERWOLF] = RAUM_NULL;
            objectState[WERWOLF] = 0x03;
            showtext();
            pendingTextID = 0x00; // text ID 0 (0x0000), script $816c: no text
            return;
        }
        pendingTextID = 0x00; // text ID 0 (0x0000), script $8174: no text
        return;
    }
    if ( object1 == REAGENZIEN ) {
        score = score + remainingPoints[0x74];
        remainingPoints[0x74] = 0x00;
        pendingTextID = 0xed; // text ID 237 (0x00ed), script $818e: B2 record 277: In Deiner Verzweiflung reißt Du an einem der massiven Holzregale, um die Reagenzien zwischen Dich und Mylgor zu schleudern - und es ist leichter als Du erwartet hattest: Ein kurzer Ruck, und es kippt mitsamt seinem Inhalt um! "Au Scheiße: Arnold!", denkst Du Dir, völlig verwundert über Deine plötzliche Kraft, als das Regal krachend auf dem Boden aufschlägt und sich der Inhalt der verschiedenen Reagenzien auf die Fliesen ergießt. Als sich zwei Flüssigkeiten vermischen, steigen dicke, ätzende Rauchwolken auf, die bald den ganzen Raum erfüllen und es Euch nahezu unmöglich machen, einander auch nur zu sehen! Eine laute Explosion haut Mylgor aus den Socken und wirft ihn brutal gegen die gegenüberliegende Wand, und plötzlich züngeln auf dem Boden Flammen auf, die sich bald ausbreiten und den Raum in ein riesiges Flammenmeer verwandeln! Heißer Einfall, Mann! Aber jetzt laß' uns hier besser verschwinden, bevor es ZU heiß wird...!
        objectLocation[REAGENZIEN] = RAUM_NULL;
        objectState[REAGENZIEN] = 0x01;
        showtext();
        pendingTextID = 0x00; // text ID 0 (0x0000), script $819f: no text
        return;
    }
    pendingTextID = 0x3d; // text ID 61 (0x003d), script $81a7: B2 record 163: "Dave the Destroyer", oder was? Uiuiui! Da möchte man sich ja vor Angst am liebsten hinter dem nächsten Baum verkriechen!

x81ab:
    return;
}


void PartB_HandleVerliere() { // Part B, script $81ac; command 29 (VERLIERE), SELECT $7772 case 3
    if ( objectLocation[object1] != 0xff ) {
        pendingTextID = 0x41; // text ID 65 (0x0041), script $81b3: B2 record 167: Nachdem Du eine halbe Stunde lang vergeblich in Deinen Taschen gewühlt hast, wird Dir klar, daß das Ding, das Du gerade so achtlos in die Gegend werfen wolltest, bereits in derselben liegt! Jaja, wenn's anfängt - dann im Kopf, gell?
        return;
    }
    if ( object1 == AMULETT || object1 == FELLSTIEFEL || object1 == JEANS || object1 == BAUMWOLLHEMD || object1 == TURNSCHUHE || object1 == TSHIRT || object1 == PURPURMANTEL || object1 == HOSE || object1 == BADEHOSE ) {
        if ( objectState[object1] == 0x01 ) {
            objectState[object1] = 0x00;
        }
    }
    if ( object1 == BLUT ) {
        pendingTextID = 0x026e; // text ID 622 (0x026e), script $81fd: B2 record 437: Du willst Dein Blut verlieren, ja? Schön! Warum begehst Du nicht einfach Selbstmord?
        return;
    }
    if ( object1 == GEBET ) {
        pendingTextID = 0x026f; // text ID 623 (0x026f), script $820c: B2 record 438: Dazu müßtest Du schon Deinen Kopf verlieren!
        return;
    }
    if ( object1 == ZAUBERSPRUCH ) {
        pendingTextID = 0x0270; // text ID 624 (0x0270), script $821b: B2 record 439: Wie willst Du denn etwas verlieren, das in dem komischen, verkümmerten Ding gespeichert ist, welches Du Dein Hirn nennst?
        return;
    }
    pendingTextID = 0x08; // text ID 8 (0x0008), script $8224: engine $5D94: Drop-object response with object name.
    objectLocation[object1] = currentRoom;

x822c:
    return;
}


void PartB_HandleBetritt() { // Part B, script $822d; command 30 (BETRITT), SELECT $7772 case 4
    if ( object1 == HUNDESCHLITTEN || object1 == DACHSSCHLITTEN && objectState[object1] == 0x00 ) {
        pendingTextID = 0x09; // text ID 9 (0x0009), script $823e: B2 record 111: Gut: Wie Du willst...
        objectState[object1] = 0x01;
        return;
    }
    if ( object1 == EISPALAST ) {
        if ( objectState[ELIXIER] != 0x02 ) {
            pendingTextID = 0xe4; // text ID 228 (0x00e4), script $8259: B2 record 268: Der Yeti macht aber ganz und gar nicht den Eindruck, als hätte er vor, Dich bei Deinem Vorhaben zu unterstützen...
            return;
        } else {
            if ( objectState[ELIXIER] == 0x02 ) {
                currentRoom = IN_FIRONS_THRONSAAL;
                objectLocation[DAVE] = IN_FIRONS_THRONSAAL;
                score = score + remainingPoints[0xa2];
                remainingPoints[0xa2] = 0x00;
                pendingTextID = 0xe3; // text ID 227 (0x00e3), script $827f: B2 record 267: Unbemerkt schleichst Du Dich an dem Yeti vorbei in den Thronsaal - keinen Moment zu früh: Kaum hast Du die Halle erreicht, werden aus dem Nichts Deine Konturen sichtbar...
                showtext();
                Restart();
                imageID = currentRoom;
                ShowImage();
                Code2E5B();
                showtext();
                return;
            }
        }
    }
    pendingTextID = 0x0a; // text ID 10 (0x000a), script $8291: B2 record 112: Könntest Du mir mal bitte erklären, wie Du DAS betreten willst?

x8295:
    return;
}


void PartB_HandleBetrachte() { // Part B, script $8296; command 31 (BETRACHTE), SELECT $7772 case 5
    pendingTextID = objectDescriptionID[object1]; // dynamic text ID, script $8296; resolve through texts/C64/text_ids.json
    if ( object1 == ERDLOCH && objectLocation[NOTIZ] == RAUM_NULL ) {
        objectLocation[NOTIZ] = currentRoom;
        objectDescriptionID[ERDLOCH] = 0x0b;
        return;
    }
    if ( object1 == NOTIZ ) {
        score = score + remainingPoints[0x64];
        remainingPoints[0x64] = 0x00;
        return;
    }
    if ( object1 == TISCH && objectLocation[PFEIFE] == RAUM_NULL ) {
        objectLocation[PFEIFE] = currentRoom;
        objectDescriptionID[TISCH] = 0x0b;
        return;
    }
    if ( object1 == KAMIN && objectLocation[MYLGOR] == currentRoom ) {
        pendingTextID = 0x0125; // text ID 293 (0x0125), script $82f4: B2 record 333: Ein kurzer, vorwurfsvoller Blick von Seiten Mylgors hält Dich davon ab, in fremder Leute Sachen herumzuschnüffeln, die Dich nicht das Geringste angehen! Schuldbewußt und etwas beschämt senkst Du Deine Augenlider und läßt von Deinem Vorhaben ab...
        return;
    }
    if ( object1 == VERTRAG && objectState[VERTRAG] == 0x01 && diskSide == 0x02 ) {
        pendingTextID = 0x0271; // text ID 625 (0x0271), script $830f: B2 record 440: Unter dem Vertrag prangt in großen roten Strichen Deine Unterschrift: Drei große Kreuze...
        return;
    }
    if ( object1 == BIENENSTOCK ) {
        if ( objectState[BIENENSTOCK] == 0x01 && objectLocation[HONIG] == RAUM_NULL ) {
            objectDescriptionID[BIENENSTOCK] = 0x0b;
            objectLocation[HONIG] = currentRoom;
            objectState[HONIG] = 0x00;
            pendingTextID = 0xf6; // text ID 246 (0x00f6), script $833e: B2 record 286: Auf ihrer überstürzten Flucht haben die Bienen ihren Honig im Bienenkorb zurückgelassen, so daß sich noch eine ganze Menge des klebrigen Zeugs in ihm befindet...
            return;
        }
    }
    if ( object1 == STEINALTAR ) {
        score = score + remainingPoints[0x02];
        remainingPoints[0x02] = 0x00;
        pendingTextID = 0xf1; // text ID 241 (0x00f1), script $8359: B2 record 281: Der Altar ist den A.C.A-Göttern geweiht und stellt Szenen aus "Soul Crystals" Entwicklungszeit dar: Während Du staunend um den Steinaltar herumgehst, kannst Du Chris vor seinem AMIGA beim Schreiben der Spieltexte sehen, vollgepumpt mit Barrels von Kaffee, tausenden von Zigaretten und Chopins Trauermarsch vor sich herpfeifend, bis Kai, die arme, geplagte Seele es endlich fertigbringt, einen hochintelligenten (und langen!) Parser fertigzustellen, der hinterher die Welt in hehres Entzücken versetzen wird... Du denkst an diese armen Schweine und daß jemand, der es geschafft hat, ein solch riesiges Programm fertigzustellen, doch eine ganze Menge Geld damit verdient haben muß. Naja, ich hoffe doch, daß Du recht haben wirst - aber bis zum Irrenhaus ist es mittlerweile auch nicht mehr so weit...
        return;
    }
    if ( object1 == KURZSCHWERT ) {
        if ( objectState[KURZSCHWERT] == 0x01 ) {
            pendingTextID = 0x011f; // text ID 287 (0x011f), script $836f: B2 record 327: Ein stinknormales Schwert: Warum zum Himmel hast Du es bloß in Weihwasser getaucht?
        } else {
            if ( objectState[KURZSCHWERT] == 0x02 ) {
                pendingTextID = 0x011e; // text ID 286 (0x011e), script $837d: B2 record 326: Oh, oh: Diese Snobs! Was hast Du Dir eigentlich davon versprochen, daß Du die Klinge Deines Schwertes versilbert hast? Meinst Du, Du könntest Deinen Gegnern damit imponieren? Vielleicht solltest Du es erst einmal zu gebrauchen lernen - eine Gelegenheit dazu wird sich wohl bald finden...
            } else {
                if ( objectState[KURZSCHWERT] == 0x03 ) {
                    pendingTextID = 0x4d; // text ID 77 (0x004d), script $838b: B2 record 179: Du betrachtest Dein Schwert: Als Du es im Licht drehst, blitzt die versilberte Klinge, die Du in der Kapelle des Klosters geweiht hast, geheimnisvoll auf. Du wiegst es prüfend in der Hand und führst ein paar unsichere Hiebe gegen einen unsichtbaren Gegner aus. "Ja!", denkst Du Dir zufrieden, "Eine wahrhaft tödliche Waffe, geführt von der Hand eines Meisters der Waffenkunst!" Mit diesem Schwert in Deiner Hand fühlst Du Dich, als ob Du es mit allen Mächten dieser Welt aufnehmen könntest. Nun, wir werden sehen, ob Dein Optimismus gerechtfertigt ist...
                }
            }
        }
        return;
    }
    if ( object1 == GRABPLATTE && objectLocation[GEBET] == RAUM_NULL ) {
        objectDescriptionID[GRABPLATTE] = 0x0b;
        score = score + remainingPoints[0x5d];
        remainingPoints[0x5d] = 0x00;
        objectLocation[GEBET] = 0xff;
        return;
    }
    if ( object1 == STUDIERTISCH && objectLocation[SCHUBLADEN] == RAUM_NULL ) {
        score = score + remainingPoints[0x2a];
        remainingPoints[0x2a] = 0x00;
        objectLocation[SCHUBLADEN] = currentRoom;
        pendingTextID = 0xfd; // text ID 253 (0x00fd), script $83dd: B2 record 293: Ein höchst geschmackvoll verzierter, großer Studiertisch mit vielen Schubladen an seiner rechten Seite.
        return;
    }
    if ( object1 == SCHUBLADEN ) {
        if ( objectLocation[LABORSCHLUESSEL] == RAUM_NULL && objectState[SCHUBLADEN] == 0x01 ) {
            objectLocation[LABORSCHLUESSEL] = currentRoom;
            pendingTextID = 0x0103; // text ID 259 (0x0103), script $83ff: B2 record 299: Vorsichtig, aber gewissenhaft, durchsuchst Du die Schubladen von Mylgors Studiertisch, eine nach der anderen: In den meisten befinden sich lediglich einige persönliche Habseligkeiten des alten Alchemisten. Gerade willst Du auch die letzte Schublade schon wieder enttäuscht schließen, als Deine Finger unter einer Menge Krimskrams auf etwas Hartes stoßen, das in rotseidenes Tuch eingepackt ist! Als Du es auspackst, findest Du endlich einen kleinen Schlüssel!
        } else {
            pendingTextID = 0x0102; // text ID 258 (0x0102), script $8405: B2 record 298: Ein paar ganz normale Schreibtischschubladen! Öffnen müßtest Du sie schon selbst - durch Wände schauen kann ich nämlich nicht!
        }
        return;
    }
    if ( object1 == BETT2 && objectLocation[AMULETT] == RAUM_NULL ) {
        objectDescriptionID[BETT2] = 0x0b;
        objectLocation[AMULETT] = currentRoom;
        pendingTextID = 0xf4; // text ID 244 (0x00f4), script $8427: B2 record 284: Du wühlst in Mylgors Bettzeug herum, bis Du etwas unter Mylgors Kissen findest: Ein merkwürdiges, etwa handtellergroßes Amulett!
        return;
    }
    if ( object1 == WERWOLF ) {
        pendingTextID = 0x0123; // text ID 291 (0x0123), script $8435: B2 record 331: Im fahlen Mondlicht kannst Du einen fürchterlich mutierten Wolf erkennen, aus dessen spitzer Schnauze Geifer trifft. Er bleckt seine scharfen, gelben Zähne und hebt mit einem Blick voller Haß auf alles Lebende seine krallenbewehrten Klauen gegen Dich! Paß auf: Er wird Dich angreifen, sobald sich ihm die erstbeste Gelegenheit dazu bietet! Schon duckt er sich, um seinen tödlichen Sprung gegen Deine Kehle vorzubereiten...!
        return;
    }

x843e:
    return;
}


void PartB_HandleHilf() { // Part B, script $843f; command 32 (HILF), SELECT $7772 case 6
    tableptr = data0x940c;
    temp = 0x01;

x8446:
    scratch1 = *(unsigned short*)tableptr; tableptr += 2;
    pendingTextID = *(unsigned short*)tableptr; tableptr += 2;
    if ( scratch1 == object1 ) {
        goto x8462;
    }
    temp = temp + 0x01;
    if ( temp <= 0x15 ) {
        goto x8446;
    }

x8462:
    if ( object1 == MYLGOR && currentRoom == IN_MYLGORS_GEHEIMLABOR ) {
        pendingTextID = 0x53; // text ID 83 (0x0053), script $846d: B2 record 185: Danke für Dein wirklich selbstloses Angebot, aber hier wird nun wirklich keine Hilfe benötigt.
        return;
    }
    if ( temp <= 0x15 ) {
        return;
    }
    if ( object1 == WERWOLF ) {
        pendingTextID = 0x0130; // text ID 304 (0x0130), script $8485: B2 record 344: Das kann doch wohl nicht Dein Ernst seiiiiiiiiiin...!
        showtext();
        Restart();
        objectLocation[DAVE] = 0xff;
        return;
    }
    pendingTextID = 0x53; // text ID 83 (0x0053), script $8496: B2 record 185: Danke für Dein wirklich selbstloses Angebot, aber hier wird nun wirklich keine Hilfe benötigt.

x849a:
    return;
}


void PartB_HandleVerlasse() { // Part B, script $849b; command 33 (VERLASSE), SELECT $7772 case 7
    if ( object1 == HUNDESCHLITTEN || object1 == DACHSSCHLITTEN && objectState[object1] == 0x01 ) {
        objectState[object1] = 0x00;
        objectLocation[object1] = currentRoom;
        pendingTextID = 0x0f; // text ID 15 (0x000f), script $84b5: B2 record 117: Okay: Du stehst wieder auf eigenen Beinen.
        if ( currentRoom == IN_EINEM_SCHNEEBEDECKTEN_TAL && object1 == DACHSSCHLITTEN ) {
            pendingTextID = 0xd2; // text ID 210 (0x00d2), script $84c4: B2 record 250: Nachdem sie Dich zu Deinem Reiseziel gebracht haben, machen die Schlittendachse schnell kehrt und verschwinden wieder in der Eiswüste. Eine Weile siehst Du ihnen nach - dann bist Du wieder allein...
            objectLocation[DACHSSCHLITTEN] = RAUM_NULL;
            objectState[DACHSSCHLITTEN] = 0x00;
        }
        return;
    } else {
        if ( object1 == HUNDESCHLITTEN || object1 == DACHSSCHLITTEN && objectState[object1] == 0x00 ) {
            pendingTextID = 0x54; // text ID 84 (0x0054), script $84ea: B2 record 186: Was willst Du eigentlich? Du stehst doch schon lange auf Deinen eigenen Beinen!
            return;
        }
    }
    pendingTextID = 0x55; // text ID 85 (0x0055), script $84f3: B2 record 187: Kannst Du mir vielleicht mal einen heißen Tip geben, wie Du DAS verlassen willst?

x84f7:
    return;
}


void PartB_HandleBewege() { // Part B, script $84f8; command 34 (BEWEGE), SELECT $7772 case 8
    if ( object1 == KAMIN ) {
        if ( objectLocation[MYLGOR] != IM_KAMINZIMMER ) {
            if ( down[IM_KAMINZIMMER] == 0x00 ) {
                score = score + remainingPoints[0x1c];
                remainingPoints[0x1c] = 0x00;
                down[IM_KAMINZIMMER] = 0x30;
                up[IN_EINEM_KURZEN_KORRIDOR] = 0x13;
            } else {
                if ( down[IM_KAMINZIMMER] == 0x30 ) {
                    down[IM_KAMINZIMMER] = 0x00;
                }
            }
            pendingTextID = 0x0132; // text ID 306 (0x0132), script $8537: B2 record 346: Du erinnerst Dich an die Geräusche, die Du in der Nacht, die Du hier verbracht hast, gehört hast: Ein Scharren wie...: STEIN AUF STEIN!!! Der Kamin! Das ist es! Hastig versuchst Du den Kamin beiseite zu rücken... Das gibt's doch wohl nicht: Das Ding ist ja nicht einmal so schwer wie ein normaler Tisch oder Stuhl - ja, es ist nicht einmal aus Stein, sondern eine fast perfekte Attrappe aus billigem Gips! Leicht schwingt der Kamin zur Seite...
            return;
        } else {
            if ( objectLocation[MYLGOR] == IM_KAMINZIMMER ) {
                pendingTextID = 0x0125; // text ID 293 (0x0125), script $8548: B2 record 333: Ein kurzer, vorwurfsvoller Blick von Seiten Mylgors hält Dich davon ab, in fremder Leute Sachen herumzuschnüffeln, die Dich nicht das Geringste angehen! Schuldbewußt und etwas beschämt senkst Du Deine Augenlider und läßt von Deinem Vorhaben ab...
                return;
            }
        }
    }
    pendingTextID = 0x10; // text ID 16 (0x0010), script $8553: B2 record 118: Versprichst Du dir irgend etwas Bestimmtes davon, DAS durch die Gegend zu schleppen?

x8557:
    return;
}


void PartB_HandleOeffne() { // Part B, script $8558; command 35 (OEFFNE), SELECT $7772 case 9
    if ( object1 == JEANS || object1 == HOSE ) {
        pendingTextID = 0x0268; // text ID 616 (0x0268), script $8563: B2 record 432: Tja, was sein muß, muß sein: Hastig siehst Du Dich um, ob auch keiner zusieht, öffnest Deine Hose, und... MOMENT MAL! So nicht, Kumpel! Als ob der Saure Regen nicht schon reichte...!
        goto x86d0;
    }
    tableptr = data0x939c;
    temp = 0x01;

x8573:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    scratch2 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x8591;
    }
    temp = temp + 0x01;
    if ( temp <= 0x1c ) {
        goto x8573;
    }

x8591:
    if ( temp > 0x1c ) {
        pendingTextID = 0x58; // text ID 88 (0x0058), script $8597: B2 record 190: Vorsichtig öffnest Du es, bis Du nach ein paar Sekunden bemerkst, daß Du das doch eigentlich gar nicht öffnen konntest! Also schließt Du es wieder, läßt es wie es war und nimmst Dir vor, nicht weiter über Logik in Computerprogrammen nachzudenken.
        goto x86d0;
    }
    if ( objectState[object1] == 0x00 ) {
        pendingTextID = 0x11; // text ID 17 (0x0011), script $85a6: B2 record 119: Hmmm... - Scheint aber verschlossen zu sein!
        goto x86d0;
    } else {
        if ( objectState[object1] == 0x01 ) {
            pendingTextID = 0x57; // text ID 87 (0x0057), script $85b5: B2 record 189: Oh! Da scheint Dir wohl jemand mit dem Öffnen zuvorgekommen zu sein...
            goto x86d0;
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
                if ( object1 == FRIEDHOFSTOR1 ) {
                    objectState[FRIEDHOFSTOR1] = 0x01;
                    objectState[FRIEDHOFSTOR2] = 0x01;
                    north[IM_KLOSTERGARTEN] = 0x2b;
                    south[AUF_DEM_FRIEDHOF] = 0x26;
                } else {
                    if ( object1 == FRIEDHOFSTOR2 ) {
                        objectState[FRIEDHOFSTOR1] = 0x01;
                        objectState[FRIEDHOFSTOR2] = 0x01;
                        north[IM_KLOSTERGARTEN] = 0x2b;
                        south[AUF_DEM_FRIEDHOF] = 0x26;
                    }
                }
                if ( object1 == SARKOPHAG ) {
                    if ( objectState[KOENIG] == 0x00 && objectLocation[KOENIG] == RAUM_NULL ) {
                        objectLocation[SKELETT1] = currentRoom;
                    }
                    score = score + remainingPoints[0x77];
                    remainingPoints[0x77] = 0x00;
                    pendingTextID = 0x0133; // text ID 307 (0x0133), script $865e: B2 record 347: Es bereitet Dir zwar einige Mühe, den schweren Sargdeckel zur Seite zu rücken, aber schließlich hast Du ihn soweit verschoben, daß Du in sein Inneres blicken kannst, soweit es die schummrige Beleuchtung überhaupt zuläßt. Als Du Dich weiter über den Sarg beugst, um sein Inneres genauer in Augenschein zu nehmen, schlägt Dir fauliger Modergeruch entgegen, der Dir fast den Atem raubt! Also, wenn das das After Shave war, das der König zu Lebzeiten benutzt hat, bin ich echt verdammt froh, nicht seine Gemahlin gewesen zu sein...!
                    goto x86d0;
                }
                if ( object1 == LABORTUER && objectState[REAGENZIEN] != 0x00 ) {
                    pendingTextID = 0x0272; // text ID 626 (0x0272), script $8674: B2 record 441: Die Labortür hat sich durch die Hitze schon zu sehr verzogen, als daß Du sie noch öffnen könntest...
                    showtext();
                    objectState[LABORTUER] = 0x02;
                    north[IN_EINEM_KURZEN_KORRIDOR] = 0x00;
                    goto x86d0;
                }
                if ( object1 == LABORTUER ) {
                    north[IN_EINEM_KURZEN_KORRIDOR] = 0x31;
                    south[IN_MYLGORS_GEHEIMLABOR] = 0x30;
                    objectState[LABORTUER] = 0x01;
                    objectState[STAHLTUER1] = 0x01;
                } else {
                    if ( object1 == STAHLTUER1 ) {
                        north[IN_EINEM_KURZEN_KORRIDOR] = 0x31;
                        south[IN_MYLGORS_GEHEIMLABOR] = 0x30;
                        objectState[LABORTUER] = 0x01;
                        objectState[STAHLTUER1] = 0x01;
                    }
                }
                pendingTextID = 0x56; // text ID 86 (0x0056), script $86c9: B2 record 188: Okay, geöffnet.
            }
        }
    }

x86d0:
    scratch2 = 0x00;
    scratch3 = 0x00;
    return;
}


void PartB_HandleZiehe() { // Part B, script $86d9; command 36 (ZIEHE), SELECT $7772 case 10
    if ( object1 == DACHSSCHLITTEN || object1 == HUNDESCHLITTEN ) {
        pendingTextID = 0x0273; // text ID 627 (0x0273), script $86e4: B2 record 442: Du nimmst alle Kraft zusammen und beginnst, den schweren Schlitten hinter Dir herzuziehen, bis Du hinter Dir ein leises Lachen hörst. Diese faulen, nichtsnutzigen Tiere! Jetzt sitzen die schon seit über einer halben Stunde auf dem Schlitten und lassen sich von Dir durch den Schnee ziehen! Wütend scheuchst Du sie von den Sitzen herunter und spannst sie wieder vor den Schlitten.
        return;
    }
    pendingTextID = 0x0258; // text ID 600 (0x0258), script $86ed: B2 record 416: Das findest Du wohl witzig, häh? Naja, vergessen wir's...

x86f2:
    return;
}


void PartB_HandleDruecke() { // Part B, script $86f3; command 37 (DRUECKE), SELECT $7772 case 11
    if ( object1 == HOLZTUER && objectLocation[MYLGOR] == RAUM_NULL ) {
        objectLocation[MYLGOR] = currentRoom;
        score = score + remainingPoints[0x40];
        remainingPoints[0x40] = 0x00;
        pendingTextID = 0x0157; // text ID 343 (0x0157), script $8711: B2 record 383: Du klopfst zaghaft an die Tür und wartest: Nichts passiert! Du klopfst noch einmal, diesmal etwas lauter: Keine Reaktion! Gerade willst Du mit aller Kraft gegen die Tür hämmern, als sich, just an der Stelle, auf der sich um ein Haar die zerstörerische Wirkung Deiner kraftvollen Fäuste in ihrer ganzen, schrecklichen Größe offenbart hätte, eine kleine Luke öffnet, hinter der ein Gesicht, das sich im Halbdunkel jedoch nur sehr schwer identifizieren läßt, erscheint! "Was ist Dein Begehr, Fremder?", fragt die Stimme hinter der Tür mißtrauisch.
        return;
    }
    pendingTextID = 0x59; // text ID 89 (0x0059), script $871a: B2 record 191: Glaube mir: Es besteht wirklich nicht der geringste Grund, das zu drücken!

x871e:
    return;
}


void PartB_HandleNimm() { // Part B, script $871f; command 38 (NIMM), SELECT $77a4 case 1
    tableptr = data0x9374;
    temp = 0x01;

x8726:
    scratch1 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x8740;
    }
    temp = temp + 0x01;
    if ( temp <= 0x28 ) {
        goto x8726;
    }

x8740:
    if ( temp > 0x28 ) {
        pendingTextID = 0x0e; // text ID 14 (0x000e), script $8746: B2 record 116: Tut mir leid, aber das kannst Du beim besten Willen nicht mitnehmen!
        goto x8766;
    }
    if ( objectLocation[object1] == 0xff ) {
        pendingTextID = 0x0d; // text ID 13 (0x000d), script $8755: B2 record 115: Aber das hast Du doch schon längst!
        goto x8766;
    }
    objectLocation[object1] = 0xff;
    pendingTextID = 0x0c; // text ID 12 (0x000c), script $8762: engine $5D94: Take-object response with object name.

x8766:
    if ( object1 == PFEIFE ) {
        if ( currentRoom == IN_DER_ORKHOEHLE ) {
            if ( objectState[ORKMANN] != 0x06 && objectLocation[ORKMANN] == currentRoom ) {
                objectLocation[DAVE] = 0xff;
                imageID = 0x82;
                ShowImage();
                pendingTextID = 0x0128; // text ID 296 (0x0128), script $878b: B2 record 336: Vorsichtig langst Du nach der kleinen Pfeife - doch unglücklicherweise hast Du Dir genau den falschen Augenblick für Deinen Diebstahl ausgesucht: Als sich der Blick des Orkvaters wieder auf Dich, dann auf die Pfeife richtet, wirst Du hochrot, um kurz darauf wieder sehr, sehr bleich zu werden...: "Verdammter Dieb!", schreit Dich der Ork an, "Einem Abhängigen sein Ein und Alles stehlen zu wollen!" Zu seinem Sohn gewandt, ruft er erbost aus: "So, Filius! Kapierst Du jetzt endlich, weshalb ich dieses verfluchte Menschenpack hasse? Alles Lügner und Diebe! Aber...", er grinst hämisch zu Dir herüber, während Du vor Schreck keinen Ton zu Deiner Verteidigung herausbringen kannst, "...EIN Gutes hat es doch, daß Du ihn zum Essen hierhergebracht hast: Er dürfte ein schmackhaftes Hors d'Oevre abgeben...!" Bevor Du aufspringen kannst, um Fersengeld zu geben, packen Dich bereits zwei kräftige Hände brutal im Nacken und brechen Dir mit einer kurzen, aber gut geübten Bewegung das Genick! Du findest nicht einmal mehr die Zeit, den traurigen und schwer enttäuschten Gesichtsausdruck des kleinen Orks zu bemerken...
                showtext();
                Restart();
                return;
            } else {
                if ( objectState[ORKMANN] == 0x06 && objectLocation[ORKMANN] == currentRoom ) {
                    objectLocation[PFEIFE] = 0xff;
                    pendingTextID = 0x0127; // text ID 295 (0x0127), script $87aa: B2 record 335: Ohne daß die in der Höhle Anwesenden es bemerken, tasten sich Deine Finger langsam über den Tisch, bis Deine Fingerspitzen die kleine Pfeife berühren. Vorsichtig, und ohne den Orkvater aus den Augen zu lassen, ziehst Du sie zu Dir hin und sackst sie ein! Naja, wenn das Dein Dank für die Gastfreundschaft der Orkfamilie ist... Zumindest würde ich mich jetzt aber beeilen, hier schnell die Platte zu putzen, bevor jemand den Diebstahl bemerkt!
                    score = score + remainingPoints[0x6c];
                    remainingPoints[0x6c] = 0x00;
                    return;
                }
            }
        } else {
            if ( objectLocation[PFEIFE] != 0xff ) {
                objectLocation[PFEIFE] = 0xff;
                pendingTextID = 0x0c; // text ID 12 (0x000c), script $87cf: engine $5D94: Take-object response with object name.
                return;
            }
        }
    }
    if ( object1 == SILBERMUENZEN ) {
        score = score + remainingPoints[0x1f];
        remainingPoints[0x1f] = 0x00;
        objectLocation[SILBERMUENZEN] = 0xff;
        return;
    }
    if ( object1 == HONIG ) {
        score = score + remainingPoints[0x47];
        remainingPoints[0x47] = 0x00;
        objectLocation[HONIG] = 0xff;
        pendingTextID = 0x0c; // text ID 12 (0x000c), script $880d: engine $5D94: Take-object response with object name.
        return;
    }
    if ( object1 == KURZSCHWERT && objectLocation[KURZSCHWERT] == RAUM_NULL ) {
        score = score + remainingPoints[0x8e];
        remainingPoints[0x8e] = 0x00;
        objectLocation[KURZSCHWERT] = 0xff;
        pendingTextID = 0x0c; // text ID 12 (0x000c), script $8834: engine $5D94: Take-object response with object name.
        return;
    }
    if ( object1 == TOTENSCHAEDEL ) {
        score = score + remainingPoints[0x85];
        remainingPoints[0x85] = 0x00;
        objectLocation[TOTENSCHAEDEL] = 0xff;
        pendingTextID = 0x0c; // text ID 12 (0x000c), script $8854: engine $5D94: Take-object response with object name.
        return;
    }
    if ( object1 == LABORSCHLUESSEL && objectLocation[LABORSCHLUESSEL] == RAUM_NULL ) {
        score = score + remainingPoints[0x52];
        remainingPoints[0x52] = 0x00;
        objectLocation[LABORSCHLUESSEL] = 0xff;
        pendingTextID = 0x0c; // text ID 12 (0x000c), script $887b: engine $5D94: Take-object response with object name.
        return;
    }

x8883:
    return;
}


void PartB_HandleSprich() { // Part B, script $8884; command 39 (SPRICH), SELECT $77a4 case 2
    pendingTextID = 0x5b; // text ID 91 (0x005b), script $8884: B2 record 193: Wie merkwürdig! Keine Antwort ?!?!?
    tableptr = data0x947c;
    temp = 0x01;

x888f:
    scratch1 = *(unsigned short*)tableptr; tableptr += 2;
    pendingTextID = *(unsigned short*)tableptr; tableptr += 2;
    if ( scratch1 == object1 ) {
        goto x88ab;
    }
    temp = temp + 0x01;
    if ( temp <= 0x0f ) {
        goto x888f;
    }

x88ab:
    if ( temp > 0x0f ) {
        pendingTextID = 0x5b; // text ID 91 (0x005b), script $88b1: B2 record 193: Wie merkwürdig! Keine Antwort ?!?!?
    }
    if ( object1 == ORKKIND ) {
        if ( currentRoom == AUF_EINER_LICHTUNG2 ) {
            if ( objectState[ORKKIND] == 0x00 ) {
                pendingTextID = 0x0135; // text ID 309 (0x0135), script $88ca: B2 record 349: Du fragst das kleine Kind, was es denn so allein hier draußen triebe. "Ich sitze hier ganz einfach herum und versuche, mich mit mir selbst zu beschäftigen: Ich soll erst zum Essen wieder nach Hause kommen, weil Vater nach dieser anstrengenden Woche unbedingt Erholung braucht und ich Mutter nicht beim Kochen stören soll! So ein Mist! Wenigstens etwas zum Spielen hätten sie mir geben können!", antwortet es traurig, "Kannst Du mir nicht irgendein Spielzeug kaufen?"
            } else {
                if ( objectState[ORKKIND] == 0x01 ) {
                    pendingTextID = 0x0136; // text ID 310 (0x0136), script $88d8: B2 record 350: "Ich hatte nur einen einzigen Wunsch zu Weihnachten: Einen Fußball! Aber sowas fanden meine Eltern zu ordinär! Mein Freund Horax hat sogar eine Baseballkeule geschenkt bekommen, mit der er jetzt Geld verdient, indem er reiche Abenteurer sich ein wenig mit ihr "unterhalten" läßt! Ja, DAS sind Geschenke, mit denen ein Mann was anfangen kann! Und was finde ICH unter dem Baum? Irgendwelche dämlichen Malbücher und Kleider! Bäh, wie doof! Gar nix zum Spielen...", erklärt Dir der kleine Ork voller Entrüstung über diese absolute Verantwortungslosigkeit seiner Eltern.
                } else {
                    if ( objectState[ORKKIND] >= 0x02 ) {
                        pendingTextID = 0x0137; // text ID 311 (0x0137), script $88e6: B2 record 351: Auf Deine Fragen hin schaut das Kind Dich lediglich mit einem flehenden Blick an, nicht willens, noch eine weitere Antwort zu geben.
                        objectState[ORKKIND] = 0x03;
                    }
                }
            }
        } else {
            if ( currentRoom == IN_DER_ORKHOEHLE ) {
                objectState[ORKKIND] = 0x00;
                pendingTextID = 0x5b; // text ID 91 (0x005b), script $8901: B2 record 193: Wie merkwürdig! Keine Antwort ?!?!?
            }
        }
        objectState[ORKKIND] = objectState[ORKKIND] + 0x01;
        return;
    }
    if ( object1 == MYLGOR ) {
        if ( objectState[MYLGOR] == 0x00 && objectState[VERTRAG] == 0x00 ) {
            pendingTextID = 0x0142; // text ID 322 (0x0142), script $8929: B2 record 362: Du erzählst dem Fremden hinter der Luke von Deiner Reise in diese Welt und fragst ihn, ob er Dir vielleicht etwas zu essen und einen Platz geben könnte, wo Du die Nacht verbringen kannst. Erstaunlicherweise scheint er Deine Story nicht im Geringsten anzuzweifeln: "Natürlich könnte ich...", antwortet die Stimme hinter der Tür gedehnt, "Aber nur unter einer Bedingung: Wenn ich Dir helfe, mußt Du mir versprechen, auch mir einen kleinen Dienst zu erweisen: Es gibt da eine kleine, selbstverständlich nicht allzu gefährliche Aufgabe, die morgen verrichtet werden müßte. Wenn Du mir eine kurze schriftliche Erklärung unterzeichnest, die besagt, daß Du sie für mich erledigen wirst, werde ich Dir im Gegenzug dazu ein Bett zum Schlafen, warme Kleider und ein warmes Abendessen geben." Mit diesen Worten reicht Dir der Mann einen merkwürdigerweise schon vorformulierten Vertrag und ein kleines, scharfes Messerchen durch die Luke hinaus. Auf Deine Frage hin, wozu Du denn das Messer bräuchtest, antwortet der Fremde gleichgültig: "Ich bin nur vorsichtig - zuviele Menschen haben mich schon hintergangen! Daher wirst Du unsere Abmachung mit demselben Blut unterschreiben, daß Du vergießen wirst, solltest Du es wagen, sie zu brechen..."
            objectState[MYLGOR] = 0x01;
            objectLocation[VERTRAG] = 0xff;
            objectLocation[MESSER] = 0xff;
            return;
        } else {
            if ( objectState[MYLGOR] == 0x01 && currentRoom == VOR_MYLGORS_HAUS ) {
                pendingTextID = 0x0144; // text ID 324 (0x0144), script $8951: B2 record 364: "Ich habe Dir bereits mitgeteilt, was ich zu sagen habe!", antwortet Mylgor Dir ungeduldig.
                return;
            } else {
                if ( objectState[MYLGOR] == 0x01 && currentRoom == IM_KAMINZIMMER ) {
                    pendingTextID = 0x0145; // text ID 325 (0x0145), script $8967: B2 record 365: Ihr beiden schwatzt, bis es fast halb Zwölf ist. Ich denke, es wird jetzt langsam Zeit für Dich, ins Bett zu gehen. Immerhin hast Du morgen ja vielleicht einen schweren Tag vor Dir...
                    objectState[MYLGOR] = 0x02;
                    return;
                } else {
                    if ( objectState[MYLGOR] == 0x02 && currentRoom == IM_KAMINZIMMER ) {
                        if ( currentRoom == IM_KAMINZIMMER && objectState[BETT1] == 0x00 ) {
                            pendingTextID = 0x0146; // text ID 326 (0x0146), script $8990: B2 record 366: Nach jedem Satz, den Du sagst, rekelt sich Mylgor in seinem alten Ohrensessel und unterdrückt krampfhaft ein herzhaftes Gähnen: Wahrscheinlich ist er schon viel zu müde, um Deinen Erzählungen noch konzentriert folgen zu können, und wartet nur noch aus Höflichkeit darauf, daß Du ihm nun endlich von selbst eine angenehme Nachtruhe wünschst und Dich in Deine Schlafkammer verziehst...
                            return;
                        } else {
                            if ( objectState[BETT1] == 0x01 ) {
                                score = score + 0x0f;
                                objectLocation[FELLSTIEFEL] = IM_KAMINZIMMER;
                                objectLocation[ELIXIER] = IM_KAMINZIMMER;
                                objectLocation[BAUMWOLLHEMD] = IM_KAMINZIMMER;
                                objectLocation[HOSE] = IM_KAMINZIMMER;
                                objectState[MYLGOR] = 0x03;
                                objectState[HAUSTUER] = 0x02;
                                pendingTextID = 0x0147; // text ID 327 (0x0147), script $89ca: B2 record 367: Mylgor hat Dich bereits erwartet. Er begrüßt Dich kurz und kommt gleich zum Geschäft: "Ich hoffe, Du erinnerst Dich noch an den Pakt, den wir gestern abend miteinander geschlossen haben. Nun, jetzt ist es an der Zeit, daß auch Du Deinen Teil unserer Abmachung erfüllst: Es gibt einen bösen Elfenkönig namens Firon, der sich mit seiner Horde in seinem Eispalast im Nordwesten unseres geliebten Landes versteckt hält. Oft überfällt er jedoch mit seiner Yetiarmee unser kleines, friedliches Dorf und plündert es - vor einigen Jahren hat er es gar vollständig in Schutt und Asche gelegt! Als Vorsitzender des Dorfrates befehle ich Dir: Gebiete ihm Einhalt! Hier sind ein paar Kleidungsstücke, die Du brauchen wirst, um in den kalten Eisregionen überleben zu können, und ein Flacon mit einem magischen Elixier, das Dich für ein paar Sekunden unsichtbar macht: Benutze es auf gar keinen Fall, bis es wirklich unumgänglich ist, da es Dich, wie schon gesagt, nur für einen Zug schützen wird und Du es auch nur ein einziges Mal anwenden kannst! Nun begib Dich also auf den Weg und beende Firons dunkle Machenschaften: Möge Zargon Dich behüten...!" Mit diesen Worten öffnet Mylgor eine kleine Truhe, holt die erwähnten Dinge aus ihr heraus und breitet sie auf dem Tisch vor Dir aus.
                                return;
                            }
                        }
                    } else {
                        if ( objectState[MYLGOR] == 0x03 ) {
                            pendingTextID = 0x0148; // text ID 328 (0x0148), script $89dd: B2 record 368: Ich glaube, Du gehst jetzt besser und löst Dein Versprechen ein, bevor Mylgor ungehalten wird: Man weiß ja schließlich nie, wozu so ein alter Alchemist im Zorn fähig ist...
                            return;
                        }
                    }
                }
            }
        }
    } else {
        if ( currentRoom == IN_MYLGORS_GEHEIMLABOR ) {
            pendingTextID = 0x0149; // text ID 329 (0x0149), script $89f1: B2 record 369: Du hast wirklich absolut keine Zeit, hier noch lange mit Mylgor herumzuschwatzen! Töte ihn - oder stirb selbst!
            return;
        }
    }
    if ( object1 == VERKAEUFER ) {
        if ( objectState[VERKAEUFER] == 0x00 ) {
            pendingTextID = 0x014a; // text ID 330 (0x014a), script $8a09: B2 record 370: Der Verkäufer blickt kurz von seiner Arbeit auf, kommt dann hinter den Tresen und fragt Dich geschäftig, ob Du einen der Hundeschlitten kaufen möchtest.
        } else {
            if ( objectState[VERKAEUFER] == 0x01 ) {
                pendingTextID = 0x5b; // text ID 91 (0x005b), script $8a17: B2 record 193: Wie merkwürdig! Keine Antwort ?!?!?
            }
        }
        return;
    }
    if ( object1 == FIRON ) {
        if ( objectState[EICHENTUER] == 0x00 ) {
            objectState[EICHENTUER] = 0x01;
            pendingTextID = 0x0139; // text ID 313 (0x0139), script $8a35: B2 record 353: Der alte Elfenkönig erhebt sich von seinem Thron: "Ich wußte, daß Du eines Tages kommen und den Befehl Deines Herren erfüllen würdest. Nun tu Deine Pflicht und vernichte auch noch den letzten Sproß eines edlen Geschlechts - ich werde mich nicht wehren! So lange habe ich auf diesen Augenblick gewartet, und es wird Zeit, daß wir es hinter uns bringen...", antwortet er Dir mit sanfter Stimme, in deren Melodie so etwas wie Melancholie und Resignation mitschwingt...
        } else {
            if ( objectState[EICHENTUER] == 0x01 ) {
                objectState[EICHENTUER] = 0x02;
                pendingTextID = 0x013a; // text ID 314 (0x013a), script $8a49: B2 record 354: Es überrascht Firon ein wenig, daß Du nicht gleich kurzen Prozeß mit ihm machst, wie eigentlich mit Mylgor abgesprochen. Nach einer kurzen Pause nickt er jedoch bedächtig: "So erfüllt sich denn endlich die Prophezeiung...", sagt er, "Wenn Du mich nun wirklich verschonen willst, werde ich Dir im Gegenzug verraten, wie Du die volle Wahrheit darüber herausfinden kannst, was in diesem Land passiert ist, und wer für all die Dinge verantwortlich ist, die Du teilweise vielleicht sogar schon gesehen hast..."
            } else {
                if ( objectState[EICHENTUER] == 0x02 ) {
                    pendingTextID = 0x013b; // text ID 315 (0x013b), script $8a57: B2 record 355: Firon antwortet: "Um Dir zu beweisen, daß ich auf Deiner Seite stehe, werde ich Dir einen Schlüssel geben, dessen Zweck Dir später sicherlich noch erklärt wird. Es liegt leider nicht in meiner Befugnis, es Dir persönlich zu sagen, aber es gibt jemanden... -jemanden in dem alten Kloster auf dem Hügel im Nordosten des Landes, den Du finden solltest. Wir beide waren Mitglieder einer Lobby, die sich im Geheimen mit den Problemen des Landes beschäftigt hat, nachdem das Böse die Oberhand gewonnen hatte. Bedauerlicherweise..." - bei diesen Worten seufzt er und blickt für einen kurzen Moment geistesabwesend an Dir vorbei in die kalte Leere - "Bedauerlicherweise schaffte er es nicht mehr, zu uns in diese Wüste zu fliehen, so daß er den Häschern des Bösen in die Hände fiel... Ich habe ihn und das Kloster, das uns damals als geheimes Hauptquartier diente, nie mehr wiedergesehen: Alles, was mir blieb, war ein Schlüssel, dessen Abdruck ich in magischem Eis gegossen und seit Jahrzehnten aufbewahrt habe. Möge er Dir auf Deiner Suche behilflich sein..." Mit diesen Worten steht Firon auf, holt einen großen Schlüssel aus einem Geheimfach in seinem Thron und legt ihn Dir vorsichtig in die ausgestreckte Hand. Mit einem Blick auf das Portal hinter Dir fügt er hinzu: "Meine Wachen werden Dich passieren lassen. Ich werde sie anweisen, einen meiner schnellsten Dachsschlitten für Deine Rückkehr zum Rand der Eisregionen bereit zu machen. Leb' wohl, mein Freund - und mögen die Götter Dich schützen..." Mit diesen Worten winkt Firon den Yeti heran, der Dich nach draußen geleitet, wo Firons Schlitten schon auf Dich wartet...
                    showtext();
                    Restart();
                    objectLocation[EISSCHLUESSEL] = 0xff;
                    objectLocation[DACHSSCHLITTEN] = IN_DER_EISWUESTE;
                    objectLocation[DAVE] = IN_DER_EISWUESTE;
                    currentRoom = IN_DER_EISWUESTE;
                    imageID = currentRoom;
                    ShowImage();
                    imageID = 0xff;
                    Code2E5B();
                    showtext();
                    return;
                }
            }
        }
        return;
    }
    if ( object1 == JACKSGEIST ) {
        score = score + remainingPoints[0x4c];
        remainingPoints[0x4c] = 0x00;
        objectLocation[JACKSGEIST] = RAUM_NULL;
        objectState[TOTENSCHAEDEL] = 0x01;
        pendingTextID = 0x013c; // text ID 316 (0x013c), script $8aa6: B2 record 356: Du erzählst dem Geist des alten Klosterabtes von Deiner langen, beschwerlichen Reise durch die Eiswüste, und daß Firon Dir empfohlen habe, Bruder Jack um Hilfe zu bitten. Bedächtig nickt Jack...: "Ich habe niemals gewagt, noch darauf zu hoffen, daß wirklich einmal ein unerschrockener Held kommen könnte, um den Dunklen Lord für all seine Greueltaten zu bestrafen. So ist mein letzter Traum denn doch endlich Wirklichkeit geworden... Nun, das Schicksal unseres Landes hat eine lange, traurige Vorgeschichte - und der einzige, der sie Dir erzählen könnte, ist sein rechtmäßiger Herrscher, Firons Bruder Richard. Nach seinem Sturz wurde er damals vom Dunklen Lord ermordet und sein Leichnahm zweigeteilt: Der Rumpf wurde in seiner Gruft auf dem Friedhof beigesetzt, während sein Kopf in dem verschütteten Stollen einer alten Zwergenmine vergraben wurde. Finde die beiden Teile des Körpers unseres Königs, und vereine sie wieder! Dies ist der einzige Weg, unserem Land noch Hilfe zu bringen... -bringen... -brin..." In eine Wolke aus bläulichem Rauch gehüllt fährt Bruder Jacks Geist wieder zurück ins Reich der Toten und läßt Dich allein...
        return;
    }
    if ( object1 == KOENIG ) {
        if ( objectState[KOENIG] == 0x00 ) {
            pendingTextID = 0x013d; // text ID 317 (0x013d), script $8abd: B2 record 357: Der Geist des Königs schaut Dich eine Weile an, dann hüpft er mit einem spitzbübischen Grinsen auf den Rand seines Sarges, und nachdem er es sich dort bequem gemacht hat, beginnt er Dir, die Geschichte seines Reiches zu erzählen: "Vor langer, langer Zeit", beginnt er seine Geschichte, und sein Gesicht ist wieder das eines alten, verbitterten Mannes, "war dies ein schönes, friedliches und wohlhabendes Land, in dem alle meine Untertanen gerecht und weise von mir regiert wurden. Ich residierte in meinem Schloß auf einer von kristallklarem Wasser umgebenen Insel, dessen prachtvoller Bau dem Reichtum und der Kunstfertigkeit meines Volkes Ausdruck verlieh... Damals beschäftigte ich auch einen jungen Zauberer namens Zargon an meinem Hofe, der mich von Zeit zu Zeit mit seinen Kunststückchen zu unterhalten pflegte. Er war begabt, sehr begabt sogar, doch niemals hätte ich vermutet, daß er eine Geheimkammer im Untergeschoß meines Schlosses bewohnte - einen Raum, in dem er all seine magischen Experimente durchführte: Er war von dem irrsinnigen Gedanken besessen, künstlich Gold herzustellen, welches er dringend benötigte, um die Lehrstunden, die er bei den höchsten Magiern unseres Landes nahm, bezahlen zu können. Eines Tages jedoch erfüllten sich seine Wünsche dennoch: Er wurde in den Siebenten Zirkel der Magiergilde aufgenommen, was bedeutete, daß sich seine volle magische Kraft entfaltet hatte und er berechtigt war, auch die machtvollsten Sprüche anzuwenden - ja, er wurde schließlich sogar mächtiger als seine einstigen Lehrmeister, die die Entwicklung ihres begabtesten Schülers nun mit großer Sorge verfolgten - doch in seinem unendlichen Ehrgeiz wollte er noch mehr: Er wollte meinen Thron! Doch statt meine edlen Ritter in einem tapferen und gerechten Kampf zu bekämpfen, besann er sich auf seine magischen Kräfte und erschuf eine Armee aus grausamen, untoten Kreaturen... In einer finsteren Nacht - es stürmte und gewitterte, als wäre der Jüngste Tag angebrochen - zog er diese Ausgeburten der Hölle vor meinem Schloß zusammen, und als die Uhr vom Turm Mitternacht schlug, erhoben sich - welch' makabre Ironie des Schicksals - die Leichnahme meiner Ahnen, die in einem Gruftgewölbe unterhalb der Schloßgemächer zur letzten Ruhe gebettet waren, aus ihren Särgen - und öffneten die Tore! Es bereitete Zargon und seinen Schergen kaum Mühe, das Schloß binnen weniger Minuten einzunehmen: Niemand hatte diesen Überfall erwartet - ein verhängnisvoller Fehler... Nachdem sie die Tür zu meinem Schlafgemach aufgebrochen hatten, führten mich Zargons Schwarzblüter zu ihrem Herren ab, der mir ohne ein Wort der Erklärung oder Entschuldigung die Klinge seines Degens bis zum Heft in die Brust stieß..."
            objectState[SARKOPHAG] = 0x02;
            objectState[KOENIG] = 0x01;
        } else {
            if ( objectState[KOENIG] == 0x01 ) {
                pendingTextID = 0x013e; // text ID 318 (0x013e), script $8ad7: B2 record 358: Der König nickt zustimmend. "Du hast recht: Wir haben keine Zeit mehr zu verlieren!", beschließt er, "Die Zeit ist reif, zurückzuschlagen, Zargon seiner gerechten Strafe zuzuführen und die Bewohner meines Reiches aus seiner Tyrannis zu befreien! Wie Du sehen kannst..." - er schaut traurig an sich herunter - "...erlaubt es mir meine übernatürliche Erscheinungsform leider nicht mehr, Zargon persönlich herauszufordern und das Unheil, das er über uns alle gebracht hat, zu sühnen, aber vielleicht bist Du ja stark und klug genug, um es zumindest zu versuchen! Nein! Sag' jetzt nichts! Du darfst mir nicht widersprechen: Dies hier ist nicht bloß irgendeine Aufgabe - es ist Deine Bestimmung!" König Richard schaut Dich aus flehenden Augen an...
                objectState[KOENIG] = 0x02;
            } else {
                if ( objectState[KOENIG] == 0x02 ) {
                    score = score + remainingPoints[0x4f];
                    remainingPoints[0x4f] = 0x00;
                    objectState[KOENIG] = 0x03;
                    objectLocation[ZAUBERSPRUCH] = 0xff;
                    objectState[HOLZTUER] = 0x01;
                    objectState[HAUSTUER] = 0x01;
                    south[VOR_MYLGORS_HAUS] = 0x13;
                    north[IM_KAMINZIMMER] = 0x16;
                    objectState[MYLGOR] = 0x04;
                    pendingTextID = 0x013f; // text ID 319 (0x013f), script $8b21: B2 record 359: "Na, bravo! Du scheinst also verstanden zu haben, worum es in diesem Spiel geht!", sagt der König und faltet zufrieden die Hände über dem Bauch, "Bevor Du jedoch auch nur die geringste Chance haben wirst, Zargon herausfordern zu können, mußt Du erst einmal seinen Vasallen besiegen: Mylgor! Du kennst ihn: Er war derjenige, der Dir befohlen hatte, Firon zu ermorden - meinen jüngeren Bruder, der emigriert ist, als Zargon an die Macht kam, und sich nun mit einer Handvoll der alten Mitglieder seines Geheimbundes in einem Palast aus Eis verschanzt, um vor weiteren Nachstellungen durch Zargons Schergen sicher zu sein. Ich nehme an, daß Mylgor bereits vom Scheitern seines Plans in Kenntnis gesetzt wurde und sich daher in den Geheimkammern unter seiner kleinen Hütte versteckt: Ich weiß zwar nicht, wie Du dorthin gelangst, aber vielleicht wird Dir dieser Zauberspruch helfen, durch einen Bann verschlossene Türen zu öffnen. Er ist zwar nicht stark genug, um Barrieren wie die, die Zargon um das Weltentor hinter dem Wasserfall gelegt hat, zu brechen, aber er ist alles, was von meinen einstmals mächtigen magischen Kräften übriggeblieben ist... Und nun laß mich Dich den Zauberspruch lehren..." Der König legt drei Finger seiner rechten Hand auf Deine Stirn, und ein kalter Schauder überkommt Dich, als Du plötzlich die eisige Kälte seines Körpers spürst... In einer fremden, uralten Sprache murmelt Richard einige kehlige Laute und öffnet dann wieder die Augen: Du besitzt nun die restliche Astralenergie, die er noch hatte...
                } else {
                    if ( objectState[KOENIG] == 0x03 ) {
                        objectState[KOENIG] = 0x04;
                        objectLocation[KOENIG] = RAUM_NULL;
                        pendingTextID = 0x0140; // text ID 320 (0x0140), script $8b3b: B2 record 360: "Du kennst den Zauberspruch!", sagt der König ungeduldig, "Das ist nun aber wirklich alles, was ich für Dich tun konnte...: Das Schicksal meiner Welt liegt in Deinen Händen, doch meine Gebete begleiten Dich - leb' wohl..." Der Geist des Königs wird immer transparenter, bis er schließlich ganz unsichtbar ist... Angesichts der schweren Bürde, die durch diese ungeheure Verantwortung auf Dir lastet, fühlst Du Dich auf einmal unwahrscheinlich allein und verlassen...
                    }
                }
            }
        }
        return;
    }
    if ( object1 == STEINALTAR && objectLocation[GEBET] == 0xff || object1 == GEBET ) {
        if ( currentRoom == IN_DER_KLEINEN_KAPELLE ) {
            score = score + remainingPoints[0x72];
            remainingPoints[0x72] = 0x00;
            objectLocation[GEBET] = 0x69;
            objectLocation[JACKSGEIST] = currentRoom;
            pendingTextID = 0x0151; // text ID 337 (0x0151), script $8b77: B2 record 377: Verzweifelt kniest Du vor dem Altar nieder und schickst ein Stoßgebet nach geistvolleren Texten, besseren Grafiken, leistungsfähigeren Computern und kompetenteren Programmierern zum Himmel, und nebenbei denkst Du auch an den armen, armen Klosterbruder Jack, der hier wohl irgendwann mal vom Schlitten gerutscht sein soll - doch nach wenigen Versen bekommst Du das ungute Gefühl, als wäre etwas hinter Dir - und drehst Dich um: Du fühlst eine leichte, aber eisig kalte Brise durch den Raum streichen, als Du den Nebel im Kirchenschiff bemerkst, der langsam auf Dich zukommt und dabei dichter und dichter wird, bis er schließlich kurz vor Dir stehenbleibt... Du spürst, wie sich in Deinem Nacken die ersten kalten Schweißperlen bilden, und zitternd vor Angst stammelst Du: "Au Scheiße! Alles klar, Leute: Vergeßt das mit den geistvollen Texten und so... War nur'n blöder Witz! Alles in Ordnung, echt!" Doch gerade, bevor Du Dir vor Angst in Deine einzige Hose machen kannst, nimmt der Nebel, den Du eigentlich für eine dieser mysteriösen Wolken gehalten hast, durch die hier wohl jeder in himmlische Gefilde abkommandiert wird, menschliche Umrisse an - und vor Dir steht: BRUDER JACK! Er begrüßt Dich mit den Worten: "Friede sei mit Dir, mein Sohn!", schaut dann auf Deine Beinkleider, grinst und fragt scheinheilig: "Deine Hosen... Ähem: Alles in Ordnung?"
            return;
        }
    }

x8b81:
    return;
}


void PartB_HandleWende() { // Part B, script $8b82; command 40 (WENDE), SELECT $77a4 case 3
    if ( object2 == DAVE ) {
        if ( object1 == FELLSTIEFEL && objectState[FELLSTIEFEL] == 0x00 ) {
            objectState[FELLSTIEFEL] = 0x01;
            objectLocation[FELLSTIEFEL] = 0xff;
            pendingTextID = 0x5d; // text ID 93 (0x005d), script $8ba1: B2 record 195: Unbeholfen steigst Du in die dicken Fellstiefel, die Dir Mylgor gegeben hat. Mannomann, sind die warm! Besser, Du ziehst sie nicht in geschlossenen Räumen wieder aus...
            return;
        } else {
            if ( object1 == BAUMWOLLHEMD && objectState[BAUMWOLLHEMD] == 0x00 ) {
                objectState[BAUMWOLLHEMD] = 0x01;
                objectLocation[BAUMWOLLHEMD] = 0xff;
                pendingTextID = 0x5f; // text ID 95 (0x005f), script $8bc2: B2 record 197: Gut: Du streifst Dir das warme Baumwollhemd über.
                return;
            } else {
                if ( object1 == HOSE && objectState[HOSE] == 0x00 ) {
                    objectState[HOSE] = 0x01;
                    objectLocation[HOSE] = 0xff;
                    pendingTextID = 0x61; // text ID 97 (0x0061), script $8be3: B2 record 199: Du bist nun mit der gefütterten, warmen Hose bekleidet.
                    return;
                }
            }
        }
        if ( object1 == ELIXIER ) {
            if ( currentRoom == VOR_FIRONS_EISPALAST ) {
                objectLocation[ELIXIER] = RAUM_NULL;
                objectState[ELIXIER] = 0x01;
                score = score + remainingPoints[0x71];
                remainingPoints[0x71] = 0x00;
                pendingTextID = 0x0150; // text ID 336 (0x0150), script $8c11: B2 record 376: "Auf Ex!", denkst Du Dir und leerst die kleine Phiole, die Mylgor Dir mitgegeben hat, in einem Zug. Sofort wirst Du unsichtbar, was Du hauptsächlich an dem ziemlich stupiden Ausdruck erkennst, der sich auf dem Gesicht des Yetis breitmacht, als er sieht, daß er nichts sieht... Nun beeil' Dich aber, in Firons Palast im Norden zu kommen - denn nach dem nächsten Zug wirst Du wieder sichtbar werden...!
                return;
            } else {
                if ( currentRoom != VOR_FIRONS_EISPALAST ) {
                    pendingTextID = 0x1a; // text ID 26 (0x001a), script $8c20: B2 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
                    return;
                }
            }
        }
        if ( object1 == HONIG ) {
            pendingTextID = 0x014d; // text ID 333 (0x014d), script $8c30: B2 record 373: Ja, glaubst Du denn tatsächlich, ich hätte all diese Strapazen auf mich genommen, bloß um den Honig jetzt selbst zu essen? Das kann doch wohl kaum Teil der Lösung sein, oder? Naja, okay: Wer weiß - denn was ist hier schon logisch...? Also: Wenn Du tatsächlich so hungrig sein solltest, dann unterbrich das Spiel (Du solltest sowieso mal auf die Uhr - oder besser: den KALENDER! - schauen...), gehe in die Küche und mach' Dir erstmal was zu futtern ("Schalte Computer aus", "Gehe in Küche", "Öffne Kühlschrank", "Inspiziere Kühlschrank", "Plündere Kühlschrank", "Wende Essen auf Dich an", "Gehe zu Computer", "Schalte Computer an", "Boote Soul Crystal", "Ärgere Dich über nicht abgespeicherten Spielstand"...). Großzügigerweise werde ich Dir sogar versprechen, während Deiner Abwesenheit nicht zu mogeln...
            return;
        }
        if ( object1 == AMULETT ) {
            if ( currentRoom != IN_EINEM_VERWUNSCHENEN_WALD2 ) {
                objectLocation[AMULETT] = 0xff;
                objectState[AMULETT] = 0x01;
                score = score + remainingPoints[0x03];
                remainingPoints[0x03] = 0x00;
                pendingTextID = 0x5c; // text ID 92 (0x005c), script $8c5d: B2 record 194: Du legst Dir das Amulett an.
                return;
            } else {
                if ( currentRoom == IN_EINEM_VERWUNSCHENEN_WALD2 ) {
                    pendingTextID = 0x0182; // text ID 386 (0x0182), script $8c6b: not displayed on B2 by $3F62
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
            pendingTextID = 0x65; // text ID 101 (0x0065), script $8cd1: B2 record 203: Hey, Du! Ich bin bloß ein Computer! Das wird "C-O-M-P-U-T-E-R" geschrieben! Sprich mir nach: "Kooom-Piuuu-Tääär"! Fein, und jetzt denk' Dir mal was Realistischeres aus...
            return;
        }
        if ( object2 == SKELETT1 || object2 == SKELETT2 ) {
            pendingTextID = 0x64; // text ID 100 (0x0064), script $8ce4: B2 record 202: Es ist leider zu hart, um bequem darauf liegen zu können - und außerdem: So auf die Schnelle macht das nun auch keinen Spaß...
            return;
        }
        if ( object2 == ORKFRAU ) {
            pendingTextID = 0x0159; // text ID 345 (0x0159), script $8cf2: B2 record 385: Ich muß mich doch sehr wundern, Herr Parker! Ob das nicht vielleicht sogar ein Fall für die Sitte wäre? Also: Tut mir fürchterlich leid, aber da spiele ich nicht mehr mit: Vielleicht solltest Du ja einfach mal weniger vor Deinem Computer sitzen und Dir lieber eine Freundin zulegen, statt Deine Fantasien in jugendfreien Spielen ausleben zu wollen! Falls Dir aber wirklich soviel daran gelegen ist, Dich an Orks zu vergehen, kannst Du ja einen Brief an Chris und Kai schreiben - vielleicht schreiben sie ja noch mal eine "Adult-Version" für Perverslinge wie Dich... Vorerst jedoch werden wir die Orkdame in Ruhe lassen - und wenn's noch so schwerfällt...
            return;
        }
        if ( object2 == HOLZTUER && objectLocation[MYLGOR] == RAUM_NULL ) {
            objectLocation[MYLGOR] = currentRoom;
            score = score + remainingPoints[0x40];
            remainingPoints[0x40] = 0x00;
            pendingTextID = 0x0157; // text ID 343 (0x0157), script $8d19: B2 record 383: Du klopfst zaghaft an die Tür und wartest: Nichts passiert! Du klopfst noch einmal, diesmal etwas lauter: Keine Reaktion! Gerade willst Du mit aller Kraft gegen die Tür hämmern, als sich, just an der Stelle, auf der sich um ein Haar die zerstörerische Wirkung Deiner kraftvollen Fäuste in ihrer ganzen, schrecklichen Größe offenbart hätte, eine kleine Luke öffnet, hinter der ein Gesicht, das sich im Halbdunkel jedoch nur sehr schwer identifizieren läßt, erscheint! "Was ist Dein Begehr, Fremder?", fragt die Stimme hinter der Tür mißtrauisch.
            return;
        }
        if ( object2 == BETT1 ) {
            if ( objectState[BETT1] == 0x00 ) {
                objectState[BETT1] = 0x01;
                objectState[NORDTUER] = 0x01;
                north[IM_DIENERSCHLAFZIMMER] = 0x13;
                objectState[MYLGOR] = 0x02;
                objectState[BADEHOSE] = 0x00;
                score = score + remainingPoints[0x08];
                remainingPoints[0x08] = 0x00;
                pendingTextID = 0x0155; // text ID 341 (0x0155), script $8d5a: B2 record 381: Erst, als Du Dich auf dem Bettzeug ausstreckst, um Dich ein wenig auszuruhen, spürst Du, daß Dich Deine Reise doch viel müder gemacht hat als Du geglaubt hattest. In der Zwischenzeit ist es tiefe Nacht geworden, draußen regnet es in Strömen - und Du bist heilfroh, bei diesem Hundewetter ein Dach über dem Kopf zu haben. Du kuschelst Dich tief in die warme, mollige Bettdecke ein und denkst über Deinen weiteren Aufenthalt in dieser seltsamen, fremden Welt nach, über den Vertrag, den Du mit Mylgor abgeschlossen hast, und was wohl Deine Eltern... Elt... -El... -Zzz... -Zzz... Mit dem Daumen im Mund fällst Du in den tiefen, traumlosen Schlaf der Erschöpfung... Plötzlich wird Dein süßer Schlummer jedoch von einem häßlich scharrenden Geräusch von nebenan unterbrochen - einem Geräusch wie das Scharren von Stein auf Stein! Du stehst auf und willst die Tür zum Kaminzimmer öffnen - aber sie ist abgeschlossen! Frustriert legst Du Dich wieder hin, um wenigstens noch ein paar Stündchen an der Matratze horchen zu können... Am nächsten Nachmittag weckt Dich Mylgor und fordert Dich auf, Dich schnell frischzumachen und danach ins Kaminzimmer zu kommen, wo er Dir seine Order geben will - nur über den nächtlichen Zwischenfall verliert er merkwürdigerweise kein Wort: Du beschließt, ihn vorsichtshalber auch gar nicht darauf anzusprechen und stehst halbwegs ausgeschlafen und entspannt wieder auf...
                return;
            } else {
                if ( objectState[BETT1] == 0x01 ) {
                    pendingTextID = 0x0156; // text ID 342 (0x0156), script $8d6b: B2 record 382: Diesmal hast Du aber nun wirklich keine Zeit zum Schlafen! Immerhin hast Du jetzt ja wohl eine Aufgabe zu erfüllen - und außerdem: Ein echter Held schläft nie!
                    return;
                }
            }
        }
        if ( object2 == GRAB ) {
            pendingTextID = 0x0274; // text ID 628 (0x0274), script $8d7c: B2 record 443: Warum so eilig, junger Freund? Früher oder später wirst Du hier doch sowieso landen! Genieße Dein Leben bis dahin - viel Zeit hast Du doch wahrscheinlich sowieso nicht mehr...!
            return;
        }
    }
    if ( object1 == HONIG ) {
        if ( object2 == BAUMSTAMM1 ) {
            pendingTextID = 0x0276; // text ID 630 (0x0276), script $8d92: B2 record 445: Die Idee ist ja nicht schlecht - nur haben wir leider nicht genug Honig dabei, um den ganzen Baumstamm damit bestreichen zu können.
        } else {
            if ( object2 == FELLSTIEFEL ) {
                score = score + remainingPoints[0x14];
                remainingPoints[0x14] = 0x00;
                objectLocation[HONIG] = 0x69;
                objectState[HONIG] = 0x14;
                pendingTextID = 0x015a; // text ID 346 (0x015a), script $8db6: B2 record 386: Du versuchst ein wenig von dem Honig auf die Sohlen Deiner Stiefel aufzutragen, was sich allerdings als wesentlich komplizierter gestaltet, als Du anfangs angenommen hattest. Schließlich, Deinen ganzen Körper völlig mit Honig verklebt, schaffst Du es aber trotzdem: Du trägst den letzten Rest der klebrigen Masse auf die Sohlen auf und versuchst damit herumzulaufen, wobei Du erfreut feststellst, daß Deine Stiefel nun wesentlich besser auf dem Boden haften, was zwar auf der einen Seite das Laufen nicht gerade erleichtert, dafür aber auch das Ausrutschen auf glatten Flächen erheblich erschwert...
            } else {
                pendingTextID = 0x0278; // text ID 632 (0x0278), script $8dbc: B2 record 447: Naja, etwas infantil - aber ganz nett, diese Ferkelei! Vielleicht sollten wir uns jedoch ein wenig von dem klebrigen Zeug aufbewahren: So ganz sinnlos, wie Du zu meinen scheinst, wird es wohl kaum sein!
            }
        }
        return;
    }
    if ( object1 == MESSER && object2 == DAVE && objectState[VERTRAG] == 0x00 ) {
        objectLocation[BLUT] = 0xff;
        pendingTextID = 0x014e; // text ID 334 (0x014e), script $8ddf: B2 record 374: Schmerzlich verziehst Du Dein Gesicht, als das kleine, scharfe Messerchen tief in Deine Fingerkuppe ritzt und dort eine kleine, aber tiefe Wunde hinterläßt, aus der nun rotes Blut auf den Boden tropft. "Den kann ich wegschmeißen! Und gerade die Maushand! Wenn das Mylgors Art ist, Leute für ihn zu verpflichten, wird er nur sehr wenige finden, die nach Vertragsabschluß noch arbeitsfähig sind!", denkst Du Dir, als Du Deinen lädierten Finger betrachtest...
        return;
    }
    if ( object1 == BLUT ) {
        if ( object2 == VERTRAG && objectState[VERTRAG] == 0x00 ) {
            objectState[VERTRAG] = 0x01;
            objectLocation[BLUT] = RAUM_NULL;
            score = score + remainingPoints[0x0d];
            remainingPoints[0x0d] = 0x00;
            pendingTextID = 0x014c; // text ID 332 (0x014c), script $8e13: B2 record 372: Mit dem Blut, das aus Deiner Fingerspitze tropft, schreibst Du unbeholfen Deinen Namen unter den Vertrag...
        } else {
            pendingTextID = 0x0277; // text ID 631 (0x0277), script $8e19: B2 record 446: Das wäre verantwortungslos, findest Du nicht? Wenn Du Dein Blut unbedingt loswerden mußt, solltest Du es vernünftigerweise zur Sondermülldeponie bringen!
        }
        return;
    }
    if ( object1 == PFEIFE ) {
        if ( object2 == BIENENSTOCK && objectState[BIENENSTOCK] == 0x00 ) {
            score = score + remainingPoints[0x0b];
            remainingPoints[0x0b] = 0x00;
            objectState[BIENENSTOCK] = 0x01;
            pendingTextID = 0x014f; // text ID 335 (0x014f), script $8e48: B2 record 375: Genießerisch ziehst Du an der Pfeife, die Du dem Orkvater gestohlen hast, und bläst den süßlichen Rauch rücksichtsloserweise direkt in den Bienenstock hinein. Wie erwartet, vertragen die Bienen den Geruch des Zeugs, das der alte Ork in die Pfeife gestopft hat, nicht besonders gut: Hastig verlassen sie ihren Bienenstock und suchen das Weite! Als Du ihnen verträumt und irgendwie auch etwas benommen nachblickst, fragst Du Dich allerdings, weshalb so viele der Bienen diese unkontrollierten Kurven fliegen - fast schon so, als wären sie betrunken... Könnte es vielleicht sein, daß irgendetwas mit der Pfeifenfüllung nicht in Ordnung war...?
            return;
        } else {
            if ( object2 == BIENENSTOCK && objectState[BIENENSTOCK] == 0x01 || object2 == DAVE ) {
                pendingTextID = 0x5e; // text ID 94 (0x005e), script $8e63: B2 record 196: Vorsichtig ziehst Du an der Pfeife des Orkvaters. Ihr süßlicher Rauch versetzt Dich in eine andere Welt: Eine Welt, in der Du auf einem tiefergelegten Toaster durch die Wolken fliegst, wo rosa Elefanten den Verkehr regeln. Plötzlich fängt es an, bunte Regentropfen zu regnen - und die Sicht in Deinem Turbotoaster wird immer schlechter, weil die Scheibenwischer natürlich auch mal wieder streiken! So ein Mist! Dabei warst Du mit der Kiste doch gerade erst beim Toaster-Überwachungs-Verein (TÜV)! RUMMS! Nu isses mal wieder passiert: Kaum paßt man mal eine Weile nicht auf, da nimmt einem auch schon wieder einer von diesen blasierten Marzipankartoffelreitern die Vorfahrt! "Er war schuld!", denkst Du Dir noch, als Du mit der Rübe durch die Windschutzscheibe bretterst. Dann gehen die Lichter aus... Als Du zu Dir kommst, befindest Du Dich wieder an der Stelle, wo Du an der Pfeife gezogen hast - allerdings hast Du einen fürchterlichen Brummschädel. Mann! Was für ein Kraut...
                return;
            }
        }
    }
    if ( object1 == KURZSCHWERT ) {
        if ( object2 == WEIHWASSERBECKEN ) {
            score = score + remainingPoints[0x3c];
            remainingPoints[0x3c] = 0x00;
            if ( objectState[KURZSCHWERT] == 0x00 ) {
                objectState[KURZSCHWERT] = 0x01;
            } else {
                if ( objectState[KURZSCHWERT] == 0x02 ) {
                    objectState[KURZSCHWERT] = 0x03;
                }
            }
            pendingTextID = 0x0154; // text ID 340 (0x0154), script $8ea4: B2 record 380: Du tauchst Dein Schwert in das Weihwasserbecken und präparierst es mit dem Weihwasser.
            return;
        }
        if ( object2 == SILBER ) {
            score = score + remainingPoints[0x82];
            remainingPoints[0x82] = 0x00;
            pendingTextID = 0x0153; // text ID 339 (0x0153), script $8ebf: B2 record 379: Du tauchst Dein treues Schwert tief in das heiße, geschmolzene Silber und versilberst es somit bis hoch zum Griff.
            if ( objectState[KURZSCHWERT] == 0x00 ) {
                objectState[KURZSCHWERT] = 0x02;
            } else {
                if ( objectState[KURZSCHWERT] == 0x01 ) {
                    objectState[KURZSCHWERT] = 0x03;
                }
            }
            return;
        }
        if ( object2 == WERWOLF ) {
            if ( objectState[KURZSCHWERT] == 0x03 && objectLocation[KURZSCHWERT] == 0xff ) {
                score = score + remainingPoints[0x9f];
                remainingPoints[0x9f] = 0x00;
                pendingTextID = 0xf0; // text ID 240 (0x00f0), script $8f08: B2 record 280: Bevor Dein untoter Gegner Gelegenheit zum Angriff bekommt, fichst Du mit einer gewandten Bewegung gegen seine Brust! Kurz bevor Deine Klinge jedoch ihr Ziel findet, läßt Du sie überraschend nach oben, gegen den Hals der Bestie, schwingen, wo sie eine klaffende, rauchende Wunde hinterläßt, ohne daß der Werwolf auch nur die geringste Chance gehabt hätte, Deinen wahrhaft mörderisch guten Hieb abzuwehren! Die untote Kreatur sinkt, schwer verwundet durch Deine geweihte Waffe, mit einem ungläubigen Blick in ihren Augen zu Boden und haucht ihr "Leben" aus. "K.O. wegen vorzeitigen Ablebens in der ersten Runde!" - selbstzufrieden steckst Du Dein Schwert zurück in die Scheide und pustest Dir über die Fingernägel, als Dir der Gedanke kommt, daß dies auch eine Finte sein könnte: Vorsichtig, und mit einer Hand den Schwertgriff fest umklammernd, kniest Du neben dem Wolfskörper nieder, um zu sehen, ob Dein Gegner wirklich tot ist... Deine Sorge war unbegründet: Dampfendes, grünliches Blut rinnt aus einer langen, weit aufklaffenden Wunde aus seiner Kehle. Etwas anderes, was Du allerdings auch sehen mußt, ist etwas rotes Blut, das an einer der Wolfsklauen klebt - und als Du Dich, von bösen Vorahnungen geplagt, untersuchst, kannst Du eine kleine, aber dennoch ziemlich tiefe Wunde an Deinem linken Bein erkennen, die der Wolf wohl noch im Fallen gerissen haben muß, und aus der nun - GRÜNES Blut sickert! SCHEISSE! Jetzt, wo Du sie bemerkt hast, beginnt die Wunde höllisch zu brennen: Die Infektion hat begonnen, und es wird nur noch eine Frage der Zeit sein, bis auch Du beginnst, bei Vollmond zur Bestie zu werden! Während Du Dich resignierend auf einem der umgefallenen Grabsteine niederläßt, um über Dein ungewisses Schicksal nachzusinnen, verwandelt sich der der Körper des Wolfes in den verwesenden Leichnam einer einst wohl einmal wunderschönen, jungen Frau, die dankbar zu Dir aufzublicken scheint! Als Du sie berühren willst - zerfällt sie zu Staub...
                objectLocation[WERWOLF] = RAUM_NULL;
                objectState[WERWOLF] = 0x03;
                showtext();
                pendingTextID = 0x00; // text ID 0 (0x0000), script $8f19: no text
                return;
            }
            pendingTextID = 0x00; // text ID 0 (0x0000), script $8f21: no text
            return;
        }
        if ( object2 == DAVE ) {
            pendingTextID = 0x60; // text ID 96 (0x0060), script $8f2f: B2 record 198: Na gut, wie Du meinst: Heldenhaft stürzst Du Dich in die Klinge Deines Schwertes - aber nichts passiert! Kein Blut, kein Schmerz, rein gar nichts! Frustriert unternimmst Du einen weiteren Versuch, doch wieder spürst Du nichts. Beim dritten Mal triffst Du Dich dann endlich: In Todesqualen windest Du Dich auf dem Boden, ohne daß ein Wort des Schmerzes über Deine Lippen kommt - wie es sich eben für einen echten Helden gehört. Wenn das Deine Freundin sehen könnte! So einen stilvollen Abgang legt man schließlich nicht alle Tage hin! Auf einmal ist alles vorbei, und es wird dunkel... Nach einiger Zeit erwachst Du schwebend in einem dunklen Raum. Du schauderst: Ist das das Leben nach dem Tode? Das soll wirklich alles sein? Sieht ja finster aus... Doch auf einmal wird Dir klar, was Dich geweckt hat: Leise, wie aus weiter Ferne, weht eine sanfte Stimme zu Dir herüber... "Dave Parker!", kannst Du sie wispern hören, "Du solltest wissen, daß niemand seinem Schicksal entkommen kann! Es hat keinen Sinn, vor seiner Bestimmung zu fliehen - das Schicksal holt Dich immer wieder ein! Gehe also hin und erfülle die Aufgaben, die man Dir auferlegt hat. Kraft meiner göttlichen Befugnisse werde ich Dir nun ein Extraleben schenken, um Dir noch eine Gelegenheit zu geben, Deine Bestimmung zu erfüllen..." Während die Stimme im Nichts verhallt, beginnt sich alles um Dich herum zu drehen, Dir wird schwindlig - und Du fällst in einen tiefen, traumlosen Schlaf... Als Du Deine Augen wieder öffnest, findest Du Dich genau dort wieder, wo Du Deinen Selbstmordversuch unternommen hast...
            showtext();
            Restart();
            return;
        }
    }
    if ( object2 == STEINALTAR ) {
        if ( object1 == GEBET ) {
            score = score + remainingPoints[0x72];
            remainingPoints[0x72] = 0x00;
            objectLocation[GEBET] = 0x69;
            objectLocation[JACKSGEIST] = currentRoom;
            pendingTextID = 0x0151; // text ID 337 (0x0151), script $8f5d: B2 record 377: Verzweifelt kniest Du vor dem Altar nieder und schickst ein Stoßgebet nach geistvolleren Texten, besseren Grafiken, leistungsfähigeren Computern und kompetenteren Programmierern zum Himmel, und nebenbei denkst Du auch an den armen, armen Klosterbruder Jack, der hier wohl irgendwann mal vom Schlitten gerutscht sein soll - doch nach wenigen Versen bekommst Du das ungute Gefühl, als wäre etwas hinter Dir - und drehst Dich um: Du fühlst eine leichte, aber eisig kalte Brise durch den Raum streichen, als Du den Nebel im Kirchenschiff bemerkst, der langsam auf Dich zukommt und dabei dichter und dichter wird, bis er schließlich kurz vor Dir stehenbleibt... Du spürst, wie sich in Deinem Nacken die ersten kalten Schweißperlen bilden, und zitternd vor Angst stammelst Du: "Au Scheiße! Alles klar, Leute: Vergeßt das mit den geistvollen Texten und so... War nur'n blöder Witz! Alles in Ordnung, echt!" Doch gerade, bevor Du Dir vor Angst in Deine einzige Hose machen kannst, nimmt der Nebel, den Du eigentlich für eine dieser mysteriösen Wolken gehalten hast, durch die hier wohl jeder in himmlische Gefilde abkommandiert wird, menschliche Umrisse an - und vor Dir steht: BRUDER JACK! Er begrüßt Dich mit den Worten: "Friede sei mit Dir, mein Sohn!", schaut dann auf Deine Beinkleider, grinst und fragt scheinheilig: "Deine Hosen... Ähem: Alles in Ordnung?"
            return;
        }
    }
    if ( object1 == TOTENSCHAEDEL && object2 == SKELETT1 ) {
        score = score + remainingPoints[0x83];
        remainingPoints[0x83] = 0x00;
        objectLocation[SKELETT1] = 0x69;
        objectLocation[TOTENSCHAEDEL] = 0x69;
        objectLocation[KOENIG] = currentRoom;
        pendingTextID = 0x0158; // text ID 344 (0x0158), script $8f8f: B2 record 384: Vorsichtig legst Du den Schädel neben den Rumpf des Königs - aber was ist denn das? Der Totenschädel rollt zum Hals des Skelettes und wächst dort wieder an, als ob er niemals irgendwo anders gewesen wäre! Im selben Moment jedoch, als der Schädel des Königs an seinen angestammten Platz zurückkehrt, fühlst Du einen eiskalten Wind im Nacken... Mal wieder das Schlimmste befürchtend, schließt Du angsterfüllt die Augen: Nichts passiert... Als Du sie jedoch wieder zu öffnen wagst - ist der Sarg leer! Du schließt Deine Augen zum zweiten Mal und öffnest sie wieder: Aber nichts hat sich geändert: Der Sarkophag des Königs ist und bleibt leer! Bevor Du jedoch versuchen kannst, auf Deinen schlotternden Beinen davonzulaufen, hörst Du eine offensichtlich recht amüsierte, sanfte Stimme hinter Dir: "Willkommen, mein Freund..." Es ist König Richard!
        return;
    }
    if ( object1 == ZAUBERSPRUCH ) {
        if ( object2 == WESTTUER ) {
            score = score + remainingPoints[0x88];
            remainingPoints[0x88] = 0x00;
            objectLocation[ZAUBERSPRUCH] = 0x69;
            objectState[WESTTUER] = 0x02;
            objectDescriptionID[WESTTUER] = 0x0b;
            objectDescriptionID[ZAUBERTUER] = 0x0b;
            pendingTextID = 0x0152; // text ID 338 (0x0152), script $8fc8: B2 record 378: Du schließt die Augen, konzentrierst Dich und versuchst, all die magische Energie, die Dir König Richard verliehen hat, auf das Schloß zu lenken: Nichts! Doch halt: Gerade, als Du frustriert aufgeben willst, hörst Du ein leises Klicken im Türschloß...
        } else {
            pendingTextID = 0x67; // text ID 103 (0x0067), script $8fce: B2 record 205: Also gut: Schwamm drüber! Vergessen wir's, und reden wir nicht mehr davon! Aber gib jetzt bitte mal etwas Sinnvolleres ein - mir wird's langsam zu langweilig!
        }
        return;
    }
    pendingTextID = 0x67; // text ID 103 (0x0067), script $8fd7: B2 record 205: Also gut: Schwamm drüber! Vergessen wir's, und reden wir nicht mehr davon! Aber gib jetzt bitte mal etwas Sinnvolleres ein - mir wird's langsam zu langweilig!

x8fdb:
    return;
}


void PartB_HandleBefestige() { // Part B, script $8fdc; command 41 (BEFESTIGE), SELECT $77a4 case 4
    if ( object1 == HONIG ) {
        if ( object2 == FELLSTIEFEL ) {
            score = score + remainingPoints[0x14];
            remainingPoints[0x14] = 0x00;
            objectLocation[HONIG] = 0x69;
            objectState[HONIG] = 0x14;
            pendingTextID = 0x015a; // text ID 346 (0x015a), script $9000: B2 record 386: Du versuchst ein wenig von dem Honig auf die Sohlen Deiner Stiefel aufzutragen, was sich allerdings als wesentlich komplizierter gestaltet, als Du anfangs angenommen hattest. Schließlich, Deinen ganzen Körper völlig mit Honig verklebt, schaffst Du es aber trotzdem: Du trägst den letzten Rest der klebrigen Masse auf die Sohlen auf und versuchst damit herumzulaufen, wobei Du erfreut feststellst, daß Deine Stiefel nun wesentlich besser auf dem Boden haften, was zwar auf der einen Seite das Laufen nicht gerade erleichtert, dafür aber auch das Ausrutschen auf glatten Flächen erheblich erschwert...
        } else {
            if ( object2 == BAUMSTAMM1 ) {
                pendingTextID = 0x0276; // text ID 630 (0x0276), script $900c: B2 record 445: Die Idee ist ja nicht schlecht - nur haben wir leider nicht genug Honig dabei, um den ganzen Baumstamm damit bestreichen zu können.
            } else {
                pendingTextID = 0x0278; // text ID 632 (0x0278), script $9012: B2 record 447: Naja, etwas infantil - aber ganz nett, diese Ferkelei! Vielleicht sollten wir uns jedoch ein wenig von dem klebrigen Zeug aufbewahren: So ganz sinnlos, wie Du zu meinen scheinst, wird es wohl kaum sein!
            }
        }
        return;
    }
    if ( object1 == TOTENSCHAEDEL && object2 == SKELETT1 ) {
        score = score + remainingPoints[0x83];
        remainingPoints[0x83] = 0x00;
        objectLocation[SKELETT1] = 0x69;
        objectLocation[TOTENSCHAEDEL] = 0x69;
        objectLocation[KOENIG] = currentRoom;
        pendingTextID = 0x0158; // text ID 344 (0x0158), script $9045: B2 record 384: Vorsichtig legst Du den Schädel neben den Rumpf des Königs - aber was ist denn das? Der Totenschädel rollt zum Hals des Skelettes und wächst dort wieder an, als ob er niemals irgendwo anders gewesen wäre! Im selben Moment jedoch, als der Schädel des Königs an seinen angestammten Platz zurückkehrt, fühlst Du einen eiskalten Wind im Nacken... Mal wieder das Schlimmste befürchtend, schließt Du angsterfüllt die Augen: Nichts passiert... Als Du sie jedoch wieder zu öffnen wagst - ist der Sarg leer! Du schließt Deine Augen zum zweiten Mal und öffnest sie wieder: Aber nichts hat sich geändert: Der Sarkophag des Königs ist und bleibt leer! Bevor Du jedoch versuchen kannst, auf Deinen schlotternden Beinen davonzulaufen, hörst Du eine offensichtlich recht amüsierte, sanfte Stimme hinter Dir: "Willkommen, mein Freund..." Es ist König Richard!
        return;
    }
    pendingTextID = 0x18; // text ID 24 (0x0018), script $904e: B2 record 126: Wie soll denn DAS funktionieren?

x9052:
    return;
}


void PartB_HandleGib() { // Part B, script $9053; command 42 (GIB), SELECT $77a4 case 5
    if ( object1 == KRISTALLKUGEL && object2 == ORKKIND ) {
        pendingTextID = 0x015d; // text ID 349 (0x015d), script $905e: B2 record 389: Du gibst dem Kind die Kristallkugel, damit es endlich etwas zum Spielen hat - und vor allem, damit bei seinen Spielen niemand mehr zu Schaden kommt. Mit zitternden Fingern betastet es das schimmernde Kleinod und betrachtet es, als wäre die kleine Kugel das wertvollste Ding auf dieser Welt. "Sie ist wunderschön - was willst Du dafür haben?", fragt es, ängstlich, in seinem jungen Leben noch nicht genug Schätze gehortet zu haben und Dir deshalb sein neues Spielzeug wieder zurückgeben zu müssen. "Nichts. Ich schenke sie Dir. Aber versuch' nicht, Fußball damit zu spielen!", antwortest Du freundlich - froh, das Kind ein wenig glücklicher machen zu können. Das kleine Ding starrt Dich aus ungläubigen Augen an: "Wirklich - gar nichts?", wiederholt es fragend, als könne es Dir nicht glauben. "Wirklich - gar nichts!", gibst Du zurück. Das Kind fällt Dir überglücklich um den Hals: "Du bist mein Freund!", kräht es in seiner kindlichen Freude, die noch nichts von dem feindseligen Ton an sich hat, in dem Orks und Menschen normalerweise miteinander zu verkehren pflegen, "Komm' mit mir mit: Ich werde Dir unsere Höhle zeigen und Dich meinen Eltern vorstellen!" Bevor Du etwas erwidern kannst, läßt der Kleine Dich los und stapft in das Unterholz hinein. Kopfschüttelnd folgst Du dem Kind durch das dichte Gestrüpp am südlichen Rande der Lichtung, auf einem Pfad, den nur die Orks kennen...
        showtext();
        objectLocation[KRISTALLKUGEL] = RAUM_NULL;
        objectLocation[ORKKIND] = IN_DER_ORKHOEHLE;
        objectLocation[DAVE] = IN_DER_ORKHOEHLE;
        objectState[ORKMANN] = 0x00;
        currentRoom = IN_DER_ORKHOEHLE;
        imageID = currentRoom;
        ShowImage();
        Code2E5B();
        showtext();
        Restart();
        pendingTextID = 0xcc; // text ID 204 (0x00cc), script $9087: B2 record 244: Als der Orkvater seinen kleinen Sohn vegnügt hinter Dir die Höhle betreten sieht, verwandelt sich sein anfänglich feindseliger Blick plötzlich in ein breites Grinsen. "Oho! Sieht ja ganz danach aus, als bekämen wir heute Besuch zum Essen!", sagt er, und Du zuckst unwillkürlich zusammen - doch er fährt unbeirrt in seiner rauhbauzigen Art fort, ohne sich der Zweideutigkeit seiner Worte überhaupt erst richtig bewußt zu werden: "Naja: Wenn mein Weib es tatsächlich noch schaffen sollte, die Echse zu grillen, bevor wir alle verhungert sind, kannst Du ja mit uns zu Mittag essen. Setz' Dich einfach hin - es ist genug für uns alle da!" Mit sehr gemischten Gefühlen setzt Du Dich auf einen der kleinen Schemel, wobei Du Dich jedoch krampfhaft bemühst, nicht zu dem Tier über der Feuerstelle zu blicken...
        imageID = 0xff;
        return;
    }
    if ( object2 == MYLGOR ) {
        pendingTextID = 0x00; // text ID 0 (0x0000), script $9099: no text
        if ( object1 == MESSER ) {
            if ( objectLocation[BLUT] == 0xff || objectState[VERTRAG] == 0x01 ) {
                objectLocation[MESSER] = RAUM_NULL;
                pendingTextID = 0x015b; // text ID 347 (0x015b), script $90b8: B2 record 387: Wortlos nimmt Mylgor sein Messer entgegen.
            } else {
                if ( objectLocation[BLUT] == RAUM_NULL && objectState[VERTRAG] == 0x00 ) {
                    pendingTextID = 0x1a; // text ID 26 (0x001a), script $90cd: B2 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
                    return;
                }
            }
        }
        if ( object1 == VERTRAG ) {
            if ( objectState[VERTRAG] == 0x00 ) {
                pendingTextID = 0x0143; // text ID 323 (0x0143), script $90e5: B2 record 363: "Was sollte ich denn bitte mit einem Vertrag anfangen, den Du nicht unterschrieben hast?", fährt Mylgor Dich ärgerlich an, "Nein, mein Freund, behalte ihn ruhig! Dir wird sehr bald klarwerden, daß Du gar keine andere Wahl hast..." Irgendwie mißfällt Dir der Ton, in dem Mylgor das Wort "Freund" ausgesprochen hat - es klang irgendwie... -verächtlich?
                return;
            } else {
                if ( objectState[VERTRAG] == 0x01 ) {
                    pendingTextID = 0x015c; // text ID 348 (0x015c), script $90f6: B2 record 388: Mit einem seltsamen Lächeln auf den Lippen nimmt Mylgor den unterschriebenen Vertrag zurück...
                    objectLocation[VERTRAG] = RAUM_NULL;
                }
            }
        }
        if ( objectState[VERTRAG] == 0x01 && objectLocation[VERTRAG] == RAUM_NULL && objectLocation[MESSER] == RAUM_NULL ) {
            showtext();
            Restart();
            score = score + remainingPoints[0x50];
            remainingPoints[0x50] = 0x00;
            objectLocation[MESSER] = RAUM_NULL;
            objectLocation[DAVE] = IM_KAMINZIMMER;
            objectLocation[MYLGOR] = IM_KAMINZIMMER;
            objectLocation[BADEHOSE] = RAUM_NULL;
            currentRoom = IM_KAMINZIMMER;
            imageID = currentRoom;
            ShowImage();
            pendingTextID = 0xcf; // text ID 207 (0x00cf), script $9148: B2 record 247: Als Du den Vertrag sowie das Messer an den Mann zurückgegeben hast, verschwindet sein Gesicht kurz hinter der Luke. Nach wenigen Sekunden hörst Du, wie von innen die Tür aufgeschlossen wird. "Tritt ein!", sagt der Mann, als er Dir die Tür öffnet, und führt Dich in ein kleines, aber sehr gemütlich eingerichtetes Kaminzimmer. Er stellt sich als "Mylgor, Alchemist" vor und zeigt Dir auch gleich den Raum, in dem Du die Nacht verbringen sollst. Auf Deine Frage hin, wo er denn schlafen wolle, wenn nicht dort, lacht er herzlich und sagt: "Meinst Du denn wirklich, daß diese kleine Hütte groß genug zum Leben für einen Wissenschaftler wie mich ist? Nein, aber nicht doch: Dies ist bloß der Raum, in dem mein Diener gewöhnlich schläft, der zur Zeit aber gerade im Nachbardorf ein paar Besorgungen für mich erledigt. Mein Labor und die anderen Räume befinden sich... - sind versteckt! Es spielt keine Rolle, wo..." Nervös streicht sich Mylgor über seinen Kinnbart, zwingt sich dann jedoch wieder zu seinem eigentümlichen Lächeln. "Aber ich dachte eigentlich, wir wollten über Dich reden - nicht über mich...?", meint er und nickt mit dem Kopf in Richtung Kaminzimmer, "Laß uns noch ein Stündchen am warmen Kamin plaudern, und ich werde Dir vielleicht ein wenig über die Geschichte unseres Dorfes erzählen. Aber gib mir erst einmal Deine nassen Sachen - Du könntest Dir ja sonst glatt den Tod holen...!" Mit einem sehr flauen Gefühl im Magen entkleidest Du Dich, wobei Du den alten Alchemisten jedoch genauestens im Auge behältst: Wer weiß, was das für eine Gefälligkeit sein wird, die Du dem alten Mann erweisen sollst? War da nicht gerade so ein gieriges Funkeln in seinen Augen zu erkennen? Vorsichtshalber lugst Du zur Tür Deiner Kammer: Gott sei Dank! Sie läßt sich abschließen! Verlegen und unsicher reichst Du Mylgor Deine klamme Badehose, doch alles was er tut, ist, sie zum Trocknen an den Kamin zu legen...
            showtext();
            Restart();
            Code2E5B();
            return;
        }
        if ( pendingTextID == 0x00 ) {
            pendingTextID = 0x12; // text ID 18 (0x0012), script $9159: B2 record 120: Ist ja wirklich lieb gemeint, aber was sollte man denn DAMIT schon anfangen können...?
        }
        return;
    }
    if ( object1 == SILBERMUENZEN && object2 == VERKAEUFER ) {
        objectLocation[SILBERMUENZEN] = RAUM_NULL;
        objectLocation[HUNDESCHLITTEN] = IN_EINEM_SCHNEEBEDECKTEN_TAL;
        objectState[VERKAEUFER] = 0x01;
        score = score + remainingPoints[0x2f];
        remainingPoints[0x2f] = 0x00;
        pendingTextID = 0x015e; // text ID 350 (0x015e), script $918b: B2 record 390: "Ah, Ihr habt Euch also entschieden, einen unserer Hundeschlitten zu kaufen?", fragt Dich der Verkäufer geschäftig und schaut dann auf Deine ausgestreckte Hand, die ihm die paar Silbermünzen anbietet, die Du in der Zwergenmine gefunden hast. "Naja...: Also, für den Preis kann ich Euch natürlich nicht gerade unser exklusivstes und teuerstes Modell anbieten, aber ich denke trotzdem, daß Ihr zufrieden damit sein werdet." Er nimmt die Münzen entgegen, zählt sie ab und wirft sie in eine kleine, eiserne Truhe auf dem Tresen. "Der Schlitten wird für Euch vorbereitet. Wir werden ihn in einem Tal nordwestlich von hier abliefern: Nehmt die Hintertür im Westen, um auf den Weg dorthin zu gelangen - es ist nicht allzuweit: In gut anderthalb Stunden könnt Ihr dort sein. Vielen Dank - und empfehlt uns bitte weiter!", sagt er zum Abschied sein wohleinstudiertes Sprüchlein auf und wendet sich daraufhin wieder seiner Arbeit hinter dem Tresen zu.
        return;
    }
    pendingTextID = 0x12; // text ID 18 (0x0012), script $9194: B2 record 120: Ist ja wirklich lieb gemeint, aber was sollte man denn DAMIT schon anfangen können...?

x9198:
    return;
}


void PartB_HandleVerriegele() { // Part B, script $9199; command 43 (VERRIEGELE), SELECT $77a4 case 6
    tableptr = data0x93ed;
    temp = 0x01;

x91a0:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x91bc;
    }
    temp = temp + 0x01;
    if ( temp <= 0x0c ) {
        goto x91a0;
    }

x91bc:
    if ( temp > 0x0c ) {
        pendingTextID = 0x15; // text ID 21 (0x0015), script $91c2: B2 record 123: Tut mir ja wirklich ganz fürchterlich leid, aber DAS kannst Du nun wirklich nicht abschließen!
        return;
    }
    if ( scratch3 != object2 ) {
        tableptr = data0x9405;
        temp = 0x01;

x91d6:
        scratch1 = *tableptr++;
        if ( scratch1 == object1 ) {
            goto x91f0;
        }
        temp = temp + 0x01;
        if ( temp <= 0x07 ) {
            goto x91d6;
        }

x91f0:
        if ( temp > 0x07 ) {
            pendingTextID = 0x14; // text ID 20 (0x0014), script $91f6: B2 record 122: Wie willst Du denn DAMIT etwas abschließen?
            return;
        }
        pendingTextID = 0x6a; // text ID 106 (0x006a), script $91fe: B2 record 208: Mist! Entschuldige bitte, aber das hier scheint einfach nicht der richtige Schlüssel zu sein - er paßt leider nicht.
        return;
    } else {
        if ( scratch3 == object2 ) {
            if ( objectState[object1] == 0x00 ) {
                pendingTextID = 0x68; // text ID 104 (0x0068), script $9212: B2 record 206: Aber das ist doch bereits abgeschlossen!
                return;
            } else {
                if ( objectState[object1] == 0x02 || objectState[object1] == 0x01 ) {
                    if ( objectState[object1] == 0x01 ) {
                        PartB_HandleSchliesse();
                    }
                    objectState[object1] = 0x00;
                    if ( object1 == FRIEDHOFSTOR1 ) {
                        objectState[FRIEDHOFSTOR2] = 0x00;
                        objectState[FRIEDHOFSTOR1] = 0x00;
                    } else {
                        if ( object1 == FRIEDHOFSTOR2 ) {
                            objectState[FRIEDHOFSTOR1] = 0x00;
                            objectState[FRIEDHOFSTOR2] = 0x00;
                        }
                    }
                    pendingTextID = 0x13; // text ID 19 (0x0013), script $925e: B2 record 121: Gut, abgeschlossen.
                    if ( object1 == LABORTUER && objectState[MYLGOR] <= 0x08 ) {
                        score = score + remainingPoints[0x51];
                        remainingPoints[0x51] = 0x00;
                        if ( objectState[REAGENZIEN] != 0x00 ) {
                            pendingTextID = 0x015f; // text ID 351 (0x015f), script $9283: B2 record 391: Hastig verschließt Du die Labortür mit dem Schlüssel aus Mylgors Studierzimmer und hörst zu Deiner Beruhigung, wie das riesige Spezialschloß mit einem leisen Klicken schließt - keine Sekunde zu früh: Im selben Moment, als Du den Schlüssel herumdrehst, erschüttert eine fürchterliche Explosion im Labor das ganze Haus bis in die Grundmauern - aber die massive und klugerweise verschlossene Tür hält die schlimmsten Auswirkungen der Druckwelle glücklicherweise von Dir ab! Putz rieselt von der Decke, der Boden und die Wände beben bedrohlich - und plötzlich wird es sehr still: Nur das knisternde Lecken der Flammen an der Labortür ist noch zu hören... Als sich der Staub nach einer Weile gelegt hat, schaust Du Dich um: Die Labortür ist noch immer verschlossen - nur aus kleinen Ritzen in ihrem Rahmen quillt schwarzer Rauch... Du schickst ein Dankgebet dafür zum Himmel, daß Du die Explosion unversehrt überlebt hast - im krassen Gegensatz zu Mylgor übrigens, der jetzt wahrscheinlich mehr oder minder gleichmäßig über die gesamte Laborfläche verteilt sein dürfte... WELL DONE: BONUS AWARDED! ...NOW PREPARE FOR NEXT STAGE... Ähem: Kleiner Scherz...!
                            objectState[MYLGOR] = 0x09;
                            objectState[REAGENZIEN] = 0x05;
                        } else {
                            if ( objectState[REAGENZIEN] == 0x00 && objectState[MYLGOR] < 0x09 ) {
                                pendingTextID = 0x0160; // text ID 352 (0x0160), script $92a4: B2 record 392: Gute Idee: Du verschließt die Tür zu Mylgors Labor und bereitest somit gewissenhaft seinen Hungertod vor... Vielleicht solltest Du ja in ein paar Jahren mal wieder hierherkommen, um ihm ein paar Blümchen zu bringen...
                                objectState[MYLGOR] = 0x08;
                            }
                        }
                    }
                }
            }
        }
    }

x92b6:
    return;
}


void PartB_HandleEntriegele() { // Part B, script $92b7; command 44 (ENTRIEGELE), SELECT $77a4 case 7
    tableptr = data0x93ed;
    temp = 0x01;

x92be:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x92da;
    }
    temp = temp + 0x01;
    if ( temp <= 0x0c ) {
        goto x92be;
    }

x92da:
    if ( temp > 0x0c ) {
        pendingTextID = 0x18; // text ID 24 (0x0018), script $92e0: B2 record 126: Wie soll denn DAS funktionieren?
        return;
    }
    if ( scratch3 != object2 ) {
        tableptr = data0x9405;
        temp = 0x01;

x92f4:
        scratch1 = *tableptr++;
        if ( scratch1 == object2 ) {
            goto x930e;
        }
        temp = temp + 0x01;
        if ( temp <= 0x07 ) {
            goto x92f4;
        }

x930e:
        if ( temp > 0x07 ) {
            pendingTextID = 0x17; // text ID 23 (0x0017), script $9314: B2 record 125: Also, DAMIT kann man ja nun wiklich nichts aufschlißen, oder?
            return;
        }
        pendingTextID = 0x6a; // text ID 106 (0x006a), script $931c: B2 record 208: Mist! Entschuldige bitte, aber das hier scheint einfach nicht der richtige Schlüssel zu sein - er paßt leider nicht.
        return;
    } else {
        if ( scratch3 == object2 ) {
            if ( objectState[object1] > 0x00 ) {
                pendingTextID = 0x69; // text ID 105 (0x0069), script $9330: B2 record 207: Das ist aber doch schon längst entriegelt!
                return;
            } else {
                if ( objectState[object1] == 0x00 ) {
                    objectState[object1] = 0x02;
                    pendingTextID = 0x16; // text ID 22 (0x0016), script $9344: B2 record 124: Okay, aufgeschlossen.
                    if ( object1 == FRIEDHOFSTOR1 ) {
                        score = score + remainingPoints[0x41];
                        remainingPoints[0x41] = 0x00;
                        objectState[FRIEDHOFSTOR2] = 0x02;
                    } else {
                        if ( object1 == FRIEDHOFSTOR2 ) {
                            objectState[FRIEDHOFSTOR1] = 0x02;
                        }
                    }
                }
            }
        }
    }

x9373:
    return;
}
