; ========================================
; New Subroutine: sub_1bd7_08a2
; ========================================
sub_1bd7_08a2:
    push bp
    mov bp, sp
    mov bx, [bp+6]

loc_1bd7_08a8:
    mov ax, [bx]
    cwd

loc_1bd7_08ab:
    call sub_1bd7_1e08
    pop bp
    retf 0002
