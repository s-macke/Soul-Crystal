; ========================================
; New Subroutine: sub_1bd7_8e98
; ========================================
sub_1bd7_8e98:
    push bp
    mov bp, sp
    sub sp, 08
    push di
    push si
    mov si, 0001
    mov ax, 0015
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov [bp-8], ax
    mov [bp-6], dx
    or dx, ax
    jnz loc_1bd7_8ebe
    sub si, si

loc_1bd7_8ebe:
    cmp si, 01
    jnz loc_1bd7_8f05
    mov ax, si
    push ax
    mov ax, 5854
    push ds
    push ax
    push word ptr [bp-6]
    push word ptr [bp-8]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    mov di, ax
    or di, di
    jz loc_1bd7_8f03
    cmp di, 0200
    ja loc_1bd7_8f03
    push word ptr [bp-6]
    push word ptr [bp-8]
    push di
    mov ax, si
    push ax
    mov ax, 0000
    mov cx, 6387
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, di
    jz loc_1bd7_8f05

loc_1bd7_8f03:
    sub si, si

loc_1bd7_8f05:
    cmp si, 01
    jnz loc_1bd7_8f4c
    mov ax, si
    push ax
    mov ax, 5859
    push ds
    push ax
    push word ptr [bp-6]
    push word ptr [bp-8]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    mov di, ax
    or di, di
    jz loc_1bd7_8f4a
    cmp di, 0400
    ja loc_1bd7_8f4a
    push word ptr [bp-6]
    push word ptr [bp-8]
    push di
    mov ax, si
    push ax
    mov ax, 0000
    mov cx, 2c43
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, di
    jz loc_1bd7_8f4c

loc_1bd7_8f4a:
    sub si, si

loc_1bd7_8f4c:
    push word ptr [bp-6]
    push word ptr [bp-8]
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04
    mov ax, si
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
