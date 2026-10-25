; ========================================
; New Subroutine: sub_1bd7_075e
; ========================================
sub_1bd7_075e:
    push bp
    mov bp, sp
    push si
    push di
    push es
    push ds
    pop es
    mov bx, [bp+6]
    push bx
    call sub_1bd7_1d77
    pop cx
    push bx
    mov di, dx
    push ds
    lds si, [bp+8]
    shr cx, 01
    repz movsw
    adc cx, cx
    repz movsb
    pop ds
    pop ax
    pop es
    pop di
    pop si
    pop bp
    retf 0006
