; ========================================
; New Subroutine: sub_1000_2300
; ========================================
sub_1000_2300:
    push bp
    mov bp, sp
    sub sp, 0048
    push si
    mov cx, 001b
    lea di, [bp-48]
    push ss
    pop es
    xor ax, ax
    repz stosw
    xor ax, ax
    jmp loc_1000_23ca

loc_1000_231a:
    mov ax, 0001
    jmp loc_1000_2343

loc_1000_2320:
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 014a
    imul word ptr [bp-14]
    mov dx, bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    mov word ptr es:[bx], 0000
    mov ax, [bp-16]
    inc ax

loc_1000_2343:
    mov [bp-16], ax
    cmp ax, 00a5
    jle loc_1000_2320
    mov ax, 0014
    imul word ptr [bp-14]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov word ptr es:[bx], 0000
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov word ptr es:[bx], 0000
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov word ptr es:[bx], 0000
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    mov word ptr es:[bx], 0000
    mov ax, 0001
    jmp loc_1000_23be
