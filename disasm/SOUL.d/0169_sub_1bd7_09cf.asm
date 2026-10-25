; ========================================
; New Subroutine: sub_1bd7_09cf
; ========================================
sub_1bd7_09cf:
    push bp
    mov bp, sp
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_09ac
    push ax
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_09be
    pop ax
    pop bp
    retf 0002
