; ========================================
; New Subroutine: sub_1bd7_1f81
; ========================================
sub_1bd7_1f81:
    xor ax, ax
    mov bx, es:[6874]
    cmp bx, ax
    jz loc_1bd7_1f90
    dec bx
    call sub_1bd7_1f96

loc_1bd7_1f90:
    mov ax, 0030
    mov bx, ffff
