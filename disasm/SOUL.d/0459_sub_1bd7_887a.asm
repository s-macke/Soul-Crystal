; ========================================
; New Subroutine: sub_1bd7_887a
; ========================================
sub_1bd7_887a:
    inc cx
    and cl, fe
    push bx
    cld
    mov si, [bx+8]
    mov bx, [bx+a]
    xor di, di
    jmp loc_1bd7_88ad

loc_1bd7_888a:
    mov ax, bx
    pop bx
    test al, 01
    jnz loc_1bd7_88d3
    push bx
    mov si, [bx+6]
    mov bx, [bx+8]
    cmp bx, si
    jz loc_1bd7_88d2
    dec bx
    xor di, di
    jmp loc_1bd7_88ad
