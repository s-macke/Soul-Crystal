; ========================================
; New Subroutine: sub_1bd7_09be
; ========================================
sub_1bd7_09be:
    push bp
    mov bp, sp
    mov bx, [bp+6]
    call sub_1bd7_1e49
    mov word ptr [bx], 0000
    pop bp
    retf 0002
