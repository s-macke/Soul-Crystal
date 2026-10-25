; ========================================
; New Subroutine: sub_1bd7_f4ea
; ========================================
sub_1bd7_f4ea:
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
    mov ax, 0011
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov si, ax
    mov [bp-2], dx
    or dx, ax
    jz loc_1bd7_f524
    mov ax, [bp-2]
    push ax
    jmp loc_1bd7_f5ad

loc_1bd7_f524:
    sub si, si
    mov di, ed9a
    mov word ptr [bp-2], 5684

loc_1bd7_f52e:
    mov es, [6ea0]
    mov bx, [bp-2]
    mov word ptr es:[bx], 0000
    mov ax, 000c
    push ax
    mov cx, si
    sub ch, ch
    add cx, 41
    push cx
    mov cx, 36ad
    push cx
    push di
    nop
    push cs
    call sub_1bd7_7648
    add sp, 08
    add di, 0c
    inc si
    add word ptr [bp-2], 02
    cmp word ptr [bp-2], 5698
    jb loc_1bd7_f52e
    mov ax, 65cf
    push ds
    push ax
    mov ax, 65d2
    push ds
    push ax
    nop
    push cs
    call sub_1bd7_70fa
    add sp, 08
    push dx
    push ax
    mov cx, 000a
    push cx
    mov cx, 0002
    push cx
    mov cx, 5684
    mov bx, 2c43
    push bx
    push cx
    mov si, ax
    mov di, dx
    nop
    push cs
    call sub_1bd7_7288
    add sp, 0c
    push di
    push si
    mov ax, 0078
    push ax
    mov ax, 0001
    push ax
    mov ax, ed9a
    mov cx, 36ad
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7288
    add sp, 0c
    push di

loc_1bd7_f5ad:
    push si
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04
    mov ax, 0011
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    push dx
    push ax
    mov cx, 000a
    push cx
    mov cx, 0002
    push cx
    mov cx, 5684
    mov bx, 2c43
    push bx
    push cx
    mov si, ax
    mov di, dx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    push di
    push si
    mov ax, 0078
    push ax
    mov ax, 0001
    push ax
    mov ax, ed9a
    mov cx, 36ad
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    push di
    push si
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04
    mov si, 5684

loc_1bd7_f60a:
    mov ax, 2c43
    push ax
    push si
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc si
    inc si
    cmp si, 5698
    jb loc_1bd7_f60a
    mov word ptr [bp-c], 0000
    sub di, di
    mov bx, 5684
    mov cx, [bp+6]
    mov ax, 2c43
    mov ds, ax

loc_1bd7_f635:
    cmp [bx], cx
    jb loc_1bd7_f64a
    inc di
    inc bx
    inc bx
    cmp bx, 5698
    jb loc_1bd7_f635
    mov ax, 7fc1
    mov ds, ax
    jmp loc_1bd7_f657
