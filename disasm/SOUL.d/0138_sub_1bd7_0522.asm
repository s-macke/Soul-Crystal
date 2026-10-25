; ========================================
; New Subroutine: sub_1bd7_0522
; ========================================
sub_1bd7_0522:
    push di
    push es
    push ds
    pop es
    mov di, 6621
    mov cx, 0008
    repz movsw
    pop es
    pop di
    ret
