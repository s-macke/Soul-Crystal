//---------------------------------------------------------------------------

#include <stdio.h>
#include <vector>
#include <string>

//---------------------------------------------------------------------------

#include "souldisk.h"
#include "disk.h"

//---------------------------------------------------------------------------

/*

die entsprechenden Bilder fangen bei index 314 an

an stelle  00029a10h in disk2a.d64

103 Locations???

01 = Hotelzimmer
02 = Lobby
03 = start in stadt
04 = weg zum Strand
05 = Hotelzimmergang
06 = rezeption


Jeder Raum hat 13 Byte
6 Byte = Richtungen (siehe unten)

n=Lobby

n-1	06	Norden
n+0	03	Osten
n+1	00	S�den
n+2	00	westen
n+3	00	hoch
n+4	00	runter

n= start in stadt

n-1	00	Norden
n+0	04	Osten
n+1	00	S�den
n+2	02	Westen
n+3	00	hoch
n+4	00	runter


29fcf enth�lt raumnummer f�r Hinweisschild         (in d64)
29da6 ist hotel enthh�lt raumnummer f�r hotel       (in d64)

----------------------------------------------

6a48 - 6b91: beinhaltet beschreibungsindex fuer objekte   333 bytes

6b92 - 6cdf: 333 Bytes 2* alle Objekte
6cdf - 6d83 beinhaltet position fuer objekte
6d85 - 6e2a: 167 Bytes
6e2b in snapshot beinhaltet raumnummer f�r bewegung norden im raum 1
+104
6e93 in snapshot beinhaltet raumnummer f�r bewegung sued im raum 1
+104
6efb in snapshot beinhaltet raumnummer fuer bewegung westen im raum 1
+104
6f63 in snapshot beinhaltet raumnummer f�r bewegung osten im raum 1

+104
6fcb
+104
7033
+104
709b
+104
7103
+104
716B
----------------------------------------------

6d5e enth�lt position f�r hinweisschild im snapshot
6d26 enth�lt position f�r hotel im snapshot

6cdf beginnt das array vermutlich mit Abenteurer
Zombie        (an Adresse 6d83 im Snapshot)

0: ABENTEURER
1: STEINALTAR
2: AMULETT
3: DACHSSCHLITTEN
4: LEDERS[CKCHEN
5: FA�
6: G[STEBETT
7: BETT
8: BETT
9: BETTZEUG
10: BIENENSTOCK
11: KLINGEL
12: BLUT
13: WASSER
14: BOOT
15: KAHN
16: BOOTSSCHL]SSEL
17: B]CHERREGALE
18: B]CHER
19: FELLSTIEFEL
20: WEI�BROTSCHEIBE
21: ZIEGELSTEIN
22: PROSPEKT
23: STUHL
24: TRUHE
25: ORKKIND
26: FEUERSTELLE
27: KAMIN
28: CODENUMMER
29: S[RGE
30: SILBERM]NZEN
31: VERTRAG
32: KADAVER
33: KRONE
34: KRISTALL
35: KRISTALLKUGEL
36: CUm�ATH
37: SAMTVORHANG
38: SCHACHT
39: SCHREIBTISCH
40: TRESEN
41: STUDIERTISCH
42: SCHREIBTISCH
43: MARMORTISCH
44: TAGEBUCH
45: GESCHIRR
46: HUNDESCHLITTEN
47: ZIMMERT]R
48: ZIMMERT]R
49: HOLZT]R
50: EICHENT]R
51: T]RKLINKE
52: SCHUBLADEN
53: EREMIT
54: ORKFRAU
55: F[HRMANN
56: PURPURFEUER
57: FIRON
58: EISSCHL]SSEL
59: WEIHWASSERBECKEN
60: EEEEEEEEE
61: SPEISEN
62: HIMMELBETT
63: HAUST]R
64: FRIEDHOFSTOR
65: FRIEDHOFSTOR
66: GRAB
67: GRABSTEIN
68: KR[UTER
69: ERDLOCH
70: HONIG
71: HOTEL
72: EISlAST
73: PORTIER
74: EISENSCHL]SSEL
75: JACKS`�EIST
76: JEANS
77: KESSEL
78: K\NIG
79: MESSER
80: LABORT]R
81: LABORSCHL]SSEL
82: BOOTSSTEG
83: TORSCHL]SSEL
84: FALLGITTER
85: FALLGITTER
86: GITTERT]R
87: GITTERT]R
88: BRIEF
89: ZAUBERT]R
90: ORKMANN
91: LAGEPLAN
92: GRABPLATTE
93: SPEISEKARTE
94: VOLLMOND
95: MUMIEN
96: MYLGOR
97: DORFBEWOHNER
98: NORDT]R
99: NOTIZ
100: ZETTEL
101: GEM[LDE
102: GEM[LDE
103: PAPIER
104: DRUDENFU�
105: DRUDENFU�
106: PARF]M
107: PFEIFE
108: PLATTFORM
109: RATTENGIFT
110: PORTALTOR
111: PORTALTOR
112: ELIXIER
113: GEBET
114: RATTEN
115: REAGENZIEN
116: ZIMMERSCHL]SSEL
117: TRESOR
118: SARKOPHAG
119: ZEPTER
120: �
121: SCHMIEREREIEN
122: VERK[UFER
123: VORRATSREGALE
124: B]CHERWAND
125: BAUMWOLLHEMD
126: TURNSCHUHE
127: SCHAUFEL
128: HINWEISSCHILD
129: WARNSCHILD
130: SILBER
131: SKELETT
132: SKELETT
133: TOTENSCH[DEL
134: HIMMEL
135: SLOT
136: ZAUBERSPRUCH
137: QUELLE
138: KRIEGERSTATUE
139: STAHLT]R
140: STAHLT]R
141: STAHLT]R
142: KURZSCHWERT
143: Tm�HIRT
144: TISCH
145: E�TISCH
146: E�TISCH
147: �
148: PURPURMANTEL
149: HOSE
150: BAUMSTAMM
151: BAUMSTAMM
152: BADEHOSE
153: EINHORN
154: KAYS`�CHL]SSEL
155: KLEIDERSCHRANK
156: WEIHWASSER
157: WASSERFALL
158: WASSERFALL
159: WAFFEN
160: WERWOLF
161: WESTT]R
162: WOLF
163: YETI
164: DAVE
165: ZARGON
166: ZOMBIE

an adresse 6b8C im snapshot steht position von betrachten text
(von Dave)
als 2 byte?
der index vom betrachten text ist zahl-102

index 01 00 = Punktezahl
index 02 00 = Codeabfrage
index 03 00 = Falsche eingabe von Code
index 04 00 = r04  (entspricht meinem index von 106)
index a8 00 = "Oh nein! ..." entspricht index 270 und letztes erlaubte
index 14 00 = Wie willst Du denn damit etwas abschlie�en
index 32 00 = --- wie ich auf den Grund des Sees hinuntertauchen ...
index 0F 00 = Du stehst wieder auf eigenen Beinen
index 2D 00 = Cheat Extension verlassen; kehre zur�ck zum Spiel
index 64 00 = Es ist leider zu hart, um bequem darauf liegen zu k�nnen
6a48 - 6b91 ist die Index Tabelle f�r Betrachten

was ist von 8376 - 8423 (irgendwelche links auf Texte evtl. )

---
6b92 - 6cdf: 333 Bytes 2* alle Objekte
vermutlich zwei byte= ein objekt da jede ungerade Adresse = 0
bis auf 6bd9 (Kristallkugel???)

---

  8007 im snapshot enth�lt index ueber gespraech mit dorfbewohner
  enth�lt 9e fuer den index

  802c im snapshot enth�lt index ueber gespraech mit dorfbewohner
  beim 2. Mal ansprechen. Enthaelt 9f

  7f32 steht klinel einmal

  fuer jeden Textindex steht ein  92 c0 byte vorher, danach D7

---

wenn bei 1c12 ein E1 gelesen wird heisst das sprung zur einer
anderen Adresse
E2 ist evtl eine switch/case anweisung

1c12 liesst vollgende Werte:
92    evtl Text darstellen
D0   if then else???? goto
EF
D3
E2  select/case jump
93
E6
E5
E1  jump

92 C0 0 D7 Allererste Befehl: Vermutlich heisst es allen Text l�schen
92 C0 5B D7
92 C0 9E D7 heisst wohl Text darstellen

0 5B und 9E wrden mit Adresse 228A gelesen. Es wird in
697C = x und 697D = 0


diese kommen ziemlich zum schluss
90    seltsame+addier funktion
B0
A7
E7  return aus unterfunktion (dann auch Zeichen f�r Ende)
91 seltsame kopier+addier funktion

Adresse 2299:
	697C = (x)
	697D = 0

	70FB = 0
	70FC = (x+1)
	 697C = 697C + 70FB
	 697D = 697D + 70FC (mit carry von vorher)



E6: 2 Byte werden gelesen (an Adresse 2DD8)
69AB = naechster Wert (x)
69aC = 0
69AD = naechster Wert (x+1)
69AE = 0
70FC = 69AD (x+1)
70FB = 0
69B3 = 69AB + 70FB
69B4 = 69AC + 70FC (carry flag von letzer Addition vermutlich noch vorhanden)

E5



2A21 evtl unterfunktion?????

---

aus programcode
an adresse 0x2266
hi	lo 	laenge jedes Feldes

C6	69 	2	beschreibungsindex
12	6B	2	??? f�r objekte
27	70	1	fast nur 0 (bei bewegung nach westen)
4	6D	1	status der objekte 1=angezogen 0,1,2,4 klingel
5E	6C	1 	raumnummer

B2	6F	1	hinab
4A	6F	1	hinauf
7A	6E	1	westen
12	6E	1	s�den
E2	6E	1	osten
AA	6D	1	norden
---

Diese Objektnummern stimmen wirklich
0xA3 = Dave
0x62 = Dorfbewohner
0x48 = Hotel

enum COMMAND
{
	UEBERSOULCRYSTAL=0x1,
	KURZTEXT=0x2,
	CREDITS=0x3,
	GRABE=0x4,
	HINUNTER=0x5,
	OST=0x6,
	AUSGAENGE=0x7,
	DISKETTEINSTALLIEREN=0x8,
	INVENTAR=0x9,
	SCHAU=0xA,
	NORD=0xB,
	SPIELENDE=0xC,
	NEUSTART=0xD,
	LADEN=0xE,
	PUNKTE=0xF,
	LOESUNG=0x10,
	MUSIKEIN=0x11,
	AUSGAENGE12=0x12,
	SUED=0x13,
	SPEICHERN=0x14,
	HINAUF=0x15,
	AUSFUEHRLICH=0x16,
	WARTE=0x17,
	WEST=0x18,
	NIX1=0x19,
	NIX2=0x1A,
	SCHLIESSE=0x1B,
	ZERSTOERE=0x1C,
	VERLIERE=0x1D,
	BETRITT=0x1E,
	BETRACHTE=0x1F,
	HILF=0x20,
	VERLASSE=0x21,
	BEWEGE=0x22,
	OEFFNE=0x23,
	ZIEHE=0x24,
	DRUECKE=0x25,
	NIMM=0x26,
	SPRICH=0x27,
	WENDE=0x28,
	BEFESTIGE=0x29,
	GIB=0x2A,
	VERRIEGELE=0x2B,
	ENTRIEGELE=0x2C
}


addr6986 Kommando
0x1 = �ber Soul Crystal
0x2 = Kurztext (Kurzbeschreibungen aktiviert)
0x3 = Credits
0x4 = Grabe
0x5 = hinunter
0x6 = ost
0x7 = Ausg�nge (anzeigen)
0x8 = Diskette Installieren
0x9 = inventar
0xA = schau (Beschriebung nochmal zeigen)
0xB = nord
0xC = spielende
0xD = Neustart
0xE = LADEN
0xF = punkte (ausgabe = r01)
0x10 = L�SUNG
0x11 = MUSIK einschalten (aber wird nicht verwendet)
0x12 = Ausg�nge anzeigen (wird nicht verwendet)

0x13 = sued
0x14 = speichern
0x15 = hinauf
0x16 = Ausf�hrlich (ausf�hrliche Beschreibungen aktivieren)
0x17 = warte
0x18 = west
0x19 = nix
0x1A = nix

0x1B = schliesse
0x1C = zerst�re
0x1D = verliere

0x1E = Betritt
0x1F = betrachte
0x20 = Hilf
0x21 = verlasse
0x22 = Bewege
0x23 = �ffne
0x24 = ziehe
0x25 = dr�cke

0x26 = Nimm
0x27 = Sprich
0x28 = Wende ... auf ... an
0x29 = Befestige ... and ...
0x2A = Gib ... and ...
0x2B = verriegele ... mit ...
0x2C = entriegele ... mit ...

tab9[0x00] =0 heisst kurzbeschreibungen aktiviert

-------

Code3C02 darstellen von text gesp�eicher in textoutput (siehe interpret.h)
5D51 auf tasteneingabe warten

37a0 neustart

3800
3B2F

4719: Codeabfrage
4B38: Codeabfrage g�ltig

goto 4B84: Codeabfrage ung�ltig, erneut versuchen

4BBB: Eigentlich dasselbe

Code5277(); Neustart des Spiels

goto 5C11 f�hrt auf Codeabfrage und anschliessend auf Disk C1

5C80???
5CDB??? was ist das???
--------
*/

std::string IntToHex(int i, int length);


void Init(unsigned char *newmem);

void AnalyzeSpecial();

//---------------------------------------------------------------------------

void Button6Click() {
    unsigned char buf[1000000];
    FILE *file = fopen("e:\\t\\c64games\\sould64\\SaveGameA.d64", "rb");
    fread(buf, 174848, 1, file);
    fclose(file);

    for (int i = 0; i < 8 * 256; i++) {
//        if (buf[21*256+i] != buf[(21+8)*256+i])

        int x, y;
//        x = buf[21*256+i];
//        y = buf[(21*2+8)*256+i];
        x = buf[(21 * 2 + 8) * 256 + i];
        y = buf[21 * 3 * 256 + i];
        if (x != y) {
            printf("not identical %i %i %i\n", i, x, y);
        }

//        printf(buf[21*256]);
//        printf(buf[(21*2+8)*256]);
    }

}
//---------------------------------------------------------------------------

void Button7Click() {
    unsigned char memory[0x10000];
    /*
    FILE *file = fopen("memory", "rb");
    if (file == NULL)
    {
        fprintf(stderr, "Error: Cannot open file\n");
        exit(1);
    }
    fread(memory, 0x10000, 1, file);
    fclose(file);
*/
    FILE *file = fopen("nachcodeabfrage.vsf", "rb");
    if (file == NULL) {
        fprintf(stderr, "Error: Cannot open file\n");
        exit(1);
    }

    fread(memory, 0x80, 1, file);
    fread(memory, 0x10000, 1, file);
    fclose(file);

/*
	std::string s;
	for(int i=0; i<103; i++) //rooms
//	for(int i=0; i<0x167; i++) //objects
	{

//		s = s + std::string(", 0x")+IntToHex(memory[0x69C6+i*2+0] | (memory[0x69C6+i*2+1]<<8) ,4); //objectdescription
//		s = s + std::string(", 0x")+IntToHex(memory[0x6b12+i*2+0] | (memory[0x6b12+i*2+1]<<8) ,4); //points
//		s = s + std::string(",0x")+IntToHex(memory[0x6C5E+i],2); //objectposition
//		s = s + std::string(",0x")+IntToHex(memory[0x6D04+i],2); //objectstatus
//		s = s + std::string(",0x")+IntToHex(memory[0x6DAA+i],2); //nord
//		s = s + std::string(",0x")+IntToHex(memory[0x6E12+i],2); //south
//		s = s + std::string(",0x")+IntToHex(memory[0x6E7A+i],2); //west
//		s = s + std::string(",0x")+IntToHex(memory[0x6EE2+i],2); //ost
//		s = s + std::string(",0x")+IntToHex(memory[0x6F4A+i],2); //up
//		s = s + std::string(",0x")+IntToHex(memory[0x6FB2+i],2); //down
//		s = s + std::string(",0x")+IntToHex(memory[0x7027+i],2); //visited

		if ((i%16) == 15)
		{
			printf(s);
			s = "";
		}
	}
		printf(s);

	return;
*/
    Init(memory);
    //Code1C12();

    AnalyzeSpecial();

/*
	file = fopen("P:\\Applications\\cygwin\\home\\Sebastian1\\c64emulator\\memory", "rb");
	fread(memory, 0x10000, 1, file);
	fclose(file);
	Init(memory);

	Memo2->Clear();
	AnalyzeSpecial();
*/
    //Code1C12();

    //Init(memory);
}

//---------------------------------------------------------------------------

void ShowDiskPointers() {
    FILE *file;
    unsigned char buf[174848];

    file = fopen("d64/Soul Crystal SideB1.d64", "rb");
    //file = fopen("d64/Soul Crystal SideB2.d64", "rb");
    //file = fopen("d64/Soul Crystal SideC1.d64", "rb");
    //file = fopen("d64/Soul Crystal SideC2.d64", "rb");

    fread(buf, 174848, 1, file);
    fclose(file);

    for (int i = 0; i < 9999; i++) {
        unsigned int x   = getd64pos(buf[0x300 + i * 3 + 0], buf[0x300 + i * 3 + 1], buf[0x300 + i * 3 + 2]);
        unsigned int end = getd64pos(buf[0x300 + i * 3 + 3], buf[0x300 + i * 3 + 4], buf[0x300 + i * 3 + 5]);
        if (x > 174848) {
            printf("end reached\n");
            return;
        }
        unsigned short size = buf[x] | (buf[x+1]<<8);
        size = -size;

        printf("%3i: 0x%06x size=0x%04x 0x%04x\n", i, x, size, end-x-2);
        //printf("0x%06x 0x%02x 0x%02x\n", x, buf[x], buf[x+1]);
    }
}

int main() {
    //ShowDiskPointers();

    Button7Click();
    return 0;
}