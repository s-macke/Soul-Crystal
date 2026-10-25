data_1000_0a45:
    db 90  ; |.|

loc_1000_0a46:
    mov bx, 000e
    imul bx
    mov bx, ax
    mov si, 0080
    add bx, [si+a]
    mov es, [si+2]
    cmp word ptr es:[bx], ff
    jnz loc_1000_0a5f
    jmp loc_1000_0a6b

loc_1000_0a5f:
    mov ax, [bp-14]
    inc ax

loc_1000_0a63:
    mov [bp-14], ax
    cmp ax, 000a
    jle loc_1000_0a46

loc_1000_0a6b:
    mov ax, [bp-14]
    jmp loc_1000_0aa6

data_1000_0a71:
    db 90  ; |.|

loc_1000_0a72:
    dec ax
    mov bx, 000e
    imul bx
    mov bx, ax
    mov si, 0080
    add bx, [si+a]
    mov es, [si+2]
    push es
    push bx
    mov ax, 000e
    push ax
    mov ax, 000e
    imul word ptr [bp-16]
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    push es
    push bx
    mov ax, 000e
    push ax
    call sub_1bd7_0786
    mov ax, [bp-16]
    dec ax

loc_1000_0aa6:
    mov [bp-16], ax
    cmp ax, 0002
    jge loc_1000_0a72
    mov si, 0080
    mov bx, 000e
    add bx, [si+a]
    mov es, [si+2]
    mov ax, [bp+8]
    mov es:[bx], ax
    mov bx, 000e
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov ax, [bp+6]
    mov es:[bx], ax
    pop si
    mov sp, bp
    pop bp
    retf 0004

data_1000_0ad9:
    db 90, e9, 30, 01, 90  ; |..0..|
