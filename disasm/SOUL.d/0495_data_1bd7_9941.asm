data_1bd7_9941:
    db 90  ; |.|

loc_1bd7_9942:
    mov cx, bx
    jmp loc_1bd7_9a2b

data_1bd7_9947:
    db 90  ; |.|

loc_1bd7_9948:
    mov ax, 7fc1
    mov ds, ax
    mov di, si
    shl di, 01
    les bx, [bp+6]
    mov ax, es:[bx+di]
    mov cl, 04
    shl ax, cl
    add ax, 181e
    mov cx, 2c43
    push cx
    push ax
    lea ax, [bp-14]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_7420
    add sp, 08
    jmp loc_1bd7_9993

loc_1bd7_9972:
    mov ax, 7fc1
    mov ds, ax
    mov bx, si
    shl bx, 01
    les si, [bp+6]
    push word ptr es:[bx+si]
    mov ax, 5d4a
    push ds
    push ax
    lea ax, [bp-14]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_7562
    add sp, 0a

loc_1bd7_9993:
    sub di, di
    cmp byte ptr [bp-14], 00
    jz loc_1bd7_99a2

loc_1bd7_999b:
    inc di
    cmp byte ptr [bp+di-14], 00
    jnz loc_1bd7_999b

loc_1bd7_99a2:
    mov cx, [bp-4]
    mov ax, 458f
    mov ds, ax
    cmp di, 03
    jge loc_1bd7_99d4
    mov si, cx
    add si, 03
    cmp byte ptr [si-354b], 00
    jz loc_1bd7_9a11
    mov [bp-2], di

loc_1bd7_99be:
    mov al, [si-354a]
    mov bx, si
    add bx, di
    mov [bx-354d], al
    inc si
    cmp byte ptr [si-354b], 00
    jnz loc_1bd7_99be
    jmp loc_1bd7_9a11

loc_1bd7_99d4:
    mov [bp-2], di
    cmp di, 03
    jle loc_1bd7_9a11
    mov bx, cx
    mov si, cx
    cmp byte ptr [si-354a], 00
    jz loc_1bd7_99ef

loc_1bd7_99e7:
    inc bx
    cmp byte ptr [bx-354a], 00
    jnz loc_1bd7_99e7

loc_1bd7_99ef:
    mov si, bx
    mov ax, cx
    inc ax
    inc ax
    cmp si, ax
    jle loc_1bd7_9a11
    mov di, [bp-2]

loc_1bd7_99fc:
    mov al, [si-354a]
    mov bx, si
    add bx, di
    mov [bx-354d], al
    mov ax, cx
    inc ax
    inc ax
    dec si
    cmp ax, si
    jl loc_1bd7_99fc

loc_1bd7_9a11:
    sub si, si
    cmp byte ptr [bp-14], 00
    jz loc_1bd7_9a2b

loc_1bd7_9a19:
    mov al, [bp+si-14]
    mov bx, si
    add bx, cx
    mov [bx-354a], al
    inc si
    cmp byte ptr [bp+si-14], 00
    jnz loc_1bd7_9a19

loc_1bd7_9a2b:
    inc cx
    mov [bp-4], cx
    mov bx, cx
    cmp byte ptr [bx-354a], 00
    jz loc_1bd7_9a3b
    jmp loc_1bd7_990c

loc_1bd7_9a3b:
    mov cx, 7fc1
    mov ds, cx
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
