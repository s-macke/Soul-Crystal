; ========================================
; New Subroutine: sub_1bd7_b268
; ========================================
sub_1bd7_b268:
    push bp
    mov bp, sp
    sub sp, 0a
    push di
    push si
    mov di, [bp+e]
    mov es, [bp+10]
    mov ax, es:[di]
    or ax, ax
    jz loc_1bd7_b28a
    dec ax
    jnz loc_1bd7_b283
    jmp loc_1bd7_b380

loc_1bd7_b283:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
