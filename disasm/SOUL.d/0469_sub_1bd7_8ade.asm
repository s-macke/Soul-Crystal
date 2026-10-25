; ========================================
; New Subroutine: sub_1bd7_8ade
; ========================================
sub_1bd7_8ade:
    push bp
    mov bp, sp
    mov ax, 0001
    mov cx, [bp+8]
    dec cx
    shl ax, cl
    mov bx, [bp+6]
    not ax
    and [bx], ax
    pop bp
    retf
