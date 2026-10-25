; ========================================
; New Subroutine: sub_1bd7_b988
; ========================================
sub_1bd7_b988:
    push bp
    mov bp, sp
    sub sp, 06
    push di
    push si
    mov word ptr [bp-2], 0000
    mov ax, [bp+6]
    or ax, ax
    jz loc_1bd7_b9a6
    dec ax
    jnz loc_1bd7_b9a2
    jmp loc_1bd7_bb86

loc_1bd7_b9a2:
    jmp loc_1bd7_bb9a
