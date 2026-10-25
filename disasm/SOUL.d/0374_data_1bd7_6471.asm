data_1bd7_6471:
    db 79, e6  ; |y.|

loc_1bd7_6473:
    jmp loc_1bd7_5e5e

data_1bd7_6476:
    db fc, ad, 8b, 34, 96, d1, e0, d0, d8, 0a, e4, 74, d6, 8b, 4d, 02  ; |...4.......t..M.|
    db d1, e1, d0, d9, 0a, ed, 74, cb, 8b, 3d, 8b, d8, 32, c1, 80, ec  ; |......t..=..2...|
    db 80, 80, ed, 7f, 02, e5, 70, d3, 80, c4, 80, 80, fc, ff, 74, cd  ; |......p.......t.|
    db 50, 32, ff, 8a, ef, 80, cb, 80, 80, c9, 80, 8b, eb, 8b, c6, f7  ; |P2..............|
    db e7, 8b, da, 0b, c0, 9f, 50, 8b, c5, f7, e7, 03, d8, 83, d2, 00  ; |......P.........|
    db 8b, fa, 8b, c1, f7, e6, 03, d8, 13, fa, 58, 9e, 74, 03, 80, cb  ; |..........X.t...|
    db 01, 8b, c5, f6, e1, 03, c7, 8b, d3, 93, 58, 0a, ff, 78, 0b, d1  ; |..........X..x..|
    db e2, d1, d3, 0a, e4, 75, 0a, e9, 69, ff, fe, c4, 80, fc, ff, 74  ; |.....u..i......t|
    db ad, e9, 1a, ff, 87, f7, 8b, 4d, 02, d1, e1, d0, d9, 8b, 44, 02  ; |.......M......D.|
    db d1, e0, d0, d8, 0a, ed, 74, 5c, 0a, e4, 74, db, 32, c1, 80, ec  ; |......t\..t.2...|
    db 81, 80, ed, 7f, 2a, e5, 71, 03, e9, 7b, ff, 80, c4, 80, 80, fc  ; |....*.q..{......|
    db ff, 75, 03, e9, 78, ff, 8b, 5d, 01, 8a, 2d, 32, c9, 80, cf, 80  ; |.u..x..]..-2....|
    db 80, 3e, 06, 6a, 00, 74, 08, d1, eb, d1, d9, 02, 3e, 06, 6a, 50  ; |.>.j.t......>.jP|
    db 8b, 54, 01, 8a, 24, 32, c0, 80, ce, 80, d1, ea, d1, d8, e8, 1a  ; |.T..$2..........|
    db 00, 8b, ee, e8, 11, 00, 0b, c2, 8b, d6, 74, 03, 80, ca, 01, 8b  ; |..........t.....|
    db dd, e9, 76, ff, e9, f6, f8, 3b, d3, 73, 1d, f7, f3, 96, 33, c0  ; |..v....;.s....3.|
    db e3, 15, 8b, fa, 8b, c6, f7, e1, f7, d8, 1b, fa, 8b, d7, 73, 07  ; |..............s.|
    db 4e, 03, c1, 13, d3, 73, f9, c3, be, ff, ff, 2b, c1, 03, d0, 8b  ; |N....s.....+....|
    db c1, 73, ed, c3  ; |.s..|

loc_1bd7_659a:
    mov byte ptr [6a06], 00
    mov ch, [6a08]
    or ch, ch
    jz loc_1bd7_65ae
    sub ch, 0e
    cmp ch, ah
    ja loc_1bd7_65ea

loc_1bd7_65ae:
    or ah, ah
    jz loc_1bd7_65ea
    push word ptr [69fa]
    mov word ptr [69fa], 6a09
    push ax
    push bx
    push dx
    xor dx, dx
    xor bl, bl
    call sub_1bd7_6414
    pop dx
    pop bx
    pop ax
    mov word ptr [69fa], 6a0d
    push ax
    push bx
    push dx
    xor bh, bh
    call sub_1bd7_63e6

loc_1bd7_65d7:
    pop dx
    pop bx
    pop ax
    pop word ptr [69fa]
    jmp sub_1bd7_6414

loc_1bd7_65e1:
    xor ax, ax
    xor bx, bx
    xor dx, dx
    mov [6a06], al

loc_1bd7_65ea:
    push word ptr [69fa]
    mov word ptr [69fa], 6a0d
    push ax
    push bx
    push dx
    call sub_1bd7_6414
    xor ax, ax
    mov [6a09], ax
    mov [6a0b], ax
    jmp loc_1bd7_65d7

data_1bd7_6604:
    db 87, f7, 8b, 6d, 06, 81, f5, 00, 80, eb, 1d, 8b, f7, 8b, 3e, fa  ; |...m..........>.|
    db 69, a5, a5, a5, ad, 80, e4, 7f, 80, e6, 80, 0a, e6, ab, 8b, 36  ; |i..............6|
    db fa, 69, 8b, fe, c3, 8b, 6d, 06, fc, 8b, 44, 06, d1, e5, d0, de  ; |.i....m...D.....|
    db d1, e0, d0, da, 25, e0, ff, 74, d2, 83, e5, e0, 3b, e8, 77, 09  ; |....%..t....;.w.|
    db 87, f7, 95, 86, d6, 0b, c0, 74, c2, 2b, c5, f7, d8, 3d, a0, 06  ; |.......t.+...=..|
    db 77, b9, d0, e6, d1, dd, d0, e2, d1, dd, 57, d1, c0, d1, c0, d1  ; |w.........W.....|
    db c0, 86, e0, 8b, f8, ac, 8a, e0, 32, c0, 92, ad, 91, ad, 93, ad  ; |........2.......|
    db 80, e4, 0f, 80, cc, 10, 0b, ff, 74, 63, 83, ff, 0e, 7c, 18, 0b  ; |........tc...|..|
    db d2, 74, 03, 80, c9, 01, 8b, d1, 8b, cb, 8b, d8, 33, c0, 83, ef  ; |.t..........3...|
    db 10, 77, e7, 74, 48, 72, 23, 83, ff, 06, 7c, 2b, 0a, d2, 74, 03  ; |.w.tHr#...|+..t.|
    db 80, ce, 01, 8a, d6, 8a, f1, 8a, cd, 8a, eb, 8a, df, 8a, f8, 8a  ; |................|
    db c4, 32, e4, 83, ef, 08, 77, 0f, 74, 23, d1, e2, d1, d1, d1, d3  ; |.2....w.t#......|
    db d1, d0, 47, 75, f5, eb, 16, 87, cf, f6, c2, 3f, 74, 03, 80, ca  ; |..Gu.......?t...|
    db 20, d1, e8, d1, db, d1, df, d1, da, e2, f6, 87, cf, 5e, 97, f6  ; | ............^..|
    db c2, 3f, 74, 03, 80, ca, 20, d1, e5, 70, 3b, d1, e5, d0, d8, 02  ; |.?t... ..p;.....|
    db 34, 13, 4c, 01, 13, 5c, 03, 50, 9f, 50, 8b, 74, 05, 81, e6, ff  ; |4.L..\.P.P.t....|
    db 0f, 81, ce, 00, 10, 58, 9e, 58, 13, fe, f7, c7, 00, 20, 74, 13  ; |.....X.X..... t.|
    db d1, df, d1, db, d1, d9, d1, da, 83, c5, 20, 83, fd, e0, 75, 03  ; |.......... ...u.|
    db e9, 37, f7, e9, 87, 00, d1, e5, d0, d8, f6, d0, 2a, 34, 1b, 4c  ; |.7..........*4.L|
    db 01, 1b, 5c, 03, 8b, 74, 05, 9f, 81, e6, ff, 0f, 81, ce, 00, 10  ; |..\..t..........|
    db 9e, 1b, fe, 73, 13, 33, f6, f6, d0, f7, d7, f7, d3, f7, d1, f7  ; |...s.3..........|
    db da, f5, 13, ce, 13, de, 13, fe  ; |........|
