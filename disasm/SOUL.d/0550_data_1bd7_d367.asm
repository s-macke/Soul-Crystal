data_1bd7_d367:
    db 90  ; |.|

loc_1bd7_d368:
    mov di, [bp+8]
    mov ax, es:[0c6e]
    mov cx, di
    shr di, 01
    shr di, 01
    mul di
    add ax, es:[0c68]
    mov dx, es:[0c6a]
    add ax, [bp+6]
    mov [bp-1c], ax
    mov [bp-1a], dx
    mov word ptr [bp-16], 0000
    mov word ptr [bp-14], 5387
    mov ch, cl
    and cx, 0300
    mov ax, cx
    mov cl, 05
    shl ax, cl
    mov [bp-c], ax
    mov word ptr [bp-12], 0000
    mov bx, [bp+e]
    or bx, bx
    jnz loc_1bd7_d3b2
    jmp loc_1bd7_d61b

loc_1bd7_d3b2:
    mov [bp-2], bx
    mov si, ax
    mov di, [bp-1c]

loc_1bd7_d3ba:
    push word ptr [bp+c]
    push word ptr [bp-14]
    push word ptr [bp-16]
    mov ax, di
    mov dx, [bp-1a]
    add ax, si
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    add si, 2000
    cmp si, 6000
    jbe loc_1bd7_d3e9
    sub si, si
    mov es, [6e86]
    add di, es:[0c6e]

loc_1bd7_d3e9:
    mov ax, [bp+a]
    add [bp-16], ax
    dec word ptr [bp-2]
    jnz loc_1bd7_d3ba
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

loc_1bd7_d3fa:
    mov ax, es:[0c6e]
    mul word ptr [bp+8]
    add ax, es:[0c68]
    mov dx, es:[0c6a]
    add ax, [bp+6]
    mov [bp-1c], ax
    mov [bp-1a], dx
    mov word ptr [bp-16], 0000
    mov word ptr [bp-14], 5387
    mov ax, es:[0c6c]
    mul word ptr [bp+a]
    mov [bp-18], ax
    sub di, di
    mov bx, di
    mov [bp-12], bx
    cmp [bp+e], bx
    jnz loc_1bd7_d437
    jmp loc_1bd7_d61b

loc_1bd7_d437:
    mov cx, di

loc_1bd7_d439:
    sub ax, ax
    mov [bp-2], ax
    mov [bp-4], ax
    cmp es:[0c6c], ax
    jnz loc_1bd7_d44b
    jmp loc_1bd7_d500

loc_1bd7_d44b:
    mov ax, di
    add ax, 0000
    mov al, cl
    inc al
    and ax, 0003
    mov [bp-1e], ax
    mov si, [bp-2]
    mov [bp-12], cx
    mov [bp-6], di
    mov [bp-c], bx
    mov di, [bp-4]

loc_1bd7_d469:
    mov ax, 0002
    push ax
    mov ax, 03c4
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov cx, di
    mov ax, 0001
    shl ax, cl
    push ax
    mov ax, 03c5
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    push word ptr [bp+c]
    mov ax, [bp-6]
    add ax, 0000
    mov dx, 5387
    add ax, si
    mov [bp-22], ax
    mov [bp-20], dx
    push dx
    push ax
    mov ax, [bp-1c]
    mov dx, [bp-1a]
    add ax, [bp-c]
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    cmp word ptr [bp-1e], 00
    jz loc_1bd7_d4e0
    push word ptr [bp+c]
    push word ptr [bp-20]
    push word ptr [bp-22]
    mov es, [6e86]
    mov ax, es:[0c6e]
    add ax, [bp-1c]
    mov dx, [bp-1a]
    add ax, [bp-c]
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a

loc_1bd7_d4e0:
    add si, [bp+a]
    mov es, [6e86]
    inc di
    cmp es:[0c6c], di
    jbe loc_1bd7_d4f2
    jmp loc_1bd7_d469

loc_1bd7_d4f2:
    mov bx, [bp-c]
    mov cx, [bp-12]
    mov di, [bp-6]
    mov ax, 2c43
    mov es, ax

loc_1bd7_d500:
    add bx, es:[0c6e]
    mov al, cl
    inc al
    test al, 03
    jz loc_1bd7_d512
    add bx, es:[0c6e]

loc_1bd7_d512:
    add di, [bp-18]
    mov ax, cx
    inc ax
    mov cx, ax
    cmp cx, [bp+e]
    jae loc_1bd7_d522
    jmp loc_1bd7_d439

loc_1bd7_d522:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

loc_1bd7_d528:
    mov ax, es:[0c6e]
    mul word ptr [bp+8]
    add ax, es:[0c68]
    mov dx, es:[0c6a]
    add ax, [bp+6]
    mov [bp-1c], ax
    mov [bp-1a], dx
    mov word ptr [bp-16], 0000
    mov word ptr [bp-14], 5387
    mov ax, es:[0c6c]
    mul word ptr [bp+a]
    mov [bp-18], ax
    sub ax, ax
    mov [bp-c], ax
    mov [bp-6], ax
    mov [bp-12], ax
    mov bx, [bp+e]
    or bx, bx
    jnz loc_1bd7_d56b
    jmp loc_1bd7_d61b

loc_1bd7_d56b:
    mov [bp-8], bx

loc_1bd7_d56e:
    sub di, di
    mov si, di
    cmp es:[0c6c], si
    jnz loc_1bd7_d57c
    jmp loc_1bd7_d604

loc_1bd7_d57c:
    mov ax, 0002
    push ax
    mov ax, 03c4
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov cx, di
    mov ax, 0001
    shl ax, cl
    push ax
    mov ax, 03c5
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    push word ptr [bp+c]
    mov ax, [bp-6]
    add ax, 0000
    mov dx, 5387
    add ax, si
    push dx
    push ax
    mov cx, [bp-1c]
    mov bx, [bp-1a]
    add cx, [bp-c]
    push bx
    push cx
    mov [bp-26], ax
    mov [bp-24], dx
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    push word ptr [bp+c]
    push word ptr [bp-24]
    push word ptr [bp-26]
    mov es, [6e86]
    mov ax, es:[0c6e]
    add ax, [bp-1c]
    mov dx, [bp-1a]
    add ax, [bp-c]
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    add si, [bp+a]
    mov es, [6e86]
    inc di
    cmp es:[0c6c], di
    jbe loc_1bd7_d5ff
    jmp loc_1bd7_d57c

loc_1bd7_d5ff:
    mov ax, 2c43
    mov es, ax

loc_1bd7_d604:
    mov ax, es:[0c6e]
    shl ax, 01
    add [bp-c], ax
    mov ax, [bp-18]
    add [bp-6], ax
    dec word ptr [bp-8]
    jz loc_1bd7_d61b
    jmp loc_1bd7_d56e

loc_1bd7_d61b:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_d621:
    db 90  ; |.|
