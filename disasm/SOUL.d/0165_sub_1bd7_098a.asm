; ========================================
; New Subroutine: sub_1bd7_098a
; ========================================
sub_1bd7_098a:
    or dx, dx
    jl loc_1bd7_09a8
    jnz loc_1bd7_0997
    call sub_1bd7_1e08
    mov ax, 6a34
    ret

loc_1bd7_0997:
    cmp dx, [bx]
    jle loc_1bd7_09a3
    mov dx, [bx]
    or cx, cx
    jge loc_1bd7_09a3
    xor cx, cx

loc_1bd7_09a3:
    call sub_1bd7_1e20
    xchg ax, bx
    ret

loc_1bd7_09a8:
    jmp loc_1bd7_1615
