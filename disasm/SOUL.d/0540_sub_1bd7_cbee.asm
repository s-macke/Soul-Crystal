; ========================================
; New Subroutine: sub_1bd7_cbee
; ========================================
sub_1bd7_cbee:
    push bp
    mov bp, sp
    sub sp, 10
    push di
    push si
    mov ax, [bp+6]
    or ax, ax
    jz loc_1bd7_cc14
    dec ax
    jz loc_1bd7_cc20
    dec ax
    dec ax
    jnz loc_1bd7_cc07
    jmp loc_1bd7_cca0

loc_1bd7_cc07:
    dec ax
    jnz loc_1bd7_cc0d
    jmp loc_1bd7_ccaa

loc_1bd7_cc0d:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
