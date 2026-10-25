; ========================================
; New Subroutine: sub_1bd7_0a67
; ========================================
sub_1bd7_0a67:
    pop word ptr [5746]
    pop word ptr [5748]
    xor ax, ax
    push bp
    mov bp, sp
    push word ptr [6847]
    push si
    push di
    push cx
    push ax
    push ax
    push ax
    push ax
    push ax
    sub sp, cx
    mov [6847], bp
    inc word ptr [6849]
    mov di, sp
    push es
    push ds
    pop es
    shr cx, 01
    repz stosw
    pop es
    jmp far, [5746]
