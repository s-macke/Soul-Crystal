; ========================================
; New Subroutine: sub_1bd7_0696
; ========================================
sub_1bd7_0696:
    push bp
    mov bp, sp
    mov bx, [bp+8]
    call sub_1bd7_1db0
    jae loc_1bd7_06c6

loc_1bd7_06a1:
    xchg dx, bx
    mov bx, [bp+6]
    call sub_1bd7_1e49
    xchg dx, bx
    mov cx, [bx]
    mov ax, [bx+2]
    xchg dx, bx
    mov [bx], cx
    mov [bx+2], ax
    jcxz loc_1bd7_06c2
    xchg ax, bx
    mov [bx-2], ax
    xchg dx, bx
    call sub_1bd7_1e10

loc_1bd7_06c2:
    pop bp
    retf 0004

loc_1bd7_06c6:
    xor cx, cx
    mov dx, [bx]
    call sub_1bd7_1e20
    jmp loc_1bd7_06a1
