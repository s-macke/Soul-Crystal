#include<stdio.h>
#include<stdlib.h>
#include"disasm.h"
#include"analyze.h"
#include"c64.h"
#include"output.h"

//bool ramdone[0x10000];
//bool prgdone[0x10000];
//int filesize = 51200;

void LoadIntoRam()
{
    unsigned char ram[0x10000];
    FILE *file;
    file = fopen("../data/nachcodeabfrage.vsf", "rb");
    if (file == NULL)
    {
        printf("Error: Cannot open file\n");
        exit(1);
    }
    fseek(file, 0x80, SEEK_SET);
    int size = fread(ram, 0x10000, 1, file);
    fclose(file);
    for(int i=0; i<0x10000; i++) Write8(i, ram[i]);
}

int main()
{
    LoadIntoRam();
/*
    for(int i=0; i<0x10000-4; i++) {
        if (Read8(i+0) == 0x90) // textoutput referenced
        if (Read8(i+1) == 0x69)
            printf("0x%04x\n", i);
    }
*/

    //printf("non maskable interrupt    0x%04x\n", Read16(0xFFFA)); // non-maskable interrupts
    //printf("interrupt service routine 0x%04x\n", Read16(0xFFFE)); // interrupt service routine
    //return 1;

		/*
    for(int i=0; i<0x10000-4; i++)
    {
        if (ram[i+0] == 0x50)
        if (ram[i+1] == 0xb2)
        if (ram[i+2] == 0xa3)
        if (ram[i+3] == 0xb2)
        {
            printf("tile pointers at 0x%04x\n", i);
        }
        if (ram[i+0] == 0xa0)
        if (ram[i+1] == 0xa0)
        if (ram[i+2] == 0xa0)
        if (ram[i+3] == 0xa0)
        if (ram[i+4] == 0xa0)
        if (ram[i+5] == 0xa0)
        if (ram[i+6] == 0xa0)
        if (ram[i+7] == 0xa0)
        {
            printf("map at 0x%04x\n", i);
        }
    }
    return 1;
    */
    InitAnalyze();

	//DisassembleAnalyze(0x1c12);
	DisassembleAnalyze(0x3a0a);
	DisassembleAnalyze(0x9796);
	DisassembleAnalyze(0x9691);
	DisassembleAnalyze(0x3b94);
	DisassembleAnalyze(0xcb39);
	DisassembleAnalyze(0xcf2f);
	DisassembleAnalyze(0x12e5);
	DisassembleAnalyze(0x0ce8);
	DisassembleAnalyze(0xaa13);
	DisassembleAnalyze(0xa8c6);
	DisassembleAnalyze(0x9be4);
	DisassembleAnalyze(0x9bda);
	DisassembleAnalyze(0x9660);
	DisassembleAnalyze(0xa626);

	/*
	DisassembleAnalyze(0x3b3c);
	DisassembleAnalyze(0x3067);
	DisassembleAnalyze(0xed7f);
	*/
    /*
    DisassembleAnalyze(0xcde2);
    DisassembleAnalyze(0xcea7);
    */
	DisassembleAnalyze(0x984e); // interrrupt ?
	//DisassembleAnalyze(0x9843); // non-maskable interrupt ?
    //DisassembleAnalyze(0xcdaa); // interrrupt
    //DisassembleAnalyze(0x9a32); // non-maskable interrupt
    // f cdda cddc 3a

	DisassembleAnalyze(0x9879); // indirect jump from 0x314
	DisassembleAnalyze(0x9861); // indirect jump from 0x316

	for(int i=0; i<6; i++) {
		//fprintf(stderr, "0x%04x\n", Read16(0xa495+i*2));
		DisassembleAnalyze(Read16(0xa495+i*2));
	}

    FindVariables();

    //DisassembleAnalyze(0x3b56); // maybe the final game
    FindFunctionEnds();
    FindOutsideCalls();

    //FindTailCalls();
    DisassembleOutput();
/*
	for(int j=0; j<0x10000; j++)
	{
		prgdone[j] = false;
		ramdone[j] = false;
	}

	int N = 0;
	for(int i=0x39; i<filesize; i++)
	{
		for(int j=0; j<0x10000; j++)
		//for(int j=0xFFFF; j>=0x0000; j--)
		{
			int n = Test(i, j);
			if (n)
			{
				printf("size:%5i prg: %04X ram: %04X delta:%5i ramend: %04X prgend:%4X next:%5i\n",
				n, i, j, j-i, j+n, i+n,
				prg[i+n-1] + ((int)prg[i+n-2]<<8));

				for(int k=0; k<n; k++)
				{
					//ramdone[j+n] = true;
				}

				i += n-1;
				//j+= n-1;
				N += n;
				goto loopend;
			}
		}
loopend:;
	}
	printf("N=%i\n", N);
*/
//0x37 beginnt es mit 00 01 = 0x100 als erste position
// nächster Block beginnt im .prg file an Stelle 0xBF und in Ram an 0x900

    return 0;
}
