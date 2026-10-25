data_1bd7_f11f:
    db 90  ; |.|

loc_1bd7_f120:
    mov ax, 03da
    push ax
    nop
    push cs
    call sub_1bd7_75ce
    add sp, 02
    sub si, si
    mov [bp-2], di

loc_1bd7_f131:
    push si
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    sub ax, ax
    push ax
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    inc si
    cmp si, 10
    jb loc_1bd7_f131
    mov ax, 0020
    push ax
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    sub ax, ax
    push ax
    mov ax, 03c0

loc_1bd7_f169:
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04

loc_1bd7_f172:
    mov ax, 0018
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov si, ax
    mov [bp-c], dx
    or dx, ax
    jnz loc_1bd7_f190
    mov di, 0504
    jmp loc_1bd7_f32b

loc_1bd7_f190:
    mov [bp-2], di
    sub ax, ax
    push ax
    mov ax, [bp+6]
    add ax, 0005
    shl ax, 01
    shl ax, 01
    sub dx, dx
    push dx
    push ax
    push word ptr [bp-c]
    push si
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-c]
    push si
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-6]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jz loc_1bd7_f1d4

loc_1bd7_f1ce:
    mov di, 0504
    jmp loc_1bd7_f238

data_1bd7_f1d3:
    db 90  ; |.|

loc_1bd7_f1d4:
    mov ax, 0001
    push ax
    mov ax, 01fc
    cwd
    push dx
    push ax
    push word ptr [bp-c]
    push si
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-c]
    push si
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-a]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jnz loc_1bd7_f1ce
    lea ax, [bp-6]
    push ss
    push ax
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    lea ax, [bp-a]
    push ss
    push ax
    mov cx, 0004
    push cx
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    mov di, [bp-2]
    mov ax, [bp-8]
    or ax, [bp-a]
    jnz loc_1bd7_f238
    mov di, 0505

loc_1bd7_f238:
    or di, di
    jz loc_1bd7_f23f
    jmp loc_1bd7_f2fa

loc_1bd7_f23f:
    mov ax, 0001
    push ax
    mov ax, 65ca
    push ds
    push ax
    push word ptr [bp-c]
    push si
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jnz loc_1bd7_f25b
    jmp loc_1bd7_f2f7

loc_1bd7_f25b:
    mov ax, 0001
    push ax
    push word ptr [bp-4]
    push word ptr [bp-6]
    push word ptr [bp-c]
    push si
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    mov es, [6e96]  ; data_7fc1_6e96 word read
    mov al, es:[0540]  ; data_2c43_0540 byte read
    sub ah, ah
    sub ax, 0003
    jz loc_1bd7_f286
    dec ax
    jz loc_1bd7_f2c0
    jmp loc_1bd7_f2fa

data_1bd7_f285:
    db 90  ; |.|

loc_1bd7_f286:
    push word ptr [bp-c]
    push si
    mov ax, 0030
    push ax
    mov cx, 0001
    push cx
    mov cx, 1358
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0030
    jnz loc_1bd7_f2f7
    mov ax, 0001
    push ax
    mov ax, 0030
    cwd
    push dx
    push ax
    push word ptr [bp-c]
    push si
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    jmp loc_1bd7_f2fa

data_1bd7_f2bf:
    db 90  ; |.|

loc_1bd7_f2c0:
    mov ax, 0001
    push ax
    mov ax, 0030
    cwd
    push dx
    push ax
    push word ptr [bp-c]
    push si
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-c]
    push si
    mov ax, 0030
    push ax
    mov cx, 0001
    push cx
    mov cx, 1358
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0030
    jz loc_1bd7_f2fa

loc_1bd7_f2f7:
    mov di, 0504

loc_1bd7_f2fa:
    or di, di
    jnz loc_1bd7_f31e
    mov ax, 0001
    push ax
    mov es, [6e96]  ; data_7fc1_6e96 word read
    push word ptr es:[0c70]  ; data_2c43_0c70 word read
    push word ptr [bp-c]
    push si
    nop
    push cs
    call sub_1bd7_b39e
    add sp, 08
    or ax, ax
    jnz loc_1bd7_f31e
    mov di, 0504

loc_1bd7_f31e:
    mov ax, [bp-c]
    push ax
    push si
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_f32b:
    mov ax, di
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_f333:
    db 90  ; |.|
