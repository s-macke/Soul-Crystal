; ========================================
; New Subroutine: sub_1bd7_0584
; ========================================
sub_1bd7_0584:
    mov bx, bp
    mov dx, [bx+4]
    mov ax, [bx+2]
    push ax
    mov cl, 0e
    call sub_1bd7_3c7c
    pop cx
    xchg ax, cx
    push cx
    mov cl, 0c
    call sub_1bd7_3c7c
    pop bx
    mov [bx+2], ax
    or byte ptr [bx], 01
    ret
