; ========================================
; New Subroutine: sub_1bd7_3e52
; ========================================
sub_1bd7_3e52:
    mov bx, 0001
    mov cl, 02

loc_1bd7_3e57:
    mov ax, 4400
    int 21
    add dl, 80
    jz loc_1bd7_3e66
    add dl, 03
    jnz loc_1bd7_3e6a

loc_1bd7_3e66:
    or [6618], cl

loc_1bd7_3e6a:
    mov cl, 01
    dec bx
    jz loc_1bd7_3e57
    call sub_1bd7_3e73
    ret
