; ========================================
; New Subroutine: sub_1bd7_1e10
; ========================================
sub_1bd7_1e10:
    push ax
    mov ax, bx
    xchg [57a4], ax  ; data_7fc1_57a4 word readwrite
    mov [bx], ax
    mov word ptr [bx+4], ffff
    pop ax
    ret
