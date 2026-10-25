; ========================================
; New Subroutine: sub_1bd7_1a2d
; ========================================
sub_1bd7_1a2d:
    pop bx
    push bp
    mov bp, sp
    push es
    push si
    mov cx, [bp+6]
    mov ax, cx
    shl ax, 01
    lea si, [bp+6]
    add si, ax
    jmp bx
