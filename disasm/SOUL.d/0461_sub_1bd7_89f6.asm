; ========================================
; New Subroutine: sub_1bd7_89f6
; ========================================
sub_1bd7_89f6:
    mov dx, cx
    add dx, 27
    and dl, f0
    mov bx, dx
    neg bx
    neg bx
    cmc
    rcr bx, 01
    shr bx, 01
    shr bx, 01
    shr bx, 01

loc_1bd7_8a0d:
    mov ah, 48
    int 21
    jb loc_1bd7_8a39
    cmp ax, [6870]
    jbe loc_1bd7_8a0d
    cmp ax, [6872]
    jbe loc_1bd7_8a22
    mov [6872], ax

loc_1bd7_8a22:
    mov ds, ax
    xor bx, bx
    mov ax, es:[di+c]
    mov [bx+2], ax
    mov ax, dx
    call sub_1bd7_8a3a
    call sub_1bd7_8a6e
    clc
    jmp loc_1bd7_8a39
