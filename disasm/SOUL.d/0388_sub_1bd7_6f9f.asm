; ========================================
; New Subroutine: sub_1bd7_6f9f
; ========================================
sub_1bd7_6f9f:
    mov cx, [6dfe]
    jcxz loc_1bd7_6fac
    mov bx, 0002
    call far, [6dfc]

loc_1bd7_6fac:
    push ds
    lds dx, [67c4]
    mov ax, 2500
    int 21
    pop ds
    retf
