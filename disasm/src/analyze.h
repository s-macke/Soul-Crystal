#ifndef ANALYZE_H
#define ANALYZE_H

#include<stdbool.h>

#include"disasm.h"

typedef struct
{
    bool isins; // is instruction

    insdetailstruct insdetail;

    bool iscode; // is code (not data and not undefined)

    bool isfunction;
    bool isfunctionend;

    bool isjmptarget;

    bool istable;
    bool isvariable;
    bool ispointer;

    bool isjumpoutside;
} meminfo;

extern meminfo codemem[0x10000];
extern int functionstartoffset[10000];
extern int functionendoffset[10000];
extern int nfunctions;


void InitAnalyze();
void FindFunctionEnds();
void FindOutsideCalls();
void FindTailCalls();
void FindVariables();
void DisassembleAnalyze(unsigned int PC);


#endif
