data_1bd7_f649:
    db 90  ; |.|

loc_1bd7_f64a:
    mov ax, 7fc1
    mov ds, ax
    mov [bp-e], di
    mov word ptr [bp-c], 0001

loc_1bd7_f657:
    cmp word ptr [bp-c], 00
    jnz loc_1bd7_f660
    jmp loc_1bd7_f6e5

loc_1bd7_f660:
    cmp word ptr [bp-e], 0a
    jae loc_1bd7_f6b2
    mov [bp-8], di
    mov dx, ee06
    mov word ptr [bp-4], 5698
    mov ax, 000a
    sub ax, [bp-e]
    mov [bp-6], ax
    mov [bp-2], dx
    mov si, dx
    mov di, [bp-4]

loc_1bd7_f682:
    mov es, [6ea0]
    lea bx, [di-2]
    mov ax, es:[bx]
    mov es:[di], ax
    mov ax, 000c
    push ax
    mov cx, 36ad
    push cx
    push si
    lea dx, [si+c]
    push cx
    push dx
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    sub si, 0c
    dec di
    dec di
    dec word ptr [bp-6]
    jnz loc_1bd7_f682
    mov di, [bp-8]

loc_1bd7_f6b2:
    mov ax, [bp+6]
    mov es, [6ea0]
    mov cx, di
    shl di, 01
    mov es:[di+5684], ax
    mov ax, 000c
    push ax
    mov dx, 0020
    push dx
    mov dx, cx
    shl cx, 01
    add cx, dx
    shl cx, 01
    shl cx, 01
    add cx, ed9a
    mov dx, 36ad
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7648
    add sp, 08

loc_1bd7_f6e5:
    mov ax, 0019
    push ax
    push cs
    call sub_1bd7_f0f6
    add sp, 02
    or ax, ax
    jz loc_1bd7_f6f7
    jmp loc_1bd7_f803

loc_1bd7_f6f7:
    sub si, si
    mov di, 5684
    mov word ptr [bp-2], ed9a

loc_1bd7_f701:
    mov ax, 0016
    push ax
    mov cx, 0020
    push cx
    mov cx, 045c
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7648
    add sp, 08
    lea ax, [si+1]
    push ax
    mov cx, 65df
    push ds
    push cx
    mov cx, 045c
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7562
    add sp, 0a
    mov ax, 000c
    push ax
    mov cx, 36ad
    push cx
    push word ptr [bp-2]
    mov cx, 0460
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    mov es, [6ea0]
    push word ptr es:[di]
    mov ax, 65e5
    push ds
    push ax
    mov ax, 046d
    mov cx, 2c43
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7562
    add sp, 0a
    mov al, 09
    push ax
    mov ax, 0016
    push ax
    mov cx, 045c
    mov dx, 2c43
    push dx
    push cx
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
    mov cx, 0016
    push cx
    mov dx, d512
    mov bx, 36ad
    push bx
    push dx
    mov es, [6e96]
    push word ptr es:[0ca6]
    push cx
    push ax
    push ax
    mov dx, 005a
    push dx
    nop
    push cs
    call sub_1bd7_d058
    add sp, 18
    sub ax, ax
    push ax
    mov cx, 0001
    push cx
    mov es, [6e96]
    push word ptr es:[0ca6]
    mov dx, 0016
    push dx
    push ax
    push ax
    push dx
    mov ax, es:[0cb0]
    mul si
    add ax, es:[0cae]
    push ax
    push word ptr es:[0cac]
    nop
    push cs
    call sub_1bd7_cccc
    add sp, 12
    inc di
    inc di
    lea ax, [si+1]
    mov si, ax
    add word ptr [bp-2], 0c
    cmp word ptr [bp-2], ee12
    jae loc_1bd7_f7f5
    jmp loc_1bd7_f701

loc_1bd7_f7f5:
    mov ax, 000f
    push ax
    sub ax, ax
    push ax
    push cs
    call sub_1bd7_f334
    add sp, 04

loc_1bd7_f803:
    cmp word ptr [bp-c], 00
    jnz loc_1bd7_f828
    mov ax, 00b4
    push ax
    mov ax, 0007
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    sub ax, ax
    push ax
    mov ax, 000c
    push ax
    nop
    push cs
    call sub_1bd7_a954
    jmp loc_1bd7_f9e2

loc_1bd7_f828:
    mov ax, 000c
    push ax
    mov ax, 0020
    push ax
    mov ax, d400
    mov cx, 36ad
    mov [bp-12], ax
    mov [bp-10], cx
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7648
    add sp, 08
    mov word ptr [bp-c], 0000
    sub di, di

loc_1bd7_f84d:
    mov es, [6ea2]
    mov byte ptr es:[di-2c00], 5f
    mov al, 09
    push ax
    mov ax, 000c
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
    mov cx, 000c
    push cx
    mov dx, d512
    mov bx, 36ad
    push bx
    push dx
    mov es, [6e96]
    push word ptr es:[0ca6]
    push cx
    push ax
    push ax
    mov dx, 005a
    push dx
    nop
    push cs
    call sub_1bd7_d058
    add sp, 18
    sub ax, ax
    push ax
    mov cx, 0001
    push cx
    mov es, [6e96]
    push word ptr es:[0ca6]
    mov cx, 000c
    push cx
    push ax
    push ax
    push cx
    mov ax, es:[0cb0]
    mul word ptr [bp-e]
    add ax, es:[0cae]
    push ax
    mov ax, es:[0cac]
    add ax, 0004
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
    jz loc_1bd7_f904
    sub ax, 0005
    jz loc_1bd7_f916
    mov ax, 36ad
    mov ds, ax
    cmp byte ptr [bp-1], 1f
    jbe loc_1bd7_f93a
    cmp di, 0b
    jae loc_1bd7_f93a
    mov al, [bp-1]
    mov [di-2c00], al
    inc di
    jmp loc_1bd7_f93a

loc_1bd7_f904:
    mov ax, 36ad
    mov ds, ax
    mov byte ptr [di-2c00], 20
    or di, di
    jz loc_1bd7_f93a
    dec di
    jmp loc_1bd7_f93a

data_1bd7_f915:
    db 90  ; |.|

loc_1bd7_f916:
    sub bx, bx
    mov ax, 36ad
    mov ds, ax
    or di, di
    jz loc_1bd7_f93a

loc_1bd7_f921:
    cmp byte ptr [bx-2c00], 20
    jnz loc_1bd7_f930
    inc bx
    cmp bx, di
    jb loc_1bd7_f921
    jmp loc_1bd7_f93a

data_1bd7_f92f:
    db 90  ; |.|

loc_1bd7_f930:
    mov byte ptr [di-2c00], 20
    mov word ptr [bp-c], 0001

loc_1bd7_f93a:
    cmp word ptr [bp-c], 00
    jnz loc_1bd7_f948
    mov ax, 7fc1
    mov ds, ax
    jmp loc_1bd7_f84d

loc_1bd7_f948:
    mov ax, 7fc1
    mov ds, ax
    mov ax, 000c
    push ax
    push word ptr [bp-10]
    push word ptr [bp-12]
    mov cx, [bp-e]
    mov dx, cx
    shl cx, 01
    add cx, dx
    shl cx, 01
    shl cx, 01
    add cx, ed9a
    mov dx, 36ad
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    mov si, 5684

loc_1bd7_f978:
    mov ax, 2c43
    push ax
    push si
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc si
    inc si
    cmp si, 5698
    jb loc_1bd7_f978
    mov ax, 65ea
    push ds
    push ax
    mov ax, 65ed
    push ds
    push ax
    nop
    push cs
    call sub_1bd7_70fa
    add sp, 08
    push dx
    push ax
    mov cx, 000a
    push cx
    mov cx, 0002
    push cx
    mov cx, 5684
    mov bx, 2c43
    push bx
    push cx
    mov si, ax
    mov di, dx
    nop
    push cs
    call sub_1bd7_7288
    add sp, 0c
    push di
    push si
    mov ax, 0078
    push ax
    mov ax, 0001
    push ax
    mov ax, ed9a
    mov cx, 36ad
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7288
    add sp, 0c
    push di
    push si
    nop
    push cs
    call sub_1bd7_7000

loc_1bd7_f9e2:
    add sp, 04
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_f9eb:
    db 90  ; |.|
