; ========================================
; New Subroutine: sub_1bd7_63e6
; ========================================
sub_1bd7_63e6:
    or bx, bx
    jnz loc_1bd7_63f5
    sub ah, 10
    jbe loc_1bd7_6459
    xchg dx, bx
    or bx, bx
    jz loc_1bd7_6459

loc_1bd7_63f5:
    or bh, bh
    jnz loc_1bd7_6408
    sub ah, 08
    jbe loc_1bd7_6459
    mov bh, bl
    mov bl, dh
    mov dh, dl
    xor dl, dl
    or bh, bh

loc_1bd7_6408:
    js sub_1bd7_6414

loc_1bd7_640a:
    dec ah
    jz loc_1bd7_6459
    shl dx, 01
    rcl bx, 01
    jno loc_1bd7_640a
