; ========================================
; New Subroutine: sub_1bd7_1dd3
; ========================================
sub_1bd7_1dd3:
    push es
    push ds
    pop es
    push cx
    mov cx, bx
    push si
    mov si, dx
    call sub_1bd7_1d77
    push di
    mov di, dx
    mov dx, si
    inc cx
    shr cx, 01
    repz movsw
    pop di
    pop si
    pop cx
    pop es
    ret
