; ========================================
; New Subroutine: sub_1bd7_e60b
; ========================================
sub_1bd7_e60b:
    push ax
    push bx
    push cx
    push dx
    mov byte ptr cs:[e2b1], ff
    call sub_1bd7_e45d
    call sub_1bd7_e58c
    pop dx
    pop cx
    pop bx
    pop ax
    retf
