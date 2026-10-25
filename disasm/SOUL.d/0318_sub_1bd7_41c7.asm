; ========================================
; New Subroutine: sub_1bd7_41c7
; ========================================
sub_1bd7_41c7:
    call sub_1bd7_41d5
    mov dx, ax
    mov cl, 04
    shl ax, cl
    mov cl, 0c
    shr dx, cl
    ret
