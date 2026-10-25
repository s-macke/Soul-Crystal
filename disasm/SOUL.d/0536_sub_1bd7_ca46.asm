; ========================================
; New Subroutine: sub_1bd7_ca46
; ========================================
sub_1bd7_ca46:
    push bp
    mov bp, sp
    sub sp, 0a
    push di
    push si
    mov ax, 458f
    mov ds, ax
    mov ax, 2020
    mov cx, 017c
    mov di, c62a
    push ds
    pop es
    repz stosw
    sub di, di
    mov cx, di

loc_1bd7_ca64:
    mov ax, 2c43
    mov es, ax
    mov bx, cx
    mov byte ptr es:[bx+472], 00
    sub si, si
    mov [bp-6], di
    mov ax, 458f
    mov ds, ax
    mov ax, 2c43
    mov es, ax

loc_1bd7_ca80:
    mov al, es:[si+340]
    mov [bp-1], al
    or al, al
    jz loc_1bd7_ca9a
    mov bx, di
    add bx, si
    mov [bx-39d6], al
    inc si
    cmp si, 10
    jl loc_1bd7_ca80

loc_1bd7_ca9a:
    inc cx
    add di, 26
    cmp di, 02f8
    jl loc_1bd7_ca64
    mov ax, 7fc1
    mov ds, ax
    sub si, si
    mov word ptr [bp-2], c62a

loc_1bd7_cab0:
    lea ax, [si+1]
    push ax
    mov ax, 64f4
    push ds
    push ax
    mov ax, 0486
    mov cx, 2c43
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7562
    add sp, 0a
    mov ax, 6503
    push ds
    push ax
    mov ax, 0486
    mov cx, 2c43
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_70fa
    add sp, 08
    mov di, ax
    mov [bp-6], dx
    or dx, ax
    jz loc_1bd7_cb46
    push word ptr [bp-6]
    push di
    mov ax, 0027
    push ax
    mov cx, 0001
    push cx
    mov cx, 64e4
    mov dx, 458f
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0027
    jnz loc_1bd7_cb39
    mov es, [6e7e]
    cmp byte ptr es:[650a], 1a
    jnz loc_1bd7_cb39
    mov ax, 0026
    push ax
    mov ax, 64e4
    mov cx, 458f
    push cx
    push ax
    mov ax, 458f
    push ax
    push word ptr [bp-2]
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    mov es, [6e7c]
    mov byte ptr es:[si+472], ff

loc_1bd7_cb39:
    mov ax, [bp-6]
    push ax
    push di
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_cb46:
    lea ax, [si+1]
    mov si, ax
    add word ptr [bp-2], 26
    cmp word ptr [bp-2], c922
    jae loc_1bd7_cb59
    jmp loc_1bd7_cab0

loc_1bd7_cb59:
    push cs
    call sub_1bd7_cb6c
    or ax, ax
    jnz loc_1bd7_cb63
    sub bx, bx

loc_1bd7_cb63:
    mov ax, bx
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
