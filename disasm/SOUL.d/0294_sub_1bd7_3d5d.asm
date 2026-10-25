; ========================================
; New Subroutine: sub_1bd7_3d5d
; ========================================
sub_1bd7_3d5d:
    cmp word ptr [6860], 9400
    jae loc_1bd7_3d95
    mov ax, 8008
    call sub_1bd7_1767
    mov al, 0a
    call sub_1bd7_3c83
    xchg ax, cx
    jcxz loc_1bd7_3d95
    mov ax, 800a
    call sub_1bd7_1767
    mov ax, [bp+2]
    call sub_1bd7_3dd0
    jnz loc_1bd7_3d89
    mov ax, 9400
    call sub_1bd7_1767
    jmp loc_1bd7_3d95

loc_1bd7_3d89:
    mov cx, 17bc
    call sub_1bd7_17c5
    mov ax, 8009
    call sub_1bd7_1767

loc_1bd7_3d95:
    mov ax, 800b
    call sub_1bd7_1767
    xor ax, ax
    call sub_1bd7_3c83
    mov si, cx
    add si, 02
    mov cx, 0008

loc_1bd7_3da8:
    push ds
    mov ds, bx
    lodsb byte ptr [si]
    pop ds
    call sub_1bd7_17bc
    loop loc_1bd7_3da8
    mov ax, 800c
    call sub_1bd7_1767
    mov dx, [bp+4]
    call sub_1bd7_3dc6
    mov al, 3a
    call sub_1bd7_17bc
    mov dx, [bp+2]
