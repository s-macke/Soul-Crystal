; ========================================
; New Subroutine: sub_1bd7_6fb8
; ========================================
sub_1bd7_6fb8:
    cmp si, di
    jae loc_1bd7_6fca
    sub di, 04
    mov ax, [di]
    or ax, [di+2]
    jz sub_1bd7_6fb8
    call far, [di]
    jmp sub_1bd7_6fb8

loc_1bd7_6fca:
    ret
