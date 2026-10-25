Unknown instruction at 0x4064: 0xcb
Unknown instruction at 0x401f: 0x1b
Unknown instruction at 0x3f21: 0x02
Unknown instruction at 0x3e4b: 0xfb
Unknown instruction at 0x5019: 0xf3
Unknown instruction at 0x60be: 0x9c
Unknown instruction at 0x6082: 0x8f
Unknown instruction at 0x5ddb: 0x6b
Unknown instruction at 0x5db3: 0x5f
// 25 functions
// jmp at 0x0c8a function 0x0c80-0x0c8a
// jmp at 0x0c9d function 0x0c8d-0x0cd8
// jmp at 0x0cd8 function 0x0c8d-0x0cd8
// jmp at 0x0ced function 0x0cdb-0x0ced
// jmp at 0x0d4c function 0x0d37-0x0d4c
// jmp at 0x0f8e function 0x0f84-0x10b2
// jmp at 0x11a1 function 0x119d-0x11a6
// jmp at 0x11a6 function 0x119d-0x11a6
// jmp at 0x1228 function 0x11a9-0x1228
// jmp at 0x12a7 function 0x1292-0x12a7
// jmp at 0x12f6 function 0x12d4-0x12f6
// jmp at 0x12f9 function 0x12f9-0x12f9
// jmp at 0x172a function 0x1720-0x172a
// jmp at 0x1818 function 0x17a5-0x19ef
// jmp at 0x1885 function 0x17a5-0x19ef
// jmp at 0x19ef function 0x17a5-0x19ef
// ------------------------------------------------
void Sub_0c80();
void Sub_0c8d();
void Sub_0cdb();
void Sub_0d37();
void Sub_0f84();
void Sub_10d7();
void Sub_1184();
void Sub_119d();
void Sub_11a9();
void Sub_122b();
void Sub_1280();
void Sub_1292();
void Sub_12aa();
void Sub_12d4();
void Sub_12f9();
void Sub_13b0();
void Sub_1416();
void Sub_170e();
void Sub_1720();
void Sub_17a5();
void Sub_19f2();
void Sub_1a0f();
void Sub_4022();
void Sub_4fb1();
void Sub_5d94();
// ------------------------------------------------

// 0x0000:  array
// 0x0001:  variable array
// 14 bytes
// 0x0010:  variable pointer
// 0x0011:  variable pointer
// 39 bytes
// 0x0039:  variable
// 0x003A:  variable
// 0x003B:  variable pointer
// 0x003C:  variable pointer
// 4 bytes
// 0x0041:  variable pointer
// 0x0042:  variable pointer
// 2 bytes
// 0x0045:  variable
// 8 bytes
// 0x004E:  variable pointer
// 0x004F:  variable pointer
// 7 bytes
// 0x0057:  variable pointer
// 0x0058:  variable pointer
// 0x0059:  variable pointer
// 0x005A:  variable pointer
// 0x005B:  variable pointer
// 0x005C:  variable pointer
// 0x005D:  variable
// 0x005E:  variable
// 2 bytes
// 0x0061:  variable pointer
// 0x0062:  variable pointer
// 0x0063:  variable pointer
// 0x0064:  variable pointer
// 0x0065:  variable
// 0x0066:  variable
// 2 bytes
// 0x0069:  variable pointer
// 0x006A:  variable pointer
// 2 bytes
// 0x006D:  variable
// 0x006E:  variable
// 56 bytes
// 0x00A7:  variable pointer
// 0x00A8:  variable pointer
// 0x00A9:  variable pointer
// 0x00AA:  variable pointer
// 0x00AB:  variable
// 10 bytes
// 0x00B6:  variable
// 73 bytes
// 0x0100:  variable array
// 523 bytes
// 0x030C:  variable
// 0x030D:  variable
// 0x030E:  variable
// 0x030F:  variable
// 2328 bytes
// 0x0C28:  variable
// 0x0C29:  variable
// 0x0C2A:  variable
// 0x0C2B:  variable
// 0x0C2C:  variable
// 0x0C2D:  variable
// 2 bytes
// 0x0C30:  variable
// 0x0C31:  variable
// 0x0C32:  variable
// 0x0C33:  variable
// 0x0C34:  variable
// 0x0C35:  variable
// 0x0C36:  variable
// 0x0C37:  variable
// 72 bytes

// Read       : 
// Write      :   0x41, 
// Read&Write : 
void Sub_0c80()
{
x0C80:
            PLA
            STA 0x41
            PLA
            JSR 0x1184
            JSR 0x119D
            JMP 0x11A4   jump outside
    return;
}


// Read       :   0x65,   0x66, 0x0c2a, 0x0c2b, 
// Write      :   0x41,   0x57,   0x58, 
// Read&Write : 
void Sub_0c8d()
{
x0C8D:
            PLA
            STA 0x41
            PLA
            JSR 0x11A9
            CLC
            LDA 0x65
            ADC 0x66
            BCC 0x0CA0
            LDX #0x17
            JMP 0x1228   jump outside
x0CA0:
            JSR 0x122B
            LDY 0x65
            BEQ 0x0CB3
            DEY
x0CA8:
            LDA (0x61),y
            STA (0x10),y
            DEY
            BPL 0x0CA8
            CPY #0xFF
            BNE 0x0CA8
x0CB3:
            CLC
            LDA 0x0C2A
            ADC 0x65
            STA 0x57
            LDA 0x0C2B
            ADC #0x0
            STA 0x58
            LDY 0x66
            BEQ 0x0CD2
            DEY
x0CC7:
            LDA (0x63),y
            STA (0x57),y
            DEY
            BPL 0x0CC7
            CPY #0xFF
            BNE 0x0CC7
x0CD2:
            JSR 0x1280
            JSR 0x1292
            JMP 0x12A5   jump outside
    return;
}


// Read       : 
// Write      :   0x41,   0x42, 
// Read&Write : 
void Sub_0cdb()
{
x0CDB:
            PLA
            STA 0x41
            PLA
            STA 0x42
            LDY #0x0
            LDX #0x4E
            JSR 0x12AA
            JSR 0x12D4
            LDY #0x3
            JMP 0x10A1   jump outside
    return;
}

// 71 bytes

// Read       :   0xab, 
// Write      :   0x41, 
// Read&Write : 
void Sub_0d37()
{
x0D37:
            PLA
            STA 0x41
            PLA
            JSR 0x13B0
            JSR 0x1416
            LDY #0x2
x0D43:
            LDA (0xA7),y
            STA (0xA9),y
            DEY
            BPL 0x0D43
            LDY 0xAB
            JMP 0x10A1   jump outside
    return;
}

// 565 bytes

// Read       :   0x42,   0x6e, 
// Write      : 
// Read&Write :   0x41,   0x45, 
void Sub_0f84()
{
x0F84:
            PLA
            STA 0x41
            PLA
            JSR 0x170E
            JSR 0x1720
            JMP 0x11A4   jump outside
// 272 bytes
x10A1:
            STY 0x45
            CLC
            LDA 0x41
            ADC 0x45
            TAX
            LDA 0x42
            ADC #0x0
            PHA
            TXA
            PHA
            LDA 0x6E
            RTS
}

// 36 bytes

// Read       : 
// Write      :   0x01, 
// Read&Write : 
void Sub_10d7()
{
x10D7:
            LDA #0x37
            STA 0x1
            RTS
}

// 168 bytes

// Read       : 
// Write      :   0x42,   0x57,   0x58,   0xa7,   0xa8, 
// Read&Write : 
void Sub_1184()
{
x1184:
            STA 0x42
            LDY #0x1
            LDA (0x41),y
            STA 0x57
            INY
            LDA (0x41),y
            STA 0x58
            LDY #0x0
            LDA (0x57),y
            STA 0xA7
            INY
            LDA (0x57),y
            STA 0xA8
            RTS
}


// Read       : 
// Write      : 
// Read&Write : 
void Sub_119d()
{
x119D:
            LDA #0x20
            LDY #0x7
            JMP 0x1947   jump outside
x11A4:
            LDY #0x3
            JMP 0x19B4   jump outside
    return;
}


// Read       :   0x3b,   0x3c, 
// Write      :   0x42,   0x69,   0x6a,   0xa7,   0xa8,   0xa9,   0xaa,   0xab, 
// Read&Write :   0x6d, 
void Sub_11a9()
{
x11A9:
            STA 0x42
            LDY #0x2
            LDA (0x41),y
            BEQ 0x11C8
            STA 0xA8
            LDY #0x1
            LDA (0x41),y
            STA 0xA7
            LDY #0x3
            LDA (0x41),y
            STA 0x69
            INY
            LDA (0x41),y
            STA 0x6A
            INY
            JMP 0x121A
x11C8:
            LDY #0x3
            LDA (0x41),y
            STA 0xA7
            INY
            LDA (0x41),y
            STA 0xA8
            INY
            LDA (0x41),y
            STA 0x69
            INY
            LDA (0x41),y
            STA 0x6A
            LDY #0x1
            LDA (0x41),y
            STA 0x6D
            AND #0x1
            BEQ 0x11F3
            LDY #0x0
            LDA (0xA7),y
            TAX
            INY
            LDA (0xA7),y
            STX 0xA7
            STA 0xA8
x11F3:
            LDA 0x6D
            AND #0x2
            BEQ 0x1205
            LDY #0x0
            LDA (0x69),y
            TAX
            INY
            LDA (0x69),y
            STX 0x69
            STA 0x6A
x1205:
            LDY #0x7
            LDA 0x6D
            AND #0x4
            BEQ 0x121A
            LDA 0x3B
            LDX 0x3C
            STA 0xA9
            STX 0xAA
            LDY #0x6
            JMP 0x1223
x121A:
            LDA (0x41),y
            STA 0xA9
            INY
            LDA (0x41),y
            STA 0xAA
x1223:
            STY 0xAB
            JMP 0x19F2   jump outside
x1228:
            JMP 0xA437   jump outside
    return;
}


// Read       :   0xa9,   0xaa, 0x0c28, 0x0c29, 
// Write      :   0x10,   0x11,   0x58,   0xb6, 
// Read&Write :   0x57, 0x0c2a, 0x0c2b, 
void Sub_122b()
{
x122B:
            STA 0x57
            JSR 0x1416
x1230:
            LDA 0x57
            PHA
            TAX
            BNE 0x1239
            JMP 0x127C
x1239:
            SEC
            LDA 0x0C2A
            SBC #0x2
            LDY 0x0C2B
            BCS 0x1245
            DEY
x1245:
            STA 0x57
            STY 0x58
            TXA
            EOR #0xFF
            SEC
            ADC 0x57
            BCS 0x1252
            DEY
x1252:
            CPY 0x0C29
            BCC 0x125E
            BNE 0x1267
            CMP 0x0C28
            BCS 0x1267
x125E:
            PLA
            JSR 0x17A5
            STA 0x57
            JMP 0x1230
x1267:
            STA 0x0C2A
            STA 0x10
            STY 0x0C2B
            STY 0x11
            LDY #0x0
            LDA 0xA9
            STA (0x57),y
            INY
            LDA 0xAA
            STA (0x57),y
x127C:
            PLA
            STA 0xB6
            RTS
}


// Read       :   0x69,   0x6a,   0xa7,   0xa8, 
// Write      : 
// Read&Write : 
void Sub_1280()
{
x1280:
            LDX 0xA7
            LDY 0xA8
            LDA #0x0
            JSR 0x1A0F
            LDX 0x69
            LDY 0x6A
            LDA #0xFF
            JMP 0x1A0F   jump outside
    return;
}


// Read       :   0xab,   0xb6, 0x0c2a, 0x0c2b, 
// Write      : 
// Read&Write : 
void Sub_1292()
{
x1292:
            LDY #0x0
            LDA 0xB6
            STA (0xA9),y
            INY
            LDA 0x0C2A
            STA (0xA9),y
            INY
            LDA 0x0C2B
            STA (0xA9),y
            RTS
x12A5:
            LDY 0xAB
            JMP 0x10A1   jump outside
    return;
}


// Read       : 
// Write      :   0x00,   0x01,   0x57,   0x58, 
// Read&Write :   0x45, 
void Sub_12aa()
{
x12AA:
            INY
            LDA (0x41),y
            BEQ 0x12C9
            INY
            LDA (0x41),y
            STA 0x57
            INY
            LDA (0x41),y
            STA 0x58
            STY 0x45
            LDY #0x0
            LDA (0x57),y
            STA 0x0,x
            INY
            LDA (0x57),y
            STA 0x1,x
            LDY 0x45
            RTS
x12C9:
            INY
            LDA (0x41),y
            STA 0x0,x
            INY
            LDA (0x41),y
            STA 0x1,x
            RTS
}


// Read       : 
// Write      : 
// Read&Write : 0x030c, 0x030d, 0x030e, 0x030f, 
void Sub_12d4()
{
x12D4:
            JSR 0x10D7
            LDA 0x030F
            PHA
            LDA 0x030C
            LDX 0x030D
            LDY 0x030E
            PLP
            JSR 0x12F9
            STA 0x030C
            STX 0x030D
            STY 0x030E
            PHP
            PLA
            STA 0x030F
            JMP 0x191B   jump outside
    return;
}


// Read       : 
// Write      : 
// Read&Write : 
void Sub_12f9()
{
x12F9:
            JMP (0x004E)   jump outside
    return;
}

// 180 bytes

// Read       :   0x3b,   0x3c, 
// Write      :   0x42,   0x61,   0x62,   0x65,   0xa7,   0xa8,   0xa9,   0xaa,   0xab, 
// Read&Write :   0x6d, 
void Sub_13b0()
{
x13B0:
            STA 0x42
            LDY #0x2
            LDA (0x41),y
            BEQ 0x13C4
            STA 0xA8
            LDY #0x1
            LDA (0x41),y
            STA 0xA7
            LDY #0x3
            BNE 0x13FA
x13C4:
            LDY #0x3
            LDA (0x41),y
            STA 0xA7
            INY
            LDA (0x41),y
            STA 0xA8
            LDY #0x1
            LDA (0x41),y
            STA 0x6D
            AND #0x1
            BEQ 0x13E5
            LDY #0x0
            LDA (0xA7),y
            TAX
            INY
            LDA (0xA7),y
            STA 0xA8
            STX 0xA7
x13E5:
            LDY #0x5
            LDA 0x6D
            AND #0x2
            BEQ 0x13FA
            LDA 0x3B
            LDX 0x3C
            STA 0xA9
            STX 0xAA
            LDY #0x4
            JMP 0x1403
x13FA:
            LDA (0x41),y
            STA 0xA9
            INY
            LDA (0x41),y
            STA 0xAA
x1403:
            STY 0xAB
            LDY #0x0
            LDA (0xA7),y
            STA 0x65
            INY
            LDA (0xA7),y
            STA 0x61
            INY
            LDA (0xA7),y
            STA 0x62
            RTS
}


// Read       :   0xa9,   0xaa, 0x0c28, 0x0c29, 0x0c2c, 0x0c2d, 0x0c34, 0x0c35, 0x0c36, 0x0c37, 
// Write      :   0x59,   0x5a, 
// Read&Write :   0x5b, 
void Sub_1416()
{
x1416:
            LDY 0xAA
            BEQ 0x1473
            LDX 0xA9
            CPY 0x0C35
            BCC 0x1473
            BNE 0x1428
            CPX 0x0C34
            BCC 0x1473
x1428:
            CPY 0x0C37
            BCC 0x1434
            BNE 0x1473
            CPX 0x0C36
            BCS 0x1473
x1434:
            LDY #0x0
            LDA (0xA9),y
            BEQ 0x1473
            STA 0x5B
            LDY #0x1
            LDA (0xA9),y
            TAX
            INY
            LDA (0xA9),y
            CMP 0x0C29
            BCC 0x1473
            BNE 0x1450
            CPX 0x0C28
            BCC 0x1473
x1450:
            CPX 0x0C2C
            SBC 0x0C2D
            BCS 0x1473
            CLC
            LDY #0x1
            LDA 0x5B
            ADC (0xA9),y
            STA 0x59
            INY
            LDA (0xA9),y
            ADC #0x0
            STA 0x5A
            LDY #0x0
            LDA 0x5B
            STA (0x59),y
            LDA #0x0
            INY
            STA (0x59),y
x1473:
            RTS
}

// 666 bytes

// Read       : 
// Write      :   0x42,   0x57,   0x58, 
// Read&Write : 
void Sub_170e()
{
x170E:
            STA 0x42
            LDY #0x1
            LDA (0x41),y
            STA 0x57
            INY
            LDA (0x41),y
            STA 0x58
            LDY #0x0
            LDA (0x57),y
            RTS
}


// Read       : 
// Write      :   0xa7,   0xa8, 
// Read&Write : 
void Sub_1720()
{
x1720:
            STA 0xA7
            LDA #0x0
            STA 0xA8
            LDA #0x20
            LDY #0x3
            JMP 0x1947   jump outside
    return;
}

// 120 bytes

// Read       :   0x3b,   0x3c,   0xb6, 0x0c28, 0x0c29, 0x0c2c, 0x0c2d, 0x1921, 0x19ad, 
// Write      :   0x01,   0x39,   0x3a,   0xa9,   0xaa, 
// Read&Write :   0x45,   0x57,   0x58,   0x59,   0x5a,   0x5b,   0x5c,   0x5d,   0x5e,   0xa7,   0xa8, 0x0100, 0x0c2a, 0x0c2b, 0x19aa, 0x19ab, 
void Sub_17a5()
{
x17A5:
            STA 0x5E
            LDA 0x0C2C
            STA 0x59
            STA 0x5B
            LDA 0x0C2D
            STA 0x5A
            STA 0x5C
x17B5:
            LDA 0x0C2A
            CMP 0x5B
            LDA 0x0C2B
            SBC 0x5C
            BCC 0x17C4
            JMP 0x1859
x17C4:
            SEC
            LDA 0x5B
            SBC #0x2
            STA 0x5B
            BCS 0x17CF
            DEC 0x5C
x17CF:
            LDY #0x0
            LDA (0x5B),y
            STA 0x57
            INY
            LDA (0x5B),y
            STA 0x58
            BNE 0x17DF
            JMP 0x184B
x17DF:
            SEC
            LDA 0x59
            SBC #0x2
            STA 0x59
            BCS 0x17EA
            DEC 0x5A
x17EA:
            LDY #0x1
            LDA (0x5B),y
            STA (0x59),y
            DEY
            LDA (0x5B),y
            STA (0x59),y
            LDY #0x0
            LDA (0x57),y
            STA 0x5D
            LDX 0x5C
            SEC
            LDA 0x5B
            SBC 0x5D
            STA 0x5B
            BCS 0x1808
            DEC 0x5C
x1808:
            INY
            CMP (0x57),y
            BEQ 0x181B
x180D:
            CLC
            LDA 0x5B
            ADC 0x5D
            STA 0x39
            STX 0x3A
            LDX #0x1A
            JMP 0x1228   jump outside
x181B:
            INY
            LDA 0x5C
            CMP (0x57),y
            BNE 0x180D
            SEC
            LDA 0x59
            SBC 0x5D
            STA 0x59
            BCS 0x182D
            DEC 0x5A
x182D:
            LDY 0x5D
            BEQ 0x180D
            DEY
x1832:
            LDA (0x5B),y
            STA (0x59),y
            DEY
            BPL 0x1832
            CPY #0xFF
            BNE 0x1832
            LDY #0x1
            LDA 0x59
            STA (0x57),y
            INY
            LDA 0x5A
            STA (0x57),y
            JMP 0x17B5
x184B:
            SEC
            LDA 0x5B
            SBC 0x57
            STA 0x5B
            BCS 0x1856
            DEC 0x5C
x1856:
            JMP 0x17B5
x1859:
            LDA 0x59
            STA 0x0C2A
            LDA 0x5A
            STA 0x0C2B
            SEC
            LDA 0x0C2A
            SBC 0x5E
            TAX
            LDA 0x0C2B
            SBC #0x0
            TAY
            TXA
            SBC #0x2
            TAX
            TYA
            SBC #0x0
            CMP 0x0C29
            BCC 0x1883
            BNE 0x1888
            CPX 0x0C28
            BCS 0x1888
x1883:
            LDX #0x10
            JMP 0x1228   jump outside
x1888:
            JSR 0x19F2
            LDA 0x5E
            RTS
// 141 bytes
x191B:
            LDA 0x1921
            STA 0x1
            RTS
// 0x1921:  variable
// 37 bytes
x1947:
            STA 0x0100
            LDA #0x0
            STA 0x19AA
            LDA #0x1
            STA 0x57
x1953:
            LDX #0x30
x1955:
            SEC
            LDA 0xA7
            SBC 0x19AB,y
            PHA
            DEY
            LDA 0xA8
            SBC 0x19AD,y
            BCC 0x196D
            STA 0xA8
            PLA
            STA 0xA7
            INX
            INY
            BNE 0x1955
x196D:
            PLA
            TXA
            STY 0x19AB
            STX 0x58
            LDX 0x57
            CMP #0x30
            BEQ 0x1985
            STA 0x19AA
            STA 0x0100,x
            INC 0x57
            JMP 0x1991
x1985:
            LDY 0x19AA
            BEQ 0x1991
            LDX 0x57
            STA 0x0100,x
            INC 0x57
x1991:
            LDX 0x58
            LDY 0x19AB
            DEY
            BPL 0x1953
            LDA 0xA7
            ORA #0x30
            LDX 0x57
            STA 0x0100,x
            INX
            LDA #0x0
            STA 0x0100,x
            RTS
// 1 bytes
// 0x19AA:  variable
// 0x19AB:  variable array
// 1 bytes
// 0x19AD:  array
// 6 bytes
x19B4:
            LDA (0x41),y
            STA 0xA9
            TAX
            INY
            STY 0x45
            LDA (0x41),y
            STA 0xAA
            BNE 0x19CD
            TXA
            BNE 0x19CD
            LDA 0x3B
            STA 0xA9
            LDA 0x3C
            STA 0xAA
x19CD:
            LDX #0xFF
x19CF:
            INX
            LDA 0x0100,x
            BNE 0x19CF
            TXA
            JSR 0x122B
            LDY 0xB6
            BEQ 0x19EA
            DEY
x19DE:
            LDA 0x0100,y
            STA (0x10),y
            DEY
            BPL 0x19DE
            CPY #0xFF
            BNE 0x19DE
x19EA:
            JSR 0x1292
            LDY 0x45
            JMP 0x10A1   jump outside
    return;
}


// Read       : 
// Write      :   0x61,   0x62,   0x63,   0x64,   0x65,   0x66, 
// Read&Write : 
void Sub_19f2()
{
x19F2:
            LDY #0x0
            LDA (0xA7),y
            STA 0x65
            LDA (0x69),y
            STA 0x66
            INY
            LDA (0xA7),y
            STA 0x61
            LDA (0x69),y
            STA 0x63
            INY
            LDA (0xA7),y
            STA 0x62
            LDA (0x69),y
            STA 0x64
            RTS
}


// Read       :   0x61,   0x62,   0x63,   0x64,   0x65,   0x66, 0x0c30, 0x0c31, 0x0c32, 0x0c33, 0x0c34, 0x0c35, 0x0c36, 0x0c37, 0x6959, 0x6963, 0x69b5, 0x69b6, 0x69b7, 0x69b8, 0x70bb, 0x70bc, 
// Write      :   0x3b,   0x3c,   0x57,   0x58, 
// Read&Write : 0x6958, 0x695a, 0x6990, 0x6991, 0x70b9, 0x70ba, 0x70fb, 0x70fc, 0x7100, 0x7101, 
void Sub_1a0f()
{
x1A0F:
            CPY 0x0C35
            BCC 0x1A28
            BNE 0x1A1B
            CPX 0x0C34
            BCC 0x1A28
x1A1B:
            CPY 0x0C37
            BCC 0x1A27
            BNE 0x1A28
            CPX 0x0C36
            BCS 0x1A28
x1A27:
            RTS
x1A28:
            CPY 0x0C31
            BCC 0x1A41
            BNE 0x1A34
            CPX 0x0C30
            BCC 0x1A41
x1A34:
            CPY 0x0C33
            BCC 0x1A40
            BNE 0x1A41
            CPX 0x0C32
            BCS 0x1A41
x1A40:
            RTS
x1A41:
            CMP #0x0
            BNE 0x1A57
            CLC
            LDA 0x61
            ADC 0x65
            STA 0x57
            LDA 0x62
            ADC #0x0
            STA 0x58
            LDA 0x65
            BNE 0x1A69
            RTS
x1A57:
            CLC
            LDA 0x63
            ADC 0x66
            STA 0x57
            LDA 0x64
            ADC #0x0
            STA 0x58
            LDA 0x66
            BNE 0x1A69
            RTS
x1A69:
            LDY #0x0
            STA (0x57),y
            TYA
            INY
            STA (0x57),y
            RTS
// 8592 bytes
x3C02:
            LDA 0x6990
            CMP #0x0
            BNE 0x3C0E
            LDA 0x6991
            CMP #0x0
x3C0E:
            BNE 0x3C14
            LDA #0x0
            BEQ 0x3C16
x3C14:
            LDA #0xFF
x3C16:
            STA 0x70FB
            LDA 0x69B5
            CMP 0x6990
            BNE 0x3C27
            LDA 0x69B6
            CMP 0x6991
x3C27:
            BEQ 0x3C2D
            LDA #0x0
            BEQ 0x3C2F
x3C2D:
            LDA #0xFF
x3C2F:
            STA 0x7100
            LDA 0x70FB
            AND 0x7100
            BNE 0x3C3D
            JMP 0x3C57
x3C3D:
            CLC
            LDA 0x69B7
            ADC #0x27
            STA 0x3B
            LDA 0x69B8
            ADC #0x70
            STA 0x3C
            LDA #0x1
            LDY #0x0
            STA (0x3B),y
            LDA #0x1
            STA 0x695A
x3C57:
            LDA 0x6990
            CMP #0x0
            BNE 0x3C63
            LDA 0x6991
            CMP #0x0
x3C63:
            BEQ 0x3C69
            LDA #0x0
            BEQ 0x3C6B
x3C69:
            LDA #0xFF
x3C6B:
            STA 0x70FB
            LDA 0x6958
            CMP #0x0
            BEQ 0x3C79
            LDA #0x0
            BEQ 0x3C7B
x3C79:
            LDA #0xFF
x3C7B:
            STA 0x7100
            LDA 0x70FB
            AND 0x7100
            BNE 0x3C89
            JMP 0x3C8A
x3C89:
            RTS
x3C8A:
            LDA 0x6958
            CMP #0x0
            BNE 0x3C95
            LDA #0x0
            BEQ 0x3C97
x3C95:
            LDA #0xFF
x3C97:
            STA 0x70FB
            LDA 0x6990
            CMP #0x84
            BNE 0x3CA6
            LDA 0x6991
            CMP #0x3
x3CA6:
            BNE 0x3CAC
            LDA #0x0
            BEQ 0x3CAE
x3CAC:
            LDA #0xFF
x3CAE:
            STA 0x7100
            LDA 0x70FB
            AND 0x7100
            BNE 0x3CBC
            JMP 0x3CC1
x3CBC:
            LDA #0x0
            STA 0x6958
x3CC1:
            LDA 0x6958
            CMP #0x0
            BNE 0x3CCB
            JMP 0x3CF2
x3CCB:
            LDA #0x0
            STA 0x6958
            LDA 0x6959
            STA 0x70FB
            LDA #0x0
            STA 0x70FC
            SEC
            LDA 0x70FB
            SBC #0x1
            STA 0x6990
            LDA 0x70FC
            SBC #0x0
            STA 0x6991
            JSR 0x4022
            JMP 0x4002
x3CF2:
            LDA #0x1
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
            LDA #0x18
            CMP 0x6990
            LDA #0x0
            SBC 0x6991
            BCC 0x3D0B
            JMP 0x3D15
x3D0B:
            LDA #0x2
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
x3D15:
            LDA #0x6A
            CMP 0x6990
            LDA #0x0
            SBC 0x6991
            BCC 0x3D24
            JMP 0x3D2E
x3D24:
            LDA #0x3
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
x3D2E:
            LDA #0xA8
            CMP 0x6990
            LDA #0x0
            SBC 0x6991
            BCC 0x3D3D
            JMP 0x3D47
x3D3D:
            LDA #0x4
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
x3D47:
            LDA #0x63
            CMP 0x6990
            LDA #0x1
            SBC 0x6991
            BCC 0x3D56
            JMP 0x3D60
x3D56:
            LDA #0x5
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
x3D60:
            LDA #0x8D
            CMP 0x6990
            LDA #0x1
            SBC 0x6991
            BCC 0x3D6F
            JMP 0x3D79
x3D6F:
            LDA #0x6
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
x3D79:
            LDA #0x43
            CMP 0x6990
            LDA #0x2
            SBC 0x6991
            BCC 0x3D88
            JMP 0x3D92
x3D88:
            LDA #0x7
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
x3D92:
            LDA #0x6B
            CMP 0x6990
            LDA #0x2
            SBC 0x6991
            BCC 0x3DA1
            JMP 0x3DAB
x3DA1:
            LDA #0x8
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
x3DAB:
            LDA #0x6C
            CMP 0x6990
            LDA #0x2
            SBC 0x6991
            BCC 0x3DBA
            JMP 0x3DC4
x3DBA:
            LDA #0x9
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
x3DC4:
            LDA #0x78
            CMP 0x6990
            LDA #0x2
            SBC 0x6991
            BCC 0x3DD3
            JMP 0x3DDD
x3DD3:
            LDA #0xB
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
x3DDD:
            LDA #0x7C
            CMP 0x6990
            LDA #0x2
            SBC 0x6991
            BCC 0x3DEC
            JMP 0x3DF6
x3DEC:
            LDA #0xC
            STA 0x70B9
            LDA #0x0
            STA 0x70BA
x3DF6:
            LDA 0x70B9
            CMP #0x1
            BNE 0x3E00
            JMP 0x3E5C
x3E00:
            CMP #0x2
            BNE 0x3E07
            JMP 0x3E62
x3E07:
            CMP #0x3
            BNE 0x3E0E
            JMP 0x3E76
x3E0E:
            CMP #0x4
            BNE 0x3E15
            JMP 0x3E8A
x3E15:
            CMP #0x5
            BNE 0x3E1C
            JMP 0x3E9E
x3E1C:
            CMP #0x6
            BNE 0x3E23
            JMP 0x3EB2
x3E23:
            CMP #0x7
            BNE 0x3E2A
            JMP 0x3EC6
x3E2A:
            CMP #0x8
            BNE 0x3E31
            JMP 0x3EED
x3E31:
            CMP #0x9
            BNE 0x3E38
            JMP 0x3F14
x3E38:
            CMP #0xA
            BNE 0x3E3F
            JMP 0x3F3B
x3E3F:
            CMP #0xB
            BNE 0x3E46
            JMP 0x3F3B
x3E46:
            JSR 0x0C80
            BCC 0x3EB4
// 17 bytes
x3E5C:
            JSR 0x5D94
            JMP 0x4002
x3E62:
            SEC
            LDA 0x6990
            SBC #0x18
            STA 0x6990
            LDA 0x6991
            SBC #0x0
            STA 0x6991
            JMP 0x3FEE
x3E76:
            SEC
            LDA 0x6990
            SBC #0x18
            STA 0x6990
            LDA 0x6991
            SBC #0x0
            STA 0x6991
            JMP 0x3F62
x3E8A:
            SEC
            LDA 0x6990
            SBC #0x56
            STA 0x6990
            LDA 0x6991
            SBC #0x0
            STA 0x6991
            JMP 0x3F62
x3E9E:
            SEC
            LDA 0x6990
            SBC #0x11
            STA 0x6990
            LDA 0x6991
            SBC #0x1
            STA 0x6991
            JMP 0x3F62
x3EB2:
            SEC
            LDA 0x6990
x3EB4:
            BCC 0x3F1F
            SBC #0x3B
            STA 0x6990
            LDA 0x6991
            SBC #0x1
            STA 0x6991
            JMP 0x3F62
x3EC6:
            SEC
            LDA 0x6990
            SBC #0x44
            STA 0x70FB
            LDA 0x6991
            SBC #0x2
            STA 0x70FC
            CLC
            LDA 0x70FB
            ADC 0x70BB
            STA 0x6990
            LDA 0x70FC
            ADC 0x70BC
            STA 0x6991
            JMP 0x3F62
x3EED:
            SEC
            LDA 0x6990
            SBC #0x44
            STA 0x70FB
            LDA 0x6991
            SBC #0x2
            STA 0x70FC
            CLC
            LDA 0x70FB
            ADC 0x70BB
            STA 0x6990
            LDA 0x70FC
            ADC 0x70BC
            STA 0x6991
            JMP 0x3F62
x3F14:
            SEC
            LDA 0x6990
            SBC #0x45
            STA 0x70FB
            LDA 0x6991
x3F1F:
            ADC #0xE9
            SBC #0x2
            STA 0x70FC
            CLC
            LDA 0x70FB
            ADC 0x70BB
            STA 0x6990
            LDA 0x70FC
            ADC 0x70BC
            STA 0x6991
            JMP 0x3F62
x3F3B:
            SEC
            LDA 0x6990
            SBC #0x51
            STA 0x70FB
            LDA 0x6991
            SBC #0x2
            STA 0x70FC
            CLC
            LDA 0x70FB
            ADC 0x70BB
            STA 0x6990
            LDA 0x70FC
            ADC 0x70BC
            STA 0x6991
            JMP 0x3F62
x3F62:
            SEC
            LDA 0x70B9
            SBC #0x2
            STA 0x70FB
            LDA 0x70BA
            SBC #0x0
            STA 0x70FC
            LDA 0x6963
            STA 0x7100
            LDA #0x0
            STA 0x7101
            LDA 0x70FB
            CMP 0x7100
            BNE 0x3F8C
            LDA 0x70FC
            CMP 0x7101
x3F8C:
            BEQ 0x3F91
            JMP 0x3F94
x3F91:
            JMP 0x3FEE
x3F94:
            SEC
            LDA 0x70B9
            SBC #0x7
            STA 0x70FB
            LDA 0x70BA
            SBC #0x0
            STA 0x70FC
            LDA 0x6963
            STA 0x7100
            LDA #0x0
            STA 0x7101
            LDA 0x70FB
            CMP 0x7100
            BNE 0x3FBE
            LDA 0x70FC
            CMP 0x7101
x3FBE:
            BEQ 0x3FC4
            LDA #0x0
            BEQ 0x3FC6
x3FC4:
            LDA #0xFF
x3FC6:
            STA 0x70FB
            LDA 0x70B9
            CMP #0x7
            BNE 0x3FD5
            LDA 0x70BA
            CMP #0x0
x3FD5:
            BEQ 0x3FDB
            LDA #0x0
            BEQ 0x3FDD
x3FDB:
            LDA #0xFF
x3FDD:
            STA 0x7100
            LDA 0x70FB
            ORA 0x7100
            BEQ 0x3FEB
            JMP 0x3FEE
x3FEB:
            JMP 0x4002
x3FEE:
            CLC
            LDA 0x6990
            ADC #0x7E
            STA 0x6990
            LDA 0x6991
            ADC #0x0
            STA 0x6991
            JSR 0x4022
x4002:
            LDA #0x0
            STA 0x6990
            LDA #0x0
            STA 0x6991
            LDA 0x695A
            CMP #0x0
            BNE 0x4016
            JMP 0x4021
x4016:
            LDA #0x0
            STA 0x695A
            JSR 0x0CDB
            BRK
// 2 bytes
x4021:
            RTS
}


// Read       : 0x6990, 0x6991, 
// Write      : 0x030c, 0x030d, 0x030e, 0x9624, 
// Read&Write : 0x70fb, 0x70fc, 
void Sub_4022()
{
x4022:
            LDA 0x6990
            AND #0xFF
            STA 0x70FB
            LDA 0x6991
            AND #0x0
            STA 0x70FC
            LDA 0x70FB
            STA 0x030C
            LDA 0x6991
            STA 0x70FB
            LDA #0x0
            STA 0x70FC
            LDA 0x70FB
            STA 0x70FB
            LDA 0x70FC
            STA 0x70FC
            LDA 0x70FB
            STA 0x030D
            LDA #0x0
            STA 0x030E
            LDA #0x82
            STA 0x9624
            JSR 0x0CDB
            BRK
            BRK
    return;
}

// 424 bytes
// 0x420C:  variable
// 3492 bytes

// Read       : 
// Write      :   0x4e,   0x4f, 
// Read&Write : 0x70e0, 0x70e1, 0x70fb, 0x70fc, 0x7100, 0x7101, 
void Sub_4fb1()
{
x4FB1:
            CLC
            LDA #0x49
            ADC 0x70E0
            STA 0x4E
            LDA #0xC1
            ADC 0x70E1
            STA 0x4F
            LDY #0x0
            LDA (0x4E),y
            STA 0x70FB
            CLC
            LDA #0xA4
            ADC 0x70E0
            STA 0x4E
            LDA #0xC0
            ADC 0x70E1
            STA 0x4F
            LDY #0x0
            LDA (0x4E),y
            STA 0x7100
            LDA #0x0
            STA 0x7101
            LDA 0x7100
            STA 0x7101
            LDA #0x0
            STA 0x7100
            LDA #0x0
            STA 0x70FC
            CLC
            LDA 0x70FB
            ADC 0x7100
            STA 0x70E0
            LDA 0x70FC
            ADC 0x7101
            STA 0x70E1
            CLC
            LDA 0x70E0
            ADC #0x94
            STA 0x70E0
            LDA 0x70E1
            ADC #0xC2
            STA 0x70E1
            JSR 0x0D37
    return;
}

// 3451 bytes

// Read       : 0x6988, 0x6989, 0xa446, 
// Write      : 0x420c, 0x70e0, 0x70e1, 0xfb69, 
// Read&Write : 0x6990, 0x6991, 0xa445, 
void Sub_5d94()
{
x5D94:
            LDA 0x6990
            CMP #0x1
            BNE 0x5DA0
            LDA 0x6991
            CMP #0x0
x5DA0:
            BNE 0x5DA5
            JMP 0x5DA8
x5DA5:
            JMP 0x5DC4
x5DA8:
            JSR 0x0C80
            STY 0xFB69
            BVS 0x5DD0
            STA 0x420C
// 17 bytes
x5DC4:
            LDA 0x6990
            CMP #0x2
            BNE 0x5DD0
            LDA 0x6991
            CMP #0x0
x5DD0:
            BNE 0x5DD5
            JMP 0x5DD8
x5DD5:
            JMP 0x605C
x5DD8:
            JSR 0x0F84
// 641 bytes
x605C:
            LDA 0x6990
            CMP #0x8
            BNE 0x6068
x6063:
            LDA 0x6991
            CMP #0x0
x6068:
            BNE 0x606D
            JMP 0x6070
x606D:
            JMP 0x6094
x6070:
            LDA 0x6988
            STA 0x70E0
            LDA 0x6989
            STA 0x70E1
            JSR 0x4FB1
            JSR 0x0C8D
// 18 bytes
x6094:
            LDA 0x6990
            CMP #0xC
            BNE 0x60A0
            LDA 0x6991
            CMP #0x0
x60A0:
            BNE 0x60A5
            JMP 0x60A8
x60A5:
            JMP 0x60C3
x60A8:
            LDA 0x6988
            STA 0x70E0
            LDA 0x6989
            STA 0x70E1
            JSR 0x4FB1
            JSR 0x0C8D
            NOP
            BVS 0x6063
            PLA
// 5 bytes
x60C3:
            CLC
            LDA 0x6990
            ADC #0x66
            STA 0x6990
            LDA 0x6991
            ADC #0x0
            STA 0x6991
            JSR 0x4022
            RTS
// 2176 bytes
// 0x6958:  variable
// 0x6959:  variable
// 0x695A:  variable
// 8 bytes
// 0x6963:  variable
// 36 bytes
// 0x6988:  variable
// 0x6989:  variable
// 6 bytes
// 0x6990:  variable
// 0x6991:  variable
// 35 bytes
// 0x69B5:  variable
// 0x69B6:  variable
// 0x69B7:  variable
// 0x69B8:  variable
// 1792 bytes
// 0x70B9:  variable
// 0x70BA:  variable
// 0x70BB:  variable
// 0x70BC:  variable
// 35 bytes
// 0x70E0:  variable
// 0x70E1:  variable
// 25 bytes
// 0x70FB:  variable
// 0x70FC:  variable
// 3 bytes
// 0x7100:  variable
// 0x7101:  variable
// 9506 bytes
// 0x9624:  variable
// 3602 bytes
xA437:
            LDY #0x0
            STY 0xA445
xA43C:
            LDY 0xA445
            BEQ 0xA43C
            LDY 0xA446
            RTS
}

// 0xA445:  variable
// 0xA446:  variable
// 22306 bytes
// 0xFB69:  variable
// 1174 bytes
