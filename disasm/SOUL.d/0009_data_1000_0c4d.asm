data_1000_0c4d:
    db 90  ; |.|

loc_1000_0c4e:
    cmp ax, [0032]
    jnz loc_1000_0c57
    jmp loc_1000_0d8b

loc_1000_0c57:
    mov ax, 0001
    jmp loc_1000_0d80

data_1000_0c5d:
    db 90  ; |.|

loc_1000_0c5e:
    cmp ax, 00a3
    jnz loc_1000_0c66
    jmp loc_1000_0d7c

loc_1000_0c66:
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 014a
    imul word ptr [bp-1a]
    mov dx, bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    mov ax, es:[bx]
    mov [bp-1c], ax
    mov ax, 0010
    push ax
    mov ax, [bp-1e]
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
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    not ax
    mov [bp-20], ax
    mov ax, 0001
    push ax
    push word ptr [bp-1c]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-16], ax
    mov ax, [bp-16]
    and ax, [bp-20]
    mov [bp-20], ax
    mov ax, 0002
    push ax
    push word ptr [bp-1c]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-18], ax
    mov ax, [bp-18]
    and ax, [bp-20]
    mov [bp-20], ax
    and ax, ax
    jnz loc_1000_0cfb
    jmp loc_1000_0d7c

loc_1000_0cfb:
    lea ax, [bp-22]
    push ax
    call sub_1bd7_8aa4
    add sp, 02
    mov ax, [bp-1e]
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
    mov ax, [bp-1c]
    mov es:[bx], ax
    mov ax, [bp-1e]
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
    mov cx, es:[bx]
    mov [bp-24], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-24]
    push ax
    mov [bp-26], dx
    mov [bp-28], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-28]
    add bx, [si+a]
    mov es, [si+2]
    add bx, [bp-26]
    mov ax, [bp-24]
    mov es:[bx], ax

loc_1000_0d7c:
    mov ax, [bp-1e]
    inc ax

loc_1000_0d80:
    mov [bp-1e], ax
    cmp ax, 00a5
    jg loc_1000_0d8b
    jmp loc_1000_0c5e

loc_1000_0d8b:
    mov ax, [bp-1a]
    inc ax

loc_1000_0d8f:
    mov [bp-1a], ax
    cmp ax, 0067
    jg loc_1000_0d9a
    jmp loc_1000_0c4e

loc_1000_0d9a:
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    push word ptr es:[bx]
    nop
    push cs
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf

data_1000_0dc0:
    db 90, 90, 90, e9, 48, 00, 90, 90, 90, 90, 90  ; |....H......|
