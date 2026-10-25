; ========================================
; New Subroutine: sub_1bd7_a114
; ========================================
sub_1bd7_a114:
    push bp
    mov bp, sp
    sub sp, 10
    push di
    push si
    mov dx, [bp+a]
    cmp dx, 5a
    jbe loc_1bd7_a12c
    mov word ptr [bp-e], 005a
    jmp loc_1bd7_a12f
