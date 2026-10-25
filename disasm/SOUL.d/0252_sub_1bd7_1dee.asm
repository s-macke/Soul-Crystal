; ========================================
; New Subroutine: sub_1bd7_1dee
; ========================================
sub_1bd7_1dee:
    mov ax, [6849]
    push bx
    mov bx, 6a38

loc_1bd7_1df5:
    cmp [bx+4], ax
    jl loc_1bd7_1dfd
    call sub_1bd7_1e0d

loc_1bd7_1dfd:
    add bx, 06
    cmp bx, 6ab0
    jb loc_1bd7_1df5
    pop bx

loc_1bd7_1e07:
    ret
