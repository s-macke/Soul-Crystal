//---------------------------------------------------------------------------

#include <stdio.h>
#include <vector>
#include <string>
#include<stdint.h>

//---------------------------------------------------------------------------

//#define SPECIAL

#include"tables.h"

unsigned char addr695D;
unsigned char addr6963;
//unsigned short int addr69B1;

unsigned char addr6964;    // last read token

//variables used throughout the script
uint16_t addr6974;
uint16_t addr6976;

uint16_t addr6978;
uint16_t addr6980;
uint16_t addr6982;

uint16_t addr697A;
uint16_t addr697E;

uint16_t addr6984;

uint16_t addr6986;
uint16_t addr6988;
uint16_t addr698A;

uint16_t addr698C;
uint16_t addr698E;
uint16_t addr6990;
uint16_t addr6992;
uint16_t addr6994;
uint16_t addr6996;
uint16_t addr6998;
uint16_t addr699A;
uint16_t addr699F;

uint16_t addr69A5;

//uint16_t addr69A9;

uint16_t addr697C;
uint16_t addr70FB;

uint16_t addr69A3; //stack pointer

uint16_t addr69A7;
uint16_t addr69AB;
uint16_t addr69AD;
uint16_t addr69AF;

uint16_t addr69B3;

uint16_t addr69B9;

uint8_t addr6D51;
uint8_t addr6D98;
uint8_t addr6D81;
uint8_t addr6D93;
uint8_t addr6D97;
uint8_t addr6D18;
uint8_t addr6D82;

std::string s;
unsigned int ifdepth = 0;


void Code22D4();

void Code231A();

void Code2360();

void Code23DF();

void Code2751();

void Code299B();

void Code27AF();

void Code2908();

void Code2950();

void Code324F();

void Code3317();

void Code1C12();

void InterpretVariableRead(std::string &str, int addr);

void InterpretVariableWrite(std::string &str, unsigned short addr);

void ShowMessage(const char *name) {
    printf("%s", name);
}

std::string IntToHex(int i, int length) {
    char x[16];

    if (length == 2) sprintf(x, "0x%02x", i);
    if (length == 4) sprintf(x, "0x%04x", i);
    else sprintf(x, "0x%x", i);

    return std::string(x);
}

uint8_t *mem;
uint8_t accesspattern[0x10000];
// |= 1 zugegriffen
// |= 2 start
// |= 4 label
// |= 8 labelret
// |= 16 endif

void AnalyzeSpecial() {
    addr6976 = 0x7600;

//diskb1
//for(int i=0; i<799; i++)
//diskc1
//for(int i=0; i<622; i++)
//diskb1

    for (int i = 0; i < 1; i++) {
        printf("step %i\n", i);
        Code1C12();
    }
}

// --------------------------------------------------------------------------
// Code1D17
void ReadNext() {
    accesspattern[addr6976] |= 1;
    addr6964 = mem[addr6976];
    addr6976++;
}

// --------------------------------------------------------------------------

void Init(unsigned char *newmem) {

    for (int i = 0; i < 0x10000; i++) {
        accesspattern[i] = 0;
    }


    mem = newmem;
    addr695D = mem[0x695D];
    addr6963 = mem[0x6963];

    addr6964 = mem[0x6964];        // last read token

    addr6974 = mem[0x6974];

    addr6976 = mem[0x6976] | (mem[0x6976 + 1] << 8);     // current address in byte code

    addr6978 = mem[0x6978];
    addr6980 = mem[0x6980];
    addr6982 = mem[0x6982];

    addr697A = mem[0x697A];
    addr697E = mem[0x697E];

    addr6984 = mem[0x6984];
    addr6986 = mem[0x6986];
    addr6988 = mem[0x6988];
    addr698A = mem[0x698A];

    addr698C = mem[0x698C];
    addr698E = mem[0x698E];
    addr6990 = mem[0x6990];
    addr6992 = mem[0x6992];
    addr6994 = mem[0x6994];
    addr6996 = mem[0x6996];
    addr6998 = mem[0x6998];
    addr699A = mem[0x699A];
    addr699F = mem[0x699F];
/*
TODO
printf((std::string("695D ") + addr695D).c_str());
printf((std::string("6963 ") + addr6963).c_str());

printf((std::string("6978 ") + addr6978).c_str());
printf((std::string("6980 ") + addr6980).c_str());
printf((std::string("6982 ") + addr6982).c_str());

printf((std::string("6984 ") + addr6984).c_str());
printf((std::string("6986 ") + addr6986).c_str());
printf((std::string("6988 ") + addr6988).c_str());
printf((std::string("698A ") + addr698A).c_str());

printf((std::string("697A ") + addr697A).c_str());
printf((std::string("697E ") + addr697E).c_str());

printf((std::string("698C ") + addr698C).c_str());
printf((std::string("698E ") + addr698E).c_str());
printf((std::string("6990 ") + addr6990).c_str());
printf((std::string("6992 ") + addr6992).c_str());
printf((std::string("6994 ") + addr6994).c_str());
printf((std::string("6996 ") + addr6996).c_str());
printf((std::string("6998 ") + addr6998).c_str());
printf((std::string("699A ") + addr699A).c_str());
printf((std::string("699F ") + addr699F).c_str());
*/
//addr69A9 = mem[0x69A9];
    addr69B9 = mem[0x69B9];
//addr69B1 = mem[0x69B1];

    addr69A5 = mem[0x69A5];
    addr697C = mem[0x697C];
    addr70FB = mem[0x70FB];

    addr69A3 = mem[0x69A3]; //gelesen //stack pointer

    addr69A7 = mem[0x69A7];
    addr69AB = mem[0x69AB];
    addr69AD = mem[0x69AD];
    addr69AF = mem[0x69AF];

    addr69B3 = mem[0x69B3] + (mem[0x69B3 + 1] << 8);
/*
TODO
printf(std::string("69A5 ") + addr69A5);

printf(std::string("697C ") + addr697C);

printf(std::string("69A7 ") + addr69A7);
printf(std::string("69AB ") + addr69AB);
printf(std::string("69AD ") + addr69AD);
printf(std::string("69AF ") + addr69AF);

printf(std::string("69B3 ") + addr69B3);
*/
// chars
    addr6D51 = mem[0x6D51];
    addr6D98 = mem[0x6D98];
    addr6D81 = mem[0x6D81];
    addr6D93 = mem[0x6D93];
    addr6D97 = mem[0x6D97];
    addr6D18 = mem[0x6D18];
    addr6D82 = mem[0x6D82];
}

// --------------------------------------------------------------------------

void Code2A15() {
    //addr69A9 = addr6976;

    //printf("%i Read 2A21 at %s value: %s\n", number, IntToHex(addr6976, 4).c_str(), IntToHex(mem[addr6976], 2).c_str());

    ReadNext();
    if (
            (addr6964 == 0xE0) ||        // last read token
            (addr6964 == 0xE1) ||
            (addr6964 == 0xE3) ||
            (addr6964 == 0xE6) ||
            (addr6964 == 0xEA) ||
            (addr6964 == 0xC1)
            ) {
        addr6976 += 2;
        return;
    }
    if (addr6964 == 0xC0) {
        addr6976++;
        return;
    }
    //printf("unknown token 0x%02x at 0x%04x\n", addr6964, addr6976);
    //exit(1);

    return;
}

static int lastvariable = -1;


void InterpretVariableWrite(std::string &str, unsigned short addr) {
    int x = mem[addr];

    if (x == 0x80) {
        str += "command";
        lastvariable = 28;
    } else if (x == 0x81) {
        str += "object1";
        lastvariable = 29;
    } else if (x == 0x82) {
        str += "object2";
        lastvariable = 30;
    } else if (x == 0x83) {
        str += "roomnumber";
        lastvariable = 31;
    } else if (x == 0x84) {
        str += "addr6963";
        lastvariable = 32;
    } else if (x == 0x90) {
        str += "addr698C";
        lastvariable = 33;
    } else if (x == 0x91) {
        str += "addr698E";
        lastvariable = 34;
    } else if (x == 0x92) {
        str += "textoutput";
        lastvariable = 35;
    } else   //addr6990
    if (x == 0x93) {
        str += "addr6992";
        lastvariable = 36;
    } else if (x == 0x94) {
        str += "addr6994";
        lastvariable = 37;
    } else if (x == 0x95) {
        str += "addr6996";
        lastvariable = 38;
    } else if (x == 0x96) {
        str += "addr6998";
        lastvariable = 39;
    } else if (x == 0x97) {
        str += "addr699A";
        lastvariable = 40;
    } else if (x == 0xA0) {
        str += "north";
        lastvariable = 41;
    } else if (x == 0xA1) {
        str += "east";
        lastvariable = 42;
    } else if (x == 0xA2) {
        str += "south";
        lastvariable = 43;
    } else if (x == 0xA3) {
        str += "west";
        lastvariable = 44;
    } else if (x == 0xA4) {
        str += "up";
        lastvariable = 45;
    } else if (x == 0xA5) {
        str += "down";
        lastvariable = 46;
    } else if (x == 0xA6) {
        str += "objectposition";
        lastvariable = 47;
    } else if (x == 0xA7) {
        str += "objectstatus";
        lastvariable = 48;
    } else if (x == 0xA8) {
        str += "visited";  //visited
        lastvariable = 49;
    } else if (x == 0xB0) {
        str += "points";
        lastvariable = 50;
    } else if (x == 0xB1) {
        str += "objectdescription";
        lastvariable = 51;
    } else
//	if (x == 0xB2) str += "tab12"; else
    {
        ShowMessage("Not found - 2");
        exit(1);
    }
}


void InterpretVariableRead(std::string &str, int addr) {
    int x = mem[addr];

    if (x == 0x80) {
        str += "command";  // addr6986
        lastvariable = 1;
    } else if (x == 0x81) {
        str += "object1";
        lastvariable = 2;
    } else  //addr6988;
    if (x == 0x82) {
        str += "object2";
        lastvariable = 3;
    } else //addr698A
    if (x == 0x83) {
        str += "roomnumber";
        lastvariable = 4;
    } else //addr695D
    if (x == 0x84) {
        str += "addr6963";
        lastvariable = 5;
    } else if (x == 0x90) {
        str += "addr698C";
        lastvariable = 6;
    } else if (x == 0x91) {
        str += "addr698E";
        lastvariable = 7;
    } else if (x == 0x92) {
        str += "textoutput";
        lastvariable = 8;
    } else if (x == 0x93) {
        str += "addr6992";
        lastvariable = 9;
    } else if (x == 0x94) {
        str += "addr6994";
        lastvariable = 10;
    } else if (x == 0x95) {
        str += "addr6996";
        lastvariable = 11;
    } else if (x == 0x96) {
        str += "addr6998";
        lastvariable = 12;
    } else if (x == 0x97) {
        str += "addr699A";
        lastvariable = 13;
    } else if (x == 0x98) {
        str += "addr6990";
        lastvariable = 14;
    } else if (x == 0xA0) {
        str += "north";
        lastvariable = 15;
    } else    //0x6DAA
    if (x == 0xA1) {
        str += "east";    //0x6EE2
        lastvariable = 16;
    } else if (x == 0xA2) {
        str += "south";
        lastvariable = 17;
    } else    //0x6E12
    if (x == 0xA3) {
        str += "west";
        lastvariable = 18;
    } else    //0x6E7A
    if (x == 0xA4) {
        str += "up";
        lastvariable = 19;
    } else    //0x6F4A
    if (x == 0xA5) {
        str += "down";
        lastvariable = 20;
    } else    //0x6FB2
    if (x == 0xA6) {
        str += "objectposition";
        lastvariable = 21;
    } else    //0x6C5E
    if (x == 0xA7) {
        str += "objectstatus";
        lastvariable = 22;
    } else    //0x6D04
    if (x == 0xA8) {
        str += "visited";
        lastvariable = 23;
    } else    //0x7027

//tab 10, 11, 12 sind unsigned short

    if (x == 0xB0) {
        str += "points";
        lastvariable = 24;
    } else    //0x6B12
    if (x == 0xB1) {
        str += "objectdescription";
        lastvariable = 25;
    } else    //0x69C6
    if (x == 0xC0) {
        int number = mem[addr6976 + 1];

        if (lastvariable == 1) //COMMAND
        {
            str += commandnames[number];
        } else if (
                ((lastvariable == 2) && (number < 0xA7)) ||
                ((lastvariable == 3) && (number < 0xA7)) ||
                (lastvariable == 29) ||
                (lastvariable == 30) ||
                (lastvariable == 48) ||
                (lastvariable == 51) ||
                (lastvariable == 25) ||
                (lastvariable == 22) ||
                (lastvariable == 47) ||
                (lastvariable == 21)
                ) {
            str += objectnames[number];
        } else
            str += "0x" + IntToHex(number, 2);

        lastvariable = 26;
    } else if (x == 0xC1) {
        int number = mem[addr6976 + 1] + (mem[addr6976 + 2] << 8);
        str += "0x" + IntToHex(number, 4);
        lastvariable = 27;
    } else {
        ShowMessage("Not found");
        exit(1);
    }

}

//Lade bestimmte Variable in 697C, oder aus Tabelle (Index auch in 697C)
//, oder nachfolgende Zahl
void Code1E8C() {
    /*
    printf(std::string(number) + std::string(" Read 1E8C at ") + IntToHex(addr6976, 4) + " value: " +
           IntToHex(mem[addr6976], 2));
    */
    //printf("%i Read 1E8C at %s value: %s\n", number, IntToHex(addr6976, 4).c_str(), IntToHex(mem[addr6976], 2).c_str());
    ReadNext();

    if ((addr6964 == 0xC0) || (addr6964 == 0xC1)) {}

    addr70FB = addr6964;
    addr6984 = addr70FB - 0x70;
    addr70FB = addr6984 >> 4;
    addr6984 = addr70FB & 0xFF;

    if (addr6984 == 1) goto mem1F4C;
    if (addr6984 == 2) goto mem1F82;
    if (addr6984 == 3) goto mem1FCD;
    if (addr6984 == 4) goto mem201F;
    if (addr6984 == 5) goto mem2047;

    ShowMessage("Error 0");
    addr6974 = 0;
    exit(1); //jump23A1

    mem1F4C:

    if ((addr6964 - 0x7F) == 1) //goto mem2068;
    {
        addr697C = addr6986;
        return;
    }
    if ((addr6964 - 0x7F) == 2) //goto mem2075;
    {
        addr697C = addr6988;

        return;
    }
    if ((addr6964 - 0x7F) == 3) //goto mem2082;
    {
        addr697C = addr698A;
        return;
    }
    if ((addr6964 - 0x7F) == 4) //goto mem208F;
    {
        addr697C = addr695D;
        return;
    }
    if ((addr6964 - 0x7F) == 5) //goto mem209B;
    {
        addr697C = addr6963;
        return;
    }
    addr6974 = 1;
    exit(1); //jump23A1;

    mem1F82:

    if ((addr6964 - 0x8F) == 1) //goto mem20A7;  // 90
    {
        addr697C = addr698C;
        return;
    }
    if ((addr6964 - 0x8F) == 2) //goto mem20B4;    //91
    {
        addr697C = addr698E;
        return;
    }

    if ((addr6964 - 0x8F) == 3) //goto mem20C1;
    {
        addr697C = addr6990;
        return;
    }

    if ((addr6964 - 0x8F) == 4) //goto mem20CE;
    {
        addr697C = addr6992;
        return;
    }

    if ((addr6964 - 0x8F) == 5) //goto mem20DB;
    {
        addr697C = addr6994;
        return;
    }

    if ((addr6964 - 0x8F) == 6) //goto mem20E8;
    {
        addr697C = addr6996;

        return;
    }

    if ((addr6964 - 0x8F) == 7) //goto mem20F5;
    {
        addr697C = addr6998;
        return;
    }

    if ((addr6964 - 0x8F) == 8) //goto mem2102;
    {
        addr697C = addr699A;
        return;
    }

    addr6974 = 1;
    exit(1); //jump23A1;

    mem1FCD:

    if ((addr6964 - 0x9F) == 1) // goto mem210F;
    {
        Code22D4();
        addr697C = mem[0x6DAA + addr697C];
        return;
    }

    if ((addr6964 - 0x9F) == 2) //goto mem212E;
    {
        Code22D4();
        addr697C = mem[0x6EE2 + addr697C];
        return;
    }
    if ((addr6964 - 0x9F) == 3) //goto mem214D;
    {
        Code22D4();
        addr697C = mem[0x6E12 + addr697C];
        return;
    }
    if ((addr6964 - 0x9F) == 4) //goto mem216C;
    {
        Code22D4();
        addr697C = mem[0x6E7A + addr697C];
        return;
    }

    if ((addr6964 - 0x9F) == 5) //goto mem218B;
    {
        Code22D4();
        addr697C = mem[0x6F4A + addr697C];
        return;
    }

    if ((addr6964 - 0x9F) == 6) //goto mem21AA;
    {
        Code22D4();
        addr697C = mem[0x6FB2 + addr697C];
        return;
    }

    if ((addr6964 - 0x9F) == 7) //goto mem21C9;
    {
        Code231A();
        addr697C = mem[0x6C5E + addr697C];
        return;
    }

    if ((addr6964 - 0x9F) == 8) //goto mem21E8;
    {
        Code231A();
        addr697C = mem[0x6D04 + addr697C];
        return;
    }

    if ((addr6964 - 0x9F) == 9) //goto mem2207;
    {
        Code22D4();
        addr697C = mem[0x7027 + addr697C];
        return;
    }


    addr6974 = 1;
    exit(1); //jump23A1;

    mem201F:

    if ((addr6964 - 0xAF) == 1) //goto mem2226;
    {
        Code231A();
        addr697C = mem[0x6B12 + addr697C * 2] | (((unsigned short) mem[0x6B12 + addr697C * 2 + 1]) << 8);
        return;
    }

    if ((addr6964 - 0xAF) == 2) //goto mem224B;
    {
        Code231A();
        addr697C = mem[0x69C6 + addr697C * 2] | (((unsigned short) mem[0x69C6 + addr697C * 2 + 1]) << 8);
        return;

    }

    if ((addr6964 - 0xAF) == 3) //goto mem2270;
    {
        Code2360();
        addr697C = mem[addr697C];
        return;
    }

    addr6974 = 1;
    exit(1); //jump23A1;

    mem2047:

    if ((addr6964 - 0xBF) == 1) //goto mem228A;
    {
        /*
            TODO
            printf(std::string(number) + std::string(" Read 228A at ") + IntToHex(addr6976, 4) + " value: " + IntToHex(mem[addr6976], 2));
            */
        ReadNext();
        addr697C = addr6964;
        return;
    }

    // read 16 bit value
    if ((addr6964 - 0xBF) == 2) //goto mem2299;
    {
        ReadNext();
        addr697C = addr6964;
        ReadNext();
        addr70FB = addr6964 << 8;
        addr697C = addr697C + addr70FB;
        return;
    }
    addr6974 = 1;
//printf("Error 1\n");
//ShowMessage("Error 1 - 1");
    exit(1); //jump23A1;

//diese 16Bit werden right geshiftet (rotiert) um 4
}

// --------------------------------------------------------------------------

// Test auf Arraygröße für Raumnummer
void Code22D4() {
    s += "[";
    InterpretVariableRead(s, addr6976);
    s += "]";

    Code1E8C();

    //Carry Flag auf jeden Fall 1
    addr70FB = 0xFF;

    if ((addr697C >= 0) && (addr697C <= 0x68)) {
        return;
    }
//	printf("Error 3\n");
    ShowMessage("Error 3\n");

    exit(1);
}

// Test auf Arraygröße für Objektnummer
void Code231A() {
    s += "[";
    InterpretVariableRead(s, addr6976);
    s += "]";

    Code1E8C();
    //Carry Flag auf jeden Fall 1
    addr70FB = 0xFF;

    if ((addr697C >= 0) && (addr697C <= 0xA6)) {
        return;
    }
//	printf("Error 4\n");
    ShowMessage("Error 4\n");

    exit(1);
}

void Code2360() {
    Code1E8C();
//	printf("Soweit sollte es niemals kommen\n");
    ShowMessage("Soweit sollte es niemals kommen\n");
    exit(1);
}

void Write(std::string s) {
    if (ifdepth > 0) {
        for (int i = 0; i < ifdepth; i++) {
            s = std::string("	") + s;
        }
    }
    printf("%s\n", s.c_str());
}

void Code1C12() {
#ifdef SPECIAL
    bool first = true;
#endif

    mem1C12:
    ReadNext();

    mem1C15:
    /*
    if (addr6964 == 0xFF) {
        printf("exit\n");
        exit(1);
    }
*/
#ifdef SPECIAL
    if (!first) {
        addr6976--;
        return;
    }
#endif

//	if (mem[addr6976-1] > 0x7F)
//	if (mem[addr6976-1] < 0xC0)
    if
            (
            (mem[addr6976 - 1] != 0xD0) &&    // IF
            (mem[addr6976 - 1] != 0xD2) &&    // ELSE
            (mem[addr6976 - 1] != 0xD3) &&    // ENDIF
            (mem[addr6976 - 1] != 0xE7) &&    // RETURN FROM SUB
            (mem[addr6976 - 1] != 0xEF) &&    // SOMETHING SPECIAL
            (mem[addr6976 - 1] != 0xE0) &&    // GOSUB
            (mem[addr6976 - 1] != 0xE1) &&    // GOTO
            (mem[addr6976 - 1] != 0xE2) &&    // SELECT CASE
            (mem[addr6976 - 1] != 0x92)       // set variable
            ) {
        s = std::string("//Command ") + IntToHex(mem[addr6976 - 1], 2) + " at " + IntToHex(addr6976 - 1, 4);
        Write(s);
    }
    s = "";
    printf("\n");
    //printf("%i Read 1C12 at %s value: %s\n", number, IntToHex(addr6976 - 1, 4).c_str(), IntToHex(mem[addr6976 - 1], 2).c_str());
    /*
    printf(std::string(number) + std::string(" Read 1C12 at ") + IntToHex(addr6976 - 1, 4) + " value: " +
           IntToHex(mem[addr6976 - 1], 2));
*/

#ifdef SPECIAL
    first = false;
#endif

//		s = std::string("mem") + IntToHex(addr6976-1, 4) + ":";
//		Write(s);

    if ((accesspattern[addr6976 - 1] & 4) != 0) {
        s = "";
        Write(s);
        s = std::string("mem") + IntToHex(addr6976 - 1, 4) + ":";
        Write(s);
    }
    if ((accesspattern[addr6976 - 1] & 8) != 0) {
        s = "";
        Write(s);
        s = std::string("mem") + IntToHex(addr6976 - 1, 4) + "ret:";
        Write(s);
    }

    accesspattern[addr6976 - 1] |= 2;

    if (addr6964 == 0xFF) //goto mem1D69;
    {
//		printf("Error I think\n");
        ShowMessage("Error?\n");

        exit(1);
    }

    if (addr6964 > 0x7F)
        if (addr6964 < 0xC0) {
            goto mem1D8B;
        }

    if (0xD0 > addr6964) {
        //		printf("Error 2\n");
        ShowMessage("Error 2 - 1");

        exit(1);
    }

    mem1C64:
    if ((addr6964 - 0xCF) == 1) goto mem2AD7;        //D0
    if ((addr6964 - 0xCF) == 2) //goto mem2B71;   //D1
    {
        addr6974 = 2;
//		printf("Error number 2\n");
        ShowMessage("Error number 2\n");

        exit(1);
    }
    if ((addr6964 - 0xCF) == 3) //goto mem2B7E;   //D2
    {
        ifdepth--;
        s = "}";
        Write(s);
        s = "else";
        Write(s);
        s = "{";
        Write(s);
        ifdepth++;

#ifdef SPECIAL
        goto mem1C12;
#endif

        addr69A5 = 0;
        Code2A15();

        //	mem2AF8:

        if (addr6964 == 0xD0) {

            addr69A5++;
            //goto mem2AF8;
//			goto mem2AF8;
        }

        if (addr6964 == 0xD3) {
            addr69A5--;
        }

        if (addr69A5 != 0xFFFF) {
            goto mem2AF8;
//			Code2A15();
        }

        ShowMessage("don't know ??");
        exit(1);

        goto mem1C12;

    }

    if ((addr6964 - 0xCF) == 4) // mem2BCC;     //D3
    {
        ifdepth--;
//		s = "} // end if";
        s = "}";
        Write(s);
        s = "";
        Write(s);
        goto mem1C12;
    }

    if ((addr6964 - 0xCF) >= 5) // D4
        if ((addr6964 - 0xCF) <= 0xA) // D9
        {
            //	printf("Error 2\n");
            ShowMessage("Error 2 - 2\n");

            exit(1);
        }

    mem1CB0:

    if ((addr6964 - 0xD9) >= 1) // DA
        if ((addr6964 - 0xD9) <= 6) // DF
        {
//		printf("Error 2\n");
            ShowMessage("Error 2 - 3\n");

            exit(1);
        }

    if ((addr6964 - 0xD9) == 7) //goto mem2BDC; // E0
    {
        s = "  gosub mem";

        //	printf("not handled 3\n");
//		ShowMessage("not handled 3\n");

//		exit(1);
        ReadNext();
        addr69AB = addr6964;
        ReadNext();
        addr69AD = addr6964;

        addr69A5 = addr6976;
        accesspattern[addr6976] |= 8;
        Code2908();   // to stack
//		addr70FC = addr69AB << 8;

//		addr6976 = addr69AB + addr70FB;
#ifdef SPECIAL
        int temp = addr6976;
#endif
        addr6976 = addr69AB + (addr69AD << 8);
        s += IntToHex(addr6976, 4) + ";";
        Write(s);

        accesspattern[addr6976] |= 4;

#ifdef SPECIAL
        addr6976 = temp;
#endif

        goto mem1C12;
    }

    if ((addr6964 - 0xD9) == 8) //goto mem2C28; // E1
    {
        ReadNext();
        addr69AB = addr6964;   // lo byte
        ReadNext();
        addr69AD = addr6964;
        addr70FB = addr69AD << 8; // hi byte

#ifdef SPECIAL
        int temp = addr6976;
#endif

        addr6976 = addr69AB + addr70FB; //addition ist eigentlich sinnlos
        s = std::string("") + "goto mem" + IntToHex(addr6976, 4) + ";";
        accesspattern[addr6976] |= 4;
        Write(s);
#ifdef SPECIAL
        addr6976 = temp;
#endif


        goto mem1C12;
    }

    if ((addr6964 - 0xD9) == 9) //goto mem2C65; // E2 //select case anwendung
    {
        s = "";
        s += "switch(";
        InterpretVariableRead(s, addr6976);
        s += ")";
        Write(s);


        Code1E8C();
        addr69AF = addr697C;
        unsigned short int addr69B1 = 1;

        while (true) {
//		printf(std::string(number) + std::string(" Read 2C7E at ") + IntToHex(addr6976, 4) + " value: " + IntToHex(mem[addr6976], 2));
            ReadNext();


            if (addr6964 != 0xEA) {
#ifdef SPECIAL
                accesspattern[addr6976 - 1] |= 8;
#endif
                goto mem1C15;
            }
            s = std::string(" case ") + std::to_string(addr69B1) + ": gosub mem" +
                IntToHex(mem[addr6976] + (mem[addr6976 + 1] << 8), 4);
            Write(s);

            accesspattern[mem[addr6976] + (mem[addr6976 + 1] << 8)] |= 4;

#ifndef SPECIAL
            if (addr69AF != addr69B1)
#endif
            {
                addr6976 += 2;
                addr69B1++;
                continue;
            }

            mem2CBD:
            ReadNext();
            addr69AB = addr6964;
            ReadNext();
            addr69AD = addr6964;
            mem2CD9:
            addr70FB = mem[addr6976];
            if (addr70FB == 0xEA) {
                addr6976 += 3;
                goto mem2CD9;
            }

            mem2D08:
            addr69A5 = addr6976;
            // send to stack the position after the switch/case
            accesspattern[addr6976] |= 8;

            Code2908();

            addr70FB = addr69AD << 8;
            addr6976 = addr69AB + addr70FB;
            goto mem1C12;
        }
    }

    if ((addr6964 - 0xD9) == 0xA) // mem2D38; // E3
    {
        Code1E8C();
//		printf("dont know how to handle");
        ShowMessage("dont know how to handle\n");
    }

    mem1CFC:

    if ((addr6964 - 0xE3) == 1) //goto mem2D4E;	//E4
    {

        s = "addr699F = mem[addr69B3];";
        Write(s);
        s = "addr69B3++;";
        Write(s);
        s = "";

        addr699F = mem[addr69B3];
        addr69B3++;
        Code2751();

        goto mem1C12;
//		printf(" not handles 2\n");
        ShowMessage("not handles 2 - 1\n");
        exit(1);

    }

    if ((addr6964 - 0xE3) == 2) //goto mem2D72;  //E5
    {
//		s = "wichtig?";
//		printf(s);
//		Memo2->Lines->Add(s);
        s = "addr699F = mem[addr69B3] + (mem[addr69B3+1] << 8);";
        Write(s);
        s = "addr69B3 += 2;";
        Write(s);
        s = "";

//		printf(" not handles 2\n");
//         hier nochmal �berpr�fen, insbesondere die funktion

        printf("lese: 0x%04x\n", addr69B3);

        //addr70FB = mem[addr69B3];
        //addr7100 = mem[addr69B3+1];
        addr699F = mem[addr69B3] + (mem[addr69B3 + 1] << 8);
        addr69B3 += 2;
        Code2751();

        goto mem1C12;
    }
    if ((addr6964 - 0xE3) == 3) //goto mem2DD8; // E6
    {
        s = "addr69B3 = 0x" + IntToHex(mem[addr6976] + (mem[addr6976 + 1] << 8), 4);
        Write(s);
        ReadNext();
        addr69AB = addr6964 & 0xFF;
        ReadNext();
        addr69AD = addr6964 & 0xFF;

//		addr70FC = 0;
        addr70FB = addr69AD << 8;

        addr69B3 = addr69AB + addr70FB;
        goto mem1C12;
    }

    if ((addr6964 - 0xE3) == 4) /*goto mem2E15;*/   //E7
    {
        s = "return; //from sub";
        Write(s);
#ifndef SPECIAL
        if (addr69A3 == 0) return;   //stack pointer

        //get from stack
        Code2950();
        addr6976 = addr69A5;
#endif
        goto mem1C12;
    }

    if ((addr6964 - 0xE3) == 5) /*goto mem2E39;*/ // E8
    {
        //Code3C02();
        s = "Code3C02(); // stelle text dar";
        Write(s);
//    	printf("dont know how to handle\n");
//		ShowMessage("dont know how to handle\n");

        goto mem1C12;
    }

    if ((addr6964 - 0xE3) == 6) /*goto mem2E3F;*/
    {
//		printf("Error DE\n");
        ShowMessage("Error DE\n");

        exit(1);
    }
    if ((addr6964 - 0xE3) == 7) //goto mem2E3F; //EA
    {
//		printf("Error DE\n");
        ShowMessage("Error DE\n");
        exit(1);
    }

    if ((addr6964 - 0xE3) == 8) /*goto mem2E4C;*/ //EB
    {
        //Code4087();
//		printf("Dont know\n");
        //ShowMessage("dont know\n");
        s = "Code4087()";
        Write(s);

        goto mem1C12;
    }
    if ((addr6964 - 0xE3) == 9) /*goto mem2E52;*/
    {
        goto mem1C12;
    }
    if ((addr6964 - 0xE3) == 0xA) /*goto mem2E55; */ //ED
    {
        s = "Code2E5B()";
        Write(s);

//		Code2E5B();
//		printf("not handled\n");
//		ShowMessage("not handled - 1\n");
//		exit(1);
        goto mem1C12;
    }

    mem1D48:
    if ((addr6964 - 0xED) == 1) /*goto mem2FA2; */    //EE
    {
//		printf("Dont know\n");
        //ShowMessage("dont know\n");

        //exit(1);
        s = "CodeCDB()";

        Write(s);
        goto mem1C12;

    }

    if ((addr6964 - 0xED) == 2) /*goto mem2FAB;*/ //EF
    {
        s = "";
        InterpretVariableRead(s, addr6976);

//		printf(std::string("EF:  setting addr6992 to 1 or 0 ???") + s);
        Write(std::string("//EF:  setting addr6992 to 1 or 0 ???") + s);

        Code1E8C();

        addr69B9 = addr697C;

        if (addr69B9 < 0x64) //oder gr�sser
        {
            //Code36B3(); // jump
            s = "Code36B3() //jump";
            Write(s);
//			ShowMessage("really strange1");
            //exit(1);
//			goto mem36B3;
        }
        if (addr69B9 < 0xC8) //oder gr�sser
        {
//			goto mem2FF4;

            addr70FB = addr69B9 - 0x63;
//			ShowMessage(std::string("addr70FB ") + addr70FB);



            if (addr70FB == 1)  // 0x64
            {
                //s = "not handled - 0x64!!!";
                s = "Code305C();";
                Write(s);

//			ShowMessage("not handled - 2");
//			exit(1);

//				Code305C();
            }
            if (addr70FB == 2)  // 0x65
            {
//			ShowMessage("not handled - 2");
//			exit(1);
//			s = "not handled - 0x65!!!";
                s = "Code31AB();";
                Write(s);
//				Code31AB();
            }
            if (addr70FB == 3)  // 0x66
            {
                s = "Code324F();";
                Write(s);
                Code324F();
            }
            if (addr70FB == 4)  //0x//
            {
                s = "Code3317();";
                Write(s);
                Code3317();
            }
            if (addr70FB == 5) {
//			ShowMessage("not handled - 2");
//			exit(1);
//			s = "not handled - 0x68!!!";
                s = "Code33DA();";
                Write(s);

//				Code33DA();
            }
            if (addr70FB == 6) {
//			ShowMessage("not handled - 2");
//			exit(1);
//			s = "not handled - 0x69!!!";
                s = "Code347E();";
                Write(s);

//				Code347E();
            }
            if (addr70FB == 7) {
//			ShowMessage("not handled - 2");
//			exit(1);
//			s = "not handled - 0x70!!!";
                s = "Code35BB();";
                Write(s);

//				Code35BB();
            }
            if (addr70FB == 8)  //0x71
            {
//			ShowMessage("not handled - 2");
//			s = "not handled - 0x71!!!";
                s = "Code362D()";
                Write(s);

//			exit(1);
//				Code362D();
            }
            if (addr70FB == 9) {
//			s = "not handled - 0x72!!!";
                s = "Code364C();";
                Write(s);

//			ShowMessage("not handled - 2");
//			exit(1);
//				Code364C();
            }


            goto mem1C12;

/*
			printf("Error???\n");
			ShowMessage("Error???");
			exit(1);
*/
        }

        addr6974 = 2;
        printf("Error number 2\n");
        exit(1);

    }


    mem1D8B:

    s = "";
    InterpretVariableWrite(s, addr6976 - 1);

    addr6978 = addr6964;
    addr697A = 0xFFFF;

    // if target is a table
    if (addr6978 >= 0xA0) {
        s = s + "[";
        InterpretVariableRead(s, addr6976);
        s = s + "]";
        Code1E8C();
        addr697A = addr697C;
    }

    s += " = ";

//mem1DBE:
    InterpretVariableRead(s, addr6976);
    Code1E8C();
    //printf(std::string(number) + std::string(" Read 1DC1 at ") + IntToHex(addr6976, 4) + " value: " + IntToHex(mem[addr6976], 2));
    //printf("%i Read 1DC1 at %s value: %s\n", number, IntToHex(addr6976, 4).c_str(), IntToHex(mem[addr6976], 2).c_str());
    ReadNext();

    if (addr6964 == 0xD7) {
        addr697E = addr6978;
        addr6980 = addr697A;
        Code23DF();
        Write(s);
        goto mem1C12;
    }

    if (addr6964 == 0xD5) {
        addr6982 = addr697C;
        s += " + ";
        InterpretVariableRead(s, addr6976);
        Code1E8C();

        addr697C = addr697C + addr6982;
        addr697E = addr6978;
        addr6980 = addr697A;
        Code23DF();
        Write(s);
        goto mem1C12;

    }

    if (addr6964 == 0xD6) {
        addr6982 = addr697C;
        s += " - ";
        InterpretVariableRead(s, addr6976);
        Code1E8C();

        addr697C = addr6982 - addr697C;
        addr697E = addr6978;
        addr6980 = addr697A;
        Code23DF();
        Write(s);
    }

    goto mem1C12;

    //ShowMessage("hier fehlt was 2");
    return;

    mem2AD7:   // D0   // if then

    s = "if (";
    Code299B();
//	ShowMessage(addr6974);
    s += ")";
    Write(s);
    s = "{";
    Write(s);
    ifdepth++;


#ifdef SPECIAL
    goto mem1C12;
#endif


    if (addr6974 != 0) goto mem1C12;

    addr69A5 = 0;

    mem2AF8:
    while (true) {
        // einen Schritt weitergehen
        Code2A15();

        //weitere if Abfrage
        if (addr6964 == 0xD0) {
            addr69A5++;
            continue;
        }

//2B10:
        //if abfrage endet
        if (addr6964 == 0xD3) {
            addr69A5--;
        }


        if ((addr6964 == 0xD2) && (addr69A5 == 0)) //???
        {
            s = "} //End if 2";
            Write(s);
            s = "";
            Write(s);

//		accesspatttern[addr6976] |= 16;
            goto mem1C12;
        } else {
            if (addr69A5 != 0xFFFF) continue;
            s = "} // end if 3";
            Write(s);
            s = "";
            Write(s);

//		accesspatttern[addr6976] |= 16;
            goto mem1C12;
        }

// ---


    }

//	printf("Hier fehlt evtl etwas\n");
    ShowMessage("Hier fehlt evtl etwas\n");

    exit(1);

}

// -----------------------------------
// something like stack
void Code2908() {
    if (addr69A3 == 0x14) //stack pointer
    {
//			printf("Error 9\n");
        ShowMessage("Error 9\n");

        exit(1);
        //addr6974 = 9;
        //addr6975 = 0;
//			goto mem23A1;
    }
    mem[0x708F + addr69A3 * 2] = addr69A5 & 0xFF;
    mem[0x708F + addr69A3 * 2 + 1] = addr69A5 >> 8;

    addr69A3++;

}

// -----------------------------------

void Code299B() {
    Code27AF();

    while (true) {
        //printf(std::string(std::string(number) + " Read 299E at ") + IntToHex(addr6976, 4) + " value: " + IntToHex(mem[addr6976], 2));
        //printf("%i Read 299E at %s value: %s\n", number, IntToHex(addr6976, 4).c_str(), IntToHex(mem[addr6976], 2).c_str());

        ReadNext();
        if (addr6964 == 0xD1) return;

        if (addr6964 == 0xD8) {
            addr69A7 = addr6974;
            s = s + " && ";
            Code27AF();
//		printf(std::string("and ") + std::string(addr6974));
//		ShowMessage("and " + std::string(addr6974));

            addr6974 = addr6974 & addr69A7;
            continue;
        }

        if (addr6964 != 0xD9) {
//		printf ("Error 7\n");
            ShowMessage("Error 7\n");

            exit(1);
        }

        addr69A7 = addr6974;
        s = s + " || ";
        Code27AF();
//	ShowMessage("or " + std::string(addr6974));
//	printf(std::string("or ") + std::string(addr6974));

        addr6974 = addr6974 | addr69A7;
    }

}

void Code27AF() {

    s += "(";
    InterpretVariableRead(s, addr6976);
    Code1E8C();
    addr6982 = addr697C;

    //printf(std::string(number) + std::string(" Read 27BE at ") + IntToHex(addr6976, 4) + " value: " + IntToHex(mem[addr6976], 2));
    //printf("%i Read 27BE at %s value: %s\n", number, IntToHex(addr6976, 4).c_str(), IntToHex(mem[addr6976], 2).c_str());

    ReadNext();

    if (addr6964 == 0xDA) s = s + " > ";
    if (addr6964 == 0xDB) s = s + " < ";
    if (addr6964 == 0xDC) s = s + " == ";
    if (addr6964 == 0xDD) s = s + " != ";
    if (addr6964 == 0xDE) s = s + " >= ";
    if (addr6964 == 0xDF) s = s + " <= ";


    if ((addr6964 < 0xDA) || (addr6964 > 0xDF)) {
//		printf("Error 6\n");
        ShowMessage("Error 6\n");

        exit(1);
    }
    addr6974 = 0;
    addr70FB = addr6964;
    unsigned short addr69A1 = addr70FB - 0xD9;

    InterpretVariableRead(s, addr6976);
    s += ")";

    Code1E8C();


//    printf(std::string("if type ") + addr69A1);
    if ((addr69A1) == 1) // goto mem285C;   // DA
    {
        if (addr697C < addr6982) {
            addr6974 = 1;
        }
        return;
    }
    if ((addr69A1) == 2) //goto mem2878;  // DB
    {
        if (addr697C > addr6982) {
            addr6974 = 1;
        }
        return;

    }
    if ((addr69A1) == 3) //goto mem2894;  // DC
    {
        if (addr697C == addr6982) {
            addr6974 = 1;
        }
        return;

    }
    if ((addr69A1) == 4) //goto mem28B2;  //DD
    {
        if (addr697C != addr6982) {
            addr6974 = 1;
        }
        return;

    }
    if ((addr69A1) == 5) //goto mem28D0;
    {
        if (addr697C <= addr6982) {
            addr6974 = 1;
        }
        return;

    }

    if ((addr69A1) == 6) //goto mem28EC;
    {
        if (addr697C >= addr6982) {
            addr6974 = 1;
        }
        return;

    }

//	printf("Error 0x2350");
    ShowMessage("Error 0x2350\n");

    exit(1);
}

void Code2751() {
    InterpretVariableWrite(s, addr6976);

    ReadNext();
    addr6978 = addr6964;
    addr697A = 0xFFFF;
    if (0xA0 <= addr6978) {
        s = s + "[";
        InterpretVariableRead(s, addr6976);
        s = s + "]";
        Code1E8C();
        addr697A = addr697C;
    }
    addr697C = addr699F;
    addr697E = addr6978;
    addr6980 = addr697A;
    Code23DF();
    s += " = addr699F";
    Write(s);

}

//gegenstueck zu 1E8C
void Code23DF() {

//	0x697E enth�lt befehl bei 1C12 als letztes
    addr6984 = addr697E - 0x70;
    addr70FB = addr6984 >> 4;
    addr6984 = addr70FB & 0xFF;

//	ShowMessage(addr70FB);

    if ((addr70FB & 0xFF) == 1) goto mem245C; // 0x80
    if ((addr70FB & 0xFF) == 2) goto mem24A0; // 0x90
    if ((addr70FB & 0xFF) == 3) goto mem24F9; // 0xA0
    if ((addr70FB & 0xFF) == 4) goto mem2559; // 0xB0

//	addr6974 = 1;
//	printf("Error 1\n");
    ShowMessage("Error 1 - 2");

    exit(1);

    mem245C:

    if ((addr697E - 0x7F) == 1) // mem258F:
    {
        addr6986 = addr697C;
        return;
    }
    if ((addr697E - 0x7F) == 2) // mem259C
    {
        addr6988 = addr697C;
        return;
    }
    if ((addr697E - 0x7F) == 3) // mem25A9
    {
        addr698A = addr697C;
        return;
    }
    if ((addr697E - 0x7F) == 4) // mem25B6
    {
        addr695D = addr697C;
        return;
    }
    if ((addr697E - 0x7F) == 5) // mem25BD
    {
        addr6963 = addr697C;
        return;

    }
//	printf("Error 1\n");
    ShowMessage("Error 1 - 3");

    exit(1);

    mem24A0:
    if ((addr697E - 0x8F) == 1) // mem25C4
    {
        addr698C = addr697C;
        return;
    }
    if ((addr697E - 0x8F) == 2) // mem25D1
    {
        addr698E = addr697C;
        return;
    }
    if ((addr697E - 0x8F) == 3) // mem25DE
    {
        addr6990 = addr697C;
        return;
    }
    if ((addr697E - 0x8F) == 4) // mem25EB
    {
        addr6992 = addr697C;
        return;
    }
    if ((addr697E - 0x8F) == 5) // mem25F8
    {
        addr6994 = addr697C;
        return;
    }
    if ((addr697E - 0x8F) == 6) // mem2605
    {
        addr6996 = addr697C;
        return;
    }
    if ((addr697E - 0x8F) == 7) // mem2612
    {
        addr6998 = addr697C;
        return;
    }
    if ((addr697E - 0x8F) == 8) // mem261F
    {
        addr699A = addr697C;
        return;
    }
//	printf("Error 1\n");
    ShowMessage("Error 1 - 4\n");

    exit(1);

    mem24F9:
    if ((addr697E - 0x9F) == 1) // mem262C, nord tabelle
    {
        mem[0x6DAA + addr6980] = addr697C;
        return;
    }
    if ((addr697E - 0x9F) == 2) // mem2643  ost tabelle
    {
        mem[0x6EE2 + addr6980] = addr697C;
        return;
    }
    if ((addr697E - 0x9F) == 3) // mem265A  sued tabelle
    {
        mem[0x6E12 + addr6980] = addr697C;
        return;
    }
    if ((addr697E - 0x9F) == 4) // mem2671  west tabelle
    {
        mem[0x6E7A + addr6980] = addr697C;
        return;
    }
    if ((addr697E - 0x9F) == 5) // mem2688  up tabelle
    {
        mem[0x6F4A + addr6980] = addr697C;
        return;
    }
    if ((addr697E - 0x9F) == 6) // mem269F  down tabelle
    {
        mem[0x6FB2 + addr6980] = addr697C;
        return;
    }
    if ((addr697E - 0x9F) == 7) // mem26B6   object position tabelle
    {
        mem[0x6C5E + addr6980] = addr697C;
        return;
    }
    if ((addr697E - 0x9F) == 8) // mem26CD   object status tabelle
    {
        mem[0x6D04 + addr6980] = addr697C;
        return;
    }
    if ((addr697E - 0x9F) == 9) // mem26E4
    {
        mem[0x7027 + addr6980] = addr697C;
        return;
    }
//	printf("Error 1\n");
    ShowMessage("Error 1 - 5");

    exit(1);

    mem2559:
    if ((addr697E - 0xAF) == 1) // mem26FB
    {
        mem[0x6B12 + addr6980 * 2] = addr697C & 0xFF;
        mem[0x6B12 + addr6980 * 2 + 1] = addr697C >> 8;
        return;

    }
    if ((addr697E - 0xAF) == 2) // mem271D
    {
        mem[0x69C6 + addr6980 * 2] = addr697C & 0xFF;
        mem[0x69C6 + addr6980 * 2 + 1] = addr697C >> 8;
        return;
    }
    if ((addr697E - 0xAF) == 3) // mem273F
    {
        mem[addr6980] = addr697C;
        return;
    }
//	printf("Error 1\n");
    ShowMessage("Error 1 - 6\n");

    exit(1);

}

// something like stack
void Code2950() {
    if (addr69A3 == 0) {
//		printf("Error 9\n");
        ShowMessage("Error 9\n");

        exit(1);
    }
    addr69A3--;

    addr69A5 = mem[0x708F + addr69A3 * 2];
    addr69A5 |= mem[0x708F + addr69A3 * 2 + 1] << 8;

}

void Code324F() {
    addr6992 = 0;
    if (((addr6986 > 3) && (addr6986 != 0x8)) || ((addr6986 > 0xB) && (addr6986 < 0x13)) || (addr6986 != 0x14) ||
        (addr6986 != 0x16)) {
        addr6992 = 1;
    }

}

void Code36B3() {
//nt addr69B9;
/*
	if (addr69B9 == 0x32)
	{
	   Code62B9();
	   goto mem373B;
	}
	if (addr69B9 == 0x33)
	{
	   goto mem62C9;
	}

	if ((addr69B9 == 0x1)
	{
		Code4B42();
	}

	if ((addr69B9 == 0x3)
	{
		Code477B();
	}

	if ((addr69B9 == 0x4)
	{
		Code5174();
	}

	if ((addr69B9 == 0x5)
	{
		Code5130();
	}

	if ((addr69B9 == 0x6)
	{
		Code4C66();
	}

	if ((addr69B9 == 0x7)
	{
		Code4CDA();
	}

	if ((addr69B9 == 0x8)
	{
		Code4440();
	}

	if ((addr69B9 == 0x9)
	{
		Code52D2();
	}

	if ((addr69B9 == 0xA)
	{
		Code4E62();
	}

	 if (addr69BB == 0)
	 {
		ShowMesage("Was ist das?");
		exit(1);
//		goto mem1C12;

	 }

	 addr69BB = 0;
	 addr69A3 = 0;
*/

}


void Code3317() {
    addr6992 = 0;

    if ((addr6D51 == 0) && (addr6D98 == 0)) {
        addr6992 = 1;
    }

    if ((addr6D81 == 0) && (addr6D93 == 0) && (addr6D97 == 0)) {
        addr6992 = 1;
    }

    if ((addr6D18 == 0) && (addr6D82 == 0)) {
        addr6992 = 1;
    }

}

void Code4C66() {
/*
	mem4C66:
	addr6990 = 0x26

	Code3C02();
	Code5D5A();

	if ((addr6961 == 0x4E) || (addr6961 == 0xC))   //wenn N gedr�ckt wird
	{
		goto mem5269;
	}

	if (addr6961 == 0x45) || (addr6961 == 0x12)) //wenn E gedr�ckt wird
	{
		0xCFF4 = 2
		goto mem381A;
	}

	goto mem4C66;
*/
}

//evtl etwas um die indices auf die disketten anzupassen
void Code3C02() {
/*
	if ((addr6990 != 0) && (addr69B5 == addr6990) )
	{
		mem[addr69B7 + 0x7027] = 1;
		addr695A = 1;
	}

	if (addr6990 == 0) && (addr6958 == 0)
	{
		return;
	}

	if (addr6958 != 0) && (addr6990 != 0x84)
	{
//3ccb:???
		addr5968 = 0;
		addr70FB = addr6959;
		addr6990 = addr70FB -1;
		Code4022();
		goto mem4002;
	}
3CF2:
*/

}
