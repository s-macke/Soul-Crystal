; ========================================
; New Subroutine: sub_1bd7_6bc4
; ========================================
sub_1bd7_6bc4:
    push bp
    mov bp, sp
    mov ax, [bp+8]
    mov cx, [bp+c]
    or cx, ax
    mov cx, [bp+a]
    jnz loc_1bd7_6bdd
    mov ax, [bp+6]
    mul cx
    pop bp
    retf 0008

loc_1bd7_6bdd:
    push bx
    mul cx
    mov bx, ax
    mov ax, [bp+6]
    mul word ptr [bp+c]
    add bx, ax
    mov ax, [bp+6]
    mul cx
    add dx, bx
    pop bx
    pop bp
    retf 0008

loc_1bd7_6bf6:
    push bp
    mov bp, sp
    push di
    push si
    push bx
    xor di, di
    mov ax, [bp+8]
    or ax, ax
    jge loc_1bd7_6c16
    inc di
    mov dx, [bp+6]
    neg ax
    neg dx
    sbb ax, 0000
    mov [bp+8], ax
    mov [bp+6], dx

loc_1bd7_6c16:
    mov ax, [bp+c]
    or ax, ax
    jge loc_1bd7_6c2e
    inc di
    mov dx, [bp+a]
    neg ax
    neg dx
    sbb ax, 0000
    mov [bp+c], ax
    mov [bp+a], dx

loc_1bd7_6c2e:
    or ax, ax
    jnz loc_1bd7_6c47
    mov cx, [bp+a]
    mov ax, [bp+8]
    xor dx, dx
    div cx
    mov bx, ax
    mov ax, [bp+6]
    div cx
    mov dx, bx
    jmp loc_1bd7_6c7f

loc_1bd7_6c47:
    mov bx, ax
    mov cx, [bp+a]
    mov dx, [bp+8]
    mov ax, [bp+6]

loc_1bd7_6c52:
    shr bx, 01
    rcr cx, 01
    shr dx, 01
    rcr ax, 01
    or bx, bx
    jnz loc_1bd7_6c52
    div cx
    mov si, ax
    mul word ptr [bp+c]
    xchg ax, cx
    mov ax, [bp+a]
    mul si
    add dx, cx
    jb loc_1bd7_6c7b
    cmp dx, [bp+8]
    ja loc_1bd7_6c7b
    jb loc_1bd7_6c7c
    cmp ax, [bp+6]
    jbe loc_1bd7_6c7c

loc_1bd7_6c7b:
    dec si

loc_1bd7_6c7c:
    xor dx, dx
    xchg ax, si

loc_1bd7_6c7f:
    dec di
    jnz loc_1bd7_6c89
    neg dx
    neg ax
    sbb dx, 00

loc_1bd7_6c89:
    pop bx
    pop si
    pop di
    pop bp
    retf 0008
