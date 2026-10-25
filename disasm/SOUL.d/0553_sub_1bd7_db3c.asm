; ========================================
; New Subroutine: sub_1bd7_db3c
; ========================================
sub_1bd7_db3c:
    push bp
    mov bp, sp
    sub sp, 10
    push di
    push si
    mov word ptr [bp-6], 0000
    mov ax, 0014
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov di, ax
    mov [bp-e], dx
    or dx, ax
    jnz loc_1bd7_db66
    mov si, 0408
    jmp loc_1bd7_db9a

loc_1bd7_db66:
    push word ptr [bp-e]
    push di
    mov ax, 0280
    push ax
    mov cx, 0002
    push cx
    mov cx, 0768
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0280
    jnz loc_1bd7_db8a
    jmp loc_1bd7_dd44

loc_1bd7_db8a:
    mov si, 0408

loc_1bd7_db8d:
    mov ax, [bp-e]
    push ax
    push di
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_db9a:
    or si, si
    jnz loc_1bd7_dbaa
    nop
    push cs
    call sub_1bd7_a814
    or ax, ax
    jnz loc_1bd7_dbaa
    mov si, 0405

loc_1bd7_dbaa:
    or si, si
    jnz loc_1bd7_dc03
    mov [bp-a], si
    sub ax, ax
    mov es, [6e8e]  ; data_7fc1_6e8e word read
    mov cx, 0530
    mov di, 181e
    repz stosw
    add word ptr [bp-a], 0a60
    mov ax, 0007
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov di, ax
    mov [bp-e], dx
    or dx, ax
    jz loc_1bd7_dc00
    push word ptr [bp-e]
    push di
    mov ax, 0a60
    push ax
    mov cx, 0001
    push cx
    mov cx, 181e
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0a60
    jnz loc_1bd7_dc00
    jmp loc_1bd7_dd90

loc_1bd7_dc00:
    mov si, 0402

loc_1bd7_dc03:
    or si, si
    jnz loc_1bd7_dc36
    mov ax, 0001
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov di, ax
    mov [bp-e], dx
    or dx, ax
    jz loc_1bd7_dc33
    sub ax, ax
    push ax
    mov cx, [bp-e]
    push cx
    push di
    nop
    push cs
    call sub_1bd7_9a46
    add sp, 06
    or ax, ax
    jnz loc_1bd7_dc36

loc_1bd7_dc33:
    mov si, 0403

loc_1bd7_dc36:
    or si, si
    jnz loc_1bd7_dc6a
    mov ax, 0002
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov di, ax
    mov [bp-e], dx
    or dx, ax
    jz loc_1bd7_dc67
    mov ax, 0001
    push ax
    mov ax, [bp-e]
    push ax
    push di
    nop
    push cs
    call sub_1bd7_9a46
    add sp, 06
    or ax, ax
    jnz loc_1bd7_dc6a

loc_1bd7_dc67:
    mov si, 0404

loc_1bd7_dc6a:
    or si, si
    jnz loc_1bd7_dc7a
    nop
    push cs
    call sub_1bd7_b74a
    or ax, ax
    jnz loc_1bd7_dc7a
    mov si, 0407

loc_1bd7_dc7a:
    or si, si
    jnz loc_1bd7_dc94
    mov word ptr [bp-a], 0001
    sub ax, ax
    push ax
    push ax
    lea ax, [bp-a]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08

loc_1bd7_dc94:
    or si, si
    jnz loc_1bd7_dcb0
    mov word ptr [bp-c], 0001
    lea ax, [bp-c]
    push ss
    push ax
    sub ax, ax
    push ax
    push ax
    push ax
    push ax
    nop
    push cs
    call sub_1bd7_b268
    add sp, 0c

loc_1bd7_dcb0:
    or si, si
    jnz loc_1bd7_dd1b
    mov es, [6e88]
    mov al, es:[0540]
    sub ah, ah
    push ax
    nop
    push cs
    call sub_1bd7_cbee
    add sp, 02
    mov es, [6e88]
    mov al, es:[0540]
    sub ah, ah
    sub ax, 0003
    jl loc_1bd7_dd1b
    dec ax
    jg loc_1bd7_dd1b
    mov [bp-a], si
    mov [bp-6], si

loc_1bd7_dcdf:
    mov es, [6e8a]
    mov byte ptr es:[1789], 10
    mov byte ptr es:[1788], 00
    mov al, [bp-a]
    mov es:[178a], al
    mov byte ptr es:[178b], 00
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
    inc word ptr [bp-a]
    cmp word ptr [bp-a], 10
    jl loc_1bd7_dcdf

loc_1bd7_dd1b:
    or si, si
    jz loc_1bd7_dd22
    jmp loc_1bd7_de04

loc_1bd7_dd22:
    mov ax, 000e
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov di, ax
    mov [bp-e], dx
    or dx, ax
    jz loc_1bd7_dd3d
    jmp loc_1bd7_ddc2

loc_1bd7_dd3d:
    mov si, 0406
    jmp loc_1bd7_de04
