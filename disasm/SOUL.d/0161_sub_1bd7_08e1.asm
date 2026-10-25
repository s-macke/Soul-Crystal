; ========================================
; New Subroutine: sub_1bd7_08e1
; ========================================
sub_1bd7_08e1:
    push es
    mov ax, 6a34
    or bx, bx
    jz loc_1bd7_0900
    jl loc_1bd7_0902
    mov cx, bx
    mov al, dl
    mov ah, dl
    call sub_1bd7_1d77
    inc cx
    xchg dx, di
    shr cx, 01
    push ds
    pop es
    repz stosw
    mov di, dx
    xchg ax, bx

loc_1bd7_0900:
    pop es
    ret

loc_1bd7_0902:
    jmp loc_1bd7_1615
