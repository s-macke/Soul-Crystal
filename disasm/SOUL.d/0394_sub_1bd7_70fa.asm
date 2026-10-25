; ========================================
; New Subroutine: sub_1bd7_70fa
; ========================================
sub_1bd7_70fa:
    push bp
    mov bp, sp
    sub ax, ax
    push ax
    push word ptr [bp+c]
    push word ptr [bp+a]
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_70c6
    mov sp, bp
    pop bp
    retf
