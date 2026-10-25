data_1bd7_a83f:
    db 90  ; |.|

loc_1bd7_a840:
    sub ax, ax
    mov es, [6e5e]  ; data_7fc1_6e5e word read
    mov cx, 000e
    mov di, dcb6
    repz stosw
    stosb
    mov ax, 0001
    push ax
    mov ax, 5d7a
    push ds
    push ax
    push word ptr [bp-c]
    push word ptr [bp-e]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    mov [bp-4], ax
    or dx, ax
    jz loc_1bd7_a890
    mov si, [bp-a]
    push word ptr [bp-c]
    push word ptr [bp-e]
    push ax
    mov ax, 0001
    push ax
    mov ax, dcb6
    mov cx, 458f
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, [bp-4]
    jz loc_1bd7_a892

loc_1bd7_a890:
    sub si, si

loc_1bd7_a892:
    cmp si, 01
    jnz loc_1bd7_a8b3
    mov ax, si
    push ax
    mov ax, 5d7f
    push ds
    push ax
    push word ptr [bp-c]
    push word ptr [bp-e]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jnz loc_1bd7_a8b8
    sub si, si

loc_1bd7_a8b3:
    mov di, [bp-e]
    jmp loc_1bd7_a900

loc_1bd7_a8b8:
    mov [bp-a], si
    mov si, 12e4
    mov di, [bp-e]

loc_1bd7_a8c1:
    push word ptr [bp-c]
    push di
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    mov cx, 2c43
    push cx
    push si
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jnz loc_1bd7_a8fe
    mov ax, 2c43
    push ax
    push si
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    add si, 04
    cmp si, 1358
    jb loc_1bd7_a8c1
    mov si, [bp-a]
    jmp loc_1bd7_a900

loc_1bd7_a8fe:
    sub si, si

loc_1bd7_a900:
    cmp si, 01
    jnz loc_1bd7_a93f
    mov ax, si
    push ax
    mov ax, 5d84
    push ds
    push ax
    push word ptr [bp-c]
    push di
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    mov [bp-4], ax
    or dx, ax
    jz loc_1bd7_a93d
    push word ptr [bp-c]
    push di
    push ax
    mov ax, si
    push ax
    mov ax, 650e
    mov cx, 458f
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, [bp-4]
    jz loc_1bd7_a93f

loc_1bd7_a93d:
    sub si, si

loc_1bd7_a93f:
    mov ax, [bp-c]
    push ax
    push di
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_a94c:
    mov ax, si
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
