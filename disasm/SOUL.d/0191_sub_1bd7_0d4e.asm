; ========================================
; New Subroutine: sub_1bd7_0d4e
; ========================================
sub_1bd7_0d4e:
    call sub_1bd7_0d16
    jae loc_1bd7_0d5e
    cmp al, 01
    jnz loc_1bd7_0d59
    xor ah, al

loc_1bd7_0d59:
    xor al, al
    call sub_1bd7_0d16

loc_1bd7_0d5e:
    xchg cx, bx
    push dx
    call word ptr [6ad9]
    call sub_1bd7_29c8
    mov al, [6ac3]  ; data_7fc1_6ac3 byte read
    mov cl, [6ac4]  ; data_7fc1_6ac4 byte read
    call sub_1bd7_022e
    pop ax
    cmp al, [6ad0]  ; data_7fc1_6ad0 byte read
    ja loc_1bd7_0d7f
    cmp ah, [6ad0]  ; data_7fc1_6ad0 byte read
    jbe loc_1bd7_0d81

loc_1bd7_0d7f:
    xor ax, ax

loc_1bd7_0d81:
    call word ptr [6add]
    ret

data_1bd7_0d86:
    db f6, 06, b4, 57, 08, 75, 18, 33, c0, 8e, c0, a0, b0, 57, 26, 3a  ; |...W.u.3.....W&:|
    db 06, 10, 04, 26, a2, 10, 04, 1e, 07, 74, 04, e8, 95, 16, f9, a1  ; |...&.....t......|
    db b9, 6a, 8b, 0e, bd, 6a, 72, 19, 3a, 06, c0, 6a, 75, 12, 3a, 26  ; |.j...jr.:..ju.:&|
    db c2, 6a, 75, 0c, 3a, 2e, c4, 6a, 75, 06, 3a, 0e, c3, 6a, 74, 01  ; |.ju.:..ju.:..jt.|
    db f9, 9c, e8, 4b, ff, 87, d9, ff, 16, d9, 6a, a0, c3, 6a, 8a, 0e  ; |...K......j..j..|
    db c4, 6a, e8, 53, f4, 9d, 73, 0c, e8, fb, 17, ff, 16, db, 6a, e8  ; |.j.S..s.......j.|
    db 9c, f5, eb, 03, e8, a1, f5, e8, d8, 1b, ff, 16, df, 6a, 8b, 16  ; |.............j..|
    db 5a, 67, e8, c0, fd, a1, bb, 6a, ff, 16, dd, 6a, e8, 59, fd, 33  ; |Zg.....j...j.Y.3|
    db c9, 86, 0e, 5e, 57, e3, 03, e8, 7b, fd, e8, 1b, fd, 74, 05, e8  ; |...^W...{....t..|
    db a3, fd, eb, 06, a1, b6, 6a, e8, 9e, fd, c3  ; |......j....|
