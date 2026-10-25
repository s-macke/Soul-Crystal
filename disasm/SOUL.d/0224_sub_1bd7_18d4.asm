; ========================================
; New Subroutine: sub_1bd7_18d4
; ========================================
sub_1bd7_18d4:
    push si
    push es
    xor cx, cx
    call sub_2b9c_041a
    call sub_1bd7_0f73
    call sub_1bd7_2b8e
    or ax, ax
    jnz loc_1bd7_18d1
    call sub_1bd7_232e
    jb loc_1bd7_18d1
    pop es
    pop si
    ret
