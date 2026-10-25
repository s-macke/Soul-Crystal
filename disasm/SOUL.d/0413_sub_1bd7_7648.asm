; ========================================
; New Subroutine: sub_1bd7_7648
; ========================================
sub_1bd7_7648:
    push bp
    mov bp, sp
    mov cx, [bp+c]
    jcxz loc_1bd7_7688
    push di
    les di, [bp+6]
    mov dx, di
    neg dx
    jz loc_1bd7_7666
    sub dx, cx
    sbb bx, bx
    and dx, bx
    add dx, cx
    xchg cx, dx
    sub dx, cx

loc_1bd7_7666:
    mov ax, [bp+a]
    mov ah, al
    shr cx, 01
    repz stosw
    adc cx, cx
    repz stosb
    xchg cx, dx
    jcxz loc_1bd7_7687
    mov bx, es
    add bx, 1000
    mov es, bx
    shr cx, 01
    repz stosw
    adc cx, cx
    repz stosb

loc_1bd7_7687:
    pop di

loc_1bd7_7688:
    mov ax, [bp+6]
    mov dx, [bp+8]
    pop bp
    retf
