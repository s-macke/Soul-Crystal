; ========================================
; New Subroutine: sub_1bd7_853e
; ========================================
sub_1bd7_853e:
    push bp
    mov bp, sp
    push ds
    lds dx, [bp+6]
    mov ah, 41
    int 21
    pop ds
    jmp loc_1bd7_7720
