; ========================================
; New Subroutine: sub_1bd7_1c31
; ========================================
sub_1bd7_1c31:
    mov ax, [si]
    test al, 01
    jz loc_1bd7_1c59
    inc ax
    jz loc_1bd7_1c67
    mov di, si
    add di, ax
    dec ax

loc_1bd7_1c3f:
    mov cx, [di]
    add cl, 01
    jz loc_1bd7_1c4f
    inc cx
    jz loc_1bd7_1c6b
    add ax, cx
    add di, cx
    jmp loc_1bd7_1c3f

loc_1bd7_1c4f:
    mov [si], ax
    cmp ax, bx
    jae loc_1bd7_1c71
    mov ax, cx
    mov si, di

loc_1bd7_1c59:
    mov di, ax
    add si, [di]
    add si, 03
    and si, fe
    cmp si, dx
    jbe sub_1bd7_1c31

loc_1bd7_1c67:
    mov dx, si
    stc
    ret

loc_1bd7_1c6b:
    mov [si], ax
    cmp ax, bx
    jb loc_1bd7_1c78

loc_1bd7_1c71:
    mov [57a0], si
    jmp loc_1bd7_1be9

loc_1bd7_1c78:
    mov dx, si
    ret
