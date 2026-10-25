; ========================================
; New Subroutine: sub_1bd7_0006
; ========================================
sub_1bd7_0006:
    push di
    xor di, di
    xor dx, dx
    xor bx, bx
    call sub_1bd7_1a04
    cmp al, 2b
    jz loc_1bd7_0019
    cmp al, 2d
    jnz loc_1bd7_001c
    dec di

loc_1bd7_0019:
    call sub_1bd7_1a01

loc_1bd7_001c:
    sub al, 30
    cmp al, 09
    ja loc_1bd7_004e
    push ax
    shl bx, 01
    rcl dx, 01
    jb loc_1bd7_0048
    mov ax, bx
    mov cx, dx
    shl bx, 01
    rcl dx, 01
    jb loc_1bd7_0048
    shl bx, 01
    rcl dx, 01
    jb loc_1bd7_0048
    add bx, ax
    adc dx, cx
    jb loc_1bd7_0048
    pop ax
    cbw
    add bx, ax
    adc dx, 00
    jae loc_1bd7_0019

loc_1bd7_0048:
    jmp loc_1bd7_1618
