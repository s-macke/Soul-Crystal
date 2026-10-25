; ========================================
; New Subroutine: sub_1bd7_453f
; ========================================
sub_1bd7_453f:
    push ax
    push bx
    push cx
    push dx
    push di
    xchg ax, dx
    xchg ax, bx
    xor bx, bx

loc_1bd7_4548:
    mov si, bx
    call sub_1bd7_4596
    jz loc_1bd7_4593
    mov bx, si
    call sub_1bd7_45c6
    mov cx, [si-9]
    jcxz loc_1bd7_4548
    shr cx, 01
    mov di, [si-7]
    push es
    push ds
    pop es
    repnz scasw
    pop es
    jnz loc_1bd7_4548
    add [di-2], dx
    or dx, dx
    jnz loc_1bd7_458d
    sub word ptr [si-9], 02
    jz loc_1bd7_4583
    mov si, di
    dec di
    dec di
    push es
    push ds
    pop es
    repz movsw
    pop es
    mov word ptr [di], 0001
    jmp loc_1bd7_458d

loc_1bd7_4583:
    xor di, di
    xchg [si-7], di
    mov word ptr [di-2], 0003

loc_1bd7_458d:
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

loc_1bd7_4593:
    jmp loc_1bd7_1688
