data_1bd7_a4d5:
    db 90  ; |.|

loc_1bd7_a4d6:
    mov es, [6e4e]
    mov ax, es:[650c]
    mov [bp-4], ax
    mov es, [6e56]
    mov bx, [bp+6]
    shl bx, 01
    mov ax, es:[bx+4f4]
    mov [bp-6], ax
    mov ax, bx
    mov es, [6e32]
    mov bx, es:[5682]
    mov word ptr [bp-16], dd72
    mov word ptr [bp-14], 458f
    mov word ptr [bp-1a], 589a
    mov word ptr [bp-18], 2c43
    mov si, ax
    mov es, [6e58]
    mov ax, es:[si-2b3a]
    add ax, 6048
    mov [bp-1e], ax
    mov word ptr [bp-1c], 458f

loc_1bd7_a527:
    cmp bx, [bp+6]
    ja loc_1bd7_a52f
    jmp loc_1bd7_a5af

loc_1bd7_a52f:
    mov di, 0008
    sub ax, ax
    mov [bp-22], ax
    mov [bp-24], ax
    cmp [bp-6], ax
    jz loc_1bd7_a5af
    mov ax, 458f
    mov es, ax

loc_1bd7_a544:
    mov si, [bp-4]
    add si, 00ff

loc_1bd7_a54b:
    cmp di, 08
    jnz loc_1bd7_a560
    lds bx, [bp-1e]
    mov di, [bp-22]
    mov al, [bx+di]
    mov [bp-1], al
    sub di, di
    inc word ptr [bp-22]

loc_1bd7_a560:
    sub si, 0100
    mov cx, di
    mov ax, 0080
    sar ax, cl
    mov cl, [bp-1]
    sub ch, ch
    test cx, ax
    jz loc_1bd7_a580
    mov bx, si
    shl bx, 01
    add bx, [bp-1a]
    mov ds, [bp-18]
    jmp loc_1bd7_a58a

loc_1bd7_a580:
    mov bx, si
    shl bx, 01
    add bx, [bp-16]
    mov ds, [bp-14]

loc_1bd7_a58a:
    mov ax, [bx]
    mov si, ax
    inc di
    cmp si, 00ff
    ja loc_1bd7_a54b
    mov ax, 7fc1
    mov ds, ax
    mov bx, [bp-24]
    mov ax, si
    mov es:[bx-354a], al
    inc word ptr [bp-24]
    mov ax, [bp-6]
    cmp [bp-24], ax
    jb loc_1bd7_a544

loc_1bd7_a5af:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_a5b5:
    db 90  ; |.|
