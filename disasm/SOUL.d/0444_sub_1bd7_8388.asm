; ========================================
; New Subroutine: sub_1bd7_8388
; ========================================
sub_1bd7_8388:
    push bp
    mov bp, sp
    push si
    push di
    mov bl, 01
    mov cx, [bp+c]
    mov ax, [bp+6]
    xor dx, dx
    cmp cx, 0a
    jnz loc_1bd7_839d
    cwd

loc_1bd7_839d:
    push ds
    lds di, [bp+8]
    jmp loc_1bd7_878d
