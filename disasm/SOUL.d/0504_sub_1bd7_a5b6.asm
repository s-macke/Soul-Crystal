; ========================================
; New Subroutine: sub_1bd7_a5b6
; ========================================
sub_1bd7_a5b6:
    push bp
    mov bp, sp
    sub sp, 10
    push di
    push si
    les bx, [bp+6]
    cmp byte ptr es:[bx], 00
    jnz loc_1bd7_a5ce
    mov di, ffff
    jmp loc_1bd7_a7f2
