; ========================================
; New Subroutine: sub_1bd7_e58c
; ========================================
sub_1bd7_e58c:
    push ds
    push es
    cli
    mov al, 36
    out 43, al
    xor ax, ax
    out 40, al
    out 40, al
    mov es, ax
    lds dx, cs:[e298]
    mov es:[0020], dx
    mov es:[0022], ds
    sti
    pop es
    pop ds
    ret
