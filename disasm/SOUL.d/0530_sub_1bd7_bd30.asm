; ========================================
; New Subroutine: sub_1bd7_bd30
; ========================================
sub_1bd7_bd30:
    push bp
    mov bp, sp
    push si
    sub si, si
    mov ax, [bp+6]
    or ax, ax
    jz loc_1bd7_bd4a
    dec ax
    jz loc_1bd7_bd43
    jmp loc_1bd7_bf9a

loc_1bd7_bd43:
    mov [6eca], si
    jmp loc_1bd7_bf9a

loc_1bd7_bd4a:
    push word ptr [6eca]
    nop
    push cs
    call sub_1bd7_b924
    add sp, 02
    push word ptr [6eca]
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    sub ah, ah
    cmp ax, 000f
    jbe loc_1bd7_bd70
    jmp loc_1bd7_bf93

loc_1bd7_bd70:
    shl ax, 01
    xchg ax, bx
    jmp word ptr cs:[bx-4288]
