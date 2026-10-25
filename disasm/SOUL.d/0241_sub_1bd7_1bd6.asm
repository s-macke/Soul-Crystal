; ========================================
; New Subroutine: sub_1bd7_1bd6
; ========================================
sub_1bd7_1bd6:
    mov si, [57a0]  ; data_7fc1_57a0 word read
    mov ax, [si]
    test al, 01
    jz loc_1bd7_1c09
    cmp ax, ffff
    jz loc_1bd7_1c09
    cmp bx, ax
    ja loc_1bd7_1c09

loc_1bd7_1be9:
    jz loc_1bd7_1bfe
    mov [si], bx
    inc bx
    sub ax, bx
    xchg si, bx
    add si, bx
    mov [si], ax
    mov [57a0], si  ; data_7fc1_57a0 word write
    add bx, 02
    ret

loc_1bd7_1bfe:
    stc
    adc [57a0], ax
    mov bx, si
    add bx, 02
    ret

loc_1bd7_1c09:
    stc
    ret
