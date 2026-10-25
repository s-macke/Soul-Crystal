; ========================================
; New Subroutine: sub_1bd7_b74a
; ========================================
sub_1bd7_b74a:
    push bp
    mov bp, sp
    sub sp, 10
    push di
    push si
    mov word ptr [bp-8], 0001
    mov ax, 000f
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov di, ax
    mov [bp-e], dx
    or dx, ax
    jnz loc_1bd7_b774
    sub si, si
    jmp loc_1bd7_b91c

loc_1bd7_b774:
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
    or ax, ax
    jnz loc_1bd7_b791
    jmp loc_1bd7_b82a

loc_1bd7_b791:
    sub si, si

loc_1bd7_b793:
    mov [bp-10], di
    cmp si, 01
    jnz loc_1bd7_b7ba
    sub ax, ax
    push ax
    mov cx, 0214
    sub dx, dx
    push dx
    push cx
    push word ptr [bp-e]
    push di
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    or ax, ax
    jnz loc_1bd7_b7b8
    jmp loc_1bd7_b8b0

loc_1bd7_b7b8:
    sub si, si

loc_1bd7_b7ba:
    cmp si, 01
    jz loc_1bd7_b7c2
    jmp loc_1bd7_b90e

loc_1bd7_b7c2:
    mov ax, si
    push ax
    mov ax, 6322
    push ds
    push ax
    push word ptr [bp-e]
    push word ptr [bp-10]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jnz loc_1bd7_b7df
    jmp loc_1bd7_b90c

loc_1bd7_b7df:
    mov [bp-8], si
    mov di, c602
    mov si, 0eba

loc_1bd7_b7e8:
    push word ptr [bp-e]
    push word ptr [bp-10]
    mov es, [6e6e]
    push word ptr es:[si]
    mov ax, 0001
    push ax
    mov es, [6e6c]
    push word ptr es:[di+2]
    push word ptr es:[di]
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    mov es, [6e6e]
    cmp es:[si], ax
    jz loc_1bd7_b818
    jmp loc_1bd7_b90c

loc_1bd7_b818:
    add di, 04
    add si, 04
    cmp si, 0ee2
    jb loc_1bd7_b7e8
    mov si, [bp-8]
    jmp loc_1bd7_b90e

loc_1bd7_b82a:
    mov si, c602
    mov [bp-10], di

loc_1bd7_b830:
    push word ptr [bp-e]
    push di
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-c]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jz loc_1bd7_b851
    jmp loc_1bd7_b791

loc_1bd7_b851:
    lea ax, [bp-c]
    push ss
    push ax
    mov cx, 0004
    push cx
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    mov ax, [bp-c]
    and ax, 000f
    mov cx, ax
    mov ax, [bp-c]
    mov dx, [bp-a]
    and al, f0
    mov dh, dl
    mov dl, ah
    mov ah, al
    sub al, al
    shl ax, 01
    rcl dx, 01
    shl ax, 01
    rcl dx, 01
    shl ax, 01
    rcl dx, 01
    shl ax, 01
    rcl dx, 01
    or ax, cx
    mov cx, 0000
    mov bx, 63ad
    add ax, cx
    adc dx, bx
    mov es, [6e6c]
    mov es:[si], ax
    mov es:[si+2], dx
    add si, 04
    cmp si, c62a
    jb loc_1bd7_b830
    mov si, [bp-8]
    jmp loc_1bd7_b793

loc_1bd7_b8b0:
    mov [bp-8], si
    mov si, 0eba
    mov [bp-10], di

loc_1bd7_b8b9:
    push word ptr [bp-e]
    push di
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-c]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jz loc_1bd7_b8da
    jmp loc_1bd7_b7b8

loc_1bd7_b8da:
    lea ax, [bp-c]
    push ss
    push ax
    mov cx, 0004
    push cx
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    mov ax, [bp-c]
    mov dx, [bp-a]
    mov es, [6e6e]
    mov es:[si], ax
    mov es:[si+2], dx
    add si, 04
    cmp si, 0ee2
    jb loc_1bd7_b8b9
    mov si, [bp-8]
    jmp loc_1bd7_b7ba
