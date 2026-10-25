; ========================================
; New Subroutine: sub_1bd7_7ab6
; ========================================
sub_1bd7_7ab6:
    push bp
    mov bp, sp
    sub sp, 02
    push di
    push si
    mov si, 6b4c
    sub di, di
    mov [bp-2], di
    jmp loc_1bd7_7ad0

loc_1bd7_7ac8:
    mov word ptr [bp-2], ffff

loc_1bd7_7acd:
    add si, 0c

loc_1bd7_7ad0:
    cmp [6d2c], si
    jb loc_1bd7_7aec
    add byte ptr [si+a], 83
    jz loc_1bd7_7acd
    push ds
    push si
    nop
    push cs
    call sub_1bd7_7a2e
    add sp, 04
    inc ax
    jz loc_1bd7_7ac8
    inc di
    jmp loc_1bd7_7acd

loc_1bd7_7aec:
    cmp word ptr [bp+4], 01
    jnz loc_1bd7_7af6
    mov ax, di
    jmp loc_1bd7_7af9

loc_1bd7_7af6:
    mov ax, [bp-2]

loc_1bd7_7af9:
    pop si
    pop di
    mov sp, bp
    pop bp
    ret 0002
