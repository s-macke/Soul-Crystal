data_1bd7_b3df:
    db 90  ; |.|

loc_1bd7_b3e0:
    mov word ptr [bp-12], 0000
    jmp loc_1bd7_b4fd

loc_1bd7_b3e8:
    mov es, [6e6a]
    mov bx, [bp-a]
    mov al, es:[bx-2bf4]
    sub ah, ah
    mov [bp-c], ax
    cmp ax, 0080
    jge loc_1bd7_b429
    push word ptr [bp+8]
    push word ptr [bp+6]
    inc ax
    mov [bp-e], ax
    push ax
    mov cx, 0001
    push cx
    add bx, d40c
    push es
    push bx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp [bp-e], ax
    jz loc_1bd7_b423
    jmp loc_1bd7_b532

loc_1bd7_b423:
    mov ax, [bp-e]
    add [bp-a], ax

loc_1bd7_b429:
    cmp word ptr [bp-c], 0080
    jle loc_1bd7_b48e
    mov ax, 0101
    sub ax, [bp-c]
    mov [bp-e], ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov ax, 0001
    push ax
    push ax
    mov cx, [bp-a]
    add cx, d40c
    mov dx, 36ad
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    dec ax
    jz loc_1bd7_b45e
    jmp loc_1bd7_b532

loc_1bd7_b45e:
    mov ax, [bp-a]
    mov [bp-10], ax
    jmp loc_1bd7_b47d

loc_1bd7_b466:
    mov es, [6e6a]
    mov bx, [bp-a]
    mov al, es:[bx-2bf4]
    mov bx, [bp-10]
    mov es:[bx-2bf4], al
    inc word ptr [bp-10]

loc_1bd7_b47d:
    mov ax, [bp-e]
    add ax, [bp-a]
    cmp ax, [bp-10]
    jg loc_1bd7_b466
    mov ax, [bp-e]
    add [bp-a], ax

loc_1bd7_b48e:
    mov es, [6e68]
    mov ax, [bp-a]
    cmp es:[0c6e], ax
    ja loc_1bd7_b50d

loc_1bd7_b49c:
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_b4a5
    jmp loc_1bd7_b742

loc_1bd7_b4a5:
    mov ax, 005a
    push ax
    mov ax, d40c
    mov cx, 36ad
    push cx
    push ax
    mov ax, [bp-12]
    mov cx, 0004
    cwd
    idiv cx
    mov ax, [bp-12]
    mov bx, dx
    cwd
    xor ax, dx
    sub ax, dx
    mov cx, 0002
    sar ax, cl
    xor ax, dx
    sub ax, dx
    mov cx, 005a
    imul cx
    mov cl, 05
    mov bh, bl
    sub bl, bl
    shl bx, cl
    add ax, bx
    mov es, [6e68]
    add ax, es:[0c68]
    mov dx, es:[0c6a]
    mov [bp-4], ax
    mov [bp-2], dx
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    inc word ptr [bp-12]

loc_1bd7_b4fd:
    mov ax, [bp+a]
    cmp [bp-12], ax
    jb loc_1bd7_b508
    jmp loc_1bd7_b742

loc_1bd7_b508:
    mov word ptr [bp-a], 0000

loc_1bd7_b50d:
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov ax, 0001
    push ax
    push ax
    mov cx, [bp-a]
    add cx, d40c
    mov dx, 36ad
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    dec ax
    jnz loc_1bd7_b532
    jmp loc_1bd7_b3e8

loc_1bd7_b532:
    mov word ptr [bp-6], 0000
    jmp loc_1bd7_b49c

loc_1bd7_b53a:
    mov word ptr [bp-12], 0000
    jmp loc_1bd7_b722

loc_1bd7_b542:
    mov es, [6e6a]  ; data_7fc1_6e6a word read
    mov bx, [bp-a]
    mov al, es:[bx-2bf4]
    sub ah, ah
    mov [bp-c], ax
    cmp ax, 0080
    jge loc_1bd7_b583
    push word ptr [bp+8]
    push word ptr [bp+6]
    inc ax
    mov [bp-e], ax
    push ax
    mov cx, 0001
    push cx
    add bx, d40c
    push es
    push bx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp [bp-e], ax
    jz loc_1bd7_b57d
    jmp loc_1bd7_b6d7

loc_1bd7_b57d:
    mov ax, [bp-e]
    add [bp-a], ax

loc_1bd7_b583:
    cmp word ptr [bp-c], 0080
    jle loc_1bd7_b5e8
    mov ax, 0101
    sub ax, [bp-c]
    mov [bp-e], ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov ax, 0001
    push ax
    push ax
    mov cx, [bp-a]
    add cx, d40c
    mov dx, 36ad
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    dec ax
    jz loc_1bd7_b5b8
    jmp loc_1bd7_b6d7

loc_1bd7_b5b8:
    mov ax, [bp-a]
    mov [bp-10], ax
    jmp loc_1bd7_b5d7

loc_1bd7_b5c0:
    mov es, [6e6a]  ; data_7fc1_6e6a word read
    mov bx, [bp-a]
    mov al, es:[bx-2bf4]
    mov bx, [bp-10]
    mov es:[bx-2bf4], al
    inc word ptr [bp-10]

loc_1bd7_b5d7:
    mov ax, [bp-e]
    add ax, [bp-a]
    cmp ax, [bp-10]
    jg loc_1bd7_b5c0
    mov ax, [bp-e]
    add [bp-a], ax

loc_1bd7_b5e8:
    mov es, [6e68]  ; data_7fc1_6e68 word read
    mov ax, [bp-a]
    cmp es:[0c6e], ax  ; data_2c43_0c6e word read
    jbe loc_1bd7_b5f9
    jmp loc_1bd7_b6b2

loc_1bd7_b5f9:
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_b60c

loc_1bd7_b5ff:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_b608
    jmp loc_1bd7_b6e0

loc_1bd7_b608:
    jmp loc_1bd7_b742

data_1bd7_b60b:
    db 90  ; |.|

loc_1bd7_b60c:
    mov ax, 0002
    push ax
    mov ax, 03c4
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov cl, [bp-8]
    mov ax, 0001
    shl ax, cl
    push ax
    mov ax, 03c5
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov es, [6e68]  ; data_7fc1_6e68 word read
    push word ptr es:[0c6e]  ; data_2c43_0c6e word read
    mov ax, d40c
    mov cx, 36ad
    push cx
    push ax
    push word ptr [bp-2]
    push word ptr [bp-4]
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    cmp word ptr [bp+c], 00
    jz loc_1bd7_b699
    mov es, [6e68]  ; data_7fc1_6e68 word read
    cmp byte ptr es:[0540], 04  ; data_2c43_0540 byte read
    jz loc_1bd7_b678
    cmp byte ptr es:[0540], 03
    jnz loc_1bd7_b699
    mov ax, [bp-12]
    inc ax
    mov cx, 0004
    cwd
    idiv cx
    or dx, dx
    jz loc_1bd7_b699

loc_1bd7_b678:
    push word ptr es:[0c6e]  ; data_2c43_0c6e word read
    mov ax, d40c
    mov cx, 36ad
    push cx
    push ax
    mov ax, es:[0c6e]  ; data_2c43_0c6e word read
    add ax, [bp-4]
    mov dx, [bp-2]
    push dx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a

loc_1bd7_b699:
    inc word ptr [bp-8]

loc_1bd7_b69c:
    mov es, [6e68]  ; data_7fc1_6e68 word read
    mov ax, [bp-8]
    cmp es:[0c6c], ax  ; data_2c43_0c6c word read
    ja loc_1bd7_b6ad
    jmp loc_1bd7_b5ff

loc_1bd7_b6ad:
    mov word ptr [bp-a], 0000

loc_1bd7_b6b2:
    push word ptr [bp+8]
    push word ptr [bp+6]
    mov ax, 0001
    push ax
    push ax
    mov cx, [bp-a]
    add cx, d40c
    mov dx, 36ad
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    dec ax
    jnz loc_1bd7_b6d7
    jmp loc_1bd7_b542

loc_1bd7_b6d7:
    mov word ptr [bp-6], 0000
    jmp loc_1bd7_b5f9

data_1bd7_b6df:
    db 90  ; |.|

loc_1bd7_b6e0:
    cmp word ptr [bp+c], 00
    jz loc_1bd7_b714
    mov es, [6e68]  ; data_7fc1_6e68 word read
    mov al, es:[0540]  ; data_2c43_0540 byte read
    sub ah, ah
    sub ax, 0003
    jz loc_1bd7_b6fa
    dec ax
    jz loc_1bd7_b708
    jmp loc_1bd7_b71f

loc_1bd7_b6fa:
    mov ax, [bp-12]
    inc ax
    mov cx, 0004
    cwd
    idiv cx
    or dx, dx
    jz loc_1bd7_b714

loc_1bd7_b708:
    mov es, [6e68]  ; data_7fc1_6e68 word read
    mov ax, es:[0c6e]  ; data_2c43_0c6e word read
    shl ax, 01
    jmp loc_1bd7_b71c

loc_1bd7_b714:
    mov es, [6e68]
    mov ax, es:[0c6e]

loc_1bd7_b71c:
    add [bp-4], ax

loc_1bd7_b71f:
    inc word ptr [bp-12]

loc_1bd7_b722:
    mov ax, [bp+a]
    cmp [bp-12], ax
    jae loc_1bd7_b742
    mov word ptr [bp-8], 0000
    jmp loc_1bd7_b69c

loc_1bd7_b732:
    dec ax
    jnz loc_1bd7_b738
    jmp loc_1bd7_b3e0

loc_1bd7_b738:
    dec ax
    dec ax
    jl loc_1bd7_b742
    dec ax
    jg loc_1bd7_b742
    jmp loc_1bd7_b53a

loc_1bd7_b742:
    mov ax, [bp-6]
    mov sp, bp
    pop bp
    retf

data_1bd7_b749:
    db 90  ; |.|
