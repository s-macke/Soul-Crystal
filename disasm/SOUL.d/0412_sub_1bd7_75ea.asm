; ========================================
; New Subroutine: sub_1bd7_75ea
; ========================================
sub_1bd7_75ea:
    push bp
    mov bp, sp
    mov cx, [bp+e]
    push ds
    push di
    push si
    jcxz loc_1bd7_763d
    lds si, [bp+a]
    les di, [bp+6]

loc_1bd7_75fb:
    mov ax, cx
    dec ax
    mov dx, di
    not dx
    sub ax, dx
    sbb bx, bx
    and ax, bx
    add ax, dx
    mov dx, si
    not dx
    sub ax, dx
    sbb bx, bx
    and ax, bx
    add ax, dx
    inc ax
    xchg ax, cx
    sub ax, cx
    shr cx, 01
    repz movsw
    adc cx, cx
    repz movsb
    xchg ax, cx
    jcxz loc_1bd7_763d
    or si, si
    jnz loc_1bd7_7630
    mov ax, ds
    add ax, 1000
    mov ds, ax

loc_1bd7_7630:
    or di, di
    jnz loc_1bd7_75fb
    mov ax, es
    add ax, 1000
    mov es, ax
    jmp loc_1bd7_75fb

loc_1bd7_763d:
    mov ax, [bp+6]
    mov dx, [bp+8]
    pop si
    pop di
    pop ds
    pop bp
    retf
