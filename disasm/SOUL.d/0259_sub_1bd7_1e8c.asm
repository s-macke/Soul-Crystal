; ========================================
; New Subroutine: sub_1bd7_1e8c
; ========================================
sub_1bd7_1e8c:
    push dx
    mov dx, [bx]
    push cx
    xor cx, cx
    inc dx
    call sub_1bd7_1e20
    dec dx
    pop cx
    push bx
    mov bx, [bx+2]
    add bx, dx
    mov byte ptr [bx], 00
    pop bx
    pop dx
    ret
