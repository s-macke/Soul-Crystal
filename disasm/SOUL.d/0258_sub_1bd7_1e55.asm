; ========================================
; New Subroutine: sub_1bd7_1e55
; ========================================
sub_1bd7_1e55:
    cmp word ptr [bx], 00
    jz loc_1bd7_1e8b
    push cx
    push si
    mov si, [bx+2]
    cmp si, es:[579e]  ; data_7fc1_579e word read
    jb loc_1bd7_1e89
    cmp si, es:[57a2]  ; data_7fc1_57a2 word read
    ja loc_1bd7_1e86
    add [si-2], ax
    or ax, ax
    jnz loc_1bd7_1e89
    mov cx, [bx]
    inc cx
    or cl, 01
    xchg [si-2], cx
    cmp cx, bx
    jz loc_1bd7_1e89
    push es
    pop ds
    jmp loc_1bd7_1688

loc_1bd7_1e86:
    call sub_1bd7_453f

loc_1bd7_1e89:
    pop si
    pop cx

loc_1bd7_1e8b:
    ret
