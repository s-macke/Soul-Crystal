; ========================================
; New Subroutine: sub_1bd7_6d30
; ========================================
sub_1bd7_6d30:
    mov cx, [6dfe]  ; data_7fc1_6dfe word read
    jcxz loc_1bd7_6d47
    mov bx, 0001
    call far, [6dfc]
    mov bx, 0004
    mov ax, 1332
    call far, [6dfc]

loc_1bd7_6d47:
    retf
