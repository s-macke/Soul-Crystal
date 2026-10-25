; ========================================
; New Subroutine: sub_1bd7_f9ec
; ========================================
sub_1bd7_f9ec:
    mov es, [6e96]
    mov al, es:[0540]
    sub ah, ah
    push ax
    nop
    push cs
    call sub_1bd7_cbee
    add sp, 02
    mov ax, 0005
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1bd7_e70a
    add sp, 04
    mov ax, 0018
    push ax
    push cs
    call sub_1bd7_f0f6
    add sp, 02
    or ax, ax
    jnz loc_1bd7_fa4b
    mov ax, 000f
    push ax
    sub ax, ax
    push ax
    push cs
    call sub_1bd7_f334
    add sp, 04
    mov ax, 0438
    push ax
    mov ax, 0007
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    sub ax, ax
    push ax
    mov ax, 000c
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04

loc_1bd7_fa4b:
    retf
