; ========================================
; New Subroutine: sub_1bd7_05a2
; ========================================
sub_1bd7_05a2:
    push bp
    mov bp, sp
    push di
    push es
    call sub_1bd7_0584
    xchg ax, di
    dec di
    dec di
    push ds
    pop es
    xor ax, ax
    mov dx, [bp+6]
    jmp loc_1bd7_05bc

loc_1bd7_05b6:
    xchg ax, dx
    mov cx, ffff
    repnz scasb

loc_1bd7_05bc:
    xchg ax, dx
    scasw
    ja loc_1bd7_05b6
    mov [bx+2], di
    pop es
    pop di
    pop bp
    retf 0002
