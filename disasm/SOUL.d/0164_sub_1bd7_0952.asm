; ========================================
; New Subroutine: sub_1bd7_0952
; ========================================
sub_1bd7_0952:
    push bp
    mov bp, sp
    mov bx, [bp+a]
    mov cx, [bp+6]
    or cx, cx
    jl loc_1bd7_094f
    mov dx, [bp+8]
    dec dx
    xchg cx, dx
    jl loc_1bd7_094f
    jnz loc_1bd7_096e
    call sub_1bd7_098a
    jmp loc_1bd7_0986

loc_1bd7_096e:
    mov ax, [bx]
    sub ax, cx
    jg loc_1bd7_097c
    call sub_1bd7_1e08
    mov ax, 6a34
    jmp loc_1bd7_0986

loc_1bd7_097c:
    cmp ax, dx
    jge loc_1bd7_0982
    mov dx, ax

loc_1bd7_0982:
    call sub_1bd7_1e20
    xchg ax, bx

loc_1bd7_0986:
    pop bp
    retf 0006
