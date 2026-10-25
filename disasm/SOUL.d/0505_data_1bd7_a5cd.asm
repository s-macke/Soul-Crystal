data_1bd7_a5cd:
    db 90  ; |.|

loc_1bd7_a5ce:
    mov ax, 0ca4
    mov cx, 2c43
    mov [bp-e], ax
    mov [bp-c], cx

loc_1bd7_a5da:
    sub bx, bx
    mov ax, 5387
    mov ds, ax

loc_1bd7_a5e1:
    mov byte ptr [bx], 00
    inc bx
    cmp bx, ff
    jb loc_1bd7_a5e1
    mov ax, 7fc1
    mov ds, ax
    mov word ptr [bp-a], 0000
    mov si, [bp+6]
    les bx, [bp-e]
    mov ax, es:[bx]
    dec ax
    jnz loc_1bd7_a605
    jmp loc_1bd7_a768

loc_1bd7_a605:
    cmp word ptr [bp+a], 00
    jnz loc_1bd7_a60e
    jmp loc_1bd7_a6c6

loc_1bd7_a60e:
    mov es, [6e38]
    mov ax, es:[0caa]
    mov [bp-10], ax
    cmp ax, [bp-a]
    ja loc_1bd7_a621
    jmp loc_1bd7_a6c6

loc_1bd7_a621:
    cmp word ptr [bp-a], 00
    jz loc_1bd7_a62c
    mov di, si
    jmp loc_1bd7_a6b6

loc_1bd7_a62c:
    mov es, [bp+8]
    cmp byte ptr es:[si], 00
    jnz loc_1bd7_a638
    jmp loc_1bd7_a768

loc_1bd7_a638:
    sub ax, ax
    mov [bp-4], ax
    mov si, ax
    lds di, [bp+6]
    mov ax, 458f
    mov es, ax

loc_1bd7_a647:
    mov al, [di]
    cmp es:[si-234a], al
    jz loc_1bd7_a660
    inc si
    cmp si, 1d
    jb loc_1bd7_a647
    mov ax, 7fc1
    mov ds, ax
    mov si, [bp-4]
    jmp loc_1bd7_a665

loc_1bd7_a660:
    mov ax, 7fc1
    mov ds, ax

loc_1bd7_a665:
    mov ax, 0000
    mov cx, 5387
    push cx
    push ax
    sub ax, ax
    push ax
    push ax
    mov es, [6e38]
    push word ptr es:[0ca2]
    mov es, [6e5a]
    shl si, 01
    shl si, 01
    mov cx, es:[si+12e4]
    add cx, 650e
    mov dx, 458f
    push dx
    push cx
    mov es, [6e38]
    mov ax, es:[0ca6]
    mul word ptr [bp-10]
    push ax
    push word ptr es:[0ca8]
    sub ax, ax
    push ax
    push ax
    push word ptr es:[0ca8]
    nop
    push cs
    call sub_1bd7_d058
    add sp, 18
    inc di
    mov ax, [bp+8]

loc_1bd7_a6b6:
    mov es, [6e38]
    mov si, es:[0ca2]
    sub si, es:[0ca8]
    jmp loc_1bd7_a6d6

loc_1bd7_a6c6:
    mov di, si
    mov es, [6e38]
    mov si, es:[0ca2]
    mov word ptr [bp+a], 0000

loc_1bd7_a6d6:
    push si
    push word ptr [bp+8]
    push di
    push cs
    call sub_1bd7_a004
    add sp, 06
    mov [bp-8], ax
    mov [bp-6], dx
    mov al, 02
    push ax
    push si
    mov ax, 648a
    mov cx, 458f
    push cx
    push ax
    push cs
    call sub_1bd7_a114
    add sp, 08
    mov ax, 0000
    mov cx, 5387
    push cx
    push ax
    mov es, [6e38]
    mov ax, es:[0ca6]
    mov cx, ax
    mul word ptr [bp-a]
    push ax
    mov ax, si
    sub si, es:[0ca2]
    neg si
    push si
    push word ptr es:[0ca2]
    mov dx, d512
    mov bx, 36ad
    push bx
    push dx
    push cx
    push ax
    sub ax, ax
    push ax
    push ax
    mov ax, 005a
    push ax
    nop
    push cs
    call sub_1bd7_d058
    add sp, 18
    les bx, [bp-8]
    mov di, bx
    mov [bp+8], es
    cmp byte ptr es:[bx], 00
    jnz loc_1bd7_a750
    mov [bp+6], di

loc_1bd7_a74b:
    mov si, [bp+6]
    jmp loc_1bd7_a768

loc_1bd7_a750:
    mov [bp+6], di
    les bx, [bp-e]
    mov ax, es:[bx]
    dec ax
    inc word ptr [bp-a]
    cmp ax, [bp-a]
    jbe loc_1bd7_a74b
    mov si, di
    jmp loc_1bd7_a605

data_1bd7_a767:
    db 90  ; |.|

loc_1bd7_a768:
    mov ax, 0001
    push ax
    push ax
    mov es, [6e38]
    mov ax, es:[0ca6]
    les bx, [bp-e]
    mul word ptr es:[bx]
    push ax
    mov es, [6e38]
    push word ptr es:[0ca2]
    sub ax, ax
    push ax
    push ax
    push word ptr es:[0ca2]
    push word ptr es:[0ca0]
    push word ptr es:[0c9e]
    nop
    push cs
    call sub_1bd7_cccc
    add sp, 12
    les bx, [bp-e]
    mov ax, es:[bx]
    sub ax, [bp-a]
    dec ax
    jnz loc_1bd7_a7e3
    mov es, [bp+8]
    cmp byte ptr es:[si], 00
    jz loc_1bd7_a7e3
    push word ptr [bp-a]
    mov ax, 0003
    push ax
    nop
    push cs
    call sub_1bd7_8c36
    add sp, 04
    mov ax, 0039
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1bd7_8c36
    add sp, 04
    sub ax, ax
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04

loc_1bd7_a7e3:
    mov es, [bp+8]
    cmp byte ptr es:[si], 00
    jz loc_1bd7_a7ef
    jmp loc_1bd7_a5da

loc_1bd7_a7ef:
    mov di, [bp-a]

loc_1bd7_a7f2:
    lea ax, [di+1]
    push ax
    mov cx, 0003
    push cx
    mov si, ax
    nop
    push cs
    call sub_1bd7_8c36
    add sp, 04
    mov es, [6e5c]
    mov es:[dcd4], si
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_a813:
    db 90  ; |.|
