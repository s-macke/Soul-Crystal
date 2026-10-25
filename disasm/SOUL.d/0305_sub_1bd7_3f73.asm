; ========================================
; New Subroutine: sub_1bd7_3f73
; ========================================
sub_1bd7_3f73:
    push ax
    call sub_1bd7_3f82
    or ax, ax
    jz loc_1bd7_3f7d
    pop ax
    ret

loc_1bd7_3f7d:
    jmp loc_1bd7_16a6
