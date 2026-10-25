; ========================================
; New Subroutine: sub_1bd7_2786
; ========================================
sub_1bd7_2786:
    mov bx, cs
    xchg es:[0486], bx
    push bx
    mov bx, 2618
    xchg es:[0484], bx
    push bx
    cmp ax, [6ab2]
    mov al, 80
    jz loc_1bd7_27a1
    inc al

loc_1bd7_27a1:
    mov bl, 81
    mov bh, [6637]
    inc cx
    mov ah, 09
    call sub_1bd7_0b1a
    pop word ptr es:[0484]
    pop word ptr es:[0486]
    ret
