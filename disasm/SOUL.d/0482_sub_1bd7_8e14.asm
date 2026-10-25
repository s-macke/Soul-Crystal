; ========================================
; New Subroutine: sub_1bd7_8e14
; ========================================
sub_1bd7_8e14:
    push bp
    mov bp, sp
    mov al, 01
    push ax
    mov ax, 005a
    push ax
    mov cx, 0200
    mov dx, 6387
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_a114
    mov sp, bp
    mov ax, 0000
    mov cx, 5387
    push cx
    push ax
    sub ax, ax
    push ax
    push ax
    mov es, [6e22]
    push word ptr es:[0ca2]
    mov cx, d512
    mov dx, 36ad
    push dx
    push cx
    push word ptr es:[0ca6]
    push word ptr es:[0ca2]
    push ax
    push ax
    mov cx, 005a
    push cx
    nop
    push cs
    call sub_1bd7_d058
    mov sp, bp
    mov ax, 0001
    push ax
    push ax
    mov es, [6e22]
    push word ptr es:[0ca6]
    push word ptr es:[0ca2]
    sub ax, ax
    push ax
    push ax
    push word ptr es:[0ca2]
    mov ax, es:[0ca6]
    mul word ptr [bp+6]
    add ax, es:[0ca0]
    push ax
    push word ptr es:[0c9e]
    nop
    push cs
    call sub_1bd7_cccc
    mov sp, bp
    pop bp
    retf
