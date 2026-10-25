; ========================================
; New Subroutine: sub_1bd7_1c7b
; ========================================
sub_1bd7_1c7b:
    push ax
    push bx
    push cx
    push si
    push di
    push es
    push ds
    pop es
    mov si, [579e]

loc_1bd7_1c87:
    mov bx, [si]
    add bl, 01
    jnz loc_1bd7_1ca2
    mov ax, [bx+2]
    sub ax, 0002
    cmp ax, si
    jnz loc_1bd7_1cdf
    add si, [bx]
    add si, 03
    and si, fe
    jmp loc_1bd7_1c87

loc_1bd7_1ca2:
    mov di, si

loc_1bd7_1ca4:
    inc bx
    jz loc_1bd7_1ccd
    add si, bx

loc_1bd7_1ca9:
    mov bx, [si]
    add bl, 01
    jnz loc_1bd7_1ca4
    mov ax, [bx+2]
    sub ax, 0002
    cmp ax, si
    jnz loc_1bd7_1cdf
    mov ax, di
    add ax, 0002
    mov [bx+2], ax
    mov cx, [bx]
    add cx, 03
    shr cx, 01
    repz movsw
    jmp loc_1bd7_1ca9

loc_1bd7_1ccd:
    sub si, di
    jz loc_1bd7_1cd4
    dec si
    mov [di], si

loc_1bd7_1cd4:
    mov [57a0], di
    pop es
    pop di
    pop si
    pop cx
    pop bx
    pop ax
    ret

loc_1bd7_1cdf:
    jmp loc_1bd7_1688
