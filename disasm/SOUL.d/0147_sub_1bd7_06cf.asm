; ========================================
; New Subroutine: sub_1bd7_06cf
; ========================================
sub_1bd7_06cf:
    push bp
    mov bp, sp
    push si
    push di
    push es
    push ds
    pop es
    mov si, [bp+8]
    mov di, [bp+6]
    mov bx, [si]
    add bx, [di]
    jo loc_1bd7_0709
    call sub_1bd7_1d77
    xchg dx, di
    push bx
    call sub_1bd7_06f9
    mov si, dx
    call sub_1bd7_06f9
    pop ax
    pop es
    pop di
    pop si
    pop bp
    retf 0004
