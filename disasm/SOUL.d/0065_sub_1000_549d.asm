; ========================================
; New Subroutine: sub_1000_549d
; ========================================
sub_1000_549d:
    push bp
    mov bp, sp
    sub sp, 0018
    push si
    xor ax, ax
    mov [bp-14], ax
    mov [bp-16], ax
    mov [bp-18], ax
    mov ax, 0001
    jmp loc_1000_555b

loc_1000_54b6:
    mov bx, 000e
    imul bx
    mov bx, ax
    mov si, 0080
    add bx, [si+a]
    mov es, [si+2]
    cmp word ptr es:[bx], ff
    jnz loc_1000_54cf
    jmp loc_1000_5566

loc_1000_54cf:
    mov ax, 000e
    imul word ptr [bp-14]
    mov bx, ax
    mov si, 0080
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov cx, es:[bx]
    mov [0072], cx
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    mov ax, es:[bx]
    mov [0070], ax
    mov ax, 0001
    jmp loc_1000_5528

loc_1000_54fe:
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 000e
    imul word ptr [bp-14]
    mov dx, bx
    mov bx, ax
    mov si, 0080
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    add bx, 04
    mov ax, es:[bx]
    mov si, dx
    mov [si+76], ax
    mov ax, [bp-16]
    inc ax

loc_1000_5528:
    mov [bp-16], ax
    cmp ax, 0005
    jle loc_1000_54fe
    mov word ptr [bp-18], 0000
    mov ax, ds
    push ax
    mov ax, 0070
    push ax
    mov ax, ds
    push ax
    lea ax, [bp-18]
    push ax
    call sub_1bd7_9710
    add sp, 08
    mov ax, 0006
    push ax
    push word ptr [bp-18]
    nop
    push cs
    call sub_1000_0f0a
    mov ax, [bp-14]
    inc ax

loc_1000_555b:
    mov [bp-14], ax
    cmp ax, 000a
    jg loc_1000_5566
    jmp loc_1000_54b6

loc_1000_5566:
    nop
    push cs
    call sub_1000_28ff
    pop si
    mov sp, bp
    pop bp
    retf
