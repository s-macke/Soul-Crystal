; ========================================
; New Subroutine: sub_1bd7_8766
; ========================================
sub_1bd7_8766:
    pop cx
    pop dx
    mov ax, [6772]
    cmp ax, sp
    jae loc_1bd7_8776
    sub ax, sp
    neg ax

loc_1bd7_8773:
    push dx
    push cx
    retf

loc_1bd7_8776:
    xor ax, ax
    jmp loc_1bd7_8773
