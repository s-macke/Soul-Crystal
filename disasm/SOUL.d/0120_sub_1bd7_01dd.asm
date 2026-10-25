; ========================================
; New Subroutine: sub_1bd7_01dd
; ========================================
sub_1bd7_01dd:
    push bp
    mov bp, sp
    push ax
    mov ax, [bp+c]
    cmp ax, [bp+8]
    jnz loc_1bd7_01fa
    mov ax, [bp+a]
    cmp ax, [bp+6]
    lahf
    and ax, 4100
    shr ax, 01
    shl ah, 01
    or ah, al
    sahf

loc_1bd7_01fa:
    pop ax
    pop bp
    retf 0008
