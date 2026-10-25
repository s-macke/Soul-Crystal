; ========================================
; New Subroutine: sub_1000_52d0
; ========================================
sub_1000_52d0:
    push bp
    mov bp, sp
    sub sp, 0018
    push si
    xor ax, ax
    mov [bp-14], ax
    mov [bp-16], ax
    mov [bp-18], ax
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 014a
    imul word ptr [bp+8]
    mov dx, bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    mov ax, es:[bx]
    and ax, 1fff
    mov [bp-14], ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_3041
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    mov cx, es:[bx]
    or cx, [bp-14]
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    mov es:[bx], cx
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    mov cx, es:[bx]
    mov [bp-16], cx
    mov bx, ax
    mov ax, 0007
    push ax
    lea ax, [bp-16]
    push ax
    mov [bp-18], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, [bp-18]
    mov ax, [bp-16]
    mov es:[bx], ax
    xor ax, ax
    push ax
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_2f74
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    mov ax, es:[bx]
    mov [0140], ax
    mov word ptr [0142], 0002
    pop si
    mov sp, bp
    pop bp
    retf 0004
