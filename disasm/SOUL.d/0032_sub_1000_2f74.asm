; ========================================
; New Subroutine: sub_1000_2f74
; ========================================
sub_1000_2f74:
    push bp
    mov bp, sp
    sub sp, 001e
    push si
    mov cx, 0006
    lea di, [bp-1e]
    push ss
    pop es
    xor ax, ax
    repz stosw
    cmp word ptr [bp+8], 00
    jz loc_1000_2f92
    jmp loc_1000_2fe5

loc_1000_2f92:
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
    mov [bp-14], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-14]
    push ax
    mov [bp-16], dx
    mov [bp-18], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-18]
    add bx, [si+a]
    mov es, [si+2]
    add bx, [bp-16]
    mov ax, [bp-14]
    mov es:[bx], ax
    jmp loc_1000_3035

loc_1000_2fe5:
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
    mov [bp-1a], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-1a]
    push ax
    mov [bp-1c], dx
    mov [bp-1e], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-1e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, [bp-1c]
    mov ax, [bp-1a]
    mov es:[bx], ax

loc_1000_3035:
    pop si
    mov sp, bp
    pop bp
    retf 0004
