; ========================================
; New Subroutine: sub_1bd7_bba4
; ========================================
sub_1bd7_bba4:
    push bp
    mov bp, sp
    sub sp, 02
    push di
    push si
    mov ax, [bp+6]
    or ax, ax
    jz loc_1bd7_bbc2
    dec ax
    jz loc_1bd7_bbb9
    jmp loc_1bd7_bc7f

loc_1bd7_bbb9:
    mov word ptr [6ec8], 0000
    jmp loc_1bd7_bc7f

loc_1bd7_bbc2:
    push word ptr [6ec8]
    push cs
    call sub_1bd7_bc88
    add sp, 02
    push word ptr [bp+8]
    mov di, 0001
    push di
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    mov si, ax
    sub ah, ah
    dec ax
    cmp ax, 0006
    jbe loc_1bd7_bbe9
    jmp loc_1bd7_bc75

loc_1bd7_bbe9:
    shl ax, 01
    xchg ax, bx
    jmp word ptr cs:[bx-440e]
