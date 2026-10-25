data_1bd7_dd43:
    db 90  ; |.|

loc_1bd7_dd44:
    mov [bp-10], di
    mov word ptr [bp-a], 0000

loc_1bd7_dd4c:
    mov cl, 07
    mov si, [bp-a]
    shl si, cl
    add si, 0768
    mov ax, 0010
    mov [bp-8], ax
    mov [bp-c], ax

loc_1bd7_dd60:
    mov di, 0004

loc_1bd7_dd63:
    mov ax, 2c43
    push ax
    push si
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc si
    inc si
    dec di
    jnz loc_1bd7_dd63
    dec word ptr [bp-8]
    jnz loc_1bd7_dd60
    inc word ptr [bp-a]
    cmp word ptr [bp-a], 0a
    jl loc_1bd7_dd4c
    mov di, [bp-10]
    mov si, [bp-6]
    jmp loc_1bd7_db8d

loc_1bd7_dd90:
    mov ax, [bp-e]
    push ax
    push di
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04
    mov [bp-a], si
    mov [bp-6], si
    mov ax, 2c43
    mov ds, ax

loc_1bd7_dda8:
    mov bx, [bp-a]
    xor byte ptr [bx+181e], aa
    inc word ptr [bp-a]
    cmp word ptr [bp-a], 0a60
    jl loc_1bd7_dda8
    mov ax, 7fc1
    mov ds, ax
    jmp loc_1bd7_dc03

loc_1bd7_ddc2:
    sub ax, ax
    push ax
    mov cx, 0014
    sub dx, dx
    push dx
    push cx
    push word ptr [bp-e]
    push di
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    sub ax, ax
    push ax
    mov es, [6e88]
    push word ptr es:[0c8c]
    push word ptr [bp-e]
    push di
    nop
    push cs
    call sub_1bd7_b39e
    add sp, 08
    or ax, ax
    jnz loc_1bd7_ddf7
    mov si, 0406

loc_1bd7_ddf7:
    mov ax, [bp-e]
    push ax
    push di
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_de04:
    or si, si
    jnz loc_1bd7_de68
    mov es, [6e88]
    mov al, es:[0540]
    sub ah, ah
    sub ax, 0003
    jl loc_1bd7_de68
    dec ax
    jg loc_1bd7_de68
    mov [bp-a], si
    mov [bp-6], si

loc_1bd7_de20:
    mov es, [6e8a]
    mov byte ptr es:[1789], 10
    mov byte ptr es:[1788], 00
    mov al, [bp-a]
    mov es:[178a], al
    les bx, [65c6]
    mov di, [bp-a]
    mov al, es:[bx+di]
    mov es, [6e8a]
    mov es:[178b], al
    mov ax, 1788
    push es
    push ax
    mov cx, 2c43
    push cx
    push ax
    mov ax, 0010
    push ax
    nop
    push cs
    call sub_1bd7_7456
    add sp, 0a
    inc word ptr [bp-a]
    cmp word ptr [bp-a], 04
    jl loc_1bd7_de20

loc_1bd7_de68:
    or si, si
    jnz loc_1bd7_de82
    mov word ptr [bp-a], 0001
    sub ax, ax
    push ax
    push ax
    lea ax, [bp-a]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_8f62
    add sp, 08

loc_1bd7_de82:
    or si, si
    jnz loc_1bd7_de95
    sub ax, ax
    push ax
    mov ax, 000a
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04

loc_1bd7_de95:
    mov ax, si
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_de9d:
    db 90  ; |.|
