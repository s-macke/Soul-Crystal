; ========================================
; New Subroutine: sub_1bd7_09ac
; ========================================
sub_1bd7_09ac:
    push bp
    mov bp, sp
    xor cx, cx
    mov bx, [bp+6]
    mov dx, [bx]
    call sub_1bd7_1e20
    xchg ax, bx
    pop bp
    retf 0002
