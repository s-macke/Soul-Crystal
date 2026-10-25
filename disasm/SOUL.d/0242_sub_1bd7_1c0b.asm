; ========================================
; New Subroutine: sub_1bd7_1c0b
; ========================================
sub_1bd7_1c0b:
    mov si, [57a0]
    mov dx, [57a2]
    call sub_1bd7_1c31
    jae loc_1bd7_1c30
    mov si, [579e]
    xchg [57a0], dx
    call sub_1bd7_1c31
    jae loc_1bd7_1c30
    cmp dx, [57a0]
    ja loc_1bd7_1c2f
    mov [57a0], dx

loc_1bd7_1c2f:
    stc

loc_1bd7_1c30:
    ret
