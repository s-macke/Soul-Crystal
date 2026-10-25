; ========================================
; New Subroutine: sub_1bd7_178d
; ========================================
sub_1bd7_178d:
    push ax
    push dx
    mov al, 0d
    call sub_1bd7_17bc
    mov al, 0a
    call sub_1bd7_17bc
    mov dx, [675a]
    call sub_1bd7_021a
    mov [675a], dx
    pop dx
    pop ax
    ret
