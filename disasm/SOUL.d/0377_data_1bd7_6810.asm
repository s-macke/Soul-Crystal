data_1bd7_6810:
    db 79, 03  ; |y.|

loc_1bd7_6812:
    jmp loc_1bd7_5e5e

loc_1bd7_6815:
    cld
    cmp byte ptr [6a1e], 00
    jz loc_1bd7_6820
    jmp loc_1bd7_6b97

loc_1bd7_6820:
    xor ax, ax
    mov di, [69fa]
    mov si, di
    stosw
    stosw
    stosw
    stosw
    mov di, si
    ret

data_1bd7_682f:
    db fc, 8b, 44, 06, 8b, d0, 25, f0, 7f, 74, db, 8b, 4d, 06, 33, d1  ; |..D...%..t..M.3.|
    db 81, e1, f0, 7f, 74, d0, d1, e0, d1, e1, 2d, 00, 80, 81, e9, e0  ; |....t.....-.....|
    db 7f, 03, c1, 70, bc, 05, 00, 80, 3d, e0, ff, 74, b6, d0, e6, d1  ; |...p....=..t....|
    db d8, 50, e8, 81, 01, 74, 03, 80, ca, 01, 5d, d1, e5, d0, d8, f7  ; |.P...t....].....|
    db c7, 00, 10, 75, 0e, d1, e2, d1, d1, d1, d3, d1, d7, 0b, ed, 75  ; |...u...........u|
    db 0a, eb, 93, 83, c5, 20, 83, fd, e0, 74, 88, e9, 24, ff, e9, d3  ; |..... ...t..$...|
    db f5, 87, f7, fc, 8b, 4d, 06, 8b, d1, 81, e1, f0, 7f, 74, ef, 8b  ; |.....M.......t..|
    db 44, 06, 33, d0, 25, f0, 7f, 74, 9b, d1, e0, d1, e1, 2d, 20, 80  ; |D.3.%..t.....- .|
    db 81, e9, e0, 7f, 2b, c1, 70, 9b, 05, 00, 80, 3d, e0, ff, 74, 9b  ; |....+.p....=..t.|
    db d0, e6, d1, d8, 50, ac, 8a, e8, 32, c9, ad, 93, ad, 92, ad, 80  ; |....P...2.......|
    db e4, 0f, 80, cc, 10, 92, 50, 8b, f7, 83, c6, 05, bf, 1c, 6a, fd  ; |......P.......j.|
    db ad, 80, e4, 0f, 80, cc, 10, ab, a5, a5, 46, 47, a4, fc, c6, 05  ; |..........FG....|
    db 00, 80, 3e, 1e, 6a, 00, 74, 1f, fd, bf, 1c, 6a, 8b, f7, ad, 8b  ; |..>.j.t....j....|
    db e8, d1, e8, 02, 26, 1e, 6a, ab, d1, ed, ad, d1, d8, ab, ad, d1  ; |....&.j.........|
    db d8, ab, ad, d1, d8, ab, fc, 58, d1, ea, d1, d8, d1, db, d1, d9  ; |.......X........|
    db e8, 3f, 00, 57, e8, 3b, 00, 57, e8, 37, 00, 57, e8, 33, 00, 0b  ; |.?.W.;.W.7.W.3..|
    db c3, 0b, c1, 0b, c2, 8b, d7, 59, 5b, 5f, 74, 03, 80, ca, 01, f6  ; |.......Y[_t.....|
    db c2, 07, 74, 03, 80, ca, 08, d1, ef, d1, db, d1, d9, d1, da, d1  ; |..t.............|
    db ef, d1, db, d1, d9, d1, da, d1, ef, d1, db, d1, d9, d1, da, e9  ; |................|
    db 08, ff, 8b, 36, 1c, 6a, 33, ff, 3b, d6, 73, 5c, 0b, d2, 75, 04  ; |...6.j3.;.s\..u.|
    db 3b, f0, 77, 3b, f7, f6, 52, 97, 33, ed, 8b, f5, a1, 16, 6a, 0b  ; |;.w;..R.3.....j.|
    db c0, 74, 04, f7, e7, 8b, f2, 50, a1, 18, 6a, 0b, c0, 74, 06, f7  ; |.t.....P..j..t..|
    db e7, 03, f0, 13, ea, a1, 1a, 6a, 0b, c0, 74, 08, f7, e7, 03, e8  ; |.......j..t.....|
    db 83, d2, 00, 92, 5a, f7, da, 1b, ce, 1b, dd, 5d, 1b, e8, 95, 92  ; |....Z......]....|
    db 91, 93, 73, 13, 4f, 03, 0e, 16, 6a, 13, 1e, 18, 6a, 13, 06, 1a  ; |..s.O...j...j...|
    db 6a, 13, 16, 1c, 6a, 73, ed, c3, 4f, 2b, 0e, 16, 6a, 1b, 1e, 18  ; |j...js..O+..j...|
    db 6a, 1b, 06, 1a, 6a, 03, 0e, 18, 6a, 13, 1e, 1a, 6a, 13, c2, 8b  ; |j...j...j...j...|
    db 16, 16, 6a, f5, eb, c9, 8a, 44, 06, 32, e4, 24, 0f, 0c, 10, a3  ; |..j....D.2.$....|
    db 12, 6a, 8a, 45, 06, 24, 0f, 0c, 10, a3, 14, 6a, 33, db, 8b, eb  ; |.j.E.$.....j3...|
    db 8b, 0c, e3, 1a, 91, 8b, 0d, e3, 08, f7, e1, 8b, e8, 8b, ca, 8b  ; |................|
    db 04, 8b, 55, 02, 0b, d2, 74, 06, f7, e2, 03, c8, 13, da, 55, 33  ; |..U...t.......U3|
    db ed, 8b, 44, 02, 0b, c0, 74, 0e, 8b, 15, 0b, d2, 74, 08, f7, e2  ; |..D...t.....t...|
    db 03, c8, 13, da, d1, d5, 58, 0b, c1, 50, 8b, 44, 02, 0b, c0, 74  ; |......X..P.D...t|
    db 0d, 8b, 55, 02, 0b, d2, 74, 06, f7, e2, 03, d8, 13, ea, 33, c9  ; |..U...t.......3.|
    db 8b, 04, 0b, c0, 74, 0f, 8b, 55, 04, 0b, d2, 74, 08, f7, e2, 03  ; |....t..U...t....|
    db d8, 13, ea, d1, d1, 8b, 44, 04, 0b, c0, 74, 0f, 8b, 15, 0b, d2  ; |......D...t.....|
    db 74, 09, f7, e2, 03, d8, 13, ea, 83, d1, 00, 58, 0b, c3, 50, 8b  ; |t..........X..P.|
    db 04, 0b, c0, 74, 08, f7, 26, 14, 6a, 03, e8, 13, ca, 8b, 05, 0b  ; |...t..&.j.......|
    db c0, 74, 08, f7, 26, 12, 6a, 03, e8, 13, ca, 33, db, 8b, 44, 02  ; |.t..&.j....3..D.|
    db 0b, c0, 74, 0f, 8b, 55, 04, 0b, d2, 74, 08, f7, e2, 03, e8, 13  ; |..t..U...t......|
    db ca, d1, d3, 8b, 44, 04, 0b, c0, 74, 10, 8b, 55, 02, 0b, d2, 74  ; |....D...t..U...t|
    db 09, f7, e2, 03, e8, 13, ca, 83, d3, 00, 55, 33, ed, 8b, 45, 02  ; |..........U3..E.|
    db 0b, c0, 74, 08, f7, 26, 12, 6a, 03, c8, 13, da, 8b, 44, 02, 0b  ; |..t..&.j.....D..|
    db c0, 74, 08, f7, 26, 14, 6a, 03, c8, 13, da, 8b, 44, 04, 0b, c0  ; |.t..&.j.....D...|
    db 74, 1a, 8b, 55, 04, 0b, d2, 74, 0b, f7, e2, 03, c8, 13, da, d1  ; |t..U...t........|
    db d5, 8b, 44, 04, f7, 26, 14, 6a, 03, d8, 13, ea, 8b, 45, 04, 0b  ; |..D..&.j.....E..|
    db c0, 74, 08, f7, 26, 12, 6a, 03, d8, 13, ea, a0, 12, 6a, f6, 26  ; |.t..&.j......j.&|
    db 14, 6a, 03, c5, 97, 5a, d1, e2, d1, d1, d1, d3, d1, d7, d1, e2  ; |.j...Z..........|
    db d1, d1, d1, d3, d1, d7, d1, e2, d1, d1, d1, d3, d1, d7, 5e, 0b  ; |..............^.|
    db f6, c3  ; |..|

loc_1bd7_6b41:
    mov byte ptr [6a1e], 00
    mov si, [6a1f]
    or si, si
    jz loc_1bd7_6b56
    sub si, 04c0
    cmp si, bp
    ja loc_1bd7_6ba6

loc_1bd7_6b56:
    or bp, bp
    jz loc_1bd7_6ba6
    push word ptr [69fa]
    mov word ptr [69fa], 6a21
    push ax
    push cx
    push dx
    push bx
    push bp
    push di
    xor bx, bx
    xor cx, cx
    xor dx, dx
    call sub_1bd7_67b1
    pop di
    pop bp
    pop bx
    pop dx
    pop cx
    pop ax
    mov word ptr [69fa], 6a29
    push ax
    push cx
    push dx
    push bx
    push bp
    push di
    xor di, di
    call sub_1bd7_675c

loc_1bd7_6b8a:
    pop di
    pop bp
    pop bx
    pop dx
    pop cx
    pop ax
    pop word ptr [69fa]
    jmp sub_1bd7_67b1

loc_1bd7_6b97:
    xor ax, ax
    xor cx, cx
    xor dx, dx
    xor bx, bx
    xor bp, bp
    xor di, di
    mov [6a1e], al

loc_1bd7_6ba6:
    push word ptr [69fa]
    mov word ptr [69fa], 6a29
    push ax
    push cx
    push dx
    push bx
    push bp
    push di
    call sub_1bd7_67b1
    mov di, 6a21
    xor ax, ax
    stosw
    stosw
    stosw
    stosw
    jmp loc_1bd7_6b8a
