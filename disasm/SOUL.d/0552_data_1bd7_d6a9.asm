data_1bd7_d6a9:
    db 90  ; |.|

loc_1bd7_d6aa:
    mov ax, [bp-c]
    push ax
    push di
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04
    jmp loc_1bd7_d680

data_1bd7_d6b9:
    db 90  ; |.|

loc_1bd7_d6ba:
    mov word ptr es:[0c68], 0000
    mov word ptr es:[0c6a], b800
    mov word ptr es:[0c70], 015c
    mov word ptr es:[0c82], 0017
    mov word ptr es:[0c84], 000c
    mov word ptr es:[0c86], 002c
    mov word ptr es:[0c88], 0080
    mov ax, 0001
    mov es:[0c6c], ax
    mov es:[0c8a], ax
    mov word ptr es:[0c8c], 00dd
    mov word ptr es:[0c90], 0094
    mov word ptr es:[0c94], 0049
    mov word ptr es:[0c96], 001a
    mov word ptr es:[0c98], 009e
    mov word ptr es:[0c9a], 0026
    mov word ptr es:[0c9c], 0038
    sub ax, ax
    mov es:[0c72], ax
    mov es:[0c74], ax
    mov es:[0c76], ax
    mov es:[0c78], ax
    mov es:[0c7a], ax
    mov es:[0c7c], ax
    mov es:[0c7e], ax
    mov es:[0c80], ax
    mov es:[0c8e], ax
    mov es:[0c9e], ax
    mov word ptr es:[0ca0], 00de
    mov ax, 005a
    mov es:[0c6e], ax
    mov es:[0c92], ax
    mov es:[0ca2], ax
    mov word ptr es:[0ca4], 0009
    mov word ptr es:[0ca6], 000e
    mov word ptr es:[0ca8], 0008
    mov word ptr es:[0caa], 0004
    mov word ptr es:[0cac], 0022
    mov word ptr es:[0cae], 008a
    mov word ptr es:[0cb0], 0011
    mov word ptr es:[0cb2], 0135
    mov word ptr es:[0cb4], 00ae
    jmp loc_1bd7_d983

data_1bd7_d7a9:
    db 90  ; |.|

loc_1bd7_d7aa:
    mov word ptr es:[0c68], 0000
    mov word ptr es:[0c6a], a000
    mov word ptr es:[0c70], 00c8
    mov word ptr es:[0c7a], 0020
    mov ax, 009a
    mov es:[0c74], ax
    mov es:[0c7c], ax
    mov ax, 0058
    mov es:[0c78], ax
    mov es:[0c80], ax
    mov ax, 0012
    mov es:[0c76], ax
    mov es:[0c82], ax
    mov ax, 002c
    mov es:[0c7e], ax
    mov es:[0c86], ax
    mov word ptr es:[0c8a], 0002
    mov word ptr es:[0c90], 009c
    mov ax, 0040
    mov es:[0c88], ax
    mov es:[0c94], ax
    mov word ptr es:[0c96], 0015
    mov word ptr es:[0c98], 009e
    mov word ptr es:[0c9a], 0026
    mov word ptr es:[0c9c], 0038
    sub ax, ax
    mov es:[0c8e], ax
    mov es:[0c9e], ax
    mov ax, 00e0
    mov es:[0c8c], ax
    mov es:[0ca0], ax
    mov ax, 0050
    mov es:[0c6e], ax
    mov es:[0c92], ax
    mov es:[0ca2], ax
    mov word ptr es:[0ca4], 0009
    mov ax, 000e
    mov es:[0c84], ax
    mov es:[0ca6], ax
    mov ax, 0008
    mov es:[0c72], ax
    mov es:[0ca8], ax
    mov ax, 0004
    mov es:[0c6c], ax
    mov es:[0caa], ax
    mov word ptr es:[0cac], 001d
    mov word ptr es:[0cae], 0090
    mov word ptr es:[0cb0], 0011
    mov word ptr es:[0cb2], 012c
    mov word ptr es:[0cb4], 00af
    jmp loc_1bd7_d983

data_1bd7_d899:
    db 90  ; |.|

loc_1bd7_d89a:
    mov word ptr es:[0c68], 0000  ; data_2c43_0c68 word write
    mov word ptr es:[0c6a], a000  ; data_2c43_0c6a word write
    mov word ptr es:[0c70], 00c8  ; data_2c43_0c70 word write
    mov word ptr es:[0c7a], 0020  ; data_2c43_0c7a word write
    mov ax, 0058
    mov es:[0c78], ax  ; data_2c43_0c78 word write
    mov es:[0c80], ax  ; data_2c43_0c80 word write
    mov ax, 0012
    mov es:[0c76], ax  ; data_2c43_0c76 word write
    mov es:[0c82], ax  ; data_2c43_0c82 word write
    mov ax, 002c
    mov es:[0c7e], ax  ; data_2c43_0c7e word write
    mov es:[0c86], ax  ; data_2c43_0c86 word write
    mov word ptr es:[0c8a], 0002  ; data_2c43_0c8a word write
    mov word ptr es:[0c90], 00ba  ; data_2c43_0c90 word write
    mov word ptr es:[0c94], 0060  ; data_2c43_0c94 word write
    mov word ptr es:[0c96], 0015  ; data_2c43_0c96 word write
    mov ax, 00d8
    mov es:[0c74], ax  ; data_2c43_0c74 word write
    mov es:[0c7c], ax  ; data_2c43_0c7c word write
    mov es:[0c98], ax  ; data_2c43_0c98 word write
    mov word ptr es:[0c9a], 0026  ; data_2c43_0c9a word write
    mov ax, 0040
    mov es:[0c88], ax  ; data_2c43_0c88 word write
    mov es:[0c9c], ax  ; data_2c43_0c9c word write
    sub ax, ax
    mov es:[0c8e], ax  ; data_2c43_0c8e word write
    mov es:[0c9e], ax  ; data_2c43_0c9e word write
    mov ax, 0120
    mov es:[0c8c], ax  ; data_2c43_0c8c word write
    mov es:[0ca0], ax  ; data_2c43_0ca0 word write
    mov ax, 0050
    mov es:[0c6e], ax  ; data_2c43_0c6e word write
    mov es:[0c92], ax  ; data_2c43_0c92 word write
    mov es:[0ca2], ax  ; data_2c43_0ca2 word write
    mov word ptr es:[0ca4], 000c  ; data_2c43_0ca4 word write
    mov ax, 0010
    mov es:[0c84], ax  ; data_2c43_0c84 word write
    mov es:[0ca6], ax  ; data_2c43_0ca6 word write
    mov ax, 0008
    mov es:[0c72], ax  ; data_2c43_0c72 word write
    mov es:[0ca8], ax  ; data_2c43_0ca8 word write
    mov ax, 0004
    mov es:[0c6c], ax  ; data_2c43_0c6c word write
    mov es:[0caa], ax  ; data_2c43_0caa word write
    mov word ptr es:[0cac], 001d  ; data_2c43_0cac word write
    mov word ptr es:[0cae], 00cc  ; data_2c43_0cae word write
    mov word ptr es:[0cb0], 0013  ; data_2c43_0cb0 word write
    mov word ptr es:[0cb2], 0167  ; data_2c43_0cb2 word write
    mov word ptr es:[0cb4], 00f0  ; data_2c43_0cb4 word write

loc_1bd7_d983:
    mov es, [bp+8]
    cmp word ptr es:[si], 00
    jz loc_1bd7_d98f
    jmp loc_1bd7_da43

loc_1bd7_d98f:
    mov es, [6e88]  ; data_7fc1_6e88 word read
    mov al, es:[0540]  ; data_2c43_0540 byte read
    cmp al, 03
    jz loc_1bd7_d9a2
    cmp al, 04
    jz loc_1bd7_d9a2
    jmp loc_1bd7_da43

loc_1bd7_d9a2:
    sub di, di
    mov si, di

loc_1bd7_d9a6:
    mov al, 10
    mov es, [6e8a]  ; data_7fc1_6e8a word read
    mov es:[1789], al  ; data_2c43_1789 byte write
    mov es:[1788], al  ; data_2c43_1788 byte write
    mov es:[178a], si  ; data_2c43_178a word write
    mov ax, si
    and ax, 0001
    cmp ax, 0001
    sbb al, al
    inc al
    shl al, 01
    mov cx, si
    and cx, 08
    cmp cx, 01
    sbb cl, cl
    inc cl
    add al, cl
    mov cl, 15
    mul cl
    mov es:[178c], al  ; data_2c43_178c byte write
    mov ax, si
    and ax, 0002
    cmp ax, 0001
    sbb al, al
    inc al
    shl al, 01
    mov dx, si
    and dx, 10
    cmp dx, 01
    sbb dl, dl
    inc dl
    add al, dl
    mul cl
    mov es:[178d], al  ; data_2c43_178d byte write
    mov ax, si
    and ax, 0004
    cmp ax, 0001
    sbb al, al
    inc al
    shl al, 01
    mov dx, si
    and dx, 20
    cmp dx, 01
    sbb dl, dl
    inc dl
    add al, dl
    mul cl
    mov es:[178f], al  ; data_2c43_178f byte write
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
    inc si
    cmp si, 40
    jge loc_1bd7_da40
    jmp loc_1bd7_d9a6

loc_1bd7_da40:
    mov si, [bp+6]

loc_1bd7_da43:
    mov es, [bp+8]
    cmp word ptr es:[si], 00
    jnz loc_1bd7_da5d
    nop
    push cs
    call sub_1bd7_8e98
    or ax, ax
    jnz loc_1bd7_da5d
    mov es, [bp+8]
    mov word ptr es:[si], 0003

loc_1bd7_da5d:
    mov es, [bp+8]
    cmp word ptr es:[si], 00
    jz loc_1bd7_da69
    jmp loc_1bd7_db0c

loc_1bd7_da69:
    sub ax, ax
    mov es, [6e8c]  ; data_7fc1_6e8c word read
    mov cx, 0800
    mov di, 96a0
    repz stosw
    mov es, [6e88]  ; data_7fc1_6e88 word read
    cmp byte ptr es:[0540], 02  ; data_2c43_0540 byte read
    jnz loc_1bd7_da88
    mov ax, 0008
    jmp loc_1bd7_da8b

loc_1bd7_da88:
    mov ax, 000e

loc_1bd7_da8b:
    mov [bp-6], ax
    mov ax, 000d
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov [bp-e], ax
    mov [bp-c], dx
    or dx, ax
    jz loc_1bd7_daf6
    sub ax, ax
    push ax
    mov cx, 0008
    sub dx, dx
    push dx
    push cx
    push word ptr [bp-c]
    push word ptr [bp-e]
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    or ax, ax
    jnz loc_1bd7_daf6
    mov dx, 96a0
    mov si, dx
    mov di, [bp-6]

loc_1bd7_dacb:
    push word ptr [bp-c]
    push word ptr [bp-e]
    push di
    mov ax, 0001
    push ax
    mov ax, 2c43
    push ax
    push si
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, di
    jnz loc_1bd7_daf0
    add si, 10
    cmp si, a6a0
    jb loc_1bd7_dacb

loc_1bd7_daf0:
    mov si, [bp+6]
    jmp loc_1bd7_dafe

data_1bd7_daf5:
    db 90  ; |.|

loc_1bd7_daf6:
    mov es, [bp+8]
    mov word ptr es:[si], 0002

loc_1bd7_dafe:
    push word ptr [bp-c]
    push word ptr [bp-e]
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_db0c:
    mov es, [bp+8]
    cmp word ptr es:[si], 00
    jnz loc_1bd7_db21
    sub ax, ax
    push ax
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04

loc_1bd7_db21:
    mov es, [bp+8]
    cmp word ptr es:[si], 00
    jnz loc_1bd7_db36
    sub ax, ax
    push ax
    push ax
    nop
    push cs
    call sub_1bd7_e70a
    add sp, 04

loc_1bd7_db36:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
