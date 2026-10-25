; ========================================
; New Subroutine: sub_1bd7_8ab8
; ========================================
sub_1bd7_8ab8:
    push bp
    mov bp, sp
    mov ax, 0001
    mov cx, [bp+8]
    dec cx
    shl ax, cl
    mov bx, [bp+6]
    xor [bx], ax
    pop bp
    retf
