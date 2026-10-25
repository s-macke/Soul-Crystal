; ========================================
; New Subroutine: sub_1bd7_6d48
; ========================================
sub_1bd7_6d48:
    pop cx
    pop dx
    mov bx, sp
    sub bx, ax
    jb loc_1bd7_6d5b
    cmp bx, [6772]
    jb loc_1bd7_6d5b
    mov sp, bx
    push dx
    push cx
    retf

loc_1bd7_6d5b:
    push dx
    push cx
    mov ax, [6774]
    inc ax
    jnz loc_1bd7_6d68
    xor ax, ax
    jmp loc_1bd7_5d90

loc_1bd7_6d68:
    jmp far, [6774]
