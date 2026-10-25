; ========================================
; New Subroutine: sub_1bd7_1d0b
; ========================================
sub_1bd7_1d0b:
    push bx
    push cx
    push di
    push es
    push ds
    pop es
    xchg ax, si
    sub ax, si
    call sub_1bd7_1ef6
    cmp bx, ax
    jb loc_1bd7_1d5d

loc_1bd7_1d1b:
    mov bx, [si]
    add bl, 01
    jnz loc_1bd7_1d2f
    add [bx+2], ax
    add si, [bx]
    add si, 03
    and si, fe
    jmp loc_1bd7_1d1b

loc_1bd7_1d2f:
    mov si, [57a0]
    mov cx, si
    sub cx, [579e]
    shr cx, 01
    sub si, 02
    mov di, si
    add di, ax
    std
    repz movsw
    cld
    add [579e], ax
    mov bx, [57a0]
    add bx, ax
    mov [57a0], bx
    mov cx, [57a2]
    sub cx, bx
    dec cx
    mov [bx], cx

loc_1bd7_1d5d:
    pop es
    pop di
    pop cx
    pop bx
    ret
