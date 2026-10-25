data_1bd7_03c8:
    db b8, 02, 01, 55, 8b, ec, 56, a3, 4b, 68, 8d, 5e, 06, ff, 16, 1f  ; |...U..V.Kh.^....|
    db 66  ; |f|

loc_1bd7_03d9:
    mov al, [684c]
    cbw
    dec ax
    jg loc_1bd7_0412
    add byte ptr [661c], 04
    jnz loc_1bd7_040a
    inc ax
    jnz loc_1bd7_0419
    call word ptr [6621]
    mov al, ah
    xor ah, ah
    mov cl, 0e
    div cl
    sub cl, ah
    xchg ax, cx
    cbw
    push ax
    add ax, 000e
    call word ptr [662f]
    pop cx
    jb loc_1bd7_0419
    call sub_1bd7_0531
    jmp loc_1bd7_0419

loc_1bd7_040a:
    mov al, 2c
    call word ptr [6627]
    jmp loc_1bd7_0419

loc_1bd7_0412:
    call word ptr [6625]
    call sub_1bd7_04ad

loc_1bd7_0419:
    mov al, [684b]
    pop si
    pop bp
    test al, 03
    jnz loc_1bd7_0429
    test al, 08
    jz loc_1bd7_042c
    retf 0008

loc_1bd7_0429:
    retf 0002

loc_1bd7_042c:
    retf 0004

data_1bd7_042f:
    db e8, 86, 16, 8b, f3, 03, d8, 40, c6, 07, 20, e8, 67, 00, eb, 2a  ; |.......@.. .g..*|
    db e8, 76, 16, 8b, f3, 80, 3f, 20, 75, 02, 46, 48, e8, 56, 00, eb  ; |.v....? u.FH.V..|
    db 1f, 53, 8b, 07, b0, 22, ff, 16, 27, 66, 5b, 53, ff, 16, 29, 66  ; |.S..."..'f[S..)f|
    db b0, 22, ff, 16, 27, 66, eb, 0d, 8b, 07, 53, ff, 16, 2f, 66, 5b  ; |."..'f....S../f[|
    db 53, ff, 16, 29, 66, 5b, e9, 90, 19, 92, ff, 16, 23, 66, 80, fc  ; |S..)f[......#f..|
    db ff, 74, 21, 8a, c4, eb, 04, 92, a0, 64, 67, ff, 16, 21, 66, 0a  ; |.t!......dg..!f.|
    db f6, 75, 08, 2a, c4, 72, 04, 3a, c2, 73, 09, 0a, e4, 74, 04, ff  ; |.u.*.r.:.s...t..|
    db 16, 25, 66, f9, c3, bb, 40, 66, 89, 07, 89, 77, 02, c3  ; |.%f...@f...w..|
