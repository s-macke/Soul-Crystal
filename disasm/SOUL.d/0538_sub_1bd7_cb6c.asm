; ========================================
; New Subroutine: sub_1bd7_cb6c
; ========================================
sub_1bd7_cb6c:
    push bp
    mov bp, sp
    sub sp, 04
    push di
    push si
    mov si, 0001
    mov ax, 6506
    push ds
    push ax
    mov ax, 6509
    push ds
    push ax
    nop
    push cs
    call sub_1bd7_70fa
    add sp, 08
    mov di, ax
    mov [bp-2], dx
    or dx, ax
    jnz loc_1bd7_cb96
    sub si, si
    jmp loc_1bd7_cbe5

loc_1bd7_cb96:
    push word ptr [bp-2]
    push di
    mov ax, 0014
    push ax
    mov cx, si
    push cx
    mov cx, 0472
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7288
    add sp, 0c
    cmp ax, 0014
    jnz loc_1bd7_cbd6
    push word ptr [bp-2]
    push di
    mov ax, 02f8
    push ax
    mov cx, si
    push cx
    mov cx, c62a
    mov dx, 458f
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7288
    add sp, 0c
    cmp ax, 02f8
    jz loc_1bd7_cbd8

loc_1bd7_cbd6:
    sub si, si

loc_1bd7_cbd8:
    mov ax, [bp-2]
    push ax
    push di
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_cbe5:
    mov ax, si
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
