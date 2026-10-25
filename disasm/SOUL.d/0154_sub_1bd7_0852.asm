; ========================================
; New Subroutine: sub_1bd7_0852
; ========================================
sub_1bd7_0852:
    push bp
    mov bp, sp
    mov ax, [bp+6]
    mov bx, 0001
    or ah, ah
    jnz loc_1bd7_08ce
    push ax
    call sub_1bd7_1d77
    xchg dx, bx
    pop word ptr [bx]
    xchg ax, dx
    pop bp
    retf 0002
