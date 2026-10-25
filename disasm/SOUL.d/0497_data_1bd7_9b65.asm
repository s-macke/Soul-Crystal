data_1bd7_9b65:
    db 90  ; |.|

loc_1bd7_9b66:
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov ax, 0002
    push ax
    mov cx, 0001
    push cx
    push word ptr [bp-12]
    push word ptr [bp-14]
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_9b8a
    jmp loc_1bd7_9acc

loc_1bd7_9b8a:
    push word ptr [bp-12]
    push word ptr [bp-14]
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov ax, 0002
    push ax
    mov cx, 0001
    push cx
    push word ptr [bp-1a]
    push word ptr [bp-1c]
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_9bbd
    jmp loc_1bd7_9acc

loc_1bd7_9bbd:
    push word ptr [bp-1a]
    push word ptr [bp-1c]
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    cmp word ptr [bp+a], 02
    jnz loc_1bd7_9c0c
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov ax, 0002
    push ax
    mov cx, 0001
    push cx
    mov cx, 5682
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_9bf8
    jmp loc_1bd7_9acc

loc_1bd7_9bf8:
    mov ax, 5682
    mov cx, 2c43
    push cx
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06

loc_1bd7_9c0c:
    cmp word ptr [bp-2], 01
    jz loc_1bd7_9c15
    jmp loc_1bd7_9ce9

loc_1bd7_9c15:
    mov ax, 0001
    push ax
    mov ax, 5d52
    push ds
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jnz loc_1bd7_9c33
    jmp loc_1bd7_9ce4

loc_1bd7_9c33:
    mov word ptr [bp-8], 0000
    jmp loc_1bd7_9c56

loc_1bd7_9c3a:
    mov ax, [bp-8]
    shl ax, 01
    add ax, [bp-18]
    mov dx, [bp-16]
    push dx
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc word ptr [bp-8]

loc_1bd7_9c56:
    les bx, [bp-14]
    mov ax, [bp-8]
    cmp es:[bx], ax
    jbe loc_1bd7_9c8b
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov cx, 0002
    push cx
    mov dx, 0001
    push dx
    shl ax, 01
    add ax, [bp-18]
    mov dx, [bp-16]
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_9c3a
    mov word ptr [bp-2], 0000

loc_1bd7_9c8b:
    cmp word ptr [bp-2], 01
    jnz loc_1bd7_9ce9
    mov word ptr [bp-8], 0000
    jmp loc_1bd7_9cb4

loc_1bd7_9c98:
    mov ax, [bp-8]
    shl ax, 01
    add ax, [bp-10]
    mov dx, [bp-e]
    push dx
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc word ptr [bp-8]

loc_1bd7_9cb4:
    les bx, [bp-14]
    mov ax, [bp-8]
    cmp es:[bx], ax
    jbe loc_1bd7_9ce9
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov cx, 0002
    push cx
    mov dx, 0001
    push dx
    shl ax, 01
    add ax, [bp-10]
    mov dx, [bp-e]
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_9c98

loc_1bd7_9ce4:
    mov word ptr [bp-2], 0000

loc_1bd7_9ce9:
    cmp word ptr [bp-2], 01
    jnz loc_1bd7_9d63
    mov ax, 0001
    push ax
    mov ax, 5d57
    push ds
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jz loc_1bd7_9d5e
    mov word ptr [bp-8], 0000
    jmp loc_1bd7_9d2e

data_1bd7_9d11:
    db 90  ; |.|

loc_1bd7_9d12:
    mov ax, [bp-8]
    shl ax, 01
    add ax, [bp-6]
    mov dx, [bp-4]
    push dx
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc word ptr [bp-8]

loc_1bd7_9d2e:
    les bx, [bp-1c]
    mov ax, [bp-8]
    cmp es:[bx], ax
    jbe loc_1bd7_9d63
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov cx, 0002
    push cx
    mov dx, 0001
    push dx
    shl ax, 01
    add ax, [bp-6]
    mov dx, [bp-4]
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_9d12

loc_1bd7_9d5e:
    mov word ptr [bp-2], 0000

loc_1bd7_9d63:
    cmp word ptr [bp-2], 01
    jnz loc_1bd7_9ddd
    mov ax, 0001
    push ax
    mov ax, 5d5c
    push ds
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jz loc_1bd7_9dd8
    mov word ptr [bp-8], 0000
    jmp loc_1bd7_9da8

data_1bd7_9d8b:
    db 90  ; |.|

loc_1bd7_9d8c:
    mov ax, [bp-8]
    shl ax, 01
    add ax, [bp-20]
    mov dx, [bp-1e]
    push dx
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc word ptr [bp-8]

loc_1bd7_9da8:
    les bx, [bp-1c]
    mov ax, [bp-8]
    cmp es:[bx], ax
    jbe loc_1bd7_9ddd
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov cx, 0002
    push cx
    mov dx, 0001
    push dx
    shl ax, 01
    add ax, [bp-20]
    mov dx, [bp-1e]
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_9d8c

loc_1bd7_9dd8:
    mov word ptr [bp-2], 0000

loc_1bd7_9ddd:
    cmp word ptr [bp-2], 01
    jnz loc_1bd7_9e29
    mov ax, 0001
    push ax
    mov ax, 5d61
    push ds
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    mov [bp-8], ax
    or ax, ax
    jnz loc_1bd7_9e06
    mov [bp-2], ax
    jmp loc_1bd7_9e29

loc_1bd7_9e06:
    push word ptr [bp+8]
    push word ptr [bp+6]
    push ax
    mov ax, 0001
    push ax
    push word ptr [bp-a]
    push word ptr [bp-c]
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, [bp-8]
    jz loc_1bd7_9e29
    mov word ptr [bp-2], 0000

loc_1bd7_9e29:
    cmp word ptr [bp+a], 02
    jz loc_1bd7_9e32
    jmp loc_1bd7_9ff2

loc_1bd7_9e32:
    cmp word ptr [bp-2], 01
    jnz loc_1bd7_9eae
    mov ax, 0002
    push ax
    mov ax, 5d66
    push ds
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jz loc_1bd7_9ea9
    mov word ptr [bp-8], 0000
    jmp loc_1bd7_9e76

loc_1bd7_9e5a:
    mov ax, [bp-8]
    shl ax, 01
    add ax, 04f4
    mov cx, 2c43
    push cx
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc word ptr [bp-8]

loc_1bd7_9e76:
    mov es, [6e32]
    mov ax, [bp-8]
    cmp es:[5682], ax
    jbe loc_1bd7_9eae
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov cx, 0002
    push cx
    mov dx, 0001
    push dx
    shl ax, 01
    add ax, 04f4
    mov dx, 2c43
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_9e5a

loc_1bd7_9ea9:
    mov word ptr [bp-2], 0000

loc_1bd7_9eae:
    cmp word ptr [bp-2], 01
    jnz loc_1bd7_9f2a
    mov ax, 0002
    push ax
    mov ax, 5d6b
    push ds
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jz loc_1bd7_9f25
    mov word ptr [bp-8], 0000
    jmp loc_1bd7_9ef2

loc_1bd7_9ed6:
    mov ax, [bp-8]
    shl ax, 01
    add ax, d4c6
    mov cx, 36ad
    push cx
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc word ptr [bp-8]

loc_1bd7_9ef2:
    mov es, [6e32]
    mov ax, [bp-8]
    cmp es:[5682], ax
    jbe loc_1bd7_9f2a
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov cx, 0002
    push cx
    mov dx, 0001
    push dx
    shl ax, 01
    add ax, d4c6
    mov dx, 36ad
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_9ed6

loc_1bd7_9f25:
    mov word ptr [bp-2], 0000

loc_1bd7_9f2a:
    cmp word ptr [bp-2], 01
    jnz loc_1bd7_9f79
    mov ax, 0002
    push ax
    mov ax, 5d70
    push ds
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    mov [bp-8], ax
    or ax, ax
    jnz loc_1bd7_9f54
    mov [bp-2], ax
    jmp loc_1bd7_9f79

data_1bd7_9f53:
    db 90  ; |.|

loc_1bd7_9f54:
    push word ptr [bp+8]
    push word ptr [bp+6]
    push ax
    mov ax, 0001
    push ax
    mov ax, 6048
    mov cx, 458f
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, [bp-8]
    jz loc_1bd7_9f79
    mov word ptr [bp-2], 0000

loc_1bd7_9f79:
    cmp word ptr [bp-2], 01
    jnz loc_1bd7_9ff2
    mov ax, 0001
    push ax
    mov ax, 5d75
    push ds
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jz loc_1bd7_9fed
    mov word ptr [bp-8], 0000
    jmp loc_1bd7_9fbc

data_1bd7_9fa1:
    db 90  ; |.|

loc_1bd7_9fa2:
    mov ax, [bp-8]
    add ax, 6448
    mov cx, 458f
    push cx
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc word ptr [bp-8]

loc_1bd7_9fbc:
    mov es, [6e32]
    mov ax, [bp-8]
    cmp es:[5682], ax
    jbe loc_1bd7_9ff2
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov cx, 0002
    push cx
    mov dx, 0001
    push dx
    add ax, 6448
    mov dx, 458f
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_9fa2

loc_1bd7_9fed:
    mov word ptr [bp-2], 0000

loc_1bd7_9ff2:
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04
    jmp loc_1bd7_9a61

data_1bd7_a003:
    db 90  ; |.|
