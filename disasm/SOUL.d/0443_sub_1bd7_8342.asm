; ========================================
; New Subroutine: sub_1bd7_8342
; ========================================
sub_1bd7_8342:
    push bp
    mov bp, sp
    mov dx, di
    mov bx, si
    push ds
    les di, [bp+6]
    xor ax, ax
    mov cx, ffff
    repnz scasb
    lea si, [di-1]
    les di, [bp+a]
    mov cx, ffff
    repnz scasb
    not cx
    sub di, cx
    mov ax, es
    mov ds, ax
    mov es, [bp+8]
    xchg si, di
    mov ax, [bp+6]
    add si, 0001
    jz loc_1bd7_8377
    movsb
    dec cx

loc_1bd7_8377:
    shr cx, 01
    repz movsw
    adc cx, cx
    repz movsb
    mov si, bx
    mov di, dx
    pop ds
    mov dx, es
    pop bp
    retf
