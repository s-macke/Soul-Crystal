; ========================================
; New Subroutine: sub_1bd7_b924
; ========================================
sub_1bd7_b924:
    push bp
    mov bp, sp
    mov ax, 0000
    mov cx, 5387
    push cx
    push ax
    mov es, [6e6c]
    mov bx, [bp+6]
    shl bx, 01
    shl bx, 01
    push word ptr es:[bx-39fc]
    push word ptr es:[bx-39fe]
    mov es, [6e68]
    push word ptr es:[0c94]
    push word ptr es:[0c92]
    nop
    push cs
    call sub_1bd7_d15e
    mov sp, bp
    mov ax, 0001
    push ax
    push ax
    mov es, [6e68]
    push word ptr es:[0c94]
    push word ptr es:[0c92]
    sub ax, ax
    push ax
    push ax
    push word ptr es:[0c92]
    push word ptr es:[0c90]
    push word ptr es:[0c8e]
    nop
    push cs
    call sub_1bd7_cccc
    mov sp, bp
    pop bp
    retf
