; ========================================
; New Subroutine: sub_1bd7_1a04
; ========================================
sub_1bd7_1a04:
    lodsb byte ptr [si]
    cmp al, 20
    jz sub_1bd7_1a04
    cmp al, 09
    jz sub_1bd7_1a04
    cmp al, 0a
    jz sub_1bd7_1a04

loc_1bd7_1a11:
    jmp loc_1bd7_0246
