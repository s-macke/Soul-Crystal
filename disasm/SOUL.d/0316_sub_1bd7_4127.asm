; ========================================
; New Subroutine: sub_1bd7_4127
; ========================================
sub_1bd7_4127:
    push cx
    add ah, f0
    jnz loc_1bd7_4145
    mov cl, 04
    shl ax, cl
    mov cx, [6b2e]
    sub cx, ax
    jb loc_1bd7_4145
    mov ax, [6b2c]
    cmp cx, ax
    jbe loc_1bd7_4145
    call sub_1bd7_468d
    jae loc_1bd7_414d

loc_1bd7_4145:
    mov ax, [6b2c]
    xor cx, cx
    call sub_1bd7_468d

loc_1bd7_414d:
    mov [6b2e], cx
    xchg ax, cx
    mov cl, 04
    add ax, 0010
    rcr ax, cl
    and ah, 1f
    mov cx, ds
    add ax, cx
    mov [5808], ax
    pop cx
    ret
