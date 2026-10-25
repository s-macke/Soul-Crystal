; ========================================
; New Subroutine: sub_1bd7_bc88
; ========================================
sub_1bd7_bc88:
    push bp
    mov bp, sp
    push di
    push si
    sub si, si
    mov di, [bp+6]

loc_1bd7_bc92:
    cmp si, di
    jnz loc_1bd7_bc9a
    mov al, 31
    jmp loc_1bd7_bc9c

loc_1bd7_bc9a:
    mov al, 02

loc_1bd7_bc9c:
    push ax
    mov es, [6e72]
    push word ptr es:[0c9a]
    mov ax, es:[0c9a]
    mul si
    add ax, dcd6
    mov cx, 458f
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_a114
    add sp, 08
    mov ax, 0000
    mov cx, 5387
    push cx
    push ax
    mov es, [6e72]
    mov ax, es:[0ca6]
    mov cx, ax
    mul si
    push ax
    sub ax, ax
    push ax
    push word ptr es:[0c9a]
    mov dx, d512
    mov bx, 36ad
    push bx
    push dx
    push cx
    push word ptr es:[0c9a]
    push ax
    push ax
    mov ax, 005a
    push ax
    nop
    push cs
    call sub_1bd7_d058
    add sp, 18
    inc si
    cmp si, 04
    jb loc_1bd7_bc92
    mov ax, 0001
    push ax
    push ax
    mov es, [6e72]
    push word ptr es:[0c9c]
    push word ptr es:[0c9a]
    sub ax, ax
    push ax
    push ax
    push word ptr es:[0c9a]
    push word ptr es:[0c98]
    push word ptr es:[0c96]
    nop
    push cs
    call sub_1bd7_cccc
    add sp, 12
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
