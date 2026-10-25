; ========================================
; New Subroutine: sub_1bd7_0ce2
; ========================================
sub_1bd7_0ce2:
    push ax
    push bx
    push cx
    push dx
    xor cx, cx
    mov ch, [675e]
    dec ch
    mov bl, [6764]
    mov bh, [675f]
    dec bx
    dec bh
    call sub_1bd7_0b3a
    mov dx, bx
    mov bh, [6ad1]
    xor ax, ax
    cmp ch, dh
    jz loc_1bd7_0d09
    inc ax

loc_1bd7_0d09:
    mov ah, 06
    call sub_1bd7_0b1a
    call sub_1bd7_0b34
    pop dx
    pop cx
    pop bx
    pop ax
    ret
