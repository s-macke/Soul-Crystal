; ========================================
; New Subroutine: sub_1bd7_070c
; ========================================
sub_1bd7_070c:
    push bp
    mov bp, sp
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_06cf
    push ax
    push word ptr [bp+a]
    nop
    push cs
    call sub_1bd7_0696
    pop bp
    retf 0006
