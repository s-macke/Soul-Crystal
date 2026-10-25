; ========================================
; New Subroutine: sub_1bd7_572c
; ========================================
sub_1bd7_572c:
    mov cx, [677e]  ; data_7fc1_677e word read
    mov ax, [677c]  ; data_7fc1_677c word read
    and al, fe
    cmp ax, cx
    jb loc_1bd7_5741
    mov [6b2c], cx  ; data_7fc1_6b2c word write
    mov [6b2e], ax  ; data_7fc1_6b2e word write
    ret

loc_1bd7_5741:
    mov bx, 9802
    jmp loc_1bd7_16bb
