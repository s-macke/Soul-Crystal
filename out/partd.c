#include"src/tables.h"

unsigned char data0x8fbe[] = {0x03, 0x05, 0x11, 0x14, 0x15, 0x16, 0x17, 0x1f, 0x20, 0x22, 0x24, 0x2d, 0x3b, 0x3e, 0x47, 0x4b, 0x4d, 0x50, 0x52, 0x54, 0x5c, 0x64, 0x65, 0x68, 0x6b, 0x6c, 0x6e, 0x71, 0x75, 0x78, 0x7d, 0x7e, 0x7f, 0x85, 0x8e, 0x8f, 0x93, 0x94, 0x97, 0x99};

unsigned char data0x8fe6[] = {0x05, 0x07, 0x00, 0x06, 0x03, 0x54, 0x17, 0x07, 0x00, 0x1e, 0x00, 0x00, 0x2d, 0x07, 0x00, 0x30, 0x01, 0x05, 0x31, 0x02, 0x01, 0x32, 0x02, 0x13, 0x33, 0x07, 0x00, 0x35, 0x07, 0x00, 0x40, 0x01, 0x16, 0x41, 0x01, 0x2b, 0x42, 0x02, 0x26, 0x51, 0x01, 0x31, 0x57, 0x01, 0x51, 0x58, 0x02, 0x4f, 0x5a, 0x04, 0x11, 0x63, 0x01, 0x13, 0x6f, 0x01, 0x43, 0x70, 0x02, 0x41, 0x76, 0x00, 0x00, 0x77, 0x07, 0x00, 0x8b, 0x02, 0x21, 0x8c, 0x04, 0x50, 0x8d, 0x03, 0x4f, 0x9a, 0x07, 0x00, 0xa0, 0x03, 0x10};

unsigned char data0x9037[] = {0x10, 0x11, 0x30, 0x75, 0x31, 0x75, 0x41, 0x3b, 0x42, 0x3b, 0x51, 0x52, 0x57, 0x99, 0x58, 0x99, 0x6f, 0x54, 0x8b, 0x52, 0x8c, 0x4b, 0x8d, 0x4b};

unsigned char data0x904f[] = {0x11, 0x3b, 0x4b, 0x52, 0x54, 0x75, 0x99};

unsigned char data0x9056[] = {0xa3, 0x00, 0x52, 0x00, 0x4a, 0x00, 0x97, 0x00, 0x62, 0x00, 0x98, 0x00, 0x37, 0x00, 0x2a, 0x01, 0x5b, 0x00, 0x2d, 0x01, 0x1a, 0x00, 0x29, 0x01, 0x61, 0x00, 0x2e, 0x01, 0x7a, 0x00, 0x2f, 0x01, 0x3a, 0x00, 0x2b, 0x01, 0x4f, 0x00, 0x2c, 0x01, 0x4c, 0x00, 0x2c, 0x01, 0x83, 0x00, 0x2c, 0x01, 0x36, 0x00, 0x83, 0x01, 0xa2, 0x00, 0x31, 0x01, 0xa5, 0x00, 0x84, 0x01, 0x01, 0x00, 0x19, 0x02, 0x25, 0x00, 0x1a, 0x02, 0x38, 0x00, 0x1b, 0x02, 0x60, 0x00, 0x1c, 0x02, 0x84, 0x00, 0x1d, 0x02, 0xa4, 0x00, 0x1e, 0x02};

unsigned char data0x90aa[] = {0x4a, 0x00, 0x7c, 0x00, 0x02, 0x00, 0xe8, 0x00, 0x4f, 0x00, 0xeb, 0x00, 0x4c, 0x00, 0xeb, 0x00, 0xa5, 0x00, 0x7a, 0x01, 0x01, 0x00, 0xc7, 0x01, 0x60, 0x00, 0xce, 0x01};

unsigned char data0x90c6[] = {0x36, 0x00, 0x5b, 0x00, 0x37, 0x00, 0x38, 0x01, 0x5b, 0x00, 0x41, 0x01, 0x02, 0x00, 0x34, 0x01, 0x4c, 0x00, 0x5a, 0x00, 0x4f, 0x00, 0x5a, 0x00, 0x60, 0x00, 0x5a, 0x00, 0x83, 0x00, 0x5a, 0x00, 0x84, 0x00, 0x5a, 0x00, 0x85, 0x00, 0x5a, 0x00, 0x9f, 0x00, 0x5a, 0x00, 0xa5, 0x00, 0x5a, 0x00, 0x01, 0x00, 0x2a, 0x02, 0x25, 0x00, 0x2b, 0x02, 0xa4, 0x00, 0x2d, 0x02, 0xff};

void PartD_HandleUebersoulcrystal(); // Part D, script $79be; command 1 (UEBERSOULCRYSTAL), SELECT $7715 case 1
void PartD_HandleKurztext(); // Part D, script $79c3; command 2 (KURZTEXT), SELECT $7715 case 2
void PartD_HandleCredits(); // Part D, script $79d7; command 3 (CREDITS), SELECT $7715 case 3
void PartD_HandleGrabe(); // Part D, script $79dc; command 4 (GRABE), SELECT $7715 case 4
void PartD_HandleHinunter(); // Part D, script $79e1; command 5 (HINUNTER), SELECT $7715 case 5
void PartD_HandleOst(); // Part D, script $7a10; command 6 (OST), SELECT $7715 case 6
void PartD_HandleAusgaenge(); // Part D, script $7a7b; command 7 (AUSGAENGE), SELECT $7715 case 7
void PartD_HandleDisketteinstallieren(); // Part D, script $7a7f; command 8 (DISKETTEINSTALLIEREN), SELECT $7715 case 8
void PartD_HandleInventar(); // Part D, script $7a83; command 9 (INVENTAR), SELECT $7715 case 9
void PartD_HandleSchau(); // Part D, script $7a87; command 10 (SCHAU), SELECT $7715 case 10
void PartD_HandleNord(); // Part D, script $7a8e; command 11 (NORD), SELECT $7715 case 11
void PartD_HandleSpielende(); // Part D, script $7aed; command 12 (SPIELENDE), SELECT $7715 case 12
void PartD_HandleNeustart(); // Part D, script $7af1; command 13 (NEUSTART), SELECT $7715 case 13
void PartD_HandleLaden(); // Part D, script $7af5; command 14 (LADEN), SELECT $774d case 1
void PartD_HandlePunkte(); // Part D, script $7af9; command 15 (PUNKTE), SELECT $774d case 2
void PartD_HandleLoesung(); // Part D, script $7afe; command 16 (LOESUNG), SELECT $774d case 3
void PartD_HandleMusikein(); // Part D, script $7b02; command 17 (MUSIKEIN), SELECT $774d case 4
void PartD_HandleAusgaenge12(); // Part D, script $7b0a; command 18 (AUSGAENGE12), SELECT $774d case 5
void PartD_HandleSued(); // Part D, script $7b12; command 19 (SUED), SELECT $774d case 6
void PartD_HandleSpeichern(); // Part D, script $7bdc; command 20 (SPEICHERN), SELECT $774d case 7
void PartD_HandleHinauf(); // Part D, script $7be0; command 21 (HINAUF), SELECT $774d case 8
void PartD_HandleAusfuehrlich(); // Part D, script $7c0f; command 22 (AUSFUEHRLICH), SELECT $774d case 9
void PartD_HandleWarte(); // Part D, script $7c23; command 23 (WARTE), SELECT $774d case 10
void PartD_HandleWest(); // Part D, script $7c28; command 24 (WEST), SELECT $774d case 11
void PartD_Sub_7d6d(); // Part D, script $7d6d; command 25 (NIX1), SELECT $774d case 12
void PartD_Sub_7d6e(); // Part D, script $7d6e; command 26 (NIX2), SELECT $774d case 13
void PartD_HandleSchliesse(); // Part D, script $7d6f; command 27 (SCHLIESSE), SELECT $7785 case 1
void PartD_HandleZerstoere(); // Part D, script $7ea6; command 28 (ZERSTOERE), SELECT $7785 case 2
void PartD_HandleVerliere(); // Part D, script $7fea; command 29 (VERLIERE), SELECT $7785 case 3
void PartD_HandleBetritt(); // Part D, script $807a; command 30 (BETRITT), SELECT $7785 case 4
void PartD_HandleBetrachte(); // Part D, script $817b; command 31 (BETRACHTE), SELECT $7785 case 5
void PartD_HandleHilf(); // Part D, script $84fe; command 32 (HILF), SELECT $7785 case 6
void PartD_HandleVerlasse(); // Part D, script $8530; command 33 (VERLASSE), SELECT $7785 case 7
void PartD_HandleBewege(); // Part D, script $857e; command 34 (BEWEGE), SELECT $7785 case 8
void PartD_HandleOeffne(); // Part D, script $86ab; command 35 (OEFFNE), SELECT $7785 case 9
void PartD_HandleZiehe(); // Part D, script $881e; command 36 (ZIEHE), SELECT $7785 case 10
void PartD_HandleDruecke(); // Part D, script $884b; command 37 (DRUECKE), SELECT $7785 case 11
void PartD_HandleNimm(); // Part D, script $886c; command 38 (NIMM), SELECT $77b7 case 1
void PartD_HandleSprich(); // Part D, script $893b; command 39 (SPRICH), SELECT $77b7 case 2
void PartD_HandleWende(); // Part D, script $8993; command 40 (WENDE), SELECT $77b7 case 3
void PartD_HandleBefestige(); // Part D, script $8d41; command 41 (BEFESTIGE), SELECT $77b7 case 4
void PartD_HandleGib(); // Part D, script $8d83; command 42 (GIB), SELECT $77b7 case 5
void PartD_HandleVerriegele(); // Part D, script $8dd2; command 43 (VERRIEGELE), SELECT $77b7 case 6
void PartD_HandleEntriegele(); // Part D, script $8eaa; command 44 (ENTRIEGELE), SELECT $77b7 case 7

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
                pendingTextID = 0x2e; // text ID 46 (0x002e), script $7632: C2 record 148: Du erwartest doch nicht allen Ernstes von mir, daß ich diesen Ort NACKT verlasse, oder?
                goto x77ce;
            } else {
                SPECIAL(0x65);
                if ( temp == 0x01 ) {
                    objectState[DAVE] = 0x64;
                }
            }
        }
        if ( currentRoom == AM_UFER_EINES_UNTERIRDISCHEN_SEES && objectState[BOOTSSCHLUESSEL] == 0x01 && command != OST ) {
            pendingTextID = 0x1a; // text ID 26 (0x001a), script $765e: C2 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
            return;
        } else {
            if ( currentRoom == AUF_EINER_KLEINEN_INSEL && objectState[BOOTSSCHLUESSEL] == 0x01 && command != WEST ) {
                pendingTextID = 0x1a; // text ID 26 (0x001a), script $7678: C2 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
                return;
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
                    } else {
                        if ( diskSide == 0x04 ) {
                            SPECIAL(0x6a);
                            if ( temp == 0x01 ) {
                                objectState[DAVE] = objectState[DAVE] - 0x01;
                            } else {
                                objectState[DAVE] = 0x64;
                            }
                        }
                    }
                }
            }
            if ( objectState[DAVE] == 0x4b || objectState[DAVE] == 0x32 || objectState[DAVE] == 0x19 ) {
                pendingTextID = 0x30; // text ID 48 (0x0030), script $76e3: C2 record 150: Langsam fange ich an zu frieren! Es wird immer kälter hier, also sieh Dich langsam mal nach einem warmen Plätzchen um, wo wir in Ruhe die Nacht verbringen können!
                showtext();
                Restart();
                pendingTextID = 0x00; // text ID 0 (0x0000), script $76e9: no text
                goto x7715;
            } else {
                if ( objectState[DAVE] <= 0x00 ) {
                    imageID = 0x81;
                    objectLocation[DAVE] = 0xff;
                    ShowImage();
                    pendingTextID = 0x31; // text ID 49 (0x0031), script $7704: C2 record 151: Also, halte mir jetzt bitte nicht vor, daß ich Dich nicht gewarnt hätte - Du hast wirklich genug Zeit gehabt, um nach jemandem zu suchen, der Dir wärmere Kleidung hätte geben können - doch nun ist es endgültig zu spät: Du erfrierst, ohne auch nur die geringste Chance gehabt zu haben, das Spiel zu lösen! Schade eigentlich...
                    showtext();
                    Restart();
                    pendingTextID = 0x00; // text ID 0 (0x0000), script $770a: no text
                    return;
                }
            }
        }
    }

x7715:
    switch(command) { // SELECT script $7715; original cases are 1-based
         case 1: PartD_HandleUebersoulcrystal(); break;
         case 2: PartD_HandleKurztext(); break;
         case 3: PartD_HandleCredits(); break;
         case 4: PartD_HandleGrabe(); break;
         case 5: PartD_HandleHinunter(); break;
         case 6: PartD_HandleOst(); break;
         case 7: PartD_HandleAusgaenge(); break;
         case 8: PartD_HandleDisketteinstallieren(); break;
         case 9: PartD_HandleInventar(); break;
         case 10: PartD_HandleSchau(); break;
         case 11: PartD_HandleNord(); break;
         case 12: PartD_HandleSpielende(); break;
         case 13: PartD_HandleNeustart(); break;
    }
    if ( pendingTextID != 0x00 ) {
        goto x77ce;
    }
    temp = command - NEUSTART;
    switch(temp) { // SELECT script $774d; original cases are 1-based
         case 1: PartD_HandleLaden(); break;
         case 2: PartD_HandlePunkte(); break;
         case 3: PartD_HandleLoesung(); break;
         case 4: PartD_HandleMusikein(); break;
         case 5: PartD_HandleAusgaenge12(); break;
         case 6: PartD_HandleSued(); break;
         case 7: PartD_HandleSpeichern(); break;
         case 8: PartD_HandleHinauf(); break;
         case 9: PartD_HandleAusfuehrlich(); break;
         case 10: PartD_HandleWarte(); break;
         case 11: PartD_HandleWest(); break;
         case 12: PartD_Sub_7d6d(); break;
         case 13: PartD_Sub_7d6e(); break;
    }
    if ( pendingTextID != 0x00 ) {
        goto x77ce;
    }
    temp = command - NIX2;
    switch(temp) { // SELECT script $7785; original cases are 1-based
         case 1: PartD_HandleSchliesse(); break;
         case 2: PartD_HandleZerstoere(); break;
         case 3: PartD_HandleVerliere(); break;
         case 4: PartD_HandleBetritt(); break;
         case 5: PartD_HandleBetrachte(); break;
         case 6: PartD_HandleHilf(); break;
         case 7: PartD_HandleVerlasse(); break;
         case 8: PartD_HandleBewege(); break;
         case 9: PartD_HandleOeffne(); break;
         case 10: PartD_HandleZiehe(); break;
         case 11: PartD_HandleDruecke(); break;
    }
    if ( pendingTextID != 0x00 ) {
        goto x77ce;
    }
    temp = command - DRUECKE;
    switch(temp) { // SELECT script $77b7; original cases are 1-based
         case 1: PartD_HandleNimm(); break;
         case 2: PartD_HandleSprich(); break;
         case 3: PartD_HandleWende(); break;
         case 4: PartD_HandleBefestige(); break;
         case 5: PartD_HandleGib(); break;
         case 6: PartD_HandleVerriegele(); break;
         case 7: PartD_HandleEntriegele(); break;
    }

x77ce:
    if ( objectLocation[DAVE] != 0xff ) {
        if ( diskSide == 0x02 ) {
        }
        if ( diskSide == 0x03 ) {
        }
        if ( diskSide == 0x04 ) {
            if ( objectLocation[KRONE] == 0xff && score >= 0x0a ) {
                score = score - 0x0a;
            }
            if ( objectState[RATTEN] > 0x00 && objectState[RATTEN] <= 0x06 ) {
                objectState[RATTEN] = objectState[RATTEN] + 0x01;
            }
            if ( objectState[RATTEN] >= 0x07 && currentRoom == IN_DER_SCHLOSSKUECHE && objectLocation[RATTEN] == IN_DER_SCHLOSSKUECHE ) {
                if ( pendingTextID != 0x00 ) {
                    showtext();
                    Restart();
                }
                objectLocation[DAVE] = 0xff;
                imageID = 0x84;
                ShowImage();
                pendingTextID = 0x01b6; // text ID 438 (0x01b6), script $783e: C2 record 249: Es sieht so aus, als hätten die Ratten nicht ganz so viel Zeit zu verschwenden wie Du, denn es ist Abendbrotzeit, und die fetten Bestien scheinen das genau zu wissen: Wie auf ein Zeichen hin springen sie Dich alle zugleich an! Du kannst Dich der hartnäckigen Attacken der kleinen Biester kaum erwehren und wirst zu Boden gerissen, wo Du machtlos mitansehen mußt, wie Du zu einem schmackhaften Rattenmahl verarbeitet wirst! Tja: Es ist wiklich ein ziemlich übles Gefühl, bei lebendigem Leibe ein Auge aus dem Kopf gerissen zu bekommen: Der Schmerz macht Dich fast wahnsinnig! Doch gerade, als Du den Mund öffnest, um laut loszubrüllen, springt eine Ratte auf Dein Gesicht, tanzt dort zu heißen, rituellen Rhythmen - und reißt Dir während einer Pirouette zu einem ekstatisch und temperamentvoll ausgestoßenen "Ouh!" schwungvoll die Zunge aus, so daß Dein Schrei von einem warmen Schwall Deines eigenen Blutes zu einem gurgelnden Röcheln abgedämpft wird! Keine Sorge: Du wirst schon nicht daran ersticken! Denn mit Deinem verbleibenden Auge kannst Du bereits eine dritte Ratte neugierig an Deiner Halsschlagader schnuppern sehen, bevor sie sie schließlich mit einem einzigen, herzhaften Biß ihrer messerscharfen Schneidezähne durchtrennt und Dich von Deinen Qualen erlöst...
                showtext();
                Restart();
                return;
            }
            if ( currentRoom == IN_EINEM_FINSTEREN_GRUFTGEWOELBE && objectState[DRUDENFUSS2] == 0x01 && objectState[SAERGE] == 0x02 ) {
                objectState[DRUDENFUSS2] = 0x00;
                return;
            } else {
                if ( currentRoom == IN_EINEM_FINSTEREN_GRUFTGEWOELBE && objectState[DRUDENFUSS2] == 0x01 && objectState[SAERGE] == 0x01 ) {
                    if ( pendingTextID != 0x00 ) {
                        showtext();
                        Restart();
                    }
                    objectLocation[DAVE] = 0xff;
                    imageID = 0x8b;
                    ShowImage();
                    pendingTextID = 0x01b7; // text ID 439 (0x01b7), script $788f: C2 record 250: Es war ein blöder Fehler, noch einmal hierherzukommen - ganz gleich, unter welchen Umständen: Zwei riesenhafte, verrottende Mumien warten bereits auf Dich... Allerdings: Irgendwie scheinen unsere beiden Vermummungskünstler doch ein wenig infantil veranlagt zu sein, denn offensichtlich wollen sie vor Deinem Tod noch eine Runde Tauziehen mit Dir spielen! In der verzweifelten Hoffnung, während des Wettkampfes vielleicht doch noch eine Gelegenheit zur Flucht zu erhalten, willigst Du kurzerhand in ein Match ein - bis Dir unmißverständlich klargemacht wird, daß Du nicht als Athlet, sondern als SEIL an dem Spiel teilnehmen sollst! Tja, also Wettkampfqualität besaß Dein Körper nicht gerade, denn er reißt schon nach zwei Runden verbissenen Hin- und Herzerrens, so daß es von nun an wohl zwei Hälften von Dir geben wird, aus denen Deine geplatzten Eingeweide herausquellen und den schönen, sauberen Fußboden mit Blut und Galle besudeln...
                    showtext();
                    Restart();
                    return;
                }
            }
            if ( currentRoom == IN_ZARGONS_MYSTERIUM ) {
                if ( objectState[ZARGON] > 0x00 && objectState[ZARGON] < 0x04 && objectLocation[ZARGON] == currentRoom ) {
                    objectState[ZARGON] = objectState[ZARGON] + 0x01;
                }
                if ( objectState[PURPURFEUER] == 0x00 && objectState[DRUDENFUSS1] == 0x00 ) {
                    if ( pendingTextID != 0x00 ) {
                        showtext();
                        Restart();
                    }
                    pendingTextID = 0x01ba; // text ID 442 (0x01ba), script $78d8: C2 record 253: Also, wenn Du wirklich meinst, daß Zargon sich fürchten müßte, wenn Du in seine Geheimkammern eindringst, dann hast Du Dich aber ganz gewaltig geschnitten! Im Gegenteil: Seelenruhig führt er erst einmal seine Unterredung mit einem der Dämonenfürsten zu Ende und wendet sich dann erst Dir zu. "Raus hier, aber dalli!", schreit er Dich an, nachdem er Dich ein paar Sekunden lang abschätzend gemustert hat, "Glaubst Du etwa, ich ließe Dich hier stundenlang in meinem Schloß herumlaufen, bloß um Dich hinterher so mir nichts, Dir nichts, einfach abzuschlachten, ohne mich zuvor ein wenig mit Dir amüsieren zu können? Du hast doch überhaupt noch keine Chance, mich zu besiegen - also verschwinde endlich und bereite Dich gefälligst etwas besser auf unseren Kampf vor! Schließlich will auch ich meinen Spaß haben! Man gönnt sich ja sonst nichts..." Mit diesen Worten schiebt er Dich ärgerlich zur Tür hinaus und schließt sie hinter sich. Von draußen kannst Du ihn noch undeutlich murmeln hören: "Diese jungen Narren! Haben nicht die geringste Ahnung, aber wollen immer gleich mit dem Kopf durch die Wand! Was glaubt dieser Spinner wohl, wie er jemals einen Platz in der Highscoreliste ergattern könnte? Ich glaube, ich muß wirklich mal ein ernstes Wörtchen mit Chris und Kai reden: Schlimm genug, mich in solch ein schwachsinniges Spiel zu stecken, aber mir dann noch solche Weicheier vorbeizuschicken - das geht nun wirklich zu weit! Ich sollte mich wirklich beim Verband gegen Nichtspielercharakter-Quälerei beschweren..."
                    showtext();
                    Restart();
                    PartD_HandleWest();
                    return;
                } else {
                    if ( objectState[PURPURFEUER] == 0x00 && objectState[DRUDENFUSS1] == 0x01 ) {
                        if ( pendingTextID != 0x00 ) {
                            showtext();
                            Restart();
                        }
                        objectLocation[DAVE] = 0xff;
                        imageID = 0x88;
                        ShowImage();
                        pendingTextID = 0x01b8; // text ID 440 (0x01b8), script $7909: C2 record 251: Als Du Dich in der Mitte des weißen Pentagramms in Zargons Mysterium wieder materialisierst, erhebt sich der alte Hexer verwundert aus seinem hohen Sessel. "Warum mußtest Du denn schon so früh kommen?", schnarrt er mit einer Spur von Enttäuschung in seiner Stimme, "Ich habe im Moment überhaupt keine Zeit, mich um Dich zu kümmern - leider...!" Mit einer nebensächlich anmutenden Bewegung seiner rechten Hand läßt er wie aus dem Nichts einen riesigen Feuerball in der Luft entstehen und schleudert ihn direkt auf Dich zu! Das letzte, woran Du in der Dir verbleibenden Zeit noch denken kannst, ist die extreme Energieverschwendung Zargons - denn ein kleiner, dezenter Blitz hätte es ja wohl auch schon getan! Dann wird es plötzlich sehr hell - und sehr heiß! Ein kleines Häuflein rauchender Asche ist schließlich alles, was noch von Deinem Körper übrigbleibt...
                        showtext();
                        Restart();
                        return;
                    } else {
                        if ( objectState[PURPURFEUER] == 0x01 && objectState[SAERGE] == 0x01 ) {
                            if ( pendingTextID != 0x00 ) {
                                showtext();
                                Restart();
                            }
                            objectLocation[DAVE] = 0xff;
                            imageID = 0x89;
                            ShowImage();
                            pendingTextID = 0x01b9; // text ID 441 (0x01b9), script $7937: C2 record 252: Als Zargon Dich inmitten seines weißen Kreidepentagramms auftauchen sieht, steht er auf und erhebt sich zu seiner vollen Größe: "Warum konntest Du nicht warten?", schnarrt er enttäuscht, "Ich habe im Moment absolut keine Zeit für Dich - leider..." Mit einer leichten Bewegung seiner rechten Hand versucht er, einen Feuerball herbeizubeschwören, doch alles, was Du erkennen kannst, ist eine kleine Flamme, die ihm die Handflächen versengt! Als Du schadenfroh loskicherst, schreit der Hexenmeister voller Schmerz: "Verdammt! Aber noch hast Du nicht gewonnnenn!" Er klatscht kurz in die Hände ("Say hooo!"), und ein paar Sekunden später materialisieren sich zwei hühnenhafte, häßliche Mumien in dem Pentagramm neben Dir. Völlig entgeistert und zu keiner Gegenwehr fähig, bereitest Du ihnen nicht die geringsten Probleme: Kräftige Klauen greifen nach Deiner Kehle, und kurz darauf hörst Dein Genick mit einem kurzen, aber lauten "Krack!" brechen! "Gott sei Dank!", denkst Du noch erleichtert, "Ich hatte schon befürchtet, sie würden mich erwürgen!" Während Deine Seele in die Ewigen Jagdgründe entfleucht, kannst Du noch mit ansehen, wie Dein Kopf brutal vom Rumpf gerissen und auf den Boden geschmettert wird, wo nun Deine Hirnmasse zähflüssig über die Steinplatten quillt, bis Zargon sie wegwischen lassen wird...
                            showtext();
                            Restart();
                            return;
                        } else {
                            if ( objectState[SAERGE] == 0x02 && objectState[PURPURFEUER] == 0x01 && objectState[ZARGON] == 0x00 ) {
                                if ( pendingTextID != 0x00 ) {
                                    showtext();
                                    Restart();
                                }
                                objectState[ZARGON] = 0x01;
                                pendingTextID = 0x01bb; // text ID 443 (0x01bb), script $7967: C2 record 254: Als Zargon Deine Anwesenheit bemerkt, dreht er sich langsam zu Dir um: Du glaubst Deinen Augen nicht trauen zu können, als Du in seinen Augen einen leichten Schimmer von Furcht erkennst! "Nun gut, Du hast Deine Aufgabe erfüllt - nun ist es an mir, zu tun, was getan werden muß...!", keucht er und zieht einen kleinen, silbernen Dolch unter seinem Cape hervor!
                                return;
                            }
                        }
                    }
                }
                if ( objectState[ZARGON] >= 0x04 ) {
                    if ( pendingTextID != 0x00 ) {
                        showtext();
                        Restart();
                    }
                    objectLocation[DAVE] = 0xff;
                    imageID = 0x8a;
                    ShowImage();
                    pendingTextID = 0x01c6; // text ID 454 (0x01c6), script $798f: C2 record 265: Tätärätäää! Und wieder eine Situation, in der unser Kandidat Dave Parker sich ein wenig zuviel Zeit nehmen zu können glaubte! Als Zargon Deinen verzweifelt suchenden Blick nach einer wirksamen Waffe gegen ihn und seine magischen Kräfte bemerkt, nimmt er seine Chance wahr und sticht Dich mit seinem kleinen, geweihten Silberdolch ab! Das letzte, was Du noch erkennen kannst, als Du zwischen seinen Beinen alle Viere von Dir streckst, ist die Sohle seines Stiefels, die sich langsam Deinem Gesicht nähert...
                    showtext();
                    Restart();
                    return;
                }
            }
        }
    }
    if ( command != INVENTAR && command != AUSGAENGE && command != LADEN && command != SPEICHERN && command != DISKETTEINSTALLIEREN ) {
        steps = steps + 0x01;
    }

x79bd:
    return;
}


void PartD_HandleUebersoulcrystal() { // Part D, script $79be; command 1 (UEBERSOULCRYSTAL), SELECT $7715 case 1
    pendingTextID = 0x1b; // text ID 27 (0x001b), script $79be: C2 record 129: "Soul Crystal" V1.5, written from 1989 to 1992 by Avantgardistic Arts. (C) 1992 by Avantgardistic Arts, Hannover & Starbyte Software, Bochum. Dieses Adventure besitzt 103 Locations, mehr als 130 hochauflösende Farbgrafiken, ungefähr 320 KBytes Text und einen ca. 30-minütigen Soundtrack. Seine Programmentwicklung hat ingesamt 16 sog. "Mann-Jahre" in Anspruch genommen. Sei also bitte so fair und "spread the word - not the disk!" Sollte dies aber doch eine Raubkopie sein (obwohl das Programm geschützt war, und das bestimmt nicht ganz ohne Grund...), dann denke bitte auch mal über die ASDG-Philosophie "A program worth using is a program worth buying" nach - allein schon die Originalverpackung sowie die Handbücher sollten Dir das Geld wert sein. Viel Spaß beim Spielen von "Soul Crystal", und - ach ja: Soweit wir wissen, ist dies das erste Adventure, in das ein CHEATMODE implementiert wurde - also solltest Du Dir Mühe geben, ihn zu finden...
    return;
}


void PartD_HandleKurztext() { // Part D, script $79c3; command 2 (KURZTEXT), SELECT $7715 case 2
    if ( visited[RAUM_NULL] == 0x01 ) {
        visited[RAUM_NULL] = 0x00;
    }
    pendingTextID = 0x25; // text ID 37 (0x0025), script $79d2: C2 record 139: "Kurzbeschreibungen" aktiviert. Die Beschreibungen der einzelnen Räume werden jetzt nur noch beim erstmaligen Betreten ausgegeben.
    return;
}


void PartD_HandleCredits() { // Part D, script $79d7; command 3 (CREDITS), SELECT $7715 case 3
    pendingTextID = 0x1c; // text ID 28 (0x001c), script $79d7: C2 record 130: "Soul Crystal", V1.5, written from 1989 to 1992 by Avantgardistic Arts, (C) 1992 by Avantgardistic Arts, Hannover & Starbyte Software, Bochum. A.C.A sind: Chris Link (Spielkonzept, Gamedesign, Tools, Texte, Soundtrack und Effekte), Kai Schulze (Spielkonzept, Gamedesign, Intro- und Parser-Programmierung AMIGA, Tools), Michael Niemeyer (Intro-Programmierung C-64, Tools), Carsten Jendro (Kernal- und Parserprogrammierung C-64), Henrik Fisch (Kernal- und Introprogrammierung MS-DOS), Kjersten Waldheim (Parserprogrammierung MS-DOS), Oliver Brühl (Grafiken und Animationen AMIGA & MS-DOS) und Klaus Adamovsky (Graphiken C-64). Besonderer Dank gilt Johnny, der "bayrischen Forelle" - stellvertretend für all die Leute, die mitgeholfen haben, "Soul Crystal" zu dem zu machen, was Ihr jetzt in den Händen haltet, indem sie uns Unmengen wertvoller Tips, Hinweise und Denkanstöße gaben, und uns nach jedem Nervenzusammenbruch auf's Neue halfen, uns weiter an die Verwirklichung unserer größenwahnsinnigen Ideen zu setzen. Ohne sie wäre das Projekt "Soul Crystal" wahrscheinlich niemals über die Planungsphase hinausgekommen.
    return;
}


void PartD_HandleGrabe() { // Part D, script $79dc; command 4 (GRABE), SELECT $7715 case 4
    pendingTextID = 0x33; // text ID 51 (0x0033), script $79dc: C2 record 153: Also, jetzt reicht's ja wohl! Als ob es nicht schon reichen würde, daß Du blind wie ein Maulwurf durch die Gegend rennst: Jetzt versuchst Du Dich auch noch artgerecht durchs Erdreich zu buddeln! Mal ganz ehrlich: Man kann es mit der Realitätstreue in Adventures auch übertreiben...
    return;
}


void PartD_HandleHinunter() { // Part D, script $79e1; command 5 (HINUNTER), SELECT $7715 case 5
    imageID = 0xff;
    if ( down[currentRoom] != 0x00 ) {
        currentRoom = down[currentRoom];
        objectLocation[DAVE] = currentRoom;
        Code2E5B();
        imageID = currentRoom;
    } else {
        if ( down[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7a01: C2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartD_HandleOst() { // Part D, script $7a10; command 6 (OST), SELECT $7715 case 6
    imageID = 0xff;
    if ( currentRoom == AM_UFER_EINES_UNTERIRDISCHEN_SEES ) {
        if ( objectState[BOOTSSCHLUESSEL] == 0x00 || objectState[KAHN] != 0x02 ) {
            pendingTextID = 0x1a; // text ID 26 (0x001a), script $7a29: C2 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
            goto x7a72;
        } else {
            if ( objectState[BOOTSSCHLUESSEL] == 0x01 && objectState[KAHN] == 0x02 ) {
                pendingTextID = 0x01c4; // text ID 452 (0x01c4), script $7a40: C2 record 263: Du stößt das kleine Boot vom Ufer ab und ruderst zu der kleinen Insel im Osten hinüber.
                showtext();
                Restart();
                objectLocation[KAHN] = AUF_EINER_KLEINEN_INSEL;
            }
        }
    }
    if ( east[currentRoom] != 0x00 ) {
        currentRoom = east[currentRoom];
        objectLocation[DAVE] = currentRoom;
        Code2E5B();
        imageID = currentRoom;
    } else {
        if ( east[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7a6c: C2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }

x7a72:
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartD_HandleAusgaenge() { // Part D, script $7a7b; command 7 (AUSGAENGE), SELECT $7715 case 7
    SPECIAL(0x08); // Ausgaenge listen
    return;
}


void PartD_HandleDisketteinstallieren() { // Part D, script $7a7f; command 8 (DISKETTEINSTALLIEREN), SELECT $7715 case 8
    SPECIAL(0x09); // Diskette installieren
    return;
}


void PartD_HandleInventar() { // Part D, script $7a83; command 9 (INVENTAR), SELECT $7715 case 9
    SPECIAL(0x0a); // Inventar anzeigen
    return;
}


void PartD_HandleSchau() { // Part D, script $7a87; command 10 (SCHAU), SELECT $7715 case 10
    visited[currentRoom] = 0x00;
    Code2E5B();
    return;
}


void PartD_HandleNord() { // Part D, script $7a8e; command 11 (NORD), SELECT $7715 case 11
    imageID = 0xff;
    if ( north[currentRoom] != 0x00 ) {
        currentRoom = north[currentRoom];
        Code2E5B();
        objectLocation[DAVE] = currentRoom;
        imageID = currentRoom;
    } else {
        if ( north[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7aae: C2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    temp = 0x01;

x7ab8:
    temp = temp + 0x01;
    if ( temp <= 0xa5 ) {
        goto x7ab8;
    }
    if ( currentRoom == AUF_EINER_KLEINEN_INSEL && objectLocation[KAHN] == 0x69 ) {
        ShowImage();
        showtext();
        Restart();
        pendingTextID = 0x01cf; // text ID 463 (0x01cf), script $7ad7: C2 record 274: Unglücklicherweise ist Dein Boot während Deiner Abwesenheit weggetrieben: Nun treibt es herrenlos in der Mitte des kleinen Sees, so daß es Dir wohl unmöglich sein dürfte, es von hier aus zu erreichen. Leider haben wir auch "vergessen", ein "Schwimm"-Gadget in SOUL CRYSTALs Benutzeroberfläche zu integrieren: Schließlich muß Dummheit ja auch irgendwie bestraft werden! Beim nächsten Mal vertauen wir unser Boot also einfach etwas sorgfältiger am Landesteg, ja? Immerhin haben wir das Ding ja nicht nur aus Spaß an der Freude eingebaut...
        imageID = 0xff;
        goto x7ae4;
    }

x7ae4:
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartD_HandleSpielende() { // Part D, script $7aed; command 12 (SPIELENDE), SELECT $7715 case 12
    SPECIAL(0x05); // Spielende
    return;
}


void PartD_HandleNeustart() { // Part D, script $7af1; command 13 (NEUSTART), SELECT $7715 case 13
    SPECIAL(0x04); // Neustart
    return;
}


void PartD_HandleLaden() { // Part D, script $7af5; command 14 (LADEN), SELECT $774d case 1
    SPECIAL(0x02); // Laden
    return;
}


void PartD_HandlePunkte() { // Part D, script $7af9; command 15 (PUNKTE), SELECT $774d case 2
    pendingTextID = 0x01; // text ID 1 (0x0001), script $7af9: engine $5D94: Score message assembled by the engine.
    return;
}


void PartD_HandleLoesung() { // Part D, script $7afe; command 16 (LOESUNG), SELECT $774d case 3
    SPECIAL(0x06); // Loesung
    return;
}


void PartD_HandleMusikein() { // Part D, script $7b02; command 17 (MUSIKEIN), SELECT $774d case 4
    temp = 0x00;
    SPECIAL(0x07); // Musik ein
    return;
}


void PartD_HandleAusgaenge12() { // Part D, script $7b0a; command 18 (AUSGAENGE12), SELECT $774d case 5
    temp = 0x01;
    SPECIAL(0x08); // Ausgaenge listen
    return;
}


void PartD_HandleSued() { // Part D, script $7b12; command 19 (SUED), SELECT $774d case 6
    imageID = 0xff;
    if ( currentRoom == AUF_DEM_BURGHOF && objectState[PORTALTOR2] == 0x01 ) {
        if ( objectState[VERTRAG] != 0x63 ) {
            pendingTextID = 0x01c1; // text ID 449 (0x01c1), script $7b2b: C2 record 260: Eine starke, dunkle Aura hält Dich immer noch im Schloß gefangen! Ich glaube, Du hast da noch etwas vergessen...
            goto x7bd3;
        }
        pendingTextID = 0x0241; // text ID 577 (0x0241), script $7b34: C2 record 388: Tja, äh... Ich weiß gar nicht, wie ich es Dir beibringen soll, ohne Dir schon wieder auf die Nerven zu gehen, aber... Naja, ähem: Wir müßten noch ein letzes Mal Deine Zugriffsberechtigung für dieses Spiel überprüfen. Tut mir ja wirklich fürchterlich leid, aber dies scheint der einzige Weg zu sein, die Anzahl der Schwarzkopien in halbwegs erträglichen (?) Grenzen zu halten und damit sicherzustellen, daß unsere Programmierer das Geld bekommen, das sie sich mit ihrer Arbeit auch wirklich sauer verdient haben. Also bitte: Noch ein einziges Mal - diesmal allerdings aus dem Tagebuch des Turmwächters ("Variatio delectat!")...
        showtext();
        Restart();
        SPECIAL(0x32);
        if ( temp == 0xff ) {
            imageID = 0xff;
            goto x7bd3;
        }
        if ( objectState[WERWOLF] != 0x63 && objectState[VERTRAG] == 0x63 ) {
            objectLocation[DAVE] = 0xff;
            imageID = 0x8d;
            ShowImage();
            pendingTextID = 0x01c0; // text ID 448 (0x01c0), script $7b66: C2 record 259: Es war ein ziemlich dummer Fehler, das Schloß in Werwolfsgestalt zu verlassen: Als Du nämlich gerade das Portaltor passierst, überglücklich, Zargons Fluch entronnen zu sein, fühlst Du plötzlich einen brennenden Schmerz im Rücken: Es war dieser bescheuerte, alte Eremit, der heute auf Wolfsjagd gegangen ist! Langsam und zitternd vor Schmerzen drehst Du den Kopf auf die Seite und ziehst einen Speer aus Deinem Rücken - einen Speer mit versilberter Spitze! Du spürst, wie Du langsam schwächer und schwächer wirst, und während Du über Deinen völlig sinnlosen und unnötigen Tod nachsinnst, wird plötzlich alles dunkel - für immer...
            showtext();
            Restart();
            imageID = 0xff;
            goto x7bd3;
        } else {
            if ( objectState[WERWOLF] == 0x63 && objectState[VERTRAG] == 0x63 ) {
                score = score + 0x03e8;
                pendingTextID = 0x01bf; // text ID 447 (0x01bf), script $7b8a: C2 record 258: Du glaubst Deinen Augen nicht trauen zu können: Das Portaltor steht tatsächlich sperrangelweit offen! Unter dem Torbogen kannst Du den Geist König Richards schweben sehen, der Dir gütig und dankbar zuzulächeln scheint - und auch die Vögel zwitschern wieder von den Bäumen herab: Das ganze Land blüht wieder auf, zum ersten Mal seit langer, langer Zeit! Feierlich gehst Du auf Deinen neugewonnenen Freund zu und läßt die finsteren Burgmauern für immer hinter Dir - FREI...
                showtext();
                Restart();
                SPECIAL(0x33); // Gewonnen
            }
        }
    }
    if ( south[currentRoom] != 0x00 ) {
        currentRoom = south[currentRoom];
        Code2E5B();
        objectLocation[DAVE] = currentRoom;
        imageID = currentRoom;
    } else {
        if ( south[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7bb3: C2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    if ( currentRoom == IN_DER_SCHLOSSKUECHE ) {
        if ( objectLocation[RATTEN] == currentRoom ) {
            ShowImage();
            showtext();
            Restart();
            pendingTextID = 0x01b5; // text ID 437 (0x01b5), script $7bc9: C2 record 248: Als die Ratten Deine Anwesenheit bemerken, beginnen sie nervös - oder eher: HUNGRIG? - zu quieken! Besonders eine unter ihnen, ein häßliches, fettes Biest, schaut Dich aus heimtückisch funkelnden Äuglein an, während sie die Tür im Westen des Raumes blockiert...
            goto x7bd3;
        }
    }

x7bd3:
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartD_HandleSpeichern() { // Part D, script $7bdc; command 20 (SPEICHERN), SELECT $774d case 7
    SPECIAL(0x03); // Speichern
    return;
}


void PartD_HandleHinauf() { // Part D, script $7be0; command 21 (HINAUF), SELECT $774d case 8
    imageID = 0xff;
    if ( up[currentRoom] != 0x00 ) {
        currentRoom = up[currentRoom];
        Code2E5B();
        objectLocation[DAVE] = currentRoom;
        imageID = currentRoom;
    } else {
        if ( up[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7c00: C2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    if ( imageID != 0xff ) {
        ShowImage();
    }
    return;
}


void PartD_HandleAusfuehrlich() { // Part D, script $7c0f; command 22 (AUSFUEHRLICH), SELECT $774d case 9
    if ( visited[RAUM_NULL] == 0x00 ) {
        visited[RAUM_NULL] = 0x01;
    }
    pendingTextID = 0x24; // text ID 36 (0x0024), script $7c1e: C2 record 138: "Ausführliche Beschreibungen" aktiviert. Zu jedem Raum, den Du von nun an betrittst, wird die vollständige Beschreibung geliefert, ganz gleich, ob Du ihn schon betreten hast oder nicht.
    return;
}


void PartD_HandleWarte() { // Part D, script $7c23; command 23 (WARTE), SELECT $774d case 10
    pendingTextID = 0x36; // text ID 54 (0x0036), script $7c23: C2 record 156: Die Zeit verstreicht wie der Lauf der Sonne: Langsam, aber unaufhaltsam...
    return;
}


void PartD_HandleWest() { // Part D, script $7c28; command 24 (WEST), SELECT $774d case 11
    imageID = 0xff;
    if ( currentRoom == AUF_EINER_KLEINEN_INSEL ) {
        if ( objectState[BOOTSSCHLUESSEL] == 0x00 ) {
            pendingTextID = 0x1a; // text ID 26 (0x001a), script $7c3a: C2 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
            return;
        } else {
            if ( objectState[BOOTSSCHLUESSEL] == 0x01 ) {
                pendingTextID = 0x01c5; // text ID 453 (0x01c5), script $7c4a: C2 record 264: Du stößt das Boot vom Steg ab und setzt wieder zum westlichen Ufer des unterirdischen Sees über.
                showtext();
                Restart();
                objectLocation[KAHN] = AM_UFER_EINES_UNTERIRDISCHEN_SEES;
                objectState[KAHN] = 0x02;
            }
        }
    }
    if ( currentRoom == IN_DER_SCHLOSSKUECHE && objectLocation[RATTEN] == IN_DER_SCHLOSSKUECHE ) {
        objectLocation[DAVE] = 0xff;
        imageID = 0x84;
        ShowImage();
        pendingTextID = 0x01bd; // text ID 445 (0x01bd), script $7c78: C2 record 256: Die Ratten scheinen Deine Absicht, ihr Revier zu durchqueren, aber ganz und gar nicht gutzuheißen! Nichtsdestotrotz bist Du zum Abendessen herzlich willkommen - unglücklicherweise jedoch als Hauptgang...
        showtext();
        Restart();
        return;
    }
    if ( currentRoom == IN_DER_HOEHLE_DES_CUSATHS && objectState[PARFUEM] == 0x00 ) {
        objectLocation[DAVE] = 0xff;
        pendingTextID = 0x01c3; // text ID 451 (0x01c3), script $7c96: C2 record 262: Als der Cu-Sath Deinen Versuch bemerkt, sein Revier zu durchqueren, erfüllt er routiniert seinen Job, nämlich die Halle im Westen zu bewachen! Naja: Es gibt echt nicht sehr viel über Dein plötzliches Ableben zu berichten: Kurz, aber schmerzvoll, gibst Du den Löffel ab! Dabei hätte es wirklich viel spektakulärere Todesmöglichkeiten in diesem Spiel gegeben! Naja: Wenn Du so weiterspielst, wirst Du auch sie sicherlich noch früh genug kennenlernen!
        imageID = 0x83;
        ShowImage();
        showtext();
        Restart();
        imageID = 0xff;
        return;
    }
    if ( west[currentRoom] != 0x00 ) {
        currentRoom = west[currentRoom];
        objectLocation[DAVE] = currentRoom;
        Code2E5B();
        imageID = currentRoom;
    } else {
        if ( west[currentRoom] == 0x00 ) {
            pendingTextID = 0x05; // text ID 5 (0x0005), script $7cc6: C2 record 107: Aber dorthin kannst Du doch gar nicht gehen! Zumindest habe ich nichts dergleichen gesagt, oder...?
        }
    }
    temp = 0x01;

x7cd0:
    temp = temp + 0x01;
    if ( temp <= 0xa5 ) {
        goto x7cd0;
    }
    if ( currentRoom == IN_DER_HUETTE_DES_FAEHRMANNS && objectState[PURPURMANTEL] == 0x01 && objectLocation[BOOTSSCHLUESSEL] == RAUM_NULL ) {
        ShowImage();
        showtext();
        Restart();
        pendingTextID = 0x01bc; // text ID 444 (0x01bc), script $7cf6: C2 record 255: Als er den Mantel des Butahkönigs um Deine Schultern bemerkt, fällt der alte Fährmann auf die Knie und fragt mit unterwürfiger Stimme: "Eure Majestät wünschen das Boot zu benutzen?" Gütig nickst Du, nimmst den Fuß, den Du instinktiv in den Nacken des Mannes gesetzt hattest, herunter und bedeutest ihm mit einer gnädigen Geste, sich wieder zu erheben. "Dann nehmt den Bootsschlüssel von Eurem ergebenen Diener entgegen und vergebt ihm den miserablen Zustand seiner Fähre: Es muß eine Zumutung fü Euch sein, Euren königlichen Fuß in sie hineinzusetzen, aber die Geschäfte gehen schlecht: Verzeiht mir!" Nachdem er Dir die Füße saubergeleckt hat, wendet sich der Fährenkapitän unter unzähligen Bücklingen wieder seiner Arbeit zu. Siehst Du: Kleider machen Leute!
        objectLocation[BOOTSSCHLUESSEL] = currentRoom;
        showtext();
        return;
    }
    if ( currentRoom == IM_THRONSAAL_DES_BUTHAKOENIGS && objectState[PARFUEM] == 0x01 ) {
        pendingTextID = 0x01c2; // text ID 450 (0x01c2), script $7d12: C2 record 261: Als er Deine Absicht bemerkt, seine Höhle zu durchqueren, fletscht der Cu-Sath zornig seine Zähne, doch dann...: Aber einen Moment mal! Was ist denn das? Es sieht so aus, als würde die Bestie Dein Parfüm mögen, da es dasselbe ist, das ihr Herrchen vor langer, langer Zeit einmal benutzt hat! Du traust Deinen Augen nicht, als das sonst so gefährliche Untier sanft zu schnurren beginnt und sich zärtlich an Deinen Körper schmiegt! Dann spürst Du etwas Merkwürdiges, Warmes Deine Waden herunterrinnen: Angeekelt schaust Du an Deinem Hosenbein herab, wo der Cu-Sath seine Duftnote hinterlassen hat, um Dir seine starke Zuneigung zu zeigen. Dann zuckst Du jedoch gleichgültig die Achseln: Immerhin ist es gesunder, mit Tierexkrementen besudelt zu sein als zu Tierexkrementen verarbeitet zu werden, oder? Gestärkt durch den tiefen philosophischen Sinn dieser Erkenntnis setzt Du also frohen Mutes Deinen Weg durch die Höhle fort...
        showtext();
        Restart();
        Code2E5B();
        imageID = currentRoom;
        ShowImage();
        showtext();
        return;
    }
    if ( currentRoom == IN_DER_SCHLOSSKUECHE ) {
        if ( objectState[RATTEN] == 0x00 ) {
            objectState[RATTEN] = 0x01;
            ShowImage();
            showtext();
            Restart();
            pendingTextID = 0x01b5; // text ID 437 (0x01b5), script $7d3a: C2 record 248: Als die Ratten Deine Anwesenheit bemerken, beginnen sie nervös - oder eher: HUNGRIG? - zu quieken! Besonders eine unter ihnen, ein häßliches, fettes Biest, schaut Dich aus heimtückisch funkelnden Äuglein an, während sie die Tür im Westen des Raumes blockiert...
            imageID = 0xff;
            return;
        } else {
            if ( objectLocation[RATTEN] == currentRoom ) {
                objectState[RATTEN] = 0x01;
                ShowImage();
                showtext();
                pendingTextID = 0x00; // text ID 0 (0x0000), script $7d56: no text
                imageID = 0xff;
                return;
            }
        }
    }
    if ( imageID != 0xff ) {
        ShowImage();
    }

x7d6c:
    return;
}


void PartD_Sub_7d6d() { // Part D, script $7d6d; command 25 (NIX1), SELECT $774d case 12
    return;
}


void PartD_Sub_7d6e() { // Part D, script $7d6e; command 26 (NIX2), SELECT $774d case 13
    return;
}


void PartD_HandleSchliesse() { // Part D, script $7d6f; command 27 (SCHLIESSE), SELECT $7785 case 1
    tableptr = data0x8fe6;
    temp = 0x01;

x7d76:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    scratch2 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x7d94;
    }
    temp = temp + 0x01;
    if ( temp <= 0x1c ) {
        goto x7d76;
    }

x7d94:
    if ( temp > 0x1c ) {
        pendingTextID = 0x07; // text ID 7 (0x0007), script $7d9a: C2 record 109: Aber das kannst Du doch überhaupt nicht schließen!
        return;
    }
    if ( objectState[object1] == 0x02 || objectState[object1] == 0x00 ) {
        pendingTextID = 0x3a; // text ID 58 (0x003a), script $7daf: C2 record 160: Wie willst Du denn etwas Geschlossenes noch schließen?
        return;
    }
    if ( objectState[object1] == 0x01 ) {
        objectState[object1] = 0x02;
        pendingTextID = 0x06; // text ID 6 (0x0006), script $7dc3: C2 record 108: Gut - geschlossen...
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
        if ( object1 == SAERGE ) {
            score = score + remainingPoints[0x1e];
            remainingPoints[0x1e] = 0x00;
            objectLocation[MUMIEN] = RAUM_NULL;
        }
        if ( object1 == STAHLTUER3 ) {
            objectState[STAHLTUER2] = 0x02;
            objectState[STAHLTUER3] = 0x02;
            west[IM_AMTSZIMMER_DES_TORWAECHTERS] = 0x00;
            east[IN_EINER_VERLIESZELLE] = 0x00;
        } else {
            if ( object1 == STAHLTUER2 ) {
                objectState[STAHLTUER2] = 0x02;
                objectState[STAHLTUER3] = 0x02;
                west[IM_AMTSZIMMER_DES_TORWAECHTERS] = 0x00;
                east[IN_EINER_VERLIESZELLE] = 0x00;
            }
        }
        if ( object1 == GITTERTUER2 ) {
            objectState[GITTERTUER1] = 0x02;
            objectState[GITTERTUER2] = 0x02;
            north[IN_EINER_VERLIESZELLE] = 0x00;
            south[IM_ZIMMER_DES_DUNGEON_MASTERS] = 0x00;
        } else {
            if ( object1 == GITTERTUER1 ) {
                objectState[GITTERTUER1] = 0x02;
                objectState[GITTERTUER2] = 0x02;
                north[IN_EINER_VERLIESZELLE] = 0x00;
                south[IM_ZIMMER_DES_DUNGEON_MASTERS] = 0x00;
            }
        }
        if ( object1 == EICHENTUER ) {
            north[IN_EINEM_KORRIDOR] = 0x00;
            objectState[EICHENTUER] = 0x02;
        }
    }

x7ea5:
    return;
}


void PartD_HandleZerstoere() { // Part D, script $7ea6; command 28 (ZERSTOERE), SELECT $7785 case 2
    tableptr = data0x90aa;
    temp = 0x01;

x7ead:
    scratch1 = *(unsigned short*)tableptr; tableptr += 2;
    pendingTextID = *(unsigned short*)tableptr; tableptr += 2;
    if ( scratch1 == object1 ) {
        goto x7ec9;
    }
    temp = temp + 0x01;
    if ( temp <= 0x07 ) {
        goto x7ead;
    }

x7ec9:
    if ( temp <= 0x07 ) {
        return;
    }
    if ( object1 == DAVE ) {
        pendingTextID = 0x3c; // text ID 60 (0x003c), script $7ed9: C2 record 162: Eine weise, ja geradezu philosophische Entscheidung: Selbstmord heißt, Probleme aus der Welt zu schaffen, die man ohne seine Eltern gar nicht hätte! Wirklich schönes Schlußwort! Hasta la vista... - Babe! HARAKIRIIIIIIIIIIHHHHH!
        showtext();
        Restart();
        objectLocation[DAVE] = 0xff;
        return;
    }
    if ( object1 == TRUHE ) {
        objectLocation[DAVE] = 0xff;
        pendingTextID = 0x01c8; // text ID 456 (0x01c8), script $7ef5: C2 record 267: Du versuchst, die Truhe unter Gewaltanwendung zu öffnen - doch im selben Moment, als Du ihr Schloß berührst, siehst Du einen grellweißen Blitz aus ihr herauszucken, der Dich auf der Stelle erschlägt! Du hattest keine Chance: "Die Spannung war auf dem Höhepunkt" - da war einfach nichts mehr zu machen! Aber sag' mal: Bist Du blind? Der verkokelte Leichnam des unglücklichen Abenteurers sollte Dich doch eigentlich gewarnt haben! Naja, vielleicht sind ZWEI verkohlte Leichen ja eher in der Lage, einem Blindfisch wie Dir beim nächsten Mal als abschreckendes Beispiel zu dienen...
        imageID = 0x82;
        ShowImage();
        showtext();
        Restart();
        return;
    }
    if ( object1 == KESSEL && objectState[WERWOLF] == 0x04 ) {
        score = score + remainingPoints[0x4e];
        remainingPoints[0x4e] = 0x00;
        pendingTextID = 0x01cc; // text ID 460 (0x01cc), script $7f1e: C2 record 271: Vorsichtig, und ohne den Blick von Zargon abzuwenden, näherst Du Dich dem Kessel. Der alte Magier scheint sehr wohl zu wissen, was Du vorhast, und erhebt beschwörerisch die Hände, um zwei seiner teuflischen Vasallen in sein magisches Pentagramm zu rufen - doch bevor seine Hände in der Luft zusammentreffen, hast Du auch schon den schweren Kessel umgestoßen, so daß sich sein Inhalt dampfend über den Boden ergießt und dabei das Kreidepentagramm fast vollständig auslöscht!
        objectLocation[KESSEL] = 0x69;
        objectLocation[DRUDENFUSS2] = 0x69;
        return;
    } else {
        if ( object1 == KESSEL && objectState[WERWOLF] != 0x04 ) {
            pendingTextID = 0x01cd; // text ID 461 (0x01cd), script $7f40: C2 record 272: Können vor Lachen! Weißt Du eigentlich, wie schwer das Ding ist? Du wärest doch nicht einmal in der Lage, den Kessel auch nur einen Zentimeter von der Stelle zu bewegen!
            return;
        }
    }
    if ( object1 == KRISTALL ) {
        if ( objectState[WERWOLF] == 0x04 && objectLocation[DRUDENFUSS2] == 0x69 ) {
            score = score + remainingPoints[0x23];
            remainingPoints[0x23] = 0x00;
            pendingTextID = 0x01ca; // text ID 458 (0x01ca), script $7f6b: C2 record 269: Als Zargon bemerkt, wie Du Dich nach seinem Seelenkristall umblickst, versucht er vor Dir zu dem Podest zu gelangen - doch es ist bereits zu spät: Mit zwei, drei leichtfüßigen Schritten erreichst Du den Sockel, ergreifst das Juwel und stemmst es hoch über Deinen Kopf: Dumpf pulsiert der Stein in Deinen Händen, als wäre er von eigenem Leben erfüllt! Als er erkennen muß, daß Du nunmehr die Macht über ihn erlangt hast, verlegt Zargon sich aufs Bitten: Er fleht Dich verzeifelt an, ihn zu verschonen, er bietet Dir Mylgors Stelle als sein Statthalter in dem kleinen Dorf an - ja, er verspricht Dir sogar, Dich wieder in einen Menschen zurückzuverwandeln, wenn Du seinen Kristall unangetastet ließest: Er sagt, es gäbe irgendwo eine Quelle, deren Wasser Dich von Deiner Infektion mit dem Werwolfsblut heilen könnte... Einen kurzen Augenblick lang läßt Du das Geschehene noch einmal vor Deinem geistigen Auge Revue passieren und denkst darüber nach, was wohl mehr wiegt: Dein Schicksal - oder das der gepeinigten und geknechteten Dorfbewohner, und Du brauchst nicht allzu lange, um zu einer Entscheidung zu gelangen: Ohne Zargons Jammergewinsel weiter zu beachten, schmetterst Du den Seelenkristall mit aller Kraft zu Boden, wo er in tausend Splitter zerbirst, von denen jedoch immer noch jeder einzelne Zargons Portrait widerspiegelt! Im selben Moment jedoch, als der Kristall zerbricht, hörst Du Zargon hinter Dir hysterisch aufschreien! Zu Tode erschrocken, drehst Du Dich um - um Zargon im Todeskampf mit einer dichten, dunkelgrauen Wolke zu sehen, die wohl durch das Auseinanderbrechen des dunklen Juwels freigesetzt worden ist, in dem sie viele Jahrzehnte auf diesen einen Moment gewartet haben muß! Lediglich Zargons wild um sich schlagende Arme und Beine schauen noch aus dem schmutziggrauen Nebel heraus! Dann - plötzlich - ist der Spuk vorbei: Die Wolke verschwindet ebenso schnell, wie sie aufgetaucht ist, und mit ihr auch der böse Hexenmeister! Eine bedrückende Stille erfüllt den Raum, als Du Dich erschöpft an der Wand hinuntergleiten läßt: Alles, was von Zargon übriggeblieben ist, sind seine Krone und das Königszepter...
            objectLocation[KRISTALL] = 0x69;
            objectLocation[ZARGON] = 0x69;
            objectLocation[KRONE] = currentRoom;
            objectLocation[UNKNOWN2] = currentRoom;
        } else {
            if ( objectLocation[DRUDENFUSS2] == currentRoom ) {
                objectState[DRUDENFUSS2] = 0x01;
                pendingTextID = 0x01cb; // text ID 459 (0x01cb), script $7f94: C2 record 270: Hastig rennst Du zu dem Seelenkristall hin, um ihn zu vernichten und damit Zargons gotteslästerliche Existenz endgültig zu beenden - aber als Du das weiße Kreidepentagramm zwischen Dir und dem Podest überquerst, fühlst Du Dich plötzlich so merkwürdig! So müde - und so schwindelig! Und als Du an Dir herabblickst, bemerkst Du, wie sich Dein Körper langsam entmaterialisiert, um an einen anderen Ort in Zargons Schloß teleportiert zu werden! Vielleicht erinnerst Du Dich ja an ein weiteres Pentagramm in diesem Gemäuer...?
                showtext();
                Restart();
                currentRoom = IN_EINEM_FINSTEREN_GRUFTGEWOELBE;
                Code2E5B();
                imageID = currentRoom;
                ShowImage();
            } else {
                if ( objectState[WERWOLF] != 0x04 ) {
                    pendingTextID = 0x01cd; // text ID 461 (0x01cd), script $7fad: C2 record 272: Können vor Lachen! Weißt Du eigentlich, wie schwer das Ding ist? Du wärest doch nicht einmal in der Lage, den Kessel auch nur einen Zentimeter von der Stelle zu bewegen!
                }
            }
        }
        return;
    }
    if ( object1 == VERTRAG ) {
        if ( currentRoom > UNTER_DEM_TORBOGEN ) {
            objectLocation[DAVE] = 0xff;
            pendingTextID = 0x01c9; // text ID 457 (0x01c9), script $7fcb: C2 record 268: Mit einem letzten, hämischen Blick zerreißt Du den Vertrag, der Dich an Zargon und Mylgor gebunden hatte, in handliche, kleine Schnipsel und läßt sie zufrieden zu Boden rieseln - aber in dem Moment, als der erste Papierfetzen den Boden berührt, fühlst Du einen stechenden Schmerz in der Herzgegend, der langsam aber sicher Besitz von Deinem gesamten Körper ergreift! Als lebende Fackel stürzt Du mit einem letzten, fürchterlichen Schrei zu Boden, und während Deine Seele zur Hölle fährt, kannst Du mit ansehen, wie sich aus dem Rauch der letzten Flammen ein Totenschädel bildet: Nun bist Du endlich frei! Niemand wird jemals wieder in der Lage sein, Dich zu irgendetwas zu zwingen...
            imageID = 0x87;
            ShowImage();
            showtext();
            Restart();
            return;
        } else {
            pendingTextID = 0x026d; // text ID 621 (0x026d), script $7fdb: not displayed on C2 by $3F62
            return;
        }
    }
    pendingTextID = 0x3d; // text ID 61 (0x003d), script $7fe5: C2 record 163: "Dave the Destroyer", oder was? Uiuiui! Da möchte man sich ja vor Angst am liebsten hinter dem nächsten Baum verkriechen!

x7fe9:
    return;
}


void PartD_HandleVerliere() { // Part D, script $7fea; command 29 (VERLIERE), SELECT $7785 case 3
    if ( objectLocation[object1] != 0xff ) {
        pendingTextID = 0x41; // text ID 65 (0x0041), script $7ff1: C2 record 167: Nachdem Du eine halbe Stunde lang vergeblich in Deinen Taschen gewühlt hast, wird Dir klar, daß das Ding, das Du gerade so achtlos in die Gegend werfen wolltest, bereits in derselben liegt! Jaja, wenn's anfängt - dann im Kopf, gell?
        return;
    }
    if ( object1 == AMULETT || object1 == FELLSTIEFEL || object1 == JEANS || object1 == BAUMWOLLHEMD || object1 == TURNSCHUHE || object1 == TSHIRT || object1 == PURPURMANTEL || object1 == HOSE || object1 == BADEHOSE ) {
        if ( objectState[object1] == 0x01 ) {
            objectState[object1] = 0x00;
        }
    }
    if ( object1 == BLUT ) {
        pendingTextID = 0x026e; // text ID 622 (0x026e), script $803b: not displayed on C2 by $3F62
        return;
    }
    if ( object1 == GEBET ) {
        pendingTextID = 0x026f; // text ID 623 (0x026f), script $804a: not displayed on C2 by $3F62
        return;
    }
    if ( object1 == ZAUBERSPRUCH ) {
        pendingTextID = 0x0270; // text ID 624 (0x0270), script $8059: not displayed on C2 by $3F62
        return;
    }
    if ( object1 == CODENUMMER ) {
        pendingTextID = 0x0279; // text ID 633 (0x0279), script $8068: C2 record 431: Selbst wenn Du den Code vergessen könntest: Willst Du Dir diese Chance wirklich entgehen lassen? Wir haben das Ding schließlich nicht umsonst ins Spiel eingebaut, weißt Du?
        return;
    }
    pendingTextID = 0x08; // text ID 8 (0x0008), script $8071: engine $5D94: Drop-object response with object name.
    objectLocation[object1] = currentRoom;

x8079:
    return;
}


void PartD_HandleBetritt() { // Part D, script $807a; command 30 (BETRITT), SELECT $7785 case 4
    if ( object1 == SCHACHT ) {
        currentRoom = IN_EINEM_DUNKLEN_SCHACHT;
        objectLocation[DAVE] = IN_EINEM_DUNKLEN_SCHACHT;
        imageID = currentRoom;
        ShowImage();
        Code2E5B();
        showtext();
        imageID = 0xff;
        return;
    }
    if ( object1 == FASS ) {
        currentRoom = IN_EINER_DUNKLEN_HALLE;
        objectLocation[DAVE] = IN_EINER_DUNKLEN_HALLE;
        imageID = currentRoom;
        ShowImage();
        Code2E5B();
        showtext();
        imageID = 0xff;
        return;
    }
    if ( object1 == KAHN ) {
        if ( objectState[BOOTSSCHLUESSEL] == 0x00 ) {
            objectState[BOOTSSCHLUESSEL] = 0x01;
            pendingTextID = 0x09; // text ID 9 (0x0009), script $80ca: C2 record 111: Gut: Wie Du willst...
        } else {
            if ( objectState[BOOTSSCHLUESSEL] == 0x01 ) {
                pendingTextID = 0x18; // text ID 24 (0x0018), script $80d7: C2 record 126: Wie soll denn DAS funktionieren?
            }
        }
        return;
    }
    if ( object1 == BOOTSSTEG ) {
        if ( objectState[BOOTSSCHLUESSEL] == 0x01 ) {
            objectState[BOOTSSCHLUESSEL] = 0x00;
            pendingTextID = 0x0f; // text ID 15 (0x000f), script $80f5: C2 record 117: Okay: Du stehst wieder auf eigenen Beinen.
            if ( currentRoom == AUF_EINER_KLEINEN_INSEL ) {
                if ( objectState[KAHN] == 0x02 ) {
                    objectLocation[KAHN] = 0x69;
                    pendingTextID = 0x01cf; // text ID 463 (0x01cf), script $810d: C2 record 274: Unglücklicherweise ist Dein Boot während Deiner Abwesenheit weggetrieben: Nun treibt es herrenlos in der Mitte des kleinen Sees, so daß es Dir wohl unmöglich sein dürfte, es von hier aus zu erreichen. Leider haben wir auch "vergessen", ein "Schwimm"-Gadget in SOUL CRYSTALs Benutzeroberfläche zu integrieren: Schließlich muß Dummheit ja auch irgendwie bestraft werden! Beim nächsten Mal vertauen wir unser Boot also einfach etwas sorgfältiger am Landesteg, ja? Immerhin haben wir das Ding ja nicht nur aus Spaß an der Freude eingebaut...
                    return;
                }
            }
        } else {
            if ( objectState[BOOTSSCHLUESSEL] == 0x00 ) {
                pendingTextID = 0x18; // text ID 24 (0x0018), script $8120: C2 record 126: Wie soll denn DAS funktionieren?
            }
        }
        return;
    }
    if ( object1 == DRUDENFUSS1 ) {
        objectState[DRUDENFUSS1] = 0x01;
        pendingTextID = 0x01d0; // text ID 464 (0x01d0), script $8136: C2 record 275: Als Du das weiße Pentagramm betrittst, fühlst Du Dich plötzlich so merkwürdig duselig: Alles um Dich herum beginnt sich zu drehen - und plötzlich wird Dir schwarz vor Augen! Du stirbst... Nein! Entschuldigung: Du stirbst natürlich nicht! NOCH nicht! Du scheinst lediglich teleportiert zu werden, denn als Du wieder aus Deinem traumlosen Schlaf erwachst, hat sich Deine Umgebung vollkommen verändert...
        showtext();
        Restart();
        currentRoom = IN_ZARGONS_MYSTERIUM;
        objectLocation[DAVE] = IN_ZARGONS_MYSTERIUM;
        imageID = currentRoom;
        ShowImage();
        Code2E5B();
        return;
    }
    if ( object1 == DRUDENFUSS2 ) {
        objectState[DRUDENFUSS2] = 0x01;
        pendingTextID = 0x01d0; // text ID 464 (0x01d0), script $815c: C2 record 275: Als Du das weiße Pentagramm betrittst, fühlst Du Dich plötzlich so merkwürdig duselig: Alles um Dich herum beginnt sich zu drehen - und plötzlich wird Dir schwarz vor Augen! Du stirbst... Nein! Entschuldigung: Du stirbst natürlich nicht! NOCH nicht! Du scheinst lediglich teleportiert zu werden, denn als Du wieder aus Deinem traumlosen Schlaf erwachst, hat sich Deine Umgebung vollkommen verändert...
        showtext();
        Restart();
        currentRoom = IN_EINEM_FINSTEREN_GRUFTGEWOELBE;
        objectLocation[DAVE] = IN_EINEM_FINSTEREN_GRUFTGEWOELBE;
        Code2E5B();
        imageID = currentRoom;
        ShowImage();
        return;
    }
    pendingTextID = 0x0a; // text ID 10 (0x000a), script $8176: C2 record 112: Könntest Du mir mal bitte erklären, wie Du DAS betreten willst?

x817a:
    return;
}


void PartD_HandleBetrachte() { // Part D, script $817b; command 31 (BETRACHTE), SELECT $7785 case 5
    pendingTextID = objectDescriptionID[object1]; // dynamic text ID, script $817b; resolve through texts/C64/text_ids.json
    if ( object1 == KURZSCHWERT ) {
        if ( objectState[KURZSCHWERT] == 0x01 ) {
            pendingTextID = 0x011f; // text ID 287 (0x011f), script $818d: not displayed on C2 by $3F62
        } else {
            if ( objectState[KURZSCHWERT] == 0x02 ) {
                pendingTextID = 0x011e; // text ID 286 (0x011e), script $819b: not displayed on C2 by $3F62
            } else {
                if ( objectState[KURZSCHWERT] == 0x03 ) {
                    pendingTextID = 0x4d; // text ID 77 (0x004d), script $81a9: C2 record 179: Du betrachtest Dein Schwert: Als Du es im Licht drehst, blitzt die versilberte Klinge, die Du in der Kapelle des Klosters geweiht hast, geheimnisvoll auf. Du wiegst es prüfend in der Hand und führst ein paar unsichere Hiebe gegen einen unsichtbaren Gegner aus. "Ja!", denkst Du Dir zufrieden, "Eine wahrhaft tödliche Waffe, geführt von der Hand eines Meisters der Waffenkunst!" Mit diesem Schwert in Deiner Hand fühlst Du Dich, als ob Du es mit allen Mächten dieser Welt aufnehmen könntest. Nun, wir werden sehen, ob Dein Optimismus gerechtfertigt ist...
                }
            }
        }
        return;
    }
    if ( object1 == ABENTEURER && objectLocation[ZETTEL] == RAUM_NULL ) {
        objectLocation[ZETTEL] = IN_DEN_STAELLEN;
        objectDescriptionID[ABENTEURER] = 0x0b;
        return;
    }
    if ( object1 == ZETTEL ) {
        score = score + remainingPoints[0x65];
        remainingPoints[0x65] = 0x00;
        pendingTextID = 0x01fb; // text ID 507 (0x01fb), script $81e3: C2 record 318: Die Zeilen auf dem zerknitterten Zettel lauten: "Hüte Dich vor dem mächtigen Hexenmeister! Sein Pentagramm ist seine letzte Chance - und seine Diener schlafen niemals...!"
        return;
    }
    if ( object1 == TRUHE ) {
        score = score + remainingPoints[0x19];
        remainingPoints[0x19] = 0x00;
        pendingTextID = 0x01dc; // text ID 476 (0x01dc), script $81fe: C2 record 287: Eine schwere Truhe, die rein äußerlich nicht viel hermacht - wenn man von dem kleinen und höchst wertvoll gearbeiteten Schloß davor absieht, einem Schloß, das irgendwie ganz und gar nicht zu der Truhe paßt! Andererseits dürfte solch ein kleines Ding jedoch eventuelle "Knackarbeiten" erheblich vereinfachen...
        return;
    }
    if ( object1 == QUELLE && objectState[QUELLE] == 0x00 ) {
        objectLocation[WASSER] = currentRoom;
        objectState[QUELLE] = 0x01;
        objectDescriptionID[QUELLE] = 0x0b;
        return;
    }
    if ( object1 == ESSTISCH1 && objectState[ESSTISCH1] == 0x00 ) {
        objectLocation[KADAVER] = currentRoom;
        objectLocation[GESCHIRR] = currentRoom;
        objectState[ESSTISCH1] = 0x01;
        objectDescriptionID[ESSTISCH1] = 0x0b;
        return;
    }
    if ( object1 == GESCHIRR && objectState[GESCHIRR] == 0x00 ) {
        objectLocation[SPEISEN] = currentRoom;
        objectState[GESCHIRR] = 0x01;
        objectDescriptionID[GESCHIRR] = 0x0b;
        return;
    }
    if ( object1 == KRAEUTER ) {
        score = score + remainingPoints[0x45];
        remainingPoints[0x45] = 0x00;
        return;
    }
    if ( object1 == SAERGE && objectState[SAERGE] == 0x01 ) {
        objectLocation[MUMIEN] = currentRoom;
        pendingTextID = 0x01de; // text ID 478 (0x01de), script $829a: C2 record 289: Vorsichtig hebst Du einen der Särge an: Ziemlich schwer, das Ding! Du fragst Dich, wieviel er wohl ohne seinen Inhalt wöge...!
        return;
    }
    if ( object1 == HIMMEL && objectLocation[VOLLMOND] == RAUM_NULL ) {
        objectDescriptionID[HIMMEL] = 0x0b;
        objectLocation[VOLLMOND] = currentRoom;
        pendingTextID = 0x020a; // text ID 522 (0x020a), script $82bb: C2 record 333: Na, komm schon: Es wird wahrscheinlich gleich regnen - und Du willst den Himmel betrachten? Alter Romantiker! Außer dem Vollmond, der Dich von dort oben herab zu beobachten scheint, kannst Du doch sowieso nicht allzuviel erkennen...
        return;
    }
    if ( object1 == VOLLMOND && objectState[WERWOLF] == 0x03 ) {
        objectDescriptionID[VOLLMOND] = 0x01f9;
        pendingTextID = 0x01f8; // text ID 504 (0x01f8), script $82d8: C2 record 315: Wie in Trance blickst Du zu dem bleichen, vollen Mond auf - bis Du durch ein merkwürdiges Geräusch von dem Berg im Norden her aus Deinen Gedanken gerissen wirst: Es ist dasselbe Geräusch, das Du damals schon einmal auf dem verwilderten Friedhof des alten, verfallenen Klosters wahrgenommen hast - nur: Dieses Mal verspürst Du keine Angst mehr - nein, im Gegenteil: Das Geräusch scheint Dir sogar auf ganz seltsame Weise vertraut zu sein, scheint Dich zu rufen, zu locken...? Urplötzlich fühlst Du einen brennenden Schmerz in Deiner Brust, so als wollte eine dunkle Macht von innen heraus von Deinem Körper Besitz ergreifen! Vor Schmerz wie von Sinnen, willst Du Dir das Hemd vom Körper reißen - und erstarrst: Deine Brust ist über und über bedeckt mit struppigem, schwarzen Haar, genau wie Deine Arme - und nach weiteren qualvollen Sekunden Dein ganzer Körper! Du versuchst zu schreien, doch Du erkennst Deine eigene Stimme nicht wieder: Statt eines menschlichen Schmerzensschreies entringt sich Deiner Kehle - WOLFSGEHEUL...! Fieberhaft versuchst Du, Deine Panik herunterzukämpfen und einen klaren Gedanken zu fassen: Offenbar war die Wunde, die Dir der Werwolf während Eures mitternächtlichen Duells auf dem verwahrlosten Klosterfriedhofes geschlagen hat, doch nicht ganz so harmlos, wie Du anfangs in Deiner Naivität angenommen hattest! Du könntest Dich ohrfeigen vor Wut, aber es hilft nichts... In der Hoffnung, daß König Richard schon einen Weg finden wird, Dich zu heilen, wenn Du diesem verfluchten Gemäuer erst einmal entkommen bist, beschließt Du, weitere Gedanken über Deine behaarte Zukunft fürs erste zu vertagen...
        objectState[WERWOLF] = 0x04;
        score = score + remainingPoints[0x5f];
        remainingPoints[0x5f] = 0x00;
        return;
    }
    if ( object1 == SCHREIBTISCH2 && objectLocation[TAGEBUCH] == RAUM_NULL ) {
        objectLocation[TAGEBUCH] = currentRoom;
        pendingTextID = 0x01e6; // text ID 486 (0x01e6), script $8305: C2 record 297: Auf dem Tisch des Turmwächters befinden sich, mehr oder minder ordentlich aufgereiht, einige Bücher und Zeitschriften, mit denen er sich in Friedenszeiten die Langeweile vertrieben hat: So kannst Du zum Beispiel zwölf Ausgaben des PLAYBOY-Magazins, Ausgabe Januar bis Dezember 712, entdecken (Mann! Einer der besten Jahrgänge überhaupt!), die Bestseller "Sagt der AMSTRAD leise Servus" und "How to blow up my ATARI", und schließlich ein paar seiner Tagebücher...
        objectDescriptionID[SCHREIBTISCH2] = 0x0b;
        return;
    }
    if ( object1 == TAGEBUCH && objectState[TAGEBUCH] == 0x01 ) {
        if ( remainingPoints[0x2d] != 0x00 ) {
            pendingTextID = 0x01e9; // text ID 489 (0x01e9), script $8329: C2 record 300: Du beginnst das zerfledderte Tagebuch des Turmwächters zu lesen: Es beschreibt die Belagerung des Schlosses von ihren frühesten Anfängen bis zu ihrem bitteren Ende: Der umsichtige Turmwächter hatte die Auseinandersetzungen und Machtkämpfe zwischen seinem Herrn und Zargon schon längst bemerkt, bevor König Richard auch nur an einen Umsturz zu denken gewagt hätte - doch auch der Verfasser dieser Zeilen hätte niemals so etwas erwartet wie das, was erst noch kommen sollte! Richards Geist hat offenbar wirklich nichts beschönigt: Als sein Körper schon kalt und verkrümmt auf dem Boden von Zargons Gemach lag, ließ Zargon alle ehemaligen Gefolgsleute des gestürzten Herrschers wie Vieh im Burghof zusammentreiben, wo er sie vor die Wahl stellte, entweder ihm zu dienen, oder ihrem König in den Tod zu folgen - und an dieser Stelle enden die Aufzeichnungen plötzlich... Du fühlst kalte, nach Rache und Vergeltung schreiende Wut, aber gleichzeitig auch verzweifelte Hilflosigkeit in Dir aufsteigen, als Du das kleine, ledergebundene Buch wieder zuschlägst, um nur nicht weiter auf sein abruptes Ende starren zu müssen... Im selben Moment, als eine dichte, graue Staubwolke aus den vergilbten Seiten aufsteigt, hörst Du draußen einen Blitz in den Hauptturm einschlagen, der den Raum für Bruchteile von Sekunden in sein gespenstisches, fahles Licht taucht und das Gebäude bis in die Grundmauern erschüttert - so, als wollte eine gigantische, eherne Faust diese Brutstätte des Bösen ein für alle Male auslöschen! So ähnlich muß es sich wohl auch in der verhängnisvollen Nacht zugetragen haben, in der der brave Turmwächter seinem Herrn zum allerletzten Mal die Treue hielt...
            score = score + remainingPoints[0x2d];
            remainingPoints[0x2d] = 0x00;
            objectState[TAGEBUCH] = 0x02;
        } else {
            pendingTextID = 0x0b; // text ID 11 (0x000b), script $8341: C2 record 113: Tut mir leid - aber darüber gibt es nun wirklich nicht mehr allzu viel zu berichten...
        }
        return;
    }
    if ( object1 == SCHMIEREREIEN ) {
        score = score + remainingPoints[0x79];
        remainingPoints[0x79] = 0x00;
        pendingTextID = 0x0205; // text ID 517 (0x0205), script $835c: C2 record 328: Das Gekritzel an der Wand lautet: "Des Königs Macht den Weg Dir schafft!", "For a good time gimme a call: 32168!", "Don't push it - PULL it!", "Paul, halt's Maul!", "Chris, wir lieben Dich!", und "Die Macht, die mir nicht ganz geheuer, bezieht er aus dem Purpurfeuer!" Den Rest der Mitteilungen kannst Du leider nicht mehr entziffern, jedoch ist anzunehmen, daß ihr Niveau auch nicht viel höher liegt als das des Schwachsinns, den Du gerade lesen mußtest.
        return;
    }
    if ( object1 == EICHENTUER && objectLocation[TUERKLINKE] == RAUM_NULL ) {
        objectLocation[TUERKLINKE] = currentRoom;
        pendingTextID = 0x01eb; // text ID 491 (0x01eb), script $8377: C2 record 302: Direkt über dem Schlüsselloch kannst Du eine kleine, goldene Türklinke erkennen.
        objectDescriptionID[IEEEEEEEEE] = 0x0b;
        return;
    }
    if ( object1 == HIMMELBETT && objectLocation[BETTZEUG] == RAUM_NULL ) {
        objectLocation[BETTZEUG] = currentRoom;
        pendingTextID = 0x01f0; // text ID 496 (0x01f0), script $8398: C2 record 307: In Zargons Himmelbett findest Du lediglich seinen rotgepunkteten Pyjama und schwarzseidene Bettwäsche - oder was hattest Du erwartet? Allerdings: Leute, die ihren nächtlichen Aktivitäten auf seidenen Laken nachgehen, sind tatsächlich ein wenig suspekt, da hast Du zweifelsohne recht...
        objectDescriptionID[HIMMELBETT] = 0x0b;
        return;
    }
    if ( object1 == BETTZEUG && objectLocation[LEDERSOECKCHEN] == RAUM_NULL ) {
        objectLocation[LEDERSOECKCHEN] = currentRoom;
        pendingTextID = 0x01d5; // text ID 469 (0x01d5), script $83b9: C2 record 280: Als Du ein wenig in Zargons Bettzeug herumstöberst, findest Du einen kleinen Lederbeutel!
        objectDescriptionID[BETTZEUG] = 0x0b;
        return;
    }
    if ( object1 == LEDERSOECKCHEN && objectState[LEDERSOECKCHEN] == 0x01 && objectLocation[PAPIER] == RAUM_NULL ) {
        objectLocation[PAPIER] = 0xff;
        pendingTextID = 0x01d2; // text ID 466 (0x01d2), script $83e2: C2 record 277: Es enthält ein kleines, vergilbtes Papierzettelchen!
        return;
    } else {
        if ( object1 == LEDERSOECKCHEN && objectState[LEDERSOECKCHEN] == 0x01 && objectLocation[PAPIER] != RAUM_NULL ) {
            pendingTextID = 0x01d3; // text ID 467 (0x01d3), script $83ff: C2 record 278: Ein kleines, aus Nappaleder gefertigtes Säckchen, das mit einer Schnur zugezogen und als Brustbeutel getragen werden kann.
            return;
        }
    }
    if ( object1 == PAPIER && remainingPoints[0x68] != 0x00 ) {
        objectLocation[CODENUMMER] = 0xff;
        score = score + remainingPoints[0x68];
        remainingPoints[0x68] = 0x00;
        objectDescriptionID[PAPIER] = 0x0b;
        pendingTextID = 0x01fd; // text ID 509 (0x01fd), script $842e: C2 record 320: Auf dem Papier steht etwas geschrieben, das für Dich keinen Sinn ergibt: Nur wild durcheinandergewürfelte Zahlen und Buchstaben - oder ein Code...?
        return;
    }
    if ( object1 == TRESOR && objectState[TRESOR] == 0x01 && objectDescriptionID[TRESOR] == 0x0202 ) {
        objectLocation[VERTRAG] = currentRoom;
        pendingTextID = 0x0203; // text ID 515 (0x0203), script $8451: C2 record 326: Oho: Im oberen Fach des Tresors findest Du etwas, das dem Vertrag, den Du dereinst mit Mylgor abgeschlossen hast, gar nicht mal so unähnlich sieht!
        objectDescriptionID[TRESOR] = 0x0b;
        return;
    }
    if ( object1 == VERTRAG && diskSide == 0x04 ) {
        pendingTextID = 0x01df; // text ID 479 (0x01df), script $846b: C2 record 290: Sofort erkennst Du den Vertrag wieder, den Du an dem Abend Deiner Ankunft in dieser Welt unterschrieben hast. Deine Unterschrift ist mit dunkelrotem Blut unter die fremden Schriftzeichen geschmiert worden, deren Sinn zu deuten Du immer noch nicht in der Lage bist...
        return;
    }
    if ( object1 == MARMORTISCH && objectLocation[BRIEF] == RAUM_NULL ) {
        objectLocation[BRIEF] = currentRoom;
        objectDescriptionID[MARMORTISCH] = 0x0b;
        pendingTextID = 0x01e7; // text ID 487 (0x01e7), script $848c: C2 record 298: Du hast in Deinem ganzen Leben noch nicht einmal ein Möbelstück gesehen, das gleichzeitig sowohl den Wohlstand als auch den guten Geschmack seines Besitzers besser auszudrücken vermochte als dieser große Schreibtisch aus kostbarem, schwarzen Marmor!
        return;
    }
    if ( object1 == BRIEF ) {
        score = score + remainingPoints[0x59];
        remainingPoints[0x59] = 0x00;
        pendingTextID = 0x01f6; // text ID 502 (0x01f6), script $84a7: C2 record 313: Es ist ein Brief von Mylgor an seinen Herrn Zargon! Du liest: "Eure Boshaftigkeit! Gestern habe ich einen neuen "Freiwilligen" gefunden, der Euren Erzfeind Firon beseitigen könnte. Ich hoffe, zumindest er wird es endlich schaffen, ihn zu vernichten, ohne vorher seinem dümmlichen Gerede Beachtung zu schenken, wie es seine Vorgänger getan haben. Sollte Dave, so der Name des Jünglings, den ich ausgesandt habe, seine Aufgabe zufriedenstellend erfüllt haben, werde ich ihn selbstverständlich zu Euch schicken, damit Ihr Euch in Euren so gut bestückten Folterkammern mit ihm vergnügen könnt... Zusammen mit diesem Schreiben übersende ich Euch den Vertrag, in dem Dave uns seine Seele verpfändet hat - verfahret damit, wie es Euch beliebt. Lebt wohl, Mylord, Euer ergebener Diener Mylgor." Oha: Nun wird Dir einiges klarer! Aber trotzdem bleibt die Sache noch immer mächtig mysteriös, denn in dem Umschlag kann ich den Vertrag zumindest nicht finden!
        return;
    }
    if ( object1 == BUECHERREGALE && objectLocation[BUECHER] == RAUM_NULL ) {
        objectLocation[BUECHER] = currentRoom;
        pendingTextID = 0x0207; // text ID 519 (0x0207), script $84c2: C2 record 330: In den Bücherregalen stehen viele, alte Schwarten über Okkultismus. Der Geruch der trockenen Ledereinbände und des vergilbten Papiers dringt Dir unangenehm in die Nase, als Du eines der Bücher in die Hand nimmst und den Staub von seinem Umschlag bläst: Kaum hast Du jedoch die uralten Schriftzeichen auf der Vorderseite bemerkt, stellst Du das Buch auch schon wieder entmutigt an seinen Platz im Regal zurück: Das kann ja kein Schwein lesen!
        objectDescriptionID[BUECHERREGALE] = 0x0b;
        return;
    }
    if ( object1 == IEEEEEEEEE && objectLocation[WEIHWASSER] == RAUM_NULL ) {
        objectLocation[WEIHWASSER] = currentRoom;
        pendingTextID = 0x46; // text ID 70 (0x0046), script $84e3: C2 record 172: Es befindet sich ein wenig Weihwasser darin.
        return;
    }
    if ( object1 == PURPURFEUER && objectState[PURPURFEUER] == 0x01 ) {
        pendingTextID = 0x0b; // text ID 11 (0x000b), script $84f8: C2 record 113: Tut mir leid - aber darüber gibt es nun wirklich nicht mehr allzu viel zu berichten...
    }

x84fd:
    return;
}


void PartD_HandleHilf() { // Part D, script $84fe; command 32 (HILF), SELECT $7785 case 6
    tableptr = data0x9056;
    temp = 0x01;

x8505:
    scratch1 = *(unsigned short*)tableptr; tableptr += 2;
    pendingTextID = *(unsigned short*)tableptr; tableptr += 2;
    if ( scratch1 == object1 ) {
        goto x8521;
    }
    temp = temp + 0x01;
    if ( temp <= 0x15 ) {
        goto x8505;
    }

x8521:
    if ( temp <= 0x15 ) {
        return;
    }
    pendingTextID = 0x53; // text ID 83 (0x0053), script $852b: C2 record 185: Danke für Dein wirklich selbstloses Angebot, aber hier wird nun wirklich keine Hilfe benötigt.

x852f:
    return;
}


void PartD_HandleVerlasse() { // Part D, script $8530; command 33 (VERLASSE), SELECT $7785 case 7
    if ( object1 == KAHN ) {
        if ( objectState[BOOTSSCHLUESSEL] == 0x01 ) {
            objectState[BOOTSSCHLUESSEL] = 0x00;
            pendingTextID = 0x0f; // text ID 15 (0x000f), script $8544: C2 record 117: Okay: Du stehst wieder auf eigenen Beinen.
            if ( currentRoom == AUF_EINER_KLEINEN_INSEL ) {
                if ( objectState[KAHN] == 0x02 ) {
                    objectLocation[KAHN] = 0x69;
                    pendingTextID = 0x01cf; // text ID 463 (0x01cf), script $855c: C2 record 274: Unglücklicherweise ist Dein Boot während Deiner Abwesenheit weggetrieben: Nun treibt es herrenlos in der Mitte des kleinen Sees, so daß es Dir wohl unmöglich sein dürfte, es von hier aus zu erreichen. Leider haben wir auch "vergessen", ein "Schwimm"-Gadget in SOUL CRYSTALs Benutzeroberfläche zu integrieren: Schließlich muß Dummheit ja auch irgendwie bestraft werden! Beim nächsten Mal vertauen wir unser Boot also einfach etwas sorgfältiger am Landesteg, ja? Immerhin haben wir das Ding ja nicht nur aus Spaß an der Freude eingebaut...
                    return;
                }
            }
        } else {
            if ( objectState[BOOTSSCHLUESSEL] == 0x00 ) {
                pendingTextID = 0x18; // text ID 24 (0x0018), script $856f: C2 record 126: Wie soll denn DAS funktionieren?
            }
        }
        return;
    }
    pendingTextID = 0x55; // text ID 85 (0x0055), script $8579: C2 record 187: Kannst Du mir vielleicht mal einen heißen Tip geben, wie Du DAS verlassen willst?

x857d:
    return;
}


void PartD_HandleBewege() { // Part D, script $857e; command 34 (BEWEGE), SELECT $7785 case 8
    if ( object1 == SAMTVORHANG ) {
        if ( objectState[SAMTVORHANG] == 0x00 ) {
            pendingTextID = 0x027a; // text ID 634 (0x027a), script $858c: C2 record 432: Du ziehst den Vorhang wieder zu und verschließt damit die Öffnung, die Dich zurück in den Weinkeller führt.
            east[IN_EINER_DUNKLEN_HALLE] = 0x00;
            objectState[SAMTVORHANG] = 0x01;
        } else {
            if ( objectState[SAMTVORHANG] == 0x01 ) {
                pendingTextID = 0x0220; // text ID 544 (0x0220), script $85a6: C2 record 355: Du schiebst den Wandvorhang beiseite und erkennst hinter ihm einen engen, finsteren Tunnel, der irgendwohin tief ins Dunkel hineinführt...
                objectState[SAMTVORHANG] = 0x00;
                east[IN_EINER_DUNKLEN_HALLE] = 0x55;
            }
        }
        return;
    }
    if ( object1 == TUERKLINKE ) {
        pendingTextID = 0x0221; // text ID 545 (0x0221), script $85c3: C2 record 356: Also, was bist Du doch für ein schlaues Kerlchen! Wenn alles in diesem Spiel so einfach wäre, hättest Du es doch wahrscheinlich schon längst in den Papierkorb geworfen (...oder gelöscht, wenn dies eine Raubkopie sein sollte! GRMPF!), oder? Naja, und von daher: "Tut mir leid, aber das kannst Du nicht machen!" Gemein, wie?
        return;
    }
    if ( object1 == BUECHERWAND ) {
        if ( objectState[BUECHERWAND] == 0x00 ) {
            objectState[BUECHERWAND] = 0x01;
            objectState[BUECHERREGALE] = 0x01;
            score = score + remainingPoints[0x7c];
            remainingPoints[0x7c] = 0x00;
            north[IN_EINER_SCHWARZEN_BIBLIOTHEK] = 0x5c;
            south[IN_ZARGONS_STUDIERZIMMER] = 0x59;
            pendingTextID = 0x021f; // text ID 543 (0x021f), script $85fe: C2 record 354: Du versuchst, die Bücherregale zur Seite zu rücken, wie Du es in jedem anderen Adventure auch getan hättest - und wie in jedem anderen Adventure hast Du damit Erfolg: Leise drehen sich die Regale auf kleinen Plattformen herum, die Du im Halbdunkel nicht richtig erkennen konntest! Du brauchst Dir wegen dieses Einfalls aber noch lange nicht auf die Schulter zu klopfen, denn was sollte man wohl anderes mit Regalen anstellen, als sie von Wand zu Wand zu bewegen? Naja, andererseits: Es soll ja sogar Leute geben, die etwas in sie hineinstellen! Tja, wem's Spaß macht...?
        } else {
            if ( objectState[BUECHERWAND] == 0x01 ) {
                north[IN_EINER_SCHWARZEN_BIBLIOTHEK] = 0x00;
                objectState[BUECHERWAND] = 0x00;
                objectState[BUECHERREGALE] = 0x00;
                pendingTextID = 0x027b; // text ID 635 (0x027b), script $861e: C2 record 433: Leise schwingt die Bücherwand wieder in ihre Ausgangsstellung zurück...
            }
        }
        return;
    }
    if ( object1 == BUECHERREGALE ) {
        if ( objectState[BUECHERREGALE] == 0x00 ) {
            objectState[BUECHERREGALE] = 0x01;
            objectState[BUECHERWAND] = 0x01;
            south[IN_ZARGONS_STUDIERZIMMER] = 0x59;
            north[IN_EINER_SCHWARZEN_BIBLIOTHEK] = 0x5c;
            pendingTextID = 0x021f; // text ID 543 (0x021f), script $864f: C2 record 354: Du versuchst, die Bücherregale zur Seite zu rücken, wie Du es in jedem anderen Adventure auch getan hättest - und wie in jedem anderen Adventure hast Du damit Erfolg: Leise drehen sich die Regale auf kleinen Plattformen herum, die Du im Halbdunkel nicht richtig erkennen konntest! Du brauchst Dir wegen dieses Einfalls aber noch lange nicht auf die Schulter zu klopfen, denn was sollte man wohl anderes mit Regalen anstellen, als sie von Wand zu Wand zu bewegen? Naja, andererseits: Es soll ja sogar Leute geben, die etwas in sie hineinstellen! Tja, wem's Spaß macht...?
        } else {
            if ( objectState[BUECHERREGALE] == 0x01 ) {
                south[IN_ZARGONS_STUDIERZIMMER] = 0x00;
                objectState[BUECHERREGALE] = 0x00;
                objectState[BUECHERWAND] = 0x00;
                pendingTextID = 0x027c; // text ID 636 (0x027c), script $866f: C2 record 434: Du schiebst die Bücherregale in ihre Ausgangsposition zurück und schließt somit den Zugang zu Zargons Geheimkammern wieder...
            }
        }
        return;
    }
    if ( object1 == KRIEGERSTATUE ) {
        pendingTextID = 0x0222; // text ID 546 (0x0222), script $8680: C2 record 357: Als Du die Statue berührst, fühlst Du, wie Dich eine geheimnisvolle Kraft durchströmt: Schützend reißt Du die Hände vor Dein Gesicht, als Du von einem grellweißen Licht geblendet wirst - und als Du sie wieder herunternimmst, mußt Du zu Deinem großen Erstaunen feststellen, daß sich Deine Umgebung völlig verändert hat...
        showtext();
        Restart();
        score = score + remainingPoints[0x8a];
        remainingPoints[0x8a] = 0x00;
        currentRoom = IM_ZIMMER_DES_DUNGEON_MASTERS;
        objectLocation[DAVE] = IM_ZIMMER_DES_DUNGEON_MASTERS;
        imageID = currentRoom;
        ShowImage();
        Code2E5B();
        return;
    }
    pendingTextID = 0x10; // text ID 16 (0x0010), script $86a6: C2 record 118: Versprichst Du dir irgend etwas Bestimmtes davon, DAS durch die Gegend zu schleppen?

x86aa:
    return;
}


void PartD_HandleOeffne() { // Part D, script $86ab; command 35 (OEFFNE), SELECT $7785 case 9
    if ( object1 == TRUHE ) {
        pendingTextID = 0x0227; // text ID 551 (0x0227), script $86b1: C2 record 362: Du versuchst die kleine Truhe zu öffnen, doch leider widersteht der komplizierte Mechanismus des zierlichen Schlosses beharrlich Deinen Knackkünsten...
        goto x8815;
    }
    if ( object1 == JEANS || object1 == HOSE ) {
        pendingTextID = 0x0268; // text ID 616 (0x0268), script $86c5: C2 record 427: Tja, was sein muß, muß sein: Hastig siehst Du Dich um, ob auch keiner zusieht, öffnest Deine Hose, und... MOMENT MAL! So nicht, Kumpel! Als ob der Saure Regen nicht schon reichte...!
        goto x8815;
    }
    tableptr = data0x8fe6;
    temp = 0x01;

x86d5:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    scratch2 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x86f3;
    }
    temp = temp + 0x01;
    if ( temp <= 0x1c ) {
        goto x86d5;
    }

x86f3:
    if ( temp > 0x1c ) {
        pendingTextID = 0x58; // text ID 88 (0x0058), script $86f9: C2 record 190: Vorsichtig öffnest Du es, bis Du nach ein paar Sekunden bemerkst, daß Du das doch eigentlich gar nicht öffnen konntest! Also schließt Du es wieder, läßt es wie es war und nimmst Dir vor, nicht weiter über Logik in Computerprogrammen nachzudenken.
        goto x8815;
    }
    if ( objectState[object1] == 0x00 ) {
        pendingTextID = 0x11; // text ID 17 (0x0011), script $8708: C2 record 119: Hmmm... - Scheint aber verschlossen zu sein!
        goto x8815;
    } else {
        if ( objectState[object1] == 0x01 ) {
            pendingTextID = 0x57; // text ID 87 (0x0057), script $8717: C2 record 189: Oh! Da scheint Dir wohl jemand mit dem Öffnen zuvorgekommen zu sein...
            goto x8815;
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
                if ( object1 == FASS ) {
                    score = score + remainingPoints[0x06];
                    remainingPoints[0x06] = 0x00;
                    pendingTextID = 0x0223; // text ID 547 (0x0223), script $876c: C2 record 358: Naja, nach dieser Menge schwachsinnigen Texts, den Du schon über Dich hast ergehen lassen, ist es nur verständlich, wenn Du Deinen Frust über soviel herausgeschmissenes Geld (...oder etwa doch Kopie?) im Wein ersäufen willst: "Hauptsach' Alk!", sagst Du Dir achselzuckend, als Du daran denkst, daß der Inhalt der Fässer mittlerweile wohl doch schon reichlich faulig schmecken dürfte, und öffnest entschlossen das mittlere Faß, in der Erwartung, sofort mit dem edlen Gesöff übergossen zu werden. Aber zu Deiner Überraschung ist das Faß völlig leer! Ein Tunnel scheint durch die ausgeteerten Wände zu führen, irgendwohin in unheimliches Dunkel hinein...
                    objectState[SAMTVORHANG] = 0x00;
                    goto x8815;
                }
                if ( object1 == STAHLTUER3 ) {
                    objectState[STAHLTUER3] = 0x01;
                    objectState[STAHLTUER2] = 0x01;
                    west[IM_AMTSZIMMER_DES_TORWAECHTERS] = 0x4f;
                    east[IN_EINER_VERLIESZELLE] = 0x50;
                } else {
                    if ( object1 == STAHLTUER2 ) {
                        objectState[STAHLTUER2] = 0x01;
                        objectState[STAHLTUER3] = 0x01;
                        west[IM_AMTSZIMMER_DES_TORWAECHTERS] = 0x4f;
                        east[IN_EINER_VERLIESZELLE] = 0x50;
                    }
                }
                if ( object1 == GITTERTUER2 ) {
                    objectState[GITTERTUER1] = 0x01;
                    objectState[GITTERTUER2] = 0x01;
                    north[IN_EINER_VERLIESZELLE] = 0x51;
                    south[IM_ZIMMER_DES_DUNGEON_MASTERS] = 0x4f;
                } else {
                    if ( object1 == GITTERTUER1 ) {
                        objectState[GITTERTUER1] = 0x01;
                        objectState[GITTERTUER2] = 0x01;
                        north[IN_EINER_VERLIESZELLE] = 0x51;
                        south[IM_ZIMMER_DES_DUNGEON_MASTERS] = 0x4f;
                    }
                }
                if ( object1 == EICHENTUER ) {
                    objectState[EICHENTUER] = 0x02;
                    pendingTextID = 0x0226; // text ID 550 (0x0226), script $8805: C2 record 361: Ich weiß gar nicht, was Du hast: Du bräuchtest doch eigentlich bloß die Türklinke zu betätigen...
                    goto x8815;
                }
                pendingTextID = 0x56; // text ID 86 (0x0056), script $880e: C2 record 188: Okay, geöffnet.
            }
        }
    }

x8815:
    scratch2 = 0x00;
    scratch3 = 0x00;
    return;
}


void PartD_HandleZiehe() { // Part D, script $881e; command 36 (ZIEHE), SELECT $7785 case 10
    if ( object1 == TUERKLINKE ) {
        pendingTextID = 0x0228; // text ID 552 (0x0228), script $8824: C2 record 363: Nicht schlecht! Hast Du die Schriftzüge aus der Gefängniszelle richtig gedeutet oder nur aus alten Fehlern gelernt? Leise schwingt die Tür auf und gibt den Weg in Zargons geheime Gemächer frei...
        score = score + remainingPoints[0x34];
        remainingPoints[0x34] = 0x00;
        objectState[EICHENTUER] = 0x01;
        north[IN_EINEM_KORRIDOR] = 0x59;
        return;
    }
    pendingTextID = 0x0258; // text ID 600 (0x0258), script $8845: C2 record 411: Das findest Du wohl witzig, häh? Naja, vergessen wir's...

x884a:
    return;
}


void PartD_HandleDruecke() { // Part D, script $884b; command 37 (DRUECKE), SELECT $7785 case 11
    if ( object1 == TUERKLINKE ) {
        objectLocation[DAVE] = 0xff;
        imageID = 0x86;
        ShowImage();
        pendingTextID = 0x0229; // text ID 553 (0x0229), script $885c: C2 record 364: Als Du die Türklinke hinunterdrückst, hörst Du ein leises Klicken unter Deinen Füßen - und bevor Du noch Zeit findest, zurückzuspringen, öffnet sich eine verborgene Falltür unter Dir! Im letzten Moment ergreifst Du den Rand der Fallgrube und versuchst, Dich wieder nach oben zu ziehen: "Hätte ich doch nicht so oft den Sportunterricht geschwänzt!", denkst Du Dir verzweifelt, als Dir nach mehreren vergeblichen und kraftraubenden Versuchen klarwird, daß Du Dich niemals ohne fremde Hilfe aus dieser mißlichen Lage befreien können wirst. Als Du panikerfüllt auf den Boden der Grube blickst, erkennst Du voller Grausen tief unter Dir lange Eisenspitzen, an denen Reste geronnenen Blutes kleben! Instinktiv willst Du nach Hilfe rufen, doch kaum hast Du den Mund geöffnet, wird Dir auch schon klar, daß Deine Schreie lediglich reine Kraft- und Zeitverschwendung wären, da die einzige Person, die Dich hier unten hören und finden könnte, Zargon persönlich wäre - und Du weißt genau, daß er kein Mitleid mit Dir hätte! Nachdem Du Dir also die Aussichtslosigkeit Deiner Situation nochmals vor Augen geführt hast, sprichst Du noch ein letztes Gebet und läßt dann den Rand der Grube los... Tja, ein Mann muß eben wissen, wann es für ihn Zeit ist zu gehen: Leider fällst Du länger als erwartet und stößt Dir dabei unzählige Male den Kopf an den harten, kantigen Felswänden, ohne jedoch wirklich das Bewußtsein zu verlieren - dann ist es plötzlich zu Ende: Aufgespießt auf die spitzen Lanzen, erschüttert Dein wilder Todesschrei das ganze Schloß, einzig und allein übertönt von Zargons hämischem Hohngelächter...
        showtext();
        Restart();
        return;
    }
    pendingTextID = 0x59; // text ID 89 (0x0059), script $8867: C2 record 191: Glaube mir: Es besteht wirklich nicht der geringste Grund, das zu drücken!

x886b:
    return;
}


void PartD_HandleNimm() { // Part D, script $886c; command 38 (NIMM), SELECT $77b7 case 1
    if ( object1 == WASSER || object1 == WEIHWASSER ) {
        pendingTextID = 0x0217; // text ID 535 (0x0217), script $8877: C2 record 346: "Nimm", "Nimm", "Nimm"! Hey, Du: Geben soll angeblich seliger sein denn nehmen! Außerdem: Könntest Du mir freundlicherweise mal erklären, wie Du Wasser ohne den passenden Behälter mitnehmen willst?
        return;
    }
    if ( object1 == WAFFEN ) {
        pendingTextID = 0x0218; // text ID 536 (0x0218), script $8886: C2 record 347: Will ich aber nicht! Schau' Dir diese Krücken doch mal genau an: In einem echten Gefecht würden sie Dich wohl elend im Stich lassen! Dein gutes, altes Schwert würde Dir garantiert bessere Dienste leisten...
        return;
    }
    if ( object1 == BRIEF ) {
        pendingTextID = 0x0215; // text ID 533 (0x0215), script $8895: C2 record 344: Nix da, mein Freund! Wohl noch nie was vom Briefgeheimnis gehört, wie?
        return;
    }
    tableptr = data0x8fbe;
    temp = 0x01;

x88a5:
    scratch1 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x88bf;
    }
    temp = temp + 0x01;
    if ( temp <= 0x28 ) {
        goto x88a5;
    }

x88bf:
    if ( temp > 0x28 ) {
        pendingTextID = 0x0e; // text ID 14 (0x000e), script $88c5: C2 record 116: Tut mir leid, aber das kannst Du beim besten Willen nicht mitnehmen!
        goto x88e5;
    }
    if ( objectLocation[object1] == 0xff ) {
        pendingTextID = 0x0d; // text ID 13 (0x000d), script $88d4: C2 record 115: Aber das hast Du doch schon längst!
        goto x88e5;
    }
    objectLocation[object1] = 0xff;
    pendingTextID = 0x0c; // text ID 12 (0x000c), script $88e1: engine $5D94: Take-object response with object name.

x88e5:
    if ( object1 == ZETTEL ) {
        objectLocation[ZETTEL] = IN_DEN_STAELLEN;
        pendingTextID = 0x0215; // text ID 533 (0x0215), script $88f1: C2 record 344: Nix da, mein Freund! Wohl noch nie was vom Briefgeheimnis gehört, wie?
        return;
    }
    if ( object1 == BRIEF ) {
        pendingTextID = 0x0215; // text ID 533 (0x0215), script $8900: C2 record 344: Nix da, mein Freund! Wohl noch nie was vom Briefgeheimnis gehört, wie?
        objectLocation[object1] = currentRoom;
        return;
    }
    if ( object1 == BUECHER ) {
        pendingTextID = 0x0216; // text ID 534 (0x0216), script $8913: C2 record 345: Nö! Einerseits sind sie viel zu schwer, und auf der anderen Seite tragen sie nicht das Geringste zur Lösung dieses Abenteuers bei - ehrlich!
        objectLocation[object1] = currentRoom;
        return;
    }
    if ( object1 == UNKNOWN2 ) {
        score = score + remainingPoints[0x78];
        remainingPoints[0x78] = 0x00;
        pendingTextID = 0x0c; // text ID 12 (0x000c), script $8932: engine $5D94: Take-object response with object name.
        return;
    }

x893a:
    return;
}


void PartD_HandleSprich() { // Part D, script $893b; command 39 (SPRICH), SELECT $77b7 case 2
    pendingTextID = 0x5b; // text ID 91 (0x005b), script $893b: C2 record 193: Wie merkwürdig! Keine Antwort ?!?!?
    tableptr = data0x90c6;
    temp = 0x01;

x8946:
    scratch1 = *(unsigned short*)tableptr; tableptr += 2;
    pendingTextID = *(unsigned short*)tableptr; tableptr += 2;
    if ( scratch1 == object1 ) {
        goto x8962;
    }
    temp = temp + 0x01;
    if ( temp <= 0x0f ) {
        goto x8946;
    }

x8962:
    if ( temp > 0x0f ) {
        pendingTextID = 0x5b; // text ID 91 (0x005b), script $8968: C2 record 193: Wie merkwürdig! Keine Antwort ?!?!?
    }
    if ( object1 == FAEHRMANN && objectState[PURPURMANTEL] == 0x00 ) {
        pendingTextID = 0x022c; // text ID 556 (0x022c), script $897a: C2 record 367: Der alte Fährmann blickt kurz von seiner Pfeife auf, grüßt Dich mit einem beiläufigen Nicken und sagt, daß Dich eine Überfahrt mit seiner Fähre fünf harte Dollars kosten würde: Dafür, daß Du immerhin seine Welt retten sollst, eine ziemlich unverschämte Einstellung...
        return;
    } else {
        if ( object1 == FAEHRMANN ) {
            pendingTextID = 0x5b; // text ID 91 (0x005b), script $8989: C2 record 193: Wie merkwürdig! Keine Antwort ?!?!?
            return;
        }
    }

x8992:
    return;
}


void PartD_HandleWende() { // Part D, script $8993; command 40 (WENDE), SELECT $77b7 case 3
    if ( object2 == DAVE ) {
        if ( object1 == FELLSTIEFEL && objectState[FELLSTIEFEL] == 0x00 ) {
            objectState[FELLSTIEFEL] = 0x01;
            objectLocation[FELLSTIEFEL] = 0xff;
            pendingTextID = 0x5d; // text ID 93 (0x005d), script $89b2: C2 record 195: Unbeholfen steigst Du in die dicken Fellstiefel, die Dir Mylgor gegeben hat. Mannomann, sind die warm! Besser, Du ziehst sie nicht in geschlossenen Räumen wieder aus...
            return;
        } else {
            if ( object1 == BAUMWOLLHEMD && objectState[BAUMWOLLHEMD] == 0x00 ) {
                objectState[BAUMWOLLHEMD] = 0x01;
                objectLocation[BAUMWOLLHEMD] = 0xff;
                pendingTextID = 0x5f; // text ID 95 (0x005f), script $89d3: C2 record 197: Gut: Du streifst Dir das warme Baumwollhemd über.
                return;
            } else {
                if ( object1 == HOSE && objectState[HOSE] == 0x00 ) {
                    objectState[HOSE] = 0x01;
                    objectLocation[HOSE] = 0xff;
                    pendingTextID = 0x61; // text ID 97 (0x0061), script $89f4: C2 record 199: Du bist nun mit der gefütterten, warmen Hose bekleidet.
                    return;
                }
            }
        }
        if ( object1 == PARFUEM ) {
            score = score + remainingPoints[0x6b];
            remainingPoints[0x6b] = 0x00;
            pendingTextID = 0x0236; // text ID 566 (0x0236), script $8a10: C2 record 377: Okay, ich habe zwar leider kein Recht, Deine Anweisungen zu verweigern, aber um mal ganz ehrlich zu sein: Ich an Deiner Stelle hätte das wirklich nicht getan, denn dieses "Parfüm" stinkt wirklich zum Gotterbarmen! Vergiß bloß nicht, ein ausgiebiges Bad - nein: besser zwei! - zu nehmen, solltest Du jemals wieder lebendig das Dorf betreten! Die Mädels würden sonst glatt die Flucht ergreifen, wenn sie diesen "Honc Schwartenfranz de Paris"-Duft röchen! Schnüffel... Ähem: Nimm DREI Bäder!!!
            objectState[PARFUEM] = 0x01;
            objectLocation[PARFUEM] = 0x69;
            return;
        }
        if ( object1 == PURPURMANTEL && objectState[PURPURMANTEL] == 0x00 ) {
            score = score + remainingPoints[0x93];
            remainingPoints[0x93] = 0x00;
            pendingTextID = 0x0239; // text ID 569 (0x0239), script $8a3e: C2 record 380: Du hast Dich schon immer gerne mit fremden Federn geschmückt, nicht wahr? Stolz hängst Du Dir den purpurnen Mantel des Butahkönigs um die Schultern.
            objectState[PURPURMANTEL] = 0x01;
            objectLocation[PURPURMANTEL] = 0xff;
            return;
        }
        if ( object1 == WASSER ) {
            pendingTextID = 0x022f; // text ID 559 (0x022f), script $8a59: C2 record 370: Du trinkst einen Schluck des bläulichen Wassers, empfindest jedoch nichts weiter als ein angenehmes Gefühl der Erfrischung - obwohl auch das schon eine ganze Menge wert ist, da Du das Spiel noch nicht vollständig gelöst hast und alle Dir zur Verfügung stehenden Kräfte mobilisieren müssen wirst! Allerdings könnte gerade das jetzt zum Problem werden...
            if ( objectState[WERWOLF] == 0x03 ) {
                pendingTextID = 0x022f; // text ID 559 (0x022f), script $8a66: C2 record 370: Du trinkst einen Schluck des bläulichen Wassers, empfindest jedoch nichts weiter als ein angenehmes Gefühl der Erfrischung - obwohl auch das schon eine ganze Menge wert ist, da Du das Spiel noch nicht vollständig gelöst hast und alle Dir zur Verfügung stehenden Kräfte mobilisieren müssen wirst! Allerdings könnte gerade das jetzt zum Problem werden...
                objectState[WERWOLF] = 0x00;
            } else {
                if ( objectState[WERWOLF] == 0x04 ) {
                    if ( objectLocation[ZARGON] == 0x69 ) {
                        score = score + 0x2d;
                    }
                    pendingTextID = 0x022e; // text ID 558 (0x022e), script $8a88: C2 record 369: Du läßt etwas von dem bläulichen Wasser in Deine schalenförmig gehaltenen Handflächen laufen und nippst vorsichtig daran: Schon nach wenigen Schlückchen fühlst Du, wie Dich eine Woge von Fröhlichkeit und neuer Kraft durchströmt, die Dich einerseits beruhigt und andererseits gleichzeitig auf gar wundersame Weise zu erfrischen scheint. Und als Du zufällig an Deinem Körper herunterblickst, bemerkst Du, daß Du Dich wieder in einen Menschen zurückverwandelt hast - was allerdings auch bedeutet, daß Du Deine übernatürlichen Kräfte einbüßt...
                    objectState[WERWOLF] = 0x63;
                }
            }
            return;
        }
        if ( object1 == WEIHWASSER && objectState[WERWOLF] == 0x04 ) {
            pendingTextID = 0x023b; // text ID 571 (0x023b), script $8aa6: C2 record 382: Also, wenn Du wirklich glaubst, Du könntest Dich einfach so vor Deiner Aufgabe drücken, indem Du das geweihte Wasser in Dich hineinschlabberst, dann bist aber völlig falsch informiert! Du brauchst nämlich ebenfalls eine, möglichst versilberte, Waffe! Und erwarte jetzt bloß nicht von mir, daß ich mein eigenes Schwert gegen mich wende!
            return;
        }
        if ( object1 == SPEISEN ) {
            if ( score > 0x19 ) {
                score = score - 0x19;
            }
            pendingTextID = 0x0235; // text ID 565 (0x0235), script $8ac1: C2 record 376: Du probierst einen Happen der Speisen, spuckst sie jedoch keine Sekunde später schon wieder angewidert aus: Das Zeug schmeckt einfach scheußlich! Naja, was hattest denn Du erwartet - nach so langer Zeit? Du mußt schwer schlucken, als Du ein paar kleine, weiße Würmer und fette, schmutziggraue Maden aus demselben Stück Brot kriechen siehst, das Du eben noch im Mund hattest - doch als Du dann zu allem Überfluß auch noch eine angebissene, noch im Todeskrampf zuckende Madenhälfte aus dem Brotlaib, von dem Du gerade abgebissen hattest, herausschauen siehst, ist es mit Deiner Beherrschung endgültig vorbei! Würgend übergibst Du Dich, so daß sich nun auf dem Boden die Überreste Deiner Mahlzeiten ausbreiten, in denen sich immer noch etwas - BEWEGT...?
            return;
        }
        if ( object1 == WEISSBROTSCHEIBE ) {
            if ( objectState[WEISSBROTSCHEIBE] == 0x00 ) {
                objectLocation[WEISSBROTSCHEIBE] = 0x69;
                pendingTextID = 0x0230; // text ID 560 (0x0230), script $8ade: C2 record 371: Mjamjam... Boah, is' mir schlääächt!
                return;
            } else {
                if ( objectState[WEISSBROTSCHEIBE] == 0x01 ) {
                    objectLocation[DAVE] = 0xff;
                    imageID = 0x85;
                    ShowImage();
                    pendingTextID = 0x0231; // text ID 561 (0x0231), script $8afa: C2 record 372: Hastig würgst Du Dir die Weißbrotscheibe 'rein, ohne in Deiner perversen Freßgier daran zu denken, daß Du sie doch selbst noch vor wenigen Minuten vergiftet hast - aber als Du es gezwungenermaßen bemerkst, ist es bereits zu spät (Ob wir wohl eine Floskeltaste mit dieser Phrase belegen sollten...?): Zum letzten Mal in Deinem jungen Leben fühlst Du, wie Du krank wirst - nein, entschuldige: nicht, wie Du krank wirst, sondern daß Dein letztes Stündlein geschlagen hat (allerdings auch kein sehr viel angenehmeres Gefühl...)! Mit einem letzten, erstickten Würgen krümmst Du Dich auf dem Boden zusammen, bis Du Dein Leben wie eine Ratte aushauchst - denn immerhin war es schließlich Rattengift, das für Dein vorzeitiges Ableben verantwortlich gewesen ist! Nächstes Mal solltest Du die Hinweise auf der Packung wohl doch etwas genauer studieren: "Von Kindern fernhalten!"
                    showtext();
                    Restart();
                    return;
                }
            }
        }
        if ( object1 == KRONE ) {
            objectLocation[DAVE] = 0xff;
            imageID = 0x8c;
            ShowImage();
            pendingTextID = 0x0234; // text ID 564 (0x0234), script $8b18: C2 record 375: "Was Napoliton... äh: Dingsbums konnte, kann ich schon lange!", denkst Du Dir und setzt Dir Zargons Krone auf den Kopf, um Dich zum neuen Herrscher des Reiches zu krönen. Doch was Du leider nicht wußtest war, daß diese Krone ihren Träger zu einem grausamen Diener des Bösen macht! Nun hast Du also auch gleich einen Pakt mit den Höllenmächten geschlossen, die zuvor Zargons Willen und Seele kontrolliert und sich schon ernsthafte Sorgen um seine Nachfolge gemacht hatten...: Im selben Moment, als Du die Krone auf Dein edles Haupt setzt, umklammert sie Deinen Schädel wie ein Schraubstock! Wild schreiend vor Schmerz versuchst Du, das teuflische Kleinod wieder vom Kopf herunterzureißen - aber es geht einfach nicht mehr! Im Gegenteil: Sie wird enger und enger, und mit jeder Sekunde, die verstreicht, wirst Du mehr und mehr zu einem Diener des Satans! Als der Schmerz langsam abklingt und Du nur noch das dumpfe, monotone Pulsieren Deines kalten Blutes im Kopf spürst, drehst Du Dich langsam und mit einem grausamen Lächeln auf den Lippen um - und siehst mit großer Zufriedenheit dabei zu, wie die Splitter des Kristalls, den Du gerade erst zerstört hattest, wieder über dem Boden schweben und sich zu einem neuen Seelenkristall zusammensetzen - einem Seelenkristall, der DEIN Bild darstellt...
            showtext();
            Restart();
            return;
        }
    }
    if ( object1 == DAVE ) {
        if ( object2 == ABENTEURER || object2 == ORKKIND || object2 == KADAVER || object2 == CU_SATH || object2 == EREMIT || object2 == FAEHRMANN || object2 == FIRON || object2 == PORTIER || object2 == KOENIG || object2 == MYLGOR || object2 == DORFBEWOHNER || object2 == VERKAEUFER || object2 == YETI || object2 == ZARGON ) {
            pendingTextID = 0x65; // text ID 101 (0x0065), script $8b71: C2 record 203: Hey, Du! Ich bin bloß ein Computer! Das wird "C-O-M-P-U-T-E-R" geschrieben! Sprich mir nach: "Kooom-Piuuu-Tääär"! Fein, und jetzt denk' Dir mal was Realistischeres aus...
            return;
        }
        if ( object2 == SKELETT1 || object2 == SKELETT2 ) {
            pendingTextID = 0x64; // text ID 100 (0x0064), script $8b84: C2 record 202: Es ist leider zu hart, um bequem darauf liegen zu können - und außerdem: So auf die Schnelle macht das nun auch keinen Spaß...
            return;
        }
        if ( object2 == KRIEGERSTATUE ) {
            pendingTextID = 0x023c; // text ID 572 (0x023c), script $8b92: C2 record 383: Ja, sag' mal: Hast Du eigentlich auch noch andere Gedanken? Ich kann Dir wirklich aus eigener Erfahrung versichern, daß es sehr viel mehr Spaß macht, mit einem knackigen, jungen Orkmädel in die Kiste zu hüpfen als mit einer harten und kalten Statue! Wenn sie wenigstens aus Gum... - aber lassen wir dieses! Außerdem: Du bist immerhin schon siebzehn! Das ist doch wohl wirklich alt genug, um Dir eine nette Freundin zu suchen, statt Deine physischen Bedürfnisse mit Hilfe einer männlichen (!!!) Statue zu befriedigen...!
            return;
        }
    }
    if ( object1 == PFEIFE ) {
    } else {
        if ( object2 == BIENENSTOCK && objectState[BIENENSTOCK] == 0x01 || object2 == DAVE ) {
            pendingTextID = 0x5e; // text ID 94 (0x005e), script $8bb5: C2 record 196: Vorsichtig ziehst Du an der Pfeife des Orkvaters. Ihr süßlicher Rauch versetzt Dich in eine andere Welt: Eine Welt, in der Du auf einem tiefergelegten Toaster durch die Wolken fliegst, wo rosa Elefanten den Verkehr regeln. Plötzlich fängt es an, bunte Regentropfen zu regnen - und die Sicht in Deinem Turbotoaster wird immer schlechter, weil die Scheibenwischer natürlich auch mal wieder streiken! So ein Mist! Dabei warst Du mit der Kiste doch gerade erst beim Toaster-Überwachungs-Verein (TÜV)! RUMMS! Nu isses mal wieder passiert: Kaum paßt man mal eine Weile nicht auf, da nimmt einem auch schon wieder einer von diesen blasierten Marzipankartoffelreitern die Vorfahrt! "Er war schuld!", denkst Du Dir noch, als Du mit der Rübe durch die Windschutzscheibe bretterst. Dann gehen die Lichter aus... Als Du zu Dir kommst, befindest Du Dich wieder an der Stelle, wo Du an der Pfeife gezogen hast - allerdings hast Du einen fürchterlichen Brummschädel. Mann! Was für ein Kraut...
            return;
        }
    }

    if ( object1 == KURZSCHWERT ) {
        if ( object2 == DAVE ) {
            pendingTextID = 0x60; // text ID 96 (0x0060), script $8bcb: C2 record 198: Na gut, wie Du meinst: Heldenhaft stürzst Du Dich in die Klinge Deines Schwertes - aber nichts passiert! Kein Blut, kein Schmerz, rein gar nichts! Frustriert unternimmst Du einen weiteren Versuch, doch wieder spürst Du nichts. Beim dritten Mal triffst Du Dich dann endlich: In Todesqualen windest Du Dich auf dem Boden, ohne daß ein Wort des Schmerzes über Deine Lippen kommt - wie es sich eben für einen echten Helden gehört. Wenn das Deine Freundin sehen könnte! So einen stilvollen Abgang legt man schließlich nicht alle Tage hin! Auf einmal ist alles vorbei, und es wird dunkel... Nach einiger Zeit erwachst Du schwebend in einem dunklen Raum. Du schauderst: Ist das das Leben nach dem Tode? Das soll wirklich alles sein? Sieht ja finster aus... Doch auf einmal wird Dir klar, was Dich geweckt hat: Leise, wie aus weiter Ferne, weht eine sanfte Stimme zu Dir herüber... "Dave Parker!", kannst Du sie wispern hören, "Du solltest wissen, daß niemand seinem Schicksal entkommen kann! Es hat keinen Sinn, vor seiner Bestimmung zu fliehen - das Schicksal holt Dich immer wieder ein! Gehe also hin und erfülle die Aufgaben, die man Dir auferlegt hat. Kraft meiner göttlichen Befugnisse werde ich Dir nun ein Extraleben schenken, um Dir noch eine Gelegenheit zu geben, Deine Bestimmung zu erfüllen..." Während die Stimme im Nichts verhallt, beginnt sich alles um Dich herum zu drehen, Dir wird schwindlig - und Du fällst in einen tiefen, traumlosen Schlaf... Als Du Deine Augen wieder öffnest, findest Du Dich genau dort wieder, wo Du Deinen Selbstmordversuch unternommen hast...
            showtext();
            Restart();
            return;
        }
        if ( object2 == TRUHE ) {
            objectLocation[DAVE] = 0xff;
            pendingTextID = 0x01c8; // text ID 456 (0x01c8), script $8be1: C2 record 267: Du versuchst, die Truhe unter Gewaltanwendung zu öffnen - doch im selben Moment, als Du ihr Schloß berührst, siehst Du einen grellweißen Blitz aus ihr herauszucken, der Dich auf der Stelle erschlägt! Du hattest keine Chance: "Die Spannung war auf dem Höhepunkt" - da war einfach nichts mehr zu machen! Aber sag' mal: Bist Du blind? Der verkokelte Leichnam des unglücklichen Abenteurers sollte Dich doch eigentlich gewarnt haben! Naja, vielleicht sind ZWEI verkohlte Leichen ja eher in der Lage, einem Blindfisch wie Dir beim nächsten Mal als abschreckendes Beispiel zu dienen...
            imageID = 0x82;
            ShowImage();
            showtext();
            Restart();
            return;
        }
    }
    if ( object1 == BOOTSSCHLUESSEL && object2 == KAHN ) {
        if ( objectState[KAHN] == 0x02 ) {
            pendingTextID = 0x67; // text ID 103 (0x0067), script $8c05: C2 record 205: Also gut: Schwamm drüber! Vergessen wir's, und reden wir nicht mehr davon! Aber gib jetzt bitte mal etwas Sinnvolleres ein - mir wird's langsam zu langweilig!
        } else {
            if ( objectState[KAHN] != 0x02 ) {
                objectState[KAHN] = 0x02;
                score = score + remainingPoints[0x10];
                remainingPoints[0x10] = 0x00;
                pendingTextID = 0x0240; // text ID 576 (0x0240), script $8c24: C2 record 387: Mit dem Bootsschlüssel schließt Du die Kette auf, mit der das Boot festgemacht ist.
            }
        }
        return;
    }
    if ( object1 == RATTENGIFT && object2 == WEISSBROTSCHEIBE ) {
        score = score + remainingPoints[0x6e];
        remainingPoints[0x6e] = 0x00;
        objectState[WEISSBROTSCHEIBE] = 0x01;
        objectLocation[RATTENGIFT] = 0x69;
        objectDescriptionID[WEISSBROTSCHEIBE] = 0x01db;
        pendingTextID = 0x0237; // text ID 567 (0x0237), script $8c59: C2 record 378: Sorgsam liest Du das Kleingedruckte unter der Gebrauchsanweisung auf der Rückseite der Verpackung, in der sich das Rattengift befindet: "Der Bundesgesundheitsminister:..." Na also: Mit hämischer Vorfreude öffnest Du die Packung und streust gleich eine doppelte, "todsichere", Dosis des Giftes auf die arme, unschuldige Weißbrotscheibe: Sie stirbt sofort - und ohne zu wissen, wofür! Das war Käse, Mann! Was sollen wir denn mit einer Weißbrotleiche anfangen, häh?
        return;
    }
    if ( object1 == CODENUMMER && object2 == TRESOR ) {
        objectLocation[CODENUMMER] = 0x69;
        objectState[TRESOR] = 0x02;
        score = score + remainingPoints[0x76];
        remainingPoints[0x76] = 0x00;
        pendingTextID = 0x0232; // text ID 562 (0x0232), script $8c85: C2 record 373: Du stellst die Kombination ein und drehst an dem schweren, eisernen Rad - schon im Stillen darauf vorbereitet, wieder mit einer dieser miesen Fallen Zargons konfrontiert zu werden, aber nichts dergleichen passiert: Mit einem leisen "Klick!" schieben sich die Zylinder des Schlosses zurück in ihre Ausgangsposition! Herzlichen und so - aber wo zum Geier hast Du das eigentlich gelernt...?
        return;
    }
    if ( object1 == VERTRAG && object2 == PURPURFEUER && objectState[PURPURFEUER] == 0x00 ) {
        score = score + 0x0320;
        objectLocation[VERTRAG] = 0x69;
        objectState[VERTRAG] = 0x63;
        pendingTextID = 0x0233; // text ID 563 (0x0233), script $8cb2: C2 record 374: Du wirfst den Vertrag in Zargons magisches Purpurfeuer und beobachtest mit selbstzufriedenem Lächeln, wie das Papier erst bräunlich wird, sich dann kräuselt und schließlich den Flammen zum Opfer fällt, woraufhin es sich knisternd in schwarzen Rauch auflöst...
        return;
    }
    if ( object1 == WEIHWASSER && object2 == PURPURFEUER ) {
        objectState[PURPURFEUER] = 0x01;
        objectLocation[PURPURFEUER] = 0x69;
        objectLocation[WEIHWASSER] = 0x69;
        score = score + remainingPoints[0x39];
        remainingPoints[0x39] = 0x00;
        pendingTextID = 0x023a; // text ID 570 (0x023a), script $8ce4: C2 record 381: Mit der hohlen Hand schöpfst Du ein wenig von dem Weihwasser aus dem Becken und sprenkelst es feierlich in die purpurnen Flammen hinein: Mit einem diabolischen Zischen verlöschen sie, und zusammen mit ihnen auch Zargons dunkle Macht! Im selben Augenblick, als das Purpurfeuer verlischt, erschüttert ein lauter Donnerschlag das ganze Schloß bis tief in die Grundmauern, so als versuchte eine eherne Gigantenfaust diese Brutstätte des Bösen zu vernichten!
        return;
    }
    if ( object1 == UNKNOWN2 && object2 == SLOT ) {
        if ( objectState[PORTALTOR2] != 0x01 ) {
            objectState[PORTALTOR2] = 0x01;
            south[AUF_DEM_BURGHOF] = 0x41;
            score = score + remainingPoints[0x87];
            remainingPoints[0x87] = 0x00;
            pendingTextID = 0x0238; // text ID 568 (0x0238), script $8d18: C2 record 379: Du schiebst Zargons Szepter in den Slot - und es scheint tatsächlich zu passen! Mit einem laut vernehmbaren Klicken rastet der Griff ein, und als Du das Szepter wie einen Hebel hin- und herbewegst, hörst Du plötzlich ein scharrendes Geräusch von oben zu Dir hinunterschallen: DAS PORTALTOR!!!
        } else {
            if ( objectState[PORTALTOR2] == 0x01 ) {
                objectState[PORTALTOR2] = 0x00;
                south[AUF_DEM_BURGHOF] = 0x00;
                pendingTextID = 0x06; // text ID 6 (0x0006), script $8d32: C2 record 108: Gut - geschlossen...
            }
        }
        return;
    }
    pendingTextID = 0x67; // text ID 103 (0x0067), script $8d3c: C2 record 205: Also gut: Schwamm drüber! Vergessen wir's, und reden wir nicht mehr davon! Aber gib jetzt bitte mal etwas Sinnvolleres ein - mir wird's langsam zu langweilig!

x8d40:
    return;
}


void PartD_HandleBefestige() { // Part D, script $8d41; command 41 (BEFESTIGE), SELECT $77b7 case 4
    if ( object1 == KAHN && object2 == BOOTSSTEG ) {
        if ( objectState[KAHN] == 0x00 ) {
            pendingTextID = 0x1a; // text ID 26 (0x001a), script $8d54: C2 record 128: Mr. Adams hätte in einem solchen Fall wahrscheinlich mit "You can't do that... YET!" geantwortet, was in etwa soviel heißt wie: "Das kannst Du (noch) nicht tun."
        } else {
            if ( objectState[KAHN] == 0x02 ) {
                score = score + remainingPoints[0x53];
                remainingPoints[0x53] = 0x00;
                objectState[KAHN] = 0x00;
                pendingTextID = 0x023d; // text ID 573 (0x023d), script $8d73: C2 record 384: Mit der Kette, die Du im Boot findest, machst Du es gewissenhaft am Landesteg fest, um sicherzustellen, daß es während Deiner Abwesenheit nicht davontreibt.
            }
        }
        return;
    }
    pendingTextID = 0x18; // text ID 24 (0x0018), script $8d7e: C2 record 126: Wie soll denn DAS funktionieren?

x8d82:
    return;
}


void PartD_HandleGib() { // Part D, script $8d83; command 42 (GIB), SELECT $77b7 case 5
    if ( object1 == WEISSBROTSCHEIBE && object2 == RATTEN ) {
        if ( objectState[WEISSBROTSCHEIBE] == 0x00 ) {
            objectLocation[WEISSBROTSCHEIBE] = 0x69;
            pendingTextID = 0x023f; // text ID 575 (0x023f), script $8d9c: C2 record 386: Oh, da haben wir mal wieder einen echten Tierfreund vor dem Computer sitzen, was? Voller Mitleid mit den armen, hungrigen Viechern teilst Du Dein letztes bißchen Brot mit ihnen. Doch nachdem Ihr Euer dürftiges Mahl beendet habt, schauen die Ratten immer noch aus hungrigen Knopfäuglein zu Dir auf! Offenbar hast Du ihnen mit dem Brot erst richtig Appetit gemacht - und nun warten sie auf das FLEISCHGERICHT!
        } else {
            if ( objectState[WEISSBROTSCHEIBE] == 0x01 ) {
                objectLocation[RATTEN] = 0x69;
                objectLocation[WEISSBROTSCHEIBE] = 0x69;
                score = score + remainingPoints[0x73];
                remainingPoints[0x73] = 0x00;
                pendingTextID = 0x023e; // text ID 574 (0x023e), script $8dc2: C2 record 385: "Da: Haut 'rein!", rufst Du den Ratten aufmunternd zu und wirfst ihnen die dünne Weißbrotscheibe hin: Gierig fallen sie darüber her und verschlingen sie binnen weniger Sekunden! Wie selbstlos von Dir, ihnen Dein letztes bißchen Brot zu geben - nur leider bleiben die sehnsüchtig erwarteten Sterntaler aus, so weit Du Dein Hemdchen auch aufhältst! Aber was ist denn das? Alle Ratten beginnen auf einmal im Raum hin- und herzutorkeln, als hätten sie einen leichten Schwips! Du hast sie vergiftet! Du hast sie heimtückisch vergiftet, umgebracht, gekillt! Mörder! MASSENMÖRDER! Glotz' nicht so unschuldig in den Monitor: Du wußtest ganz genau, daß die Brotscheibe vergiftet war! Seelenruhig und ohne die geringsten Gewissensbisse siehst Du mit eiskalter Zufriedenheit zu, wie die Ratten, eine nach der anderen, umkippen und alle Viere von sich strecken... Nachdem auch das letzte Opfer Deiner Vernichtungsaktion in die ewigen Jagdgründe abgesegelt ist, kannst Du den Raum nun endlich ungehindert durchqueren, wenn Du möchtest.
            }
        }
        return;
    }
    pendingTextID = 0x12; // text ID 18 (0x0012), script $8dcd: C2 record 120: Ist ja wirklich lieb gemeint, aber was sollte man denn DAMIT schon anfangen können...?

x8dd1:
    return;
}


void PartD_HandleVerriegele() { // Part D, script $8dd2; command 43 (VERRIEGELE), SELECT $77b7 case 6
    tableptr = data0x9037;
    temp = 0x01;

x8dd9:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x8df5;
    }
    temp = temp + 0x01;
    if ( temp <= 0x0c ) {
        goto x8dd9;
    }

x8df5:
    if ( temp > 0x0c ) {
        pendingTextID = 0x15; // text ID 21 (0x0015), script $8dfb: C2 record 123: Tut mir ja wirklich ganz fürchterlich leid, aber DAS kannst Du nun wirklich nicht abschließen!
        return;
    }
    if ( scratch3 != object2 ) {
        tableptr = data0x904f;
        temp = 0x01;

x8e0f:
        scratch1 = *tableptr++;
        if ( scratch1 == object1 ) {
            goto x8e29;
        }
        temp = temp + 0x01;
        if ( temp <= 0x07 ) {
            goto x8e0f;
        }

x8e29:
        if ( temp > 0x07 ) {
            pendingTextID = 0x14; // text ID 20 (0x0014), script $8e2f: C2 record 122: Wie willst Du denn DAMIT etwas abschließen?
            return;
        }
        pendingTextID = 0x6a; // text ID 106 (0x006a), script $8e37: C2 record 208: Mist! Entschuldige bitte, aber das hier scheint einfach nicht der richtige Schlüssel zu sein - er paßt leider nicht.
        return;
    } else {
        if ( scratch3 == object2 ) {
            if ( objectState[object1] == 0x00 ) {
                pendingTextID = 0x68; // text ID 104 (0x0068), script $8e4b: C2 record 206: Aber das ist doch bereits abgeschlossen!
                return;
            } else {
                if ( objectState[object1] == 0x02 || objectState[object1] == 0x01 ) {
                    if ( objectState[object1] == 0x01 ) {
                        PartD_HandleSchliesse();
                    }
                    objectState[object1] = 0x00;
                    if ( object1 == STAHLTUER2 ) {
                        objectState[STAHLTUER3] = 0x00;
                        if ( object1 == STAHLTUER3 ) {
                            objectState[STAHLTUER2] = 0x00;
                        }
                    }
                    if ( object1 == GITTERTUER2 ) {
                        objectState[GITTERTUER1] = 0x00;
                    } else {
                        if ( object1 == GITTERTUER1 ) {
                            objectState[GITTERTUER2] = 0x00;
                        }
                    }
                }
            }
        }
    }

x8ea9:
    return;
}


void PartD_HandleEntriegele() { // Part D, script $8eaa; command 44 (ENTRIEGELE), SELECT $77b7 case 7
    if ( object1 == TRESOR && object2 == CODENUMMER ) {
        objectLocation[CODENUMMER] = 0x69;
        objectState[TRESOR] = 0x02;
        score = score + remainingPoints[0x76];
        remainingPoints[0x76] = 0x00;
        pendingTextID = 0x0232; // text ID 562 (0x0232), script $8ecd: C2 record 373: Du stellst die Kombination ein und drehst an dem schweren, eisernen Rad - schon im Stillen darauf vorbereitet, wieder mit einer dieser miesen Fallen Zargons konfrontiert zu werden, aber nichts dergleichen passiert: Mit einem leisen "Klick!" schieben sich die Zylinder des Schlosses zurück in ihre Ausgangsposition! Herzlichen und so - aber wo zum Geier hast Du das eigentlich gelernt...?
        return;
    }
    tableptr = data0x9037;
    temp = 0x01;

x8edd:
    scratch1 = *tableptr++;
    scratch3 = *tableptr++;
    if ( scratch1 == object1 ) {
        goto x8ef9;
    }
    temp = temp + 0x01;
    if ( temp <= 0x0c ) {
        goto x8edd;
    }

x8ef9:
    if ( temp > 0x0c ) {
        pendingTextID = 0x18; // text ID 24 (0x0018), script $8eff: C2 record 126: Wie soll denn DAS funktionieren?
        return;
    }
    if ( scratch3 != object2 ) {
        tableptr = data0x904f;
        temp = 0x01;

x8f13:
        scratch1 = *tableptr++;
        if ( scratch1 == object2 ) {
            goto x8f2d;
        }
        temp = temp + 0x01;
        if ( temp <= 0x07 ) {
            goto x8f13;
        }

x8f2d:
        if ( temp > 0x07 ) {
            pendingTextID = 0x17; // text ID 23 (0x0017), script $8f33: C2 record 125: Also, DAMIT kann man ja nun wiklich nichts aufschlißen, oder?
            return;
        }
        pendingTextID = 0x6a; // text ID 106 (0x006a), script $8f3b: C2 record 208: Mist! Entschuldige bitte, aber das hier scheint einfach nicht der richtige Schlüssel zu sein - er paßt leider nicht.
        return;
    } else {
        if ( scratch3 == object2 ) {
            if ( objectState[object1] > 0x00 ) {
                pendingTextID = 0x69; // text ID 105 (0x0069), script $8f4f: C2 record 207: Das ist aber doch schon längst entriegelt!
                return;
            } else {
                if ( objectState[object1] == 0x00 ) {
                    objectState[object1] = 0x02;
                    pendingTextID = 0x16; // text ID 22 (0x0016), script $8f63: C2 record 124: Okay, aufgeschlossen.
                    if ( object1 == STAHLTUER3 ) {
                        score = score + remainingPoints[0x8c];
                        remainingPoints[0x8c] = 0x00;
                        objectState[STAHLTUER2] = 0x02;
                    } else {
                        if ( object1 == STAHLTUER2 ) {
                            objectState[STAHLTUER3] = 0x02;
                        }
                    }
                    if ( object1 == GITTERTUER2 ) {
                        score = score + remainingPoints[0x57];
                        remainingPoints[0x57] = 0x00;
                        pendingTextID = 0x16; // text ID 22 (0x0016), script $8fa0: C2 record 124: Okay, aufgeschlossen.
                        objectState[GITTERTUER1] = 0x02;
                    } else {
                        if ( object1 == GITTERTUER1 ) {
                            objectState[GITTERTUER2] = 0x02;
                        }
                    }
                }
            }
        }
    }

x8fbd:
    return;
}
