data_1bd7_cd07:
    db 90  ; |.|

loc_1bd7_cd08:
    mov di, [bp+8]
    mov ax, es:[0c6e]
    mov cx, di
    shr di, 01
    shr di, 01
    mul di
    add ax, es:[0c68]
    mov dx, es:[0c6a]
    add ax, [bp+6]
    mov [bp-1a], ax
    mov [bp-18], dx
    mov ax, [bp+e]
    mul word ptr [bp+a]
    add ax, [bp+c]
    add ax, 0000
    mov [bp-1e], ax
    mov word ptr [bp-1c], 5387
    mov ch, cl
    and cx, 0300
    mov ax, cx
    mov cl, 05
    shl ax, cl
    mov [bp-4], ax
    mov bx, [bp+12]
    or bx, bx
    jnz loc_1bd7_cd57
    jmp loc_1bd7_d03d

loc_1bd7_cd57:
    mov [bp-6], bx
    mov si, ax
    mov di, [bp-1a]

loc_1bd7_cd5f:
    push word ptr [bp+10]
    push word ptr [bp-1c]
    push word ptr [bp-1e]
    mov ax, di
    mov dx, [bp-18]
    add ax, si
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    add si, 2000
    cmp si, 6000
    jbe loc_1bd7_cd8e
    sub si, si
    mov es, [6e86]
    add di, es:[0c6e]

loc_1bd7_cd8e:
    mov ax, [bp+a]
    add [bp-1e], ax
    dec word ptr [bp-6]
    jnz loc_1bd7_cd5f
    jmp loc_1bd7_d03d

loc_1bd7_cd9c:
    mov ax, [bp+14]
    dec ax
    jz loc_1bd7_cdac
    dec ax
    jnz loc_1bd7_cda8
    jmp loc_1bd7_ce7a

loc_1bd7_cda8:
    jmp loc_1bd7_d03d

data_1bd7_cdab:
    db 90  ; |.|

loc_1bd7_cdac:
    mov ax, es:[0c6e]
    mul word ptr [bp+8]
    add ax, es:[0c68]
    mov dx, es:[0c6a]
    add ax, [bp+6]
    mov [bp-1a], ax
    mov [bp-18], dx
    mov si, [bp+a]
    mov ax, es:[0c6c]
    mov cx, ax
    mul word ptr [bp+e]
    mul si
    add ax, [bp+c]
    add ax, 0000
    mov [bp-1e], ax
    mov word ptr [bp-1c], 5387
    mov ax, cx
    mul si
    mov [bp-14], ax
    sub ax, ax
    mov [bp-4], ax
    mov [bp-e], ax
    mov bx, [bp+12]
    or bx, bx
    jnz loc_1bd7_cdfb
    jmp loc_1bd7_d03d

loc_1bd7_cdfb:
    mov [bp-6], bx

loc_1bd7_cdfe:
    sub di, di
    mov si, di
    cmp es:[0c6c], si
    jz loc_1bd7_ce64

loc_1bd7_ce09:
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
    push word ptr [bp+10]
    mov ax, [bp-1e]
    mov dx, [bp-1c]
    add ax, [bp-e]
    add ax, si
    push dx
    push ax
    mov ax, [bp-1a]
    mov dx, [bp-18]
    add ax, [bp-4]
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
    ja loc_1bd7_ce09
    mov ax, 2c43
    mov es, ax

loc_1bd7_ce64:
    mov ax, es:[0c6e]
    add [bp-4], ax
    mov ax, [bp-14]
    add [bp-e], ax
    dec word ptr [bp-6]
    jnz loc_1bd7_cdfe
    jmp loc_1bd7_d03d

data_1bd7_ce79:
    db 90  ; |.|

loc_1bd7_ce7a:
    mov ax, es:[0c6e]
    mul word ptr [bp+8]
    add ax, es:[0c68]
    mov dx, es:[0c6a]
    add ax, [bp+6]
    mov [bp-1a], ax
    mov [bp-18], dx
    mov bx, [bp+a]
    mov ax, es:[0c6c]
    mul word ptr [bp+e]
    mul bx
    add ax, [bp+c]
    add ax, 0000
    mov [bp-1e], ax
    mov word ptr [bp-1c], 5387
    mov ax, bx
    shl ax, 01
    shl ax, 01
    mov [bp-2], ax
    mov ax, bx
    shl ax, 01
    mov [bp-14], ax
    mov ax, bx
    shl ax, 01
    add ax, bx
    mov [bp-6], ax
    sub ax, ax
    mov [bp-4], ax
    mov [bp-e], ax
    mov si, [bp+12]
    or si, si
    jnz loc_1bd7_ced9
    jmp loc_1bd7_d03d

loc_1bd7_ced9:
    mov [bp-8], si
    mov si, ax
    mov di, ax

loc_1bd7_cee0:
    mov ax, 0002
    push ax
    mov cx, 03c4
    push cx
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov ax, 0001
    push ax
    mov ax, 03c5
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    push word ptr [bp+10]
    mov ax, [bp-1e]
    mov dx, [bp-1c]
    add ax, di
    push dx
    push ax
    mov cx, [bp-1a]
    mov bx, [bp-18]
    add cx, si
    push bx
    push cx
    mov [bp-22], ax
    mov [bp-20], dx
    mov [bp-26], cx
    mov [bp-24], bx
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    push word ptr [bp+10]
    push word ptr [bp-20]
    push word ptr [bp-22]
    mov ax, [bp-26]
    mov dx, [bp-24]
    add ax, 0050
    push dx
    push ax
    mov [bp-2a], ax
    mov [bp-28], dx
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    mov ax, 0002
    push ax
    mov ax, 03c5
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    push word ptr [bp+10]
    mov ax, [bp-1e]
    mov dx, [bp-1c]
    add ax, [bp+a]
    add ax, di
    push dx
    push ax
    push word ptr [bp-24]
    push word ptr [bp-26]
    mov [bp-2e], ax
    mov [bp-2c], dx
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    push word ptr [bp+10]
    push word ptr [bp-2c]
    push word ptr [bp-2e]
    push word ptr [bp-28]
    push word ptr [bp-2a]
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    mov ax, 0004
    push ax
    mov ax, 03c5
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    push word ptr [bp+10]
    mov ax, [bp-1e]
    mov dx, [bp-1c]
    add ax, [bp-14]
    add ax, di
    push dx
    push ax
    push word ptr [bp-24]
    push word ptr [bp-26]
    mov [bp-32], ax
    mov [bp-30], dx
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    push word ptr [bp+10]
    push word ptr [bp-30]
    push word ptr [bp-32]
    push word ptr [bp-28]
    push word ptr [bp-2a]
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    mov ax, 0008
    push ax
    mov ax, 03c5
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    push word ptr [bp+10]
    mov ax, [bp-1e]
    mov dx, [bp-1c]
    add ax, [bp-6]
    add ax, di
    push dx
    push ax
    push word ptr [bp-24]
    push word ptr [bp-26]
    mov [bp-36], ax
    mov [bp-34], dx
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    push word ptr [bp+10]
    push word ptr [bp-34]
    push word ptr [bp-36]
    push word ptr [bp-28]
    push word ptr [bp-2a]
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    add si, 00a0
    add di, [bp-2]
    dec word ptr [bp-8]
    jz loc_1bd7_d03d
    jmp loc_1bd7_cee0

loc_1bd7_d03d:
    cmp word ptr [bp+16], 00
    jz loc_1bd7_d052
    sub ax, ax
    push ax
    mov ax, 0003
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04

loc_1bd7_d052:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
