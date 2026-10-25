; ========================================
; New Subroutine: sub_1bd7_cccc
; ========================================
sub_1bd7_cccc:
    push bp
    mov bp, sp
    sub sp, 36
    push di
    push si
    cmp word ptr [bp+16], 00
    jz loc_1bd7_cce9
    sub ax, ax
    push ax
    mov ax, 0005
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04

loc_1bd7_cce9:
    mov ax, 2c43
    mov es, ax
    mov al, es:[0540]
    sub ah, ah
    dec ax
    jz loc_1bd7_cd08
    dec ax
    dec ax
    jge loc_1bd7_ccfe
    jmp loc_1bd7_d03d

loc_1bd7_ccfe:
    dec ax
    jg loc_1bd7_cd04
    jmp loc_1bd7_cd9c

loc_1bd7_cd04:
    jmp loc_1bd7_d03d
