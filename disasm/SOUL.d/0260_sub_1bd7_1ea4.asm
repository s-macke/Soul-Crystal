; ========================================
; New Subroutine: sub_1bd7_1ea4
; ========================================
sub_1bd7_1ea4:
    mov si, [57a0]
    mov ax, [si]
    test al, 01
    jz loc_1bd7_1eb9
    inc ax
    jz loc_1bd7_1ec1
    add ax, si
    cmp ax, [57a2]
    jz loc_1bd7_1ec1

loc_1bd7_1eb9:
    mov si, [57a2]
    mov [57a0], si

loc_1bd7_1ec1:
    ret
