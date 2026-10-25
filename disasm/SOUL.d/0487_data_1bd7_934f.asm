data_1bd7_934f:
    db 90  ; |.|

loc_1bd7_9350:
    nop
    push cs
    call sub_1bd7_76a2
    mov cx, 0004
    cwd
    idiv cx
    mov [6eb6], dx
    sub si, si

loc_1bd7_9361:
    sub ax, ax
    push ax
    mov ax, 0002
    push ax
    push di
    push ax
    les bx, [bp-6]
    mov ax, 00b0
    imul word ptr [6eb6]
    mov cx, es:[bx]
    mov bx, ax
    mov bl, [bx+si+5a7e]
    sub bh, bh
    mov ax, bx
    shl bx, 01
    add bx, ax
    mov ax, bx
    add bx, cx
    mov cl, [bx+586e]
    sub ch, ch
    push cx
    mov bx, ax
    mov cl, [bx+586e]
    push cx
    mov es, [6e24]
    push word ptr es:[0c86]
    mov dl, [bx+586f]
    sub dh, dh
    add dx, es:[0c84]
    push dx
    add cx, es:[0c82]
    push cx
    nop
    push cs
    call sub_1bd7_cccc
    add sp, 12
    inc si
    cmp si, 00b0
    jl loc_1bd7_9361
    jmp loc_1bd7_9423

data_1bd7_93c3:
    db 90  ; |.|

loc_1bd7_93c4:
    mov si, 00af

loc_1bd7_93c7:
    sub ax, ax
    push ax
    mov ax, 0002
    push ax
    push di
    push ax
    les bx, [bp-6]
    mov ax, 00b0
    imul word ptr [6eb6]
    mov cx, es:[bx]
    mov bx, ax
    mov bl, [bx+si+5a7e]
    sub bh, bh
    mov ax, bx
    shl bx, 01
    add bx, ax
    mov ax, bx
    add bx, cx
    mov cl, [bx+586e]
    sub ch, ch
    push cx
    mov bx, ax
    mov cl, [bx+586e]
    push cx
    mov es, [6e24]
    push word ptr es:[0c86]
    mov dl, [bx+586f]
    sub dh, dh
    add dx, es:[0c84]
    push dx
    add cx, es:[0c82]
    push cx
    nop
    push cs
    call sub_1bd7_cccc
    add sp, 12
    dec si
    jns loc_1bd7_93c7

loc_1bd7_9423:
    sub ax, ax
    push ax
    mov ax, 0003
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
