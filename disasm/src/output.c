#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include"c64.h"
#include"tables.h"
#include"disasm.h"
#include"analyze.h"

#define READ  (1<<6)
#define WRITE (1<<7)

int ReadWrite(int op)
{
  switch(op)
  {
    case OP_LDA:
    case OP_LDX:
    case OP_LDY:
    case OP_CMP:
    case OP_CPX:
    case OP_CPY:
    case OP_BIT:
    case OP_ADC:
    case OP_AND:
    case OP_EOR:
    case OP_ORA:
    case OP_SBC:
        return READ;

    case OP_STA:
    case OP_STX:
    case OP_STY:
        return WRITE;

    case OP_ROR:
    case OP_ROL:
    case OP_ASL:
    case OP_LSR:
    case OP_INC:
    case OP_DEC:
        return READ | WRITE;

    default:
      return 0;
  }
}

static void FindReadWriteVariables(int start)
{
  int access[0x10000];
  for(int i=0; i < 0x10000; i++) access[i] = 0;

  for(int i=start; i < 0x10000; i++)
  {
    if ((codemem[i].isfunction) && (start != i)) break;
    if (!codemem[i].isins) continue;

    switch(codemem[i].insdetail.amode)
    {
      case AMODE_ABS:
      case AMODE_ABSX:
      case AMODE_ABSY:
          access[Read16(i+1)] |= ReadWrite(codemem[i].insdetail.op);
          break;

      case AMODE_ZP:
      case AMODE_ZPX:
      case AMODE_ZPY:
          access[Read8(i+1)] |= ReadWrite(codemem[i].insdetail.op);
          break;
    }
  }

  printf("// Read       : ");
  for(int i=0; i < 0x10000; i++)
  {
    if (access[i] == 0) continue;
    if ((access[i]&READ) == 0) continue;
    if ((access[i]&WRITE) != 0) continue;
    if (i <= 255) printf("  0x%02x, ", i); else printf("0x%04x, ", i);
  }
  printf("\n");
  printf("// Write      : ");
  for(int i=0; i < 0x10000; i++)
  {
    if (access[i] == 0) continue;
    if ((access[i]&WRITE) == 0) continue;
    if ((access[i]&READ) != 0) continue;
    if (i <= 255) printf("  0x%02x, ", i); else printf("0x%04x, ", i);
  }
  printf("\n");

  printf("// Read&Write : ");
  for(int i=0; i < 0x10000; i++)
  {
    if (access[i] == 0) continue;
    if ((access[i]&READ) == 0) continue;
    if ((access[i]&WRITE) == 0) continue;
    if (i <= 255) printf("  0x%02x, ", i); else printf("0x%04x, ", i);
  }
}

void DisassembleDetail(meminfo mi, int address)
{
  char disasm[100];
  insdetailstruct insdetail;
  Disassemble(address, disasm, &insdetail);

  if (insdetail.count == 0)
  {
      fprintf(stderr, "0x%04X: unknown opcode 0x%02X\n", address, Read8(address));
      exit(1);
  }

  if (mi.isjmptarget/* || mi.isfunctionend*/)
      printf("x%04X:\n", address);
/*
  if (mi.insdetail.op == OP_JSR)
  {
      printf("            Sub_%04x(); // %s\n", mi.insdetail.insdata, disasm);
      return;
  }

  if (mi.insdetail.op == OP_RTS)
  {
      printf("            return; // %s\n", disasm);
      return;
  }

  if (mi.insdetail.op == OP_JMP)
  {
      if (codemem[mi.insdetail.insdata].isfunction)
      {
          printf("            Sub_%04x(); // %s\n", mi.insdetail.insdata, disasm);
          printf("            return;\n");
          return;
      } else if (!codemem[address].isjumpoutside)
      {
          printf("            goto x%04X; // %s\n", mi.insdetail.insdata, disasm);
          return;
      }
  }

  if (mi.insdetail.amode == AMODE_REL)
  {
      if (codemem[mi.insdetail.insdata].isfunction)
      {
          //printf("            Sub_%04x();\n", mi.insdetail.insdata);
          //printf("            return;\n");
      } else if (!codemem[address].isjumpoutside)
      {
          printf("            if (1) goto x%04X; // %s\n", address+(signed char)mi.insdetail.insdata+2, disasm);
          return;
      }
  }
*/
  //printf("//          %s", disasm);
	printf("            %s", disasm);
  if (mi.insdetail.cia1) printf("   cia1");
  if (mi.insdetail.cia2) printf("   cia2");
  if (mi.insdetail.vic) printf("   vic");
  if (mi.insdetail.sid) printf("   sid");
  if (mi.isjumpoutside) printf("   jump outside");
  printf("\n");

}

void DisassembleOutput()
{
    //bool firstfunction = true;

    /*
    printf("// tables\n");

    for(int i=0; i < 0x10000; i++)
    {
      if (codemem[i].istable) printf("// 0x%04X\n", i);
    }

    printf("\n\n\n");
*/

    printf("// ------------------------------------------------\n");
    for(int i=0; i < 0x10000; i++)
    {
        if (codemem[i].isfunction)
            printf("void Sub_%04x();\n", i);
    }
    printf("// ------------------------------------------------\n");
    printf("\n");

    for(int i=0; i < 0x10000; i++)
    {
        if (codemem[i].isfunction)
        {
          /*
            if (!firstfunction)
            {
              printf("}\n\n");
            }
            firstfunction = false;
*/
            printf("\n");
            FindReadWriteVariables(i);
            printf("\nvoid Sub_%04x()\n{\n", i);
        }

        //if (codemem[i].isvariable) printf("//        Variable at 0x%04x\n", i);

        if (codemem[i].istable || codemem[i].isvariable || codemem[i].ispointer)
        {
            printf("// 0x%04X: ", i);
            if (codemem[i].isvariable) printf(" variable");
            if (codemem[i].ispointer) printf(" pointer");
            if (codemem[i].istable) printf(" array");
            printf("\n");
        }

        if (codemem[i].isins)
        {
            DisassembleDetail(codemem[i], i);
        }

        if (codemem[i].isfunctionend)
        {
            if (codemem[i].insdetail.op != OP_RTS)
            {
                printf("    return;\n");
            }
            printf("}\n\n");
        }

        // Print empty bytes
        int n = 0;
        for(int j=i+1; j<0x10000; j++)
        {
            if (codemem[j].iscode || codemem[j].istable || codemem[j].isvariable || codemem[j].ispointer) break;
            n++;
        }
        if (n > 0) printf("// %i bytes\n", n);
        i += n;
    }
}
