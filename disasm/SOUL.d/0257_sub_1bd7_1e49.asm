; ========================================
; New Subroutine: sub_1bd7_1e49
; ========================================
sub_1bd7_1e49:
    push es
    push ds
    pop es
    push ax
    xor ax, ax
    call sub_1bd7_1e55
    pop ax
    pop es
    ret
