; ========================================
; New Subroutine: sub_1bd7_d058
; ========================================
sub_1bd7_d058:
    push bp
    mov bp, sp
    sub sp, 0e
    push di
    push si
    mov ax, 2c43
    mov es, ax
    mov di, [bp+6]
    mov bx, [bp+e]
    mov ax, es:[0c6c]
    mov cx, ax
    mul word ptr [bp+a]
    mul di
    add ax, [bp+8]
    add [bp+10], ax
    mov ax, cx
    mul word ptr [bp+18]
    mul word ptr [bp+14]
    add ax, [bp+16]
    add [bp+1a], ax
    mov ax, cx
    mul word ptr [bp+14]
    mov [bp-c], ax
    mov ax, cx
    mul di
    mov [bp-a], ax
    sub ax, ax
    mov [bp-4], ax
    mov [bp-6], ax
    or bx, bx
    jz loc_1bd7_d107
    mov [bp-8], bx

loc_1bd7_d0a8:
    sub di, di
    mov si, di
    mov [bp-2], si
    mov es, [6e86]
    cmp es:[0c6c], si
    jz loc_1bd7_d0f6

loc_1bd7_d0ba:
    push word ptr [bp+c]
    mov ax, [bp+10]
    mov dx, [bp+12]
    add ax, [bp-6]
    add ax, di
    push dx
    push ax
    mov ax, [bp+1a]
    mov dx, [bp+1c]
    add ax, [bp-4]
    add ax, si
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    add si, [bp+14]
    add di, [bp+6]
    mov es, [6e86]
    inc word ptr [bp-2]
    mov ax, [bp-2]
    cmp es:[0c6c], ax
    ja loc_1bd7_d0ba

loc_1bd7_d0f6:
    mov ax, [bp-c]
    add [bp-4], ax
    mov ax, [bp-a]
    add [bp-6], ax
    dec word ptr [bp-8]
    jnz loc_1bd7_d0a8

loc_1bd7_d107:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
