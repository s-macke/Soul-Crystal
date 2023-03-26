#ifndef C64_H
#define C64_H

typedef unsigned short int uint16;
typedef unsigned char uint8;

unsigned char Read8(uint16 addr);
unsigned short Read16(uint16 addr);
void Write8(uint16 addr, uint8 x);

#endif
