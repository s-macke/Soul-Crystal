; ========================================
; New Subroutine: sub_1bd7_8a6e
; ========================================
sub_1bd7_8a6e:
    mov ax, es:[di+2]
    or ax, ax
    jnz loc_1bd7_8a7f
    mov es:[di+2], ds
    mov es:[di], bx
    jmp loc_1bd7_8a93

loc_1bd7_8a7f:
    push es
    les si, es:[di+8]
    mov es:[si+e], ds
    mov es:[si+c], bx
    mov [bx+12], es
    mov [bx+10], si
    pop es

loc_1bd7_8a93:
    mov es:[di+a], ds
    mov es:[di+8], bx
    mov es:[di+6], ds
    mov es:[di+4], bx
    ret
