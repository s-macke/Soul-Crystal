; ========================================
; New Subroutine: sub_1bd7_1ef6
; ========================================
sub_1bd7_1ef6:
    mov bx, [57a0]
    mov bx, [bx]
    add bl, 01
    jz loc_1bd7_1f06
    cmp bx, ff
    jnz loc_1bd7_1f09

loc_1bd7_1f06:
    mov bx, 0001

loc_1bd7_1f09:
    dec bx
    ret
