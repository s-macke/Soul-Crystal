#include<vector>
#include<string>

/*
312 Change Disk   (immer)
313 totenkreuz    (immer)
329 ertrinken
330 irgendwas mit weissem tier
*/


/*
168 Myglors Amulett
169 warme Stiefel
170 Kristallkugel
171 kleiner Schluessel
172 Es befindet sich Weihwasser darin
173 Schl�ssel f�r Laboratorium
174 Notizzettel
175 Portaltor
176 Pfeife
177 Pulver in der Dose
178 warmes Baumwollhemd
179 Schwert
180 gef�ttertes Baumwollhemd
181	altmodische Badehose
182 Schaufel
183 Dave
184 ???
*/

/*
Disk B1
0[Im G�stezimmer]			314       209
1[In der Lobby]		   		315		 210
2[Auf der Stra�e]   		316       211
3[Auf der Stra�e]			317       212
4[In dem Korridor]	   		318      213
5[An der Rezeption]    		319      214
6[Im Strudel]		   		320      215
7[Am Ufer des Bergsees]     321      216
8[Im E�zimmer]              322      217
9[Im See]					323		 218
10[Im See]                  324      219
11[Vor dem Wasserfall]      325      220
12[Hinter dem Wasserfall]   326      221
13[Am Ufer]                 327      222
14[Auf einer Lichtung]      328      223

//diskb2
15[In Mylgors Studierzimmer]	450
16[Im Dienerschlafzimmer]       451
17[In der Orkh�hle]             452
18[Im Kaminzimmer]
19[Auf einer Lichtung]
20[Auf einem H�gel]
21[Vor Mylgors Haus]
22[Auf dem Marktplatz]
23[Auf einem Pfad]
24[Im tiefen Wald]
25[Auf einem schneebedeckten Berg]  460
26[Im 'Equipment Shoppe']
27[Auf dem Pfad]
28[Auf einem H�gel]
29[In einem schneebedeckten Tal]
30[Vor einer alten Zwergmine]
31[Auf einem H�gel]
32[Vor einem verfallenen Kloster]
33[Vor Firons Eispalast]
34[In der Eisw�ste]
35[In einem versch�tteten Gang]       470
36[In der ehemaligen M�nze]			471
37[Im Klostergarten]					472
38[Im Speisesaal des Klosters]          473
39[In Firons Thronsaal]               474
40[In einem Gletscher]                 475
41[Vor einer Gruft]					   476???
//???
42[Auf dem Friedhof]
43[In der Klosterschmiede]
44[In der K�nigsgruft]
45[In der kleinen Kapelle]
46[In Mylgors Schlafzimmer]
47[In einem kurzen Korridor]
48[In Mylgors Geheimlabor]
49[In einer kleinen, dunklen Krypta]

//diskc1
50[In einem verwunschenen Wald]			293
51[In einem verwunschenen Wald]         294
52[Im Sumpf]
53[Am Ufer eines sumpfigen Sees]
54[Im Sumpfsee]
55[Im Treibsand]
56[Am Ufer des sumpfigen Sees]
57[In der H�tte des Eremiten]          300
58[Auf einer Lichtung]                 301
59[Auf einem bewaldeten H�gel]
60[Im Moor]
61[Im Moor]
62[Vor Zargons Burgruine]
63[Im Torhaus]
64[Unter dem Torbogen]                307

//diskc2
65[Im Schlo�garten]      				437			209
66[Auf dem Burghof]
67[In den St�llen]        				439
68[In der Empfangshalle]   				440
69[Im oberen Treppenhaus]
70[In der Schlo�galerie]
71[Im Vorratsraum]
72[In der Schlo�k�che]
73[Im Speisesaal]          				445
74[Im K�chengarten]
75[Auf dem Dach des Hauptturmes]        447
76[Im Haus des Turmw�chters]
77[In einem dunklen Schacht]
78[In einer Verlieszelle]
79[Im Amtszimmer des Torw�chters]
80[Im Zimmer des Dungeon Masters]
81[Im unteren Treppenhaus]
82[In der Waffenkammer]
83[In einer dunklen Halle]              455
84[Im Weinkeller]                       456
85[In einem Korridor]
86[In einem finsteren Gruftgew�lbe]
87[In Zargons Schlafgemach]
88[In einer Schwarzen Bibliothek]      460
89[In Zargons Wohngemach]
90[In einem Altarraum]
91[In Zargons Studierzimmer]
92[In Zargons Mysterium]
93[In der H�tte des Torw�chters]     		465

//???
94[In der H�tte des F�hrmanns]
95[Am Ufer eines unterirdischen Sees]
96[Auf einer kleinen Insel]
97[In einem H�hlentunnel]
98[An einer unterirdischen Quelle]
99[Im Thronsaal des Buthak�nigs]
100[In der H�hle des Cu-Saths]
101[In einem H�hlentunnel]
102[In einer Wohnh�hle]
*/

/*
Inv:
Dave
Hinweisschild
Hotel
Jeans
T-Shirt
Turnschuhe
*/


	int room = 2;

	enum TCOMMAND {
		north, south, east, west,
		view,
		open, close, move,
		release, //entriegeln
		lock, //verriegeln
		fasten, //befestigen
		enter, leave, dig,
		push, pull,
		speak,
		give,
		help, wait,
		take,
		lose,
		destroy,
		use


	};

	enum TINVTYPE {
		FIXED, PICKUP, BIND
	};

	enum TOBJECTNAMES {
		common, Dave, Jeans, TShirt, Turnschuhe, Hotel, Hinweisschild
	};


	typedef struct {
		TOBJECTNAMES object;
		std::string name;
		int position;
		TINVTYPE type;
	} TOBJECT;

	std::vector <TOBJECT> objects;


	enum TACTION {
		go, say, ins, del
	};

	struct TROOMACTION {
		int room;
		TCOMMAND command;
		TACTION action;
		TOBJECTNAMES obj, obj2;
		int text;
		int dest;
		int special;
	};

	std::vector <TROOMACTION> roomaction;

	void AddCommand(TCOMMAND command, TOBJECTNAMES obj, TACTION action, int text) {
		TROOMACTION ra;
		ra.room = -1;
		ra.obj2 = common;
		ra.command = command;
		ra.obj = obj;
		ra.action = action;
		ra.text = text;

		roomaction.push_back(ra);
	}

	void AddObject(TOBJECTNAMES object, const char *name, int position, TINVTYPE type) {
		TOBJECT o;
		o.object = object;
		o.name = name;
		o.position = position;
		o.type = type;
		objects.push_back(o);
	}

	void GoRoom(int from, TCOMMAND preact, int dest) {
		TROOMACTION ra;
		ra.room = from;
		ra.command = preact;
		ra.action = go;
		ra.dest = dest;
		roomaction.push_back(ra);
		if (preact == west) {
			ra.room = dest;
			ra.command = east;
			ra.action = go;
			ra.dest = from;
			roomaction.push_back(ra);
		}
		if (preact == east) {
			ra.room = dest;
			ra.command = west;
			ra.action = go;
			ra.dest = from;
			roomaction.push_back(ra);
		}
		if (preact == north) {
			ra.room = dest;
			ra.command = south;
			ra.action = go;
			ra.dest = from;
			roomaction.push_back(ra);
		}
		if (preact == south) {
			ra.room = dest;
			ra.command = north;
			ra.action = go;
			ra.dest = from;
			roomaction.push_back(ra);
		}
	}

	int FindRoomDest(int from, TCOMMAND preact) {
		for (int i = 0; i < roomaction.size(); i++) {
			if (roomaction[i].room == from)
				if (roomaction[i].command == preact)
					return roomaction[i].dest;

		}
		return -1;
	}

	void ExecCommand(TCOMMAND act) {
		if ((act == north) || (act == south) || (act == west) || (act == east)) {
			int dest = FindRoomDest(room, act);
			if (dest != -1)
				room = dest;
		}


	}

void UpdateInv() {
    for (int i = 0; i < objects.size(); i++) {
        printf("Update inventory\n");
        //TODO
        //ListBox1->Items->Add(objects[i].name);
    }
}


int main() {

//First Message: "Soul Crystal" V 1.5 written....
//dann: Du stehst auf der Strasse von....

//		Dave, Jeans, TShirt, Turnschuhe, Hotel, Hinweisschild

    AddObject(Dave, "Dave", -1, BIND);
    AddObject(Jeans, "Jeans", -1, PICKUP);
    AddObject(TShirt, "T-Shirt", -1, PICKUP);
    AddObject(Turnschuhe, "Turnschuhe", -1, PICKUP);
    AddObject(Hotel, "Hotel", 1, FIXED);
    AddObject(Hinweisschild, "Hinweisschild", 1, FIXED);
    AddCommand(view, Hinweisschild, say, 243);
    AddCommand(view, Dave, say, 183);
    AddCommand(view, Hotel, say, 236);
    AddCommand(view, Jeans, say, 238);
    AddCommand(view, TShirt, say, 245);
    AddCommand(view, Turnschuhe, say, 242);
    AddCommand(help, Dave, say, 184);
    AddCommand(destroy, Dave, say, 162);

// common comands
    AddCommand(open, common, say, 190);
    AddCommand(close, common, say, 109);
    AddCommand(lock, common, say, 123);
    AddCommand(release, common, say, 126);
    AddCommand(fasten, common, say, 126);
    AddCommand(move, common, say, 118);
    AddCommand(enter, common, say, 112);
    AddCommand(leave, common, say, 187);
    AddCommand(push, common, say, 191);
    AddCommand(pull, common, say, 191); //unknown
    AddCommand(speak, common, say, 193);
    AddCommand(give, common, say, 120);
    AddCommand(wait, common, say, 156);
    AddCommand(wait, common, say, 185);
    AddCommand(dig, common, say, 153);
    AddCommand(take, common, say, 116);
    AddCommand(lose, common, say, 167);
    AddCommand(destroy, common, say, 163);
    AddCommand(use, common, say, 205);
//		GoRoom(2, west, 1);
/*
		UpdateInv();
*/
    return 0;
}

