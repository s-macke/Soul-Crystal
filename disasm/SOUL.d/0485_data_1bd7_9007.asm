data_1bd7_9007:
    db 90  ; |.|

loc_1bd7_9008:
    mov si, [bp-4]
    mov [bp-16], di
    cmp [6eb4], si
    jnz loc_1bd7_9017
    jmp loc_1bd7_909e

loc_1bd7_9017:
    mov [6eb4], si
    mov ax, 0001
    push ax
    mov ax, 585e
    push ds
    push ax
    push word ptr [bp-14]
    push di
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jnz loc_1bd7_903e

loc_1bd7_9034:
    mov word ptr [bp-a], 0000
    mov [bp-16], di
    jmp loc_1bd7_909e

loc_1bd7_903e:
    push word ptr [bp-14]
    push di
    mov ax, 0040
    push ax
    mov cx, 0001
    push cx
    mov cx, 54b2
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0040
    jnz loc_1bd7_9034
    mov ax, 0001
    push ax
    mov ax, 5863
    push ds
    push ax
    push word ptr [bp-14]
    push di
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jz loc_1bd7_9034
    push word ptr [bp-14]
    push di
    mov ax, 0100
    push ax
    mov cx, 0004
    push cx
    mov cx, 1388
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0100
    jz loc_1bd7_909e
    mov word ptr [bp-a], 0000

loc_1bd7_909e:
    sub si, si
    mov bx, [bp+a]
    mov ds, [bp+c]
    mov ax, 2c43
    mov es, ax

loc_1bd7_90ab:
    mov al, es:[si+54b2]
    sub ah, ah
    cmp ax, [bx]
    jz loc_1bd7_90bc
    inc si
    cmp si, 40
    jb loc_1bd7_90ab

loc_1bd7_90bc:
    mov ax, 7fc1
    mov ds, ax
    mov di, [bp-a]
    cmp si, 40
    jnz loc_1bd7_90cb
    sub di, di

loc_1bd7_90cb:
    mov es, [6e26]
    shl si, 01
    shl si, 01
    mov ax, es:[si+1388]
    mov dx, es:[si+138a]
    mov [bp-12], ax
    mov [bp-10], dx
    mov ax, es:[si+1588]
    mov dx, es:[si+158a]
    mov [bp-e], ax
    mov [bp-c], dx
    lea ax, [bp-12]
    push ss
    push ax
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    lea ax, [bp-e]
    push ss
    push ax
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    mov ax, 0001
    push ax
    mov ax, 5868
    push ds
    push ax
    push word ptr [bp-14]
    push word ptr [bp-16]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jz loc_1bd7_914f
    mov [bp-a], di
    mov ax, 0001
    push ax
    push word ptr [bp-10]
    push word ptr [bp-12]
    push word ptr [bp-14]
    push word ptr [bp-16]
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    or ax, ax
    jz loc_1bd7_91a2

loc_1bd7_914f:
    sub si, si

loc_1bd7_9151:
    mov bx, 0540
    mov es, [6e24]
    mov [bp-1a], bx
    mov [bp-18], es
    cmp byte ptr es:[bx], 03
    jz loc_1bd7_916a
    cmp byte ptr es:[bx], 04
    jnz loc_1bd7_918f

loc_1bd7_916a:
    push word ptr [bp-14]
    push word ptr [bp-16]
    mov ax, 0030
    push ax
    mov cx, 0001
    push cx
    mov cx, 1358
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0030
    jz loc_1bd7_918f
    sub si, si

loc_1bd7_918f:
    cmp word ptr [bp-c], 00
    jnz loc_1bd7_919c
    cmp word ptr [bp-e], 3000
    jbe loc_1bd7_91a8

loc_1bd7_919c:
    mov si, 0201
    jmp loc_1bd7_91cc

data_1bd7_91a1:
    db 90  ; |.|

loc_1bd7_91a2:
    mov si, [bp-a]
    jmp loc_1bd7_9151

data_1bd7_91a7:
    db 90  ; |.|

loc_1bd7_91a8:
    push word ptr [bp-14]
    push word ptr [bp-16]
    push word ptr [bp-e]
    mov ax, 0001
    push ax
    mov ax, 23be
    mov cx, 2c43
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, [bp-e]
    jz loc_1bd7_91cc
    sub si, si

loc_1bd7_91cc:
    or si, si
    jnz loc_1bd7_91e6
    sub ax, ax
    mov es, [6e28]
    mov cx, 1600
    mov di, 0000
    repz stosw
    push ax
    push cs
    call sub_1bd7_9314
    add sp, 02

loc_1bd7_91e6:
    mov [bp-a], si
    or si, si
    jz loc_1bd7_91f0
    jmp loc_1bd7_92ea

loc_1bd7_91f0:
    mov ax, 0000
    mov cx, 5387
    push cx
    push ax
    mov ax, 23be
    mov cx, 2c43
    push cx
    push ax
    mov es, [6e24]
    push word ptr es:[0c88]
    push word ptr es:[0c86]
    nop
    push cs
    call sub_1bd7_d15e
    add sp, 0c
    les bx, [bp-1a]
    cmp byte ptr es:[bx], 03
    jz loc_1bd7_9228
    cmp byte ptr es:[bx], 04
    jz loc_1bd7_9228
    jmp loc_1bd7_92df

loc_1bd7_9228:
    mov di, 0004
    mov dx, 1366
    mov [bp-2], dx
    mov si, dx

loc_1bd7_9233:
    mov es, [6e2a]
    mov byte ptr es:[1789], 10
    mov byte ptr es:[1788], 00
    mov ax, di
    mov es:[178a], al
    mov es, [6e2c]
    lea bx, [si-2]
    mov al, es:[bx]
    mov cx, ax
    and al, 80
    cmp al, 01
    sbb al, al
    inc al
    and cl, 40
    cmp cl, 01
    sbb cl, cl
    inc cl
    shl cl, 01
    lea bx, [si-1]
    mov dl, es:[bx]
    mov bx, dx
    and dl, 40
    cmp dl, 01
    sbb dl, dl
    inc dl
    or cl, dl
    shl cl, 01
    mov dl, es:[si]
    mov [bp-1c], dx
    and dl, 40
    cmp dl, 01
    sbb dl, dl
    inc dl
    or cl, dl
    shl cl, 01
    or al, cl
    shl al, 01
    and bl, 80
    cmp bl, 01
    sbb cl, cl
    inc cl
    or al, cl
    shl al, 01
    mov cl, [bp-1c]
    and cl, 80
    cmp cl, 01
    sbb cl, cl
    inc cl
    or al, cl
    mov es, [6e2a]
    mov es:[178b], al
    mov ax, 1788
    push es
    push ax
    mov cx, 2c43
    push cx
    push ax
    mov ax, 0010
    push ax
    nop
    push cs
    call sub_1bd7_7456
    add sp, 0a
    inc di
    add si, 03
    cmp si, 138a
    jae loc_1bd7_92df
    jmp loc_1bd7_9233

loc_1bd7_92df:
    mov ax, 0001
    push ax
    push cs
    call sub_1bd7_9314
    add sp, 02

loc_1bd7_92ea:
    push word ptr [bp-14]
    push word ptr [bp-16]
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04
    jmp loc_1bd7_9305

loc_1bd7_92fa:
    sub ax, ax
    mov [6eb2], ax
    mov [6eb0], ax
    mov [6eb4], ax

loc_1bd7_9305:
    mov ax, [bp-a]
    les bx, [bp+6]
    mov es:[bx], ax
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
