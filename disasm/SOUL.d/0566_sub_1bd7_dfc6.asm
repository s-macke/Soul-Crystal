; ========================================
; New Subroutine: sub_1bd7_dfc6
; ========================================
sub_1bd7_dfc6:
    push bp
    mov bp, sp
    sub sp, 0c
    push di
    push si
    mov word ptr [bp-6], 0000
    mov word ptr [bp-c], 0012
    mov word ptr [bp-a], 0001
    mov word ptr [bp-8], 0000
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-6]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    sub di, di
    cmp [bp+a], di
    jle loc_1bd7_e06e
    mov ax, [bp+6]
    mov dx, [bp+8]
    mov si, ax
    mov [bp-2], dx

loc_1bd7_e006:
    mov ax, 0036
    push ax
    mov ax, 0007
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    mov word ptr [bp-6], 0000
    mov es, [bp-2]
    mov ax, es:[si]
    mov cx, 0100
    cwd
    idiv cx
    mov [bp-c], dx
    mov ax, es:[si]
    cwd
    xor ax, dx
    sub ax, dx
    mov cx, 0008
    sar ax, cl
    xor ax, dx
    sub ax, dx
    mov [bp-a], ax
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-6]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_8f62
    add sp, 08
    sub ax, ax
    push ax
    mov ax, 0008
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    or ax, ax
    jnz loc_1bd7_e06e
    inc si
    inc si
    mov ax, [bp-2]
    inc di
    cmp [bp+a], di
    jg loc_1bd7_e006

loc_1bd7_e06e:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
