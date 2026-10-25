data_1bd7_a12b:
    db 90  ; |.|

loc_1bd7_a12c:
    mov [bp-e], dx

loc_1bd7_a12f:
    sub ax, ax
    mov es, [6e36]
    mov cx, 0b40
    mov di, d512
    repz stosw
    mov al, [bp+c]
    and al, f0
    jnz loc_1bd7_a147
    jmp loc_1bd7_a237

loc_1bd7_a147:
    add byte ptr [bp+c], 10
    jz loc_1bd7_a183
    sub di, di
    mov ax, 2c43
    mov es, ax
    cmp es:[0ca6], di
    jz loc_1bd7_a188
    mov si, d512

loc_1bd7_a15e:
    mov ax, 005a
    push ax
    mov ax, 00ff
    push ax
    mov ax, 36ad
    push ax
    push si
    nop
    push cs
    call sub_1bd7_7648
    add sp, 08
    add si, 0168
    mov es, [6e38]
    inc di
    cmp es:[0ca6], di
    ja loc_1bd7_a15e

loc_1bd7_a183:
    mov ax, 2c43
    mov es, ax

loc_1bd7_a188:
    add byte ptr [bp+c], 20
    jz loc_1bd7_a1c4
    sub di, di
    cmp es:[0ca6], di
    jz loc_1bd7_a1c4
    mov si, d56c

loc_1bd7_a19a:
    mov ax, 005a
    push ax
    mov ax, 00ff
    push ax
    mov ax, 36ad
    push ax
    push si
    nop
    push cs
    call sub_1bd7_7648
    add sp, 08
    add si, 0168
    mov es, [6e38]
    inc di
    cmp es:[0ca6], di
    ja loc_1bd7_a19a
    mov ax, 2c43
    mov es, ax

loc_1bd7_a1c4:
    add byte ptr [bp+c], 40
    jz loc_1bd7_a200
    sub di, di
    cmp es:[0ca6], di
    jz loc_1bd7_a200
    mov si, d5c6

loc_1bd7_a1d6:
    mov ax, 005a
    push ax
    mov ax, 00ff
    push ax
    mov ax, 36ad
    push ax
    push si
    nop
    push cs
    call sub_1bd7_7648
    add sp, 08
    add si, 0168
    mov es, [6e38]
    inc di
    cmp es:[0ca6], di
    ja loc_1bd7_a1d6
    mov ax, 2c43
    mov es, ax

loc_1bd7_a200:
    add byte ptr [bp+c], 80
    jz loc_1bd7_a23c
    sub di, di
    cmp es:[0ca6], di
    jz loc_1bd7_a23c
    mov si, d620

loc_1bd7_a212:
    mov ax, 005a
    push ax
    mov ax, 00ff
    push ax
    mov ax, 36ad
    push ax
    push si
    nop
    push cs
    call sub_1bd7_7648
    add sp, 08
    add si, 0168
    mov es, [6e38]
    inc di
    cmp es:[0ca6], di
    ja loc_1bd7_a212

loc_1bd7_a237:
    mov ax, 2c43
    mov es, ax

loc_1bd7_a23c:
    mov al, es:[0540]
    sub ah, ah
    dec ax
    jz loc_1bd7_a258
    dec ax
    dec ax
    jge loc_1bd7_a24c
    jmp loc_1bd7_a39b

loc_1bd7_a24c:
    dec ax
    jg loc_1bd7_a252
    jmp loc_1bd7_a2da

loc_1bd7_a252:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

loc_1bd7_a258:
    sub bx, bx
    cmp es:[0ca6], bx
    jnz loc_1bd7_a264
    jmp loc_1bd7_a39b

loc_1bd7_a264:
    sub cx, cx

loc_1bd7_a266:
    mov [bp-c], cx
    sub dx, dx
    mov di, [bp-e]
    mov ax, 36ad
    mov ds, ax
    or di, di
    jle loc_1bd7_a2bf
    mov [bp-2], cx
    mov [bp-8], bx
    mov [bp-a], dx
    mov si, dx

loc_1bd7_a282:
    les bx, [bp+6]
    mov bl, es:[bx+si]
    sub bh, bh
    mov cl, 04
    shl bx, cl
    add bx, [bp-8]
    mov ax, 2c43
    mov es, ax
    mov al, es:[bx-6960]
    mov [bp-5], al
    mov al, [bp+c]
    and al, f0
    jz loc_1bd7_a2a8
    not byte ptr [bp-5]

loc_1bd7_a2a8:
    mov al, [bp-5]
    mov bx, [bp-c]
    add bx, si
    mov [bx-2aee], al
    inc si
    cmp si, di
    jl loc_1bd7_a282
    mov cx, [bp-2]
    mov bx, [bp-8]

loc_1bd7_a2bf:
    mov ax, 7fc1
    mov ds, ax
    add cx, 5a
    mov es, [6e38]
    inc bx
    cmp es:[0ca6], bx
    ja loc_1bd7_a266
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_a2d9:
    db 90  ; |.|

loc_1bd7_a2da:
    sub bx, bx
    cmp es:[0ca6], bx
    jnz loc_1bd7_a2e6
    jmp loc_1bd7_a39b

loc_1bd7_a2e6:
    mov ax, es:[0c6c]
    mov [bp-10], ax

loc_1bd7_a2ed:
    mov ax, es:[0c6c]
    mul bx
    mov cx, 005a
    mul cx
    mov [bp-c], ax
    mov word ptr [bp-a], 0000
    cmp word ptr [bp-e], 00
    jg loc_1bd7_a309
    jmp loc_1bd7_a390

loc_1bd7_a309:
    mov [bp-8], bx
    mov si, [bp-a]

loc_1bd7_a30f:
    mov cl, 04
    les bx, [bp+6]
    mov bl, es:[bx+si]
    sub bh, bh
    shl bx, cl
    add bx, [bp-8]
    mov es, [6e3a]
    mov al, es:[bx-6960]
    mov [bp-5], al
    mov ax, [bp-c]
    add ax, si
    mov [bp-2], ax
    mov word ptr [bp-4], 0000
    cmp word ptr [bp-10], 00
    jz loc_1bd7_a382
    mov [bp-a], si
    mov si, ax
    mov di, [bp-4]
    mov ax, 36ad
    mov ds, ax
    mov ax, 2c43
    mov es, ax

loc_1bd7_a34f:
    mov al, [bp-5]
    not al
    and [si-2aee], al
    mov al, [bp+c]
    sub ah, ah
    mov cx, di
    mov dx, 0001
    shl dx, cl
    test dx, ax
    jz loc_1bd7_a36f
    mov al, [bp-5]
    or [si-2aee], al

loc_1bd7_a36f:
    add si, 5a
    inc di
    cmp es:[0c6c], di
    ja loc_1bd7_a34f
    mov si, [bp-a]
    mov ax, 7fc1
    mov ds, ax

loc_1bd7_a382:
    inc si
    cmp [bp-e], si
    jg loc_1bd7_a30f
    mov bx, [bp-8]
    mov ax, 2c43
    mov es, ax

loc_1bd7_a390:
    inc bx
    cmp es:[0ca6], bx
    jbe loc_1bd7_a39b
    jmp loc_1bd7_a2ed

loc_1bd7_a39b:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_a3a1:
    db 90  ; |.|
