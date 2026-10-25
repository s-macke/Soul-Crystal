; ========================================
; New Subroutine: sub_1bd7_7420
; ========================================
sub_1bd7_7420:
    push bp
    mov bp, sp
    mov dx, di
    mov bx, si
    push ds
    lds si, [bp+a]
    mov di, si
    mov ax, ds
    mov es, ax
    xor ax, ax
    mov cx, ffff
    repnz scasb
    not cx
    les di, [bp+6]
    mov ax, di
    test al, 01
    jz loc_1bd7_7445
    movsb
    dec cx

loc_1bd7_7445:
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
