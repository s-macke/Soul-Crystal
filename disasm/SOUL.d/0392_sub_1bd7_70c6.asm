; ========================================
; New Subroutine: sub_1bd7_70c6
; ========================================
sub_1bd7_70c6:
    push bp
    mov bp, sp
    sub sp, 08
    nop
    push cs
    call sub_1bd7_7ffc
    mov [bp-2], dx
    or dx, ax
    jnz loc_1bd7_70de
    sub ax, ax
    cwd
    jmp loc_1bd7_70f6
