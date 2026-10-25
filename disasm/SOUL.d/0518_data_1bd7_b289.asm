data_1bd7_b289:
    db 90  ; |.|

loc_1bd7_b28a:
    sub ax, ax
    push ax
    push ax
    push ax
    sub cx, cx
    push cx
    push cx
    push cx
    push cx
    mov cx, 0001
    push cx
    nop
    push cs
    call sub_1bd7_b988
    add sp, 10
    sub ax, ax
    push ax
    sub cx, cx
    push cx
    nop
    push cs
    call sub_1bd7_8c36
    add sp, 04
    mov word ptr [bp-a], 0002
    sub ax, ax
    push ax
    push ax
    lea ax, [bp-a]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    sub si, si
    mov es, [bp+10]
    mov ax, es:[di+2]
    mov [bp-4], ax
    mov ax, es:[di+4]
    mov [bp-6], ax
    mov ax, es:[di+6]
    mov [bp-8], ax

loc_1bd7_b2df:
    or si, si
    jnz loc_1bd7_b2f0
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_bd30
    add sp, 02
    jmp loc_1bd7_b310

loc_1bd7_b2f0:
    push word ptr [bp-8]
    push word ptr [bp-6]
    push word ptr [bp-4]
    push word ptr [bp+c]
    push word ptr [bp+a]
    push word ptr [bp+8]
    push word ptr [bp+6]
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b988
    add sp, 10

loc_1bd7_b310:
    mov [bp-2], ax
    cmp ax, 7fff
    jnz loc_1bd7_b322
    dec si
    sub ax, ax
    push ax
    mov ax, 0002
    jmp loc_1bd7_b335

data_1bd7_b321:
    db 90  ; |.|

loc_1bd7_b322:
    mov bx, di
    mov es, [bp+10]
    mov cx, si
    shl cx, 01
    add bx, cx
    mov es:[bx], ax
    inc si
    push ax
    mov ax, 0001

loc_1bd7_b335:
    push ax
    nop
    push cs
    call sub_1bd7_8c36
    add sp, 04
    cmp si, 01
    jb loc_1bd7_b2df
    mov es, [bp+10]
    mov bx, es:[di]
    shl bx, 01
    cmp [bx+62b0], si
    jnz loc_1bd7_b2df
    mov ax, 2c43
    mov es, ax
    mov ds, [bp+10]
    mov ax, [di]
    add ax, es:[0cb8]
    cmp ax, 3e80
    jbe loc_1bd7_b376
    mov ax, [di]

loc_1bd7_b367:
    mov es:[0cb8], ax
    mov cx, 7fc1
    mov ds, cx
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

loc_1bd7_b376:
    mov ax, [di]
    add ax, es:[0cb8]
    jmp loc_1bd7_b367

data_1bd7_b37f:
    db 90  ; |.|

loc_1bd7_b380:
    mov es, [6e66]
    mov word ptr es:[0cb8], 0000
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1bd7_bd30
    add sp, 02
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_b39d:
    db 90  ; |.|
