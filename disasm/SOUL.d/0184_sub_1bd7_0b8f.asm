; ========================================
; New Subroutine: sub_1bd7_0b8f
; ========================================
sub_1bd7_0b8f:
    mov [675a], dx
    cmp byte ptr [6639], 00
    jz sub_1bd7_0bbb
    cmp byte ptr [6ac0], 00
    jnz sub_1bd7_0bbb
    mov ax, [6ab4]
    jmp loc_1bd7_0bbe
