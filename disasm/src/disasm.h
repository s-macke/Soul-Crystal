#ifndef DISASSEMBLER_H
#define DISASSEMBLER_H

#include<stdbool.h>

typedef struct
{
    unsigned char opcode; // the opcode
    unsigned int op; // the operation such as OP_JSR
    unsigned int amode; // the address mode such as AMODE_ZP
    int insdata; // instruction data
    int count; // length of instruction

    bool cia1, cia2, sid, vic;
} insdetailstruct;

void Disassemble(unsigned int PC, char *s, insdetailstruct *insdetail);

#endif
