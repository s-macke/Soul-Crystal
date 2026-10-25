; ========================================
; New Subroutine: sub_1bd7_42d4
; ========================================
sub_1bd7_42d4:
    int 21
    jae loc_1bd7_42de
    cmp ax, 0008
    jnz loc_1bd7_42df
    stc

loc_1bd7_42de:
    ret

loc_1bd7_42df:
    cmp ax, 0007
    jnz loc_1bd7_42e9
    jmp loc_1bd7_169c
