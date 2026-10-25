; ========================================
; New Subroutine: sub_1bd7_8acb
; ========================================
sub_1bd7_8acb:
    push bp
    mov bp, sp
    mov ax, 0001
    mov cx, [bp+8]
    dec cx
    shl ax, cl
    mov bx, [bp+6]
    or [bx], ax
    pop bp
    retf
