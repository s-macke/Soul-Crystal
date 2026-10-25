; ========================================
; New Subroutine: sub_1bd7_9314
; ========================================
sub_1bd7_9314:
    push bp
    mov bp, sp
    sub sp, 06
    push di
    push si
    sub ax, ax
    push ax
    mov ax, 0005
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    mov ax, 0010
    mov bx, 0c8a
    mov es, [6e24]
    mov [bp-6], bx
    mov [bp-4], es
    sub dx, dx
    div word ptr es:[bx]
    mov di, ax
    mov ax, [bp+6]
    or ax, ax
    jz loc_1bd7_9350
    dec ax
    jz loc_1bd7_93c4
    jmp loc_1bd7_9423
