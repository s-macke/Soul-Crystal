; ========================================
; New Subroutine: sub_1000_333c
; ========================================
sub_1000_333c:
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
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 014a
    imul word ptr [0032]
    mov dx, bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    mov ax, es:[bx]
    mov [bp-16], ax
    mov ax, 0010
    push ax
    push word ptr [bp-16]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    mov [bp-18], ax
    and ax, ax
    jz loc_1000_33a0
    mov word ptr [0142], 0001
    mov ax, [bp-16]
    mov [0140], ax
    jmp loc_1000_33bf

loc_1000_33a0:
    mov word ptr [0142], 0002
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

loc_1000_33bf:
    mov ax, 000d
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    not ax
    mov [0144], ax
    pop si
    mov sp, bp
    pop bp
    retf 0002
