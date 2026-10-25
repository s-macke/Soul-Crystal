; ========================================
; New Subroutine: sub_1bd7_4710
; ========================================
sub_1bd7_4710:
    push cx
    push di
    push dx
    mov si, [5812]
    mov [5810], si

loc_1bd7_471b:
    cmp si, [580e]
    jz loc_1bd7_4734
    add si, [si+1]
    cmp byte ptr [si], 01
    jnz loc_1bd7_471b
    mov dx, [580e]
    call sub_1bd7_473c
    mov [580e], di

loc_1bd7_4734:
    mov si, [580e]
    pop dx
    pop di
    pop cx
    ret
