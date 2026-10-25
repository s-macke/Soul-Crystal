data_1bd7_8c09:
    db 90, 8b, d8, 33, c0, 8b, 4e, 0a, 3b, d3, 7f, 02, 87, da, 3b, ca  ; |...3..N.;.....;.|
    db 7f, 05, 3b, d9, 7f, 01, 48, eb, 0f, 90, 90, 90  ; |..;...H.....|

loc_1bd7_8c25:
    push bp
    mov bp, sp
    pushf
    mov ax, [bp+6]
    mov dx, [bp+8]
    jmp bx

data_1bd7_8c31:
    db 9d, 8b, e5, 5d, cb  ; |...].|
