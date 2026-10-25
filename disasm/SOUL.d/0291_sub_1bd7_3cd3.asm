; ========================================
; New Subroutine: sub_1bd7_3cd3
; ========================================
sub_1bd7_3cd3:
    push ax

loc_1bd7_3cd4:
    add bx, 04
    mov ax, [bx+2]
    or ax, [bx]
    jnz loc_1bd7_3cd4

loc_1bd7_3cde:
    sub bx, 04
    cmp cx, [bx+2]
    jnz loc_1bd7_3cde
    cmp si, [bx]
    jb loc_1bd7_3cde
    add bx, 04
    pop ax
    ret
