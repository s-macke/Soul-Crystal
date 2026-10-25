data_1bd7_88a1:
    db 90  ; |.|

loc_1bd7_88a2:
    lea dx, [si-2]
    cmp dx, bx
    jae loc_1bd7_888a
    add si, ax
    jb loc_1bd7_88d0

loc_1bd7_88ad:
    lodsw word ptr [si]
    test al, 01
    jz loc_1bd7_88a2
    mov di, si

loc_1bd7_88b4:
    dec ax
    cmp ax, cx
    jae loc_1bd7_88dc
    add si, ax
    jb loc_1bd7_88d0
    mov dx, ax
    lodsw word ptr [si]
    test al, 01
    jz loc_1bd7_88a2
    add ax, dx
    add ax, 0002
    mov si, di
    mov [si-2], ax
    jmp loc_1bd7_88b4

loc_1bd7_88d0:
    mov ax, ax

loc_1bd7_88d2:
    pop bx

loc_1bd7_88d3:
    mov ax, [bx+6]
    mov [bx+8], ax
    stc
    jmp loc_1bd7_88f5

loc_1bd7_88dc:
    pop bx
    mov [si-2], cx
    jz loc_1bd7_88eb
    add di, cx
    sub ax, cx
    dec ax
    mov [di], ax
    sub di, cx

loc_1bd7_88eb:
    add di, cx
    mov [bx+8], di
    mov ax, si
    mov dx, ds
    clc

loc_1bd7_88f5:
    ret

data_1bd7_88f6:
    db 51, 57, f6, 47, 02, 01, 74, 66, e8, d5, 00, 8b, fe, 8b, 04, a8  ; |QW.G..tf........|
    db 01, 74, 03, 2b, c8, 49, 41, 41, 8b, 77, 04, 0b, f6, 74, 4f, 03  ; |.t.+.IAA.w...tO.|
    db ce, 73, 09, 33, c0, ba, f0, ff, e3, 33, eb, 42, b8, c1, 7f, 8e  ; |.s.3.....3.B....|
    db c0, 26, a1, b4, 6d, 3d, 00, 20, 74, 16, ba, 00, 80, 3b, d0, 72  ; |.&..m=. t....;.r|
    db 06, d1, ea, 75, f8, eb, 22, 83, fa, 08, 72, 1d, d1, e2, 8b, c2  ; |...u.."...r.....|
    db 48, 8b, d0, 03, c1, 73, 02, 33, c0, f7, d2, 23, c2, 52, e8, 2e  ; |H....s.3...#.R..|
    db 00, 5a, 73, 0d, 83, fa, f0, 74, 05, b8, 10, 00, eb, e2, f9, eb  ; |.Zs....t........|
    db 1b, 8b, d0, 2b, 57, 04, 89, 47, 04, 89, 7f, 08, 8b, 77, 0a, 4a  ; |...+W..G.....w.J|
    db 89, 14, 42, 03, f2, c7, 04, fe, ff, 89, 77, 0a, 5f, 59, c3, 8b  ; |..B.......w._Y..|
    db d0, f6, 47, 02, 04, 74, 0f, 4a, 8b, 77, 04, 4e, 3b, d6, 72, 05  ; |..G..t.J.w.N;.r.|
    db 39, 57, fe, 73, 36, 42, 53, 51, 8c, de, 8e, c6, b1, 04, d3, e8  ; |9W.s6BSQ........|
    db 75, 03, b8, 00, 10, f6, 47, 02, 04, 74, 0a, 03, c6, 8b, 1e, d6  ; |u.....G..t......|
    db 67, 2b, c3, 8e, c3, 8b, d8, b4, 4a, cd, 21, 59, 5b, 72, 10, 8b  ; |g+......J.!Y[r..|
    db c2, f6, 47, 02, 04, 74, 04, 4a, 89, 57, fe, f8, eb, 01, f9, c3  ; |..G..t.J.W......|
    db 57, 8b, 77, 08, 3b, 77, 0a, 75, 03, 8b, 77, 06, ad, 3d, fe, ff  ; |W.w.;w.u..w..=..|
    db 74, 08, 8b, fe, 24, fe, 03, f0, eb, f2, 4f, 4f, 8b, f7, 5f, c3  ; |t...$.....OO.._.|
