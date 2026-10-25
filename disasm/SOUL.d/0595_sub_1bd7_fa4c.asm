; ========================================
; New Subroutine: sub_1bd7_fa4c
; ========================================
sub_1bd7_fa4c:
    push bp
    mov bp, sp
    sub sp, 12
    push di
    push si
    mov es, [6e96]
    mov al, es:[0540]
    sub ah, ah
    push ax
    nop
    push cs
    call sub_1bd7_cbee
    add sp, 02
    mov ax, 0002
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1bd7_e70a
    add sp, 04
    mov ax, 0017
    push ax
    push cs
    call sub_1bd7_f0f6
    add sp, 02
    or ax, ax
    jz loc_1bd7_fa89
    jmp loc_1bd7_fb4f

loc_1bd7_fa89:
    sub si, si
    mov ax, 2c43
    mov ds, ax

loc_1bd7_fa90:
    cmp byte ptr [si+360], 00
    jz loc_1bd7_faae
    mov al, [si+360]
    mov [bp+si-12], al
    inc si
    cmp si, 10
    jb loc_1bd7_fa90
    mov ax, 7fc1
    mov ds, ax
    mov di, [bp-2]
    jmp loc_1bd7_fab5

loc_1bd7_faae:
    mov ax, 7fc1
    mov ds, ax
    mov di, si

loc_1bd7_fab5:
    mov es, [6e96]
    mov si, es:[0c6e]
    sub si, di
    shr si, 01
    mov al, 0e
    push ax
    push di
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_a114
    add sp, 08
    mov ax, 0000
    mov cx, 5387
    push cx
    push ax
    sub ax, ax
    push ax
    push ax
    push di
    mov cx, d512
    mov dx, 36ad
    push dx
    push cx
    mov es, [6e96]
    push word ptr es:[0ca6]
    push di
    push ax
    push ax
    mov cx, 005a
    push cx
    nop
    push cs
    call sub_1bd7_d058
    add sp, 18
    sub ax, ax
    push ax
    mov cx, 0001
    push cx
    mov es, [6e96]
    push word ptr es:[0ca6]
    push di
    push ax
    push ax
    push di
    push word ptr es:[0cb2]
    push si
    nop
    push cs
    call sub_1bd7_cccc
    add sp, 12
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

loc_1bd7_fb4f:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
