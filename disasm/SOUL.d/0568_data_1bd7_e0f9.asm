data_1bd7_e0f9:
    db 90  ; |.|

loc_1bd7_e0fa:
    mov ax, 7fc1
    mov ds, ax
    mov di, bx
    inc di

loc_1bd7_e102:
    mov si, di
    mov word ptr [bp-4], 0000
    mov [bp-6], di

loc_1bd7_e10c:
    mov bx, si
    add bx, 0400
    mov es, [6e90]
    mov [bp-16], bx
    mov [bp-14], es
    mov byte ptr es:[bx], 5f
    mov al, 01
    push ax
    mov ax, 005a
    push ax
    push word ptr [bp-10]
    push word ptr [bp-12]
    nop
    push cs
    call sub_1bd7_a114
    add sp, 08
    mov ax, 0000
    mov cx, 5387
    push cx
    push ax
    sub ax, ax
    push ax
    push ax
    mov cx, 005a
    push cx
    mov dx, d512
    mov bx, 36ad
    push bx
    push dx
    mov es, [6e92]
    push word ptr es:[0ca6]
    push cx
    push ax
    push ax
    push cx
    nop
    push cs
    call sub_1bd7_d058
    add sp, 18
    mov ax, 0001
    push ax
    push ax
    mov es, [6e92]
    push word ptr es:[0ca6]
    push word ptr es:[0ca2]
    sub ax, ax
    push ax
    push ax
    mov cx, 005a
    push cx
    mov ax, es:[0ca6]
    mov es, [6e94]
    mul word ptr es:[dcd4]
    mov es, [6e92]
    add ax, es:[0ca0]
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_cccc
    add sp, 12
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_76ca
    add sp, 02
    mov [bp-1], al
    sub ah, ah
    sub ax, 0008
    jz loc_1bd7_e1e0
    sub ax, 0013
    jz loc_1bd7_e1ee
    cmp byte ptr [bp-1], 2f
    jbe loc_1bd7_e1f3
    cmp byte ptr [bp-1], 3a
    jae loc_1bd7_e1f3
    mov al, [bp-1]
    les bx, [bp-16]
    mov es:[bx], al
    mov ax, di
    inc si
    sub ax, si
    cmp ax, fffd
    jnz loc_1bd7_e1f3
    mov word ptr [bp-4], 0001
    jmp loc_1bd7_e1f3

data_1bd7_e1df:
    db 90  ; |.|

loc_1bd7_e1e0:
    les bx, [bp-16]
    mov byte ptr es:[bx], 20
    cmp di, si
    jae loc_1bd7_e1f3
    dec si
    jmp loc_1bd7_e1f3

loc_1bd7_e1ee:
    mov word ptr [bp-4], 0002

loc_1bd7_e1f3:
    cmp word ptr [bp-4], 00
    jnz loc_1bd7_e1fc
    jmp loc_1bd7_e10c

loc_1bd7_e1fc:
    mov ax, 2c43
    mov es, ax
    cmp word ptr [bp-4], 02
    jz loc_1bd7_e24c
    mov al, es:[di+402]
    sub ah, ah
    mov dl, es:[di+401]
    sub dh, dh
    mov bl, es:[di+400]
    sub bh, bh
    mov si, bx
    shl bx, 01
    shl bx, 01
    add bx, si
    shl bx, 01
    add bx, dx
    mov dx, bx
    shl bx, 01
    shl bx, 01
    add bx, dx
    shl bx, 01
    add bx, ax
    sub bx, 14d0
    mov cx, bx
    cmp bx, 01
    jae loc_1bd7_e242
    jmp loc_1bd7_e0b1

loc_1bd7_e242:
    cmp cx, 67
    jbe loc_1bd7_e24a
    jmp loc_1bd7_e0b1

loc_1bd7_e24a:
    jmp loc_1bd7_e24e

loc_1bd7_e24c:
    sub cx, cx

loc_1bd7_e24e:
    mov ax, cx
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
