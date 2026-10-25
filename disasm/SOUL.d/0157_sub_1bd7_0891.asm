; ========================================
; New Subroutine: sub_1bd7_0891
; ========================================
sub_1bd7_0891:
    push bp
    mov bp, sp
    mov bx, [bp+6]
    mov ax, [bx+2]
    mov dx, ds

loc_1bd7_089c:
    mov cx, [bx]
    jcxz loc_1bd7_08a8
    jmp loc_1bd7_08ab
