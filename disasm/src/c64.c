#include "c64.h"

uint8 ram[0x10000];

uint8 Read8(uint16 addr)
{
    return ram[addr];
}

void Write8(uint16 addr, uint8 x)
{
    ram[addr] = x;
}

unsigned short Read16(uint16 addr)
{
    return ((uint16)ram[addr]) | (((uint16)ram[addr+1])<<8);
}
