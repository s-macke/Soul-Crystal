; ========================================
; New Subroutine: sub_1bd7_8aa4
; ========================================
sub_1bd7_8aa4:
    push bp
    mov bp, sp
    mov bx, [bp+6]
    inc word ptr [bx]
    pop bp
    retf
