; ========================================
; New Subroutine: sub_1000_53b2
; ========================================
sub_1000_53b2:
    push bp
    mov bp, sp
    sub sp, 001a
    push si
    mov cx, 0004
    lea di, [bp-1a]
    push ss
    pop es
    xor ax, ax
    repz stosw
    cmp word ptr [bp+a], 00
    jge loc_1000_53e4
    mov ax, [bp+a]
    cwd
    xor ax, dx
    sub ax, dx
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-14], ax
    mov ax, [bp-14]
    mov [bp+a], ax

loc_1000_53e4:
    cmp word ptr [bp+8], 00
    jge loc_1000_5401
    mov ax, [bp+8]
    cwd
    xor ax, dx
    sub ax, dx
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-16], ax
    mov ax, [bp-16]
    mov [bp+8], ax

loc_1000_5401:
    cmp word ptr [bp+6], 00
    mov ax, 0000
    jge loc_1000_540b
    dec ax

loc_1000_540b:
    mov [bp-18], ax
    mov ax, [bp+6]
    cwd
    xor ax, dx
    sub ax, dx
    mov [bp+6], ax
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 014a
    imul word ptr [bp+a]
    mov dx, bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    mov ax, es:[bx]
    and ax, 1fff
    mov [bp-1a], ax
    push word ptr [bp+a]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_3041
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_2f74
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
    or cx, [bp-1a]
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    mov es:[bx], cx
    mov ax, [bp-18]
    and ax, ax
    jz loc_1000_548f
    mov ax, [bp+8]
    mov [0032], ax

loc_1000_548f:
    pop si
    mov sp, bp
    pop bp
    retf 0006
