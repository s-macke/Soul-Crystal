; ========================================
; New Subroutine: sub_1bd7_8755
; ========================================
sub_1bd7_8755:
    mov ax, [67d2]
    not ax
    and ax, cx
    xor cx, cx
    test al, 80
    jnz loc_1bd7_8765
    or cl, 01

loc_1bd7_8765:
    ret
