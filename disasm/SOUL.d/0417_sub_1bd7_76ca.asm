; ========================================
; New Subroutine: sub_1bd7_76ca
; ========================================
sub_1bd7_76ca:
    push bp
    mov bp, sp
    mov ah, [bp+6]
    mov dl, ah
    and dl, 0f
    int 16
    jnz loc_1bd7_76e2
    cmp dl, 01
    jnz loc_1bd7_76e2
    xor ax, ax
    jmp loc_1bd7_76ec

loc_1bd7_76e2:
    cmp dl, 02
    jz loc_1bd7_76ec
    or ax, ax
    jnz loc_1bd7_76ec
    dec ax

loc_1bd7_76ec:
    pop bp
    retf
