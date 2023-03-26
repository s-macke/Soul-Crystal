#include<stdio.h>
#include<string.h>
#include <stdlib.h>

#include"analyze.h"
#include"tables.h"
#include"c64.h"

meminfo codemem[0x10000];

int functionstartoffset[10000];
int functionendoffset[10000];
int nfunctions = 0;

void InitAnalyze()
{
    memset(codemem, 0, sizeof(codemem));
}

void FindFunctionEnds()
{
  for(int i=0; i < 0x10000; i++)
  {
    if (!codemem[i].isfunction) continue;

    functionstartoffset[nfunctions]=i;
    int lastins = i;

    for(int j=i+1; j < 0x10000; j++)
    {
        if (codemem[j].isfunction)
        {
            break;
        }
        if (codemem[j].isins)
        {
            lastins = j;
        }
    }
    codemem[lastins].isfunctionend = true;
    functionendoffset[nfunctions]=lastins;
    nfunctions++;
  }
  printf("// %i functions\n", nfunctions);
}

void FindOutsideCalls()
{
    for(int i=0; i<nfunctions; i++)
    {
      int fstart = functionstartoffset[i];
      int fend = functionendoffset[i];
      for(int j=fstart; j<=fend; j++)
      {
        if (!codemem[j].isins) continue;

        if (codemem[j].insdetail.op == OP_JMP)
        {
          int target = Read16(j+1);
          if ((target < fstart) || (target > fend))
          {
            codemem[j].isjumpoutside = true;
            if (!codemem[target].isfunction)
              printf("// jmp at 0x%04x function 0x%04x-0x%04x\n", j, fstart, fend);
          }
        }

        if (codemem[j].insdetail.amode == AMODE_REL)
        {
          int target = j + 2 + ((signed char)Read8(j+1));
          if ((target < fstart) || (target > fend))
          {
            codemem[j].isjumpoutside = true;
            if (!codemem[target].isfunction)
              printf("// rel at 0x%04x function 0x%04x-0x%04x\n", j, fstart, fend);
          }
        }

      }
    }
}



void FindTailCalls()
{
  return;
  for(int i=0; i < 0x10000; i++)
  {
    if (!codemem[i].isins) continue;
    if (Read8(i) == 0x4C) // JMP absolute
    {
      unsigned short address = Read16(i+1);
      if (codemem[address].isfunction) {
        if (codemem[i+3].isfunction)
        {
          fprintf(stderr, "        Tail call at 0x%04x to 0x%04x\n", i, address);
        } else
        {
          fprintf(stderr, "Partial tail call at 0x%04x to 0x%04x\n", i, address);
        }
      }
    }
  }
}

void DisassembleAnalyze(unsigned int PC)
{
    char disasm[200];
    int dest;
    codemem[PC].isjmptarget = true;

    while(true)
    {
        if (codemem[PC].isins) return;

        Disassemble(PC, disasm, &codemem[PC].insdetail);

        if (codemem[PC].insdetail.count == 0)
        {
        	printf("Unknown instruction at 0x%04x: 0x%02x\n", PC, Read8(PC));
            return;
        }

        codemem[PC].isins = true;

        for(int i=0; i<codemem[PC].insdetail.count; i++)
        {
            codemem[PC+i].iscode = true;
        }

        switch(codemem[PC].insdetail.op)
        {

        case OP_JSR:
             dest = Read16(PC+1);
             codemem[dest].isfunction = true;
             codemem[dest].isjmptarget = true;
             DisassembleAnalyze(dest);
             break;

        case OP_JMP:
            if (opcodelist[Read8(PC)].amode==AMODE_ABS)
            {
                dest = Read16(PC + 1);
                codemem[dest].isjmptarget = true;
                DisassembleAnalyze(dest);
            }
            /*
            else
	    if (opcodelist[Read8(PC)].amode == AMODE_IND)
	    {
	        int address = Read16(PC + 1);
		address = Read16(address);
		fprintf(stderr, "Jump to %i\n", address);
                codemem[address].isjmptarget = true;
                Analyze(address);
            }
            */
            return;

        case OP_RTS:
            //codemem[PC].isjmptarget = true;
            return;

        case OP_RTI:
            return;
        }

        if (opcodelist[Read8(PC)].amode == AMODE_REL)
        {
            dest = PC + 2 + (signed char)Read8(PC+1);
            codemem[dest].isjmptarget = true;
            DisassembleAnalyze(dest);
        }

        if (PC > 0xFFFB) return;
        PC += codemem[PC].insdetail.count;
    }
}

void FindVariables()
{
  for(int i=0; i < 0x10000; i++)
  {
      if (!codemem[i].isins) continue;
      if (opcodelist[Read8(i)].op == OP_JSR) continue;
      if (opcodelist[Read8(i)].op == OP_JMP) continue;

      if (opcodelist[Read8(i)].amode == AMODE_ABS)
      {
          int addr = Read16(i+1);
          codemem[addr].isvariable = true;
      }

      if (opcodelist[Read8(i)].amode == AMODE_ZP)
      {
          int addr = Read8(i+1);
          codemem[addr].isvariable = true;
      }

      if (opcodelist[Read8(i)].amode == AMODE_ABSX)
      {
          int addr = Read16(i+1);
          codemem[addr].istable = true;
      }
      if (opcodelist[Read8(i)].amode == AMODE_ABSY)
      {
          int addr = Read16(i+1);
          codemem[addr].istable = true;
      }
      if (opcodelist[Read8(i)].amode == AMODE_ZPX)
      {
          int addr = Read8(i+1);
          codemem[addr].istable = true;
      }
      if (opcodelist[Read8(i)].amode == AMODE_ZPY)
      {
          int addr = Read8(i+1);
          codemem[addr].istable = true;
      }

      if (opcodelist[Read8(i)].amode == AMODE_INDY)
      {
          int addr = Read8(i+1);
          codemem[addr+0].ispointer = true;
          codemem[addr+1].ispointer = true;
      }
  }
}

/*
0x156B: STA 0x14
        LDA #0x40
        JMP 0x8725
0x1572: LDA 0x6C
        BNE 0x158D
        LDA #0x2
*/
