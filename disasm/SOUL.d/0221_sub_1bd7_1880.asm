; ========================================
; New Subroutine: sub_1bd7_1880
; ========================================
sub_1bd7_1880:
    sub bx, 04
    mov di, [6829]  ; data_7fc1_6829 word read
    mov ax, fe80

loc_1bd7_188a:
    stosw
    inc ax
    inc ax
    cmp di, bx
    jb loc_1bd7_188a
    retf
