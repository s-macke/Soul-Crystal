data_1bd7_bbf1:
    db 90, 00, bc, 00, bc, 00, bc, 00, bc, 12, bc, 42, bc, 70, bc, 8b  ; |...........B.p..|
    db c6, 2a, e4, 48, a3, c8, 6e, 50, 0e, e8, 7b, 00, 83, c4, 02, eb  ; |.*.H..nP..{.....|
    db 63, 8b, c6, 2a, c0, 2d, 00, 01, 74, 07, 2d, 00, 01, 74, 12, eb  ; |c..*.-..t.-..t..|
    db 53, 83, 3e, c8, 6e, 00, 74, 4c, ff, 0e, c8, 6e, 2b, ff, eb, 44  ; |S.>.n.tL...n+..D|
    db 90, 83, 3e, c8, 6e, 00, 74, 3c, c7, 06, c8, 6e, 00, 00, eb, 34  ; |..>.n.t<...n...4|
    db 90, 8b, c6, 2a, c0, 2d, 00, 01, 74, 07, 2d, 00, 01, 74, 10, eb  ; |...*.-..t.-..t..|
    db 23, 83, 3e, c8, 6e, 03, 74, 1c, ff, 06, c8, 6e, eb, ce, 90, 83  ; |#.>.n.t....n....|
    db 3e, c8, 6e, 03, 74, 0e, c7, 06, c8, 6e, 03, 00, eb, 06, 90, 8b  ; |>.n.t....n......|
    db 36, c8, 6e, 46  ; |6.nF|

loc_1bd7_bc75:
    or di, di
    jnz loc_1bd7_bc7c
    jmp loc_1bd7_bbc2

loc_1bd7_bc7c:
    mov [bp-2], si

loc_1bd7_bc7f:
    mov ax, [bp-2]
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
