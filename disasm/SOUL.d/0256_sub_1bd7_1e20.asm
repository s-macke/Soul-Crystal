; ========================================
; New Subroutine: sub_1bd7_1e20
; ========================================
sub_1bd7_1e20:
    push es
    push ds
    pop es
    push ax
    push cx
    push si
    push di
    mov si, cx
    mov ax, bx
    mov cx, dx
    mov bx, dx
    call sub_1bd7_1d77
    mov di, dx
    xchg ax, bx
    add si, [bx+2]
    call sub_1bd7_1e08
    xchg ax, bx
    mov dx, cx
    inc cx
    shr cx, 01
    repz movsw
    pop di
    pop si
    pop cx
    pop ax
    pop es
    ret
