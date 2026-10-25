data_1bd7_c015:
    db 90  ; |.|

loc_1bd7_c016:
    mov word ptr [bp-a], 0000
    mov word ptr [bp-1a], 0002
    sub ax, ax
    mov [bp-18], ax
    mov [bp-16], ax
    nop
    push cs
    call sub_1bd7_76a2
    mov cx, 0010
    cwd
    idiv cx
    mov bx, dx
    mov [bp-1], bl
    sub bh, bh
    mov ax, bx
    shl bx, 01
    add bx, ax
    shl bx, 01
    mov al, [bx+63f4]
    sub ah, ah
    mov [bp-14], ax
    mov al, [bx+63f3]
    mov [bp-12], ax
    mov al, [bx+63f0]
    mov [bp-10], ax
    mov al, [bx+63f1]
    mov [bp-e], ax
    mov al, [bx+63f2]

loc_1bd7_c064:
    sub ah, ah
    mov [bp-c], ax
    lea ax, [bp-1a]
    push ss
    push ax
    lea ax, [bp-a]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    cmp word ptr [bp-a], 00
    jnz loc_1bd7_c0ef

loc_1bd7_c081:
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_76ca
    add sp, 02
    sub ah, ah
    mov cx, 0100
    cwd
    idiv cx
    mov [bp-2], dl
    cmp dl, 40
    jbe loc_1bd7_c0a1
    cmp dl, 5b
    jb loc_1bd7_c0ad

loc_1bd7_c0a1:
    cmp byte ptr [bp-2], 60
    jbe loc_1bd7_c081
    cmp byte ptr [bp-2], 7b
    jae loc_1bd7_c081

loc_1bd7_c0ad:
    cmp byte ptr [bp-2], 5b
    jae loc_1bd7_c0b7
    add byte ptr [bp-2], 20

loc_1bd7_c0b7:
    cmp si, 04
    jz loc_1bd7_c0d4
    mov bl, [bp-1]
    sub bh, bh
    mov ax, bx
    shl bx, 01
    add bx, ax
    shl bx, 01
    mov al, [bp-2]
    cmp [bx+6335], al
    jmp loc_1bd7_c0e8

data_1bd7_c0d2:
    db 90, 90  ; |..|

loc_1bd7_c0d4:
    mov bl, [bp-1]
    sub bh, bh
    mov ax, bx
    shl bx, 01
    add bx, ax
    shl bx, 01
    mov al, [bp-2]
    cmp [bx+63f5], al

loc_1bd7_c0e8:
    jnz loc_1bd7_c0ef
    mov word ptr [bp-a], 0001

loc_1bd7_c0ef:
    nop
    push cs
    call sub_1bd7_76a2
    mov di, ax
    nop
    push cs
    call sub_1bd7_76a2
    xor ax, aaaa
    mov si, ax
    nop
    push cs
    call sub_1bd7_76a2
    add ax, si
    sub ax, [bp-a]
    mul di
    mov di, ax
    nop
    push cs
    call sub_1bd7_76a2
    mov bx, 0cb8
    mov es, [6e74]
    mov [bp-1e], bx
    mov [bp-1c], es
    mul word ptr es:[bx]
    mov si, ax
    nop
    push cs
    call sub_1bd7_76a2
    xor ax, si
    mov cx, di
    sub cx, ax
    mov [bp-2], cx
    mov word ptr [bp-4], 0000
    mov [bp-8], di
    nop
    push cs
    call sub_1bd7_76a2
    mov cx, 0064
    cwd
    idiv cx
    or dx, dx
    jz loc_1bd7_c195
    mov [bp-8], di
    mov di, [bp-2]

loc_1bd7_c150:
    mov ax, [bp-8]
    sub ax, di
    add si, ax
    mov ax, si
    and ax, di
    test ax, 5555
    jz loc_1bd7_c16f
    mov ax, [bp-4]
    mul si
    sub di, ax
    mov ax, di
    sub ax, [bp-8]
    mov [bp-6], ax

loc_1bd7_c16f:
    les bx, [bp-1e]
    mov cl, es:[bx]
    and cl, 0f
    mov ax, 00fe
    shl ax, cl
    and si, ax
    nop
    push cs
    call sub_1bd7_76a2
    mov cx, 0064
    cwd
    idiv cx
    inc word ptr [bp-4]
    cmp dx, [bp-4]
    ja loc_1bd7_c150
    mov [bp-2], di

loc_1bd7_c195:
    mov ax, [bp-a]
    les bx, [bp-1e]
    mov cl, es:[bx]
    and cl, 0f
    shl ax, cl
    or ax, si
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_c1ab:
    db 90  ; |.|
