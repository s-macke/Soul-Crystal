#include <stdio.h>
#include <string.h>

#include "c64.h"
#include "disasm.h"
#include "tables.h"

void Disassemble(unsigned int PC, char *s, insdetailstruct *insdetail)
{
    unsigned char x;
    unsigned int address;
    s[0] = 0;

    insdetail->opcode = Read8(PC);
    insdetail->op = opcodelist[insdetail->opcode].op;
    insdetail->amode = opcodelist[insdetail->opcode].amode;
    insdetail->insdata = -1;
    insdetail->count = 0;
    insdetail->cia1 = false;
    insdetail->cia2 = false;
    insdetail->sid = false;
    insdetail->vic = false;

    switch (insdetail->amode)
    {
        case AMODE_IMP:
            sprintf(s, "%s", opcodelist[insdetail->opcode].ass);
            insdetail->count = 1;
            break;

        case AMODE_ACC:
            sprintf(s, "%s Acc", opcodelist[insdetail->opcode].ass);
            insdetail->count = 1;
            break;

        case AMODE_ABS:
            address = Read16(PC+1);
            sprintf(s, "%s 0x%04X", opcodelist[insdetail->opcode].ass, address);
            insdetail->insdata = address;
            insdetail->count = 3;
            if ((address >= 56576) && (address <= 57343)) insdetail->cia2 = true;
            if ((address >= 56320) && (address <= 56575)) insdetail->cia1 = true;
            if ((address >= 54272) && (address <= 55295)) insdetail->sid = true;
            if ((address >= 53248) && (address <= 54271)) insdetail->vic = true;
            break;

        case AMODE_IMM:
            x = Read8(PC+1);
            sprintf(s, "%s #0x%X", opcodelist[insdetail->opcode].ass, x);
            insdetail->insdata = x;
            insdetail->count = 2;
            break;

        case AMODE_ZP:
            address = Read8(PC+1);
            sprintf(s, "%s 0x%X", opcodelist[insdetail->opcode].ass, address);
            insdetail->insdata = address;
            insdetail->count = 2;
            break;

        case AMODE_ABSX:
            address = Read16(PC+1);
            sprintf(s,"%s 0x%04X,x", opcodelist[insdetail->opcode].ass, address);
            insdetail->insdata = address;
            insdetail->count = 3;
            break;

        case AMODE_ABSY:
            address = Read16(PC+1);
            sprintf(s,"%s 0x%04X,y", opcodelist[insdetail->opcode].ass, address);
            insdetail->insdata = address;
            insdetail->count = 3;
            break;

        case AMODE_ZPX:
            address = Read8(PC+1);
            sprintf(s,"%s 0x%X,x", opcodelist[insdetail->opcode].ass, address);
            insdetail->insdata = address;
            insdetail->count = 2;
            break;

        case AMODE_ZPY:
            address = Read8(PC+1);
            sprintf(s,"%s 0x%X,y", opcodelist[insdetail->opcode].ass, address);
            insdetail->insdata = address;
            insdetail->count = 2;
            break;

        case AMODE_REL:
            x = Read8(PC+1);
            sprintf(s,"%s 0x%04X", opcodelist[insdetail->opcode].ass, PC+(signed char)x+2);
            insdetail->insdata = x;
            insdetail->count = 2;
            break;

        case AMODE_IND:
            address = Read16(PC+1);
            sprintf(s, "%s (0x%04X)", opcodelist[insdetail->opcode].ass, address);
            insdetail->insdata = address;
            insdetail->count = 3;
            break;

        case AMODE_INDX:
            address = Read8(PC+1);
            sprintf(s,"%s (0x%X,x)", opcodelist[insdetail->opcode].ass, address);
            insdetail->insdata = address;
            insdetail->count = 2;
            break;

        case AMODE_INDY:
            address = Read8(PC+1);
            sprintf(s,"%s (0x%X),y", opcodelist[insdetail->opcode].ass, address);
            insdetail->insdata = address;
            insdetail->count = 2;
            break;
    }
}
