; ========================================
; New Subroutine: sub_1bd7_3f82
; ========================================
sub_1bd7_3f82:
    push bx
    push cx
    push dx
    push si
    push di
    push es
    call sub_1bd7_3fc0
    or dx, dx
    jnz loc_1bd7_3fb7
    mov si, 57fa

loc_1bd7_3f92:
    call sub_1bd7_3fda
    jae loc_1bd7_3fb9
    mov si, [si+4]
    cmp si, 5806
    jnz loc_1bd7_3f92
    call sub_1bd7_3fd7
    jae loc_1bd7_3fb9
    mov dx, ax
    call sub_1bd7_41d5
    sub ax, dx
    neg ax
    call sub_1bd7_4127
    xchg ax, dx
    call sub_1bd7_3fd7
    jae loc_1bd7_3fb9

loc_1bd7_3fb7:
    xor ax, ax

loc_1bd7_3fb9:
    pop es
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    ret
