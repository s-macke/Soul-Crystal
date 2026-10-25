; ========================================
; New Subroutine: sub_1bd7_15eb
; ========================================
sub_1bd7_15eb:
    cmp word ptr [bx+c], 01
    stc
    jz loc_1bd7_160a
    push ax
    push dx
    xor ax, ax
    cwd
    inc dx
    div word ptr [bx+c]
    mov cx, dx
    pop dx
    pop ax
    stc
    jcxz loc_1bd7_160a
    add ax, cx
    adc dx, 00
    cmp dx, 01

loc_1bd7_160a:
    ret
