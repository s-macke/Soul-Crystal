; ========================================
; New Subroutine: sub_1000_0e1a
; ========================================
sub_1000_0e1a:
    push bp
    mov bp, sp
    sub sp, 0014
    push si
    mov word ptr [bp-14], 0000
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    mov ax, es:[bx]
    and ax, 1fff
    mov [bp-14], ax
    xor ax, ax
    push ax
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_3041
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
    mov cx, es:[bx]
    or cx, [bp-14]
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    mov es:[bx], cx
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_2f74
    pop si
    mov sp, bp
    pop bp
    retf 0004
