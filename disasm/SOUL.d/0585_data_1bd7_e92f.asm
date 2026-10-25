data_1bd7_e92f:
    db 90  ; |.|

loc_1bd7_e930:
    mov ax, 000f
    push ax
    sub ax, ax
    push ax
    push cs
    call sub_1bd7_f334
    add sp, 04
    mov ax, 0036
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
    add sp, 04
    or ax, ax
    jnz loc_1bd7_e97b
    inc word ptr [bp-14]

loc_1bd7_e964:
    cmp word ptr [bp-14], 02
    jae loc_1bd7_e97b
    push word ptr [bp-14]
    push cs
    call sub_1bd7_f0f6
    add sp, 02
    mov [bp-6], ax
    or ax, ax
    jz loc_1bd7_e930

loc_1bd7_e97b:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_e984
    jmp loc_1bd7_eabe

loc_1bd7_e984:
    mov word ptr [bp-18], 0000

loc_1bd7_e989:
    mov ax, 0005
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1bd7_e70a
    add sp, 04
    mov ax, 0002
    push ax
    push cs
    call sub_1bd7_f0f6
    add sp, 02
    mov [bp-6], ax
    or ax, ax
    jnz loc_1bd7_e9e1
    mov ax, 000f
    push ax
    sub ax, ax
    push ax
    push cs
    call sub_1bd7_f334
    add sp, 04
    mov ax, 005a
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
    add sp, 04
    or ax, ax
    jz loc_1bd7_e9e1
    mov word ptr [bp-18], 0001

loc_1bd7_e9e1:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_e9ea
    jmp loc_1bd7_ea94

loc_1bd7_e9ea:
    cmp word ptr [bp-18], 00
    jz loc_1bd7_e9f3
    jmp loc_1bd7_ea94

loc_1bd7_e9f3:
    mov word ptr [bp-14], 0003
    jmp loc_1bd7_ea68

loc_1bd7_e9fa:
    mov ax, 0006
    push ax
    mov ax, 0004
    push ax
    push cs
    call sub_1bd7_f334
    add sp, 04
    mov ax, 0012
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
    add sp, 04
    or ax, ax
    jz loc_1bd7_ea34

loc_1bd7_ea2c:
    mov word ptr [bp-18], 0001
    jmp loc_1bd7_ea94

data_1bd7_ea33:
    db 90  ; |.|

loc_1bd7_ea34:
    mov ax, 0003
    push ax
    sub ax, ax
    push ax
    push cs
    call sub_1bd7_f334
    add sp, 04
    mov ax, 0036
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
    add sp, 04
    or ax, ax
    jnz loc_1bd7_ea2c

loc_1bd7_ea65:
    inc word ptr [bp-14]

loc_1bd7_ea68:
    cmp word ptr [bp-14], 12
    jae loc_1bd7_ea94
    cmp word ptr [bp-14], 11
    jnz loc_1bd7_ea80
    mov es, [6e96]
    cmp byte ptr es:[0540], 01
    jz loc_1bd7_ea65

loc_1bd7_ea80:
    push word ptr [bp-14]
    push cs
    call sub_1bd7_f0f6
    add sp, 02
    mov [bp-6], ax
    or ax, ax
    jnz loc_1bd7_ea94
    jmp loc_1bd7_e9fa

loc_1bd7_ea94:
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_eada
    cmp word ptr [bp-18], 00
    jnz loc_1bd7_eada
    mov es, [6e96]
    cmp byte ptr es:[0540], 01
    jz loc_1bd7_eada
    mov ax, 0012
    push ax
    push cs
    call sub_1bd7_f0f6
    add sp, 02
    mov [bp-6], ax
    or ax, ax
    jz loc_1bd7_eacc

loc_1bd7_eabe:
    mov es, [6e96]  ; data_7fc1_6e96 word read
    mov al, es:[0540]  ; data_2c43_0540 byte read
    sub ah, ah
    jmp loc_1bd7_f0a2

data_1bd7_eacb:
    db 90  ; |.|

loc_1bd7_eacc:
    mov ax, 000f
    push ax
    sub ax, ax
    push ax
    push cs
    call sub_1bd7_f334
    add sp, 04

loc_1bd7_eada:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_eae3
    jmp loc_1bd7_efbf

loc_1bd7_eae3:
    cmp word ptr [bp-18], 00
    jz loc_1bd7_eaec
    jmp loc_1bd7_efbf

loc_1bd7_eaec:
    mov es, [6e96]
    cmp byte ptr es:[0540], 01
    jnz loc_1bd7_eafb
    jmp loc_1bd7_efbf

loc_1bd7_eafb:
    mov ax, 0019
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov [bp-1e], ax
    mov [bp-1c], dx
    or dx, ax
    jnz loc_1bd7_eb1c
    mov word ptr [bp-6], 0506
    jmp loc_1bd7_efbf

loc_1bd7_eb1c:
    mov ax, 001a
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov [bp-4], ax
    mov [bp-2], dx
    or dx, ax
    jnz loc_1bd7_eb3e
    mov word ptr [bp-6], 0508
    jmp loc_1bd7_efb1

data_1bd7_eb3d:
    db 90  ; |.|

loc_1bd7_eb3e:
    mov word ptr [bp-14], 0000
    jmp loc_1bd7_ef56

loc_1bd7_eb46:
    sub ax, ax
    push ax
    mov ax, [bp-14]
    add ax, 0085
    shl ax, 01
    shl ax, 01
    sub dx, dx
    push dx
    push ax
    push word ptr [bp-2]
    push word ptr [bp-4]
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-2]
    push word ptr [bp-4]
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-22]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jz loc_1bd7_eb88
    jmp loc_1bd7_ef9e

loc_1bd7_eb88:
    lea ax, [bp-e]
    push ss
    push ax
    mov cx, 0004
    push cx
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    lea ax, [bp-22]
    push ss
    push ax
    mov cx, 0004
    push cx
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    sub ax, ax
    push ax
    mov ax, [bp-e]
    mov dx, [bp-c]
    add ax, 041c
    adc dx, 00
    push dx
    push ax
    push word ptr [bp-2]
    push word ptr [bp-4]
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-2]
    push word ptr [bp-4]
    push word ptr [bp-22]
    mov ax, 0001
    push ax
    push word ptr [bp-26]
    push word ptr [bp-28]
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, [bp-22]
    jz loc_1bd7_ebec
    jmp loc_1bd7_ef9e

loc_1bd7_ebec:
    mov ax, 0000
    mov cx, 5387
    push cx
    push ax
    push word ptr [bp-26]
    push word ptr [bp-28]
    mov es, [6e96]
    push word ptr es:[0c80]
    push word ptr es:[0c7e]
    nop
    push cs
    call sub_1bd7_d15e
    add sp, 0c
    mov es, [6e96]
    push word ptr es:[0c80]
    push word ptr es:[0c7e]
    push word ptr es:[0c7e]
    push word ptr es:[0c7c]
    push word ptr es:[0c7a]
    nop
    push cs
    call sub_1bd7_d33e
    add sp, 0a
    cmp word ptr [bp-6], 00
    jz loc_1bd7_ec3e
    jmp loc_1bd7_ed06

loc_1bd7_ec3e:
    sub ax, ax
    push ax
    mov ax, [bp-14]
    add ax, 0005
    shl ax, 01
    shl ax, 01
    sub dx, dx
    push dx
    push ax
    push word ptr [bp-1c]
    push word ptr [bp-1e]
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-1c]
    push word ptr [bp-1e]
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-e]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jz loc_1bd7_ec86

loc_1bd7_ec7d:
    mov word ptr [bp-6], 0507
    jmp loc_1bd7_efa3

data_1bd7_ec85:
    db 90  ; |.|

loc_1bd7_ec86:
    sub ax, ax
    push ax
    mov ax, [bp-14]
    add ax, 0085
    shl ax, 01
    shl ax, 01
    sub dx, dx
    push dx
    push ax
    push word ptr [bp-1c]
    push word ptr [bp-1e]
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-1c]
    push word ptr [bp-1e]
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-22]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jnz loc_1bd7_ec7d
    lea ax, [bp-e]
    push ss
    push ax
    mov cx, 0004
    push cx
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    lea ax, [bp-22]
    push ss
    push ax
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    sub ax, ax
    push ax
    mov ax, [bp-e]
    mov dx, [bp-c]
    add ax, 041c
    adc dx, 00
    push dx
    push ax
    push word ptr [bp-1c]
    push word ptr [bp-1e]
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a

loc_1bd7_ed06:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_ed0f
    jmp loc_1bd7_ede1

loc_1bd7_ed0f:
    push word ptr [bp-1c]
    push word ptr [bp-1e]
    mov ax, 0200
    push ax
    mov cx, 0001
    push cx
    mov cx, 1388
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0200
    jz loc_1bd7_ed35
    jmp loc_1bd7_ec7d

loc_1bd7_ed35:
    mov word ptr [bp-16], 0000

loc_1bd7_ed3a:
    mov ax, [bp-16]
    shl ax, 01
    shl ax, 01
    add ax, 1388
    mov cx, 2c43
    push cx
    push ax
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc word ptr [bp-16]
    cmp word ptr [bp-16], 0080
    jb loc_1bd7_ed3a
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_ede1
    push word ptr [bp-1c]
    push word ptr [bp-1e]
    mov ax, 0200
    push ax
    mov cx, 0001
    push cx
    mov cx, 0ee4
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0200
    jz loc_1bd7_ed8b
    jmp loc_1bd7_ec7d

loc_1bd7_ed8b:
    mov word ptr [bp-16], 0000

loc_1bd7_ed90:
    mov ax, [bp-16]
    shl ax, 01
    shl ax, 01
    add ax, 0ee4
    mov cx, 2c43
    push cx
    push ax
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    inc word ptr [bp-16]
    cmp word ptr [bp-16], 0080
    jb loc_1bd7_ed90
    push word ptr [bp-1c]
    push word ptr [bp-1e]
    push word ptr [bp-22]
    mov ax, 0001
    push ax
    push word ptr [bp-26]
    push word ptr [bp-28]
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, [bp-22]
    jz loc_1bd7_edd8
    jmp loc_1bd7_ec7d

loc_1bd7_edd8:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_ede1
    jmp loc_1bd7_efa3

loc_1bd7_ede1:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_edea
    jmp loc_1bd7_ef47

loc_1bd7_edea:
    mov ax, 2000
    push ax
    sub ax, ax
    push ax
    push word ptr [bp-8]
    push word ptr [bp-a]
    nop
    push cs
    call sub_1bd7_7648
    add sp, 08
    mov es, [6e96]
    mov ax, es:[0c6c]
    mul word ptr es:[0c76]
    mul word ptr es:[0c78]
    mov [bp-24], ax
    mov word ptr [bp-16], 0000
    jmp loc_1bd7_ef26

loc_1bd7_ee1c:
    mov ax, 0001
    push ax
    mov ax, 0007
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    mov es, [6e98]
    mov bx, [bp-16]
    shl bx, 01
    shl bx, 01
    push word ptr es:[bx+ee4]
    mov es, [6e9a]
    mov ax, es:[bx+1388]
    add ax, [bp-28]
    mov dx, [bp-26]
    push dx
    push ax
    mov ax, 23be
    mov cx, 2c43
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    push word ptr [bp-10]
    push word ptr [bp-12]
    mov ax, 23be
    mov cx, 2c43
    push cx
    push ax
    push word ptr [bp-24]
    nop
    push cs
    call sub_1bd7_d284
    add sp, 0a
    mov word ptr [bp-1a], 0000
    jmp loc_1bd7_ee9a

data_1bd7_ee7d:
    db 90  ; |.|

loc_1bd7_ee7e:
    les bx, [bp-12]
    mov si, ax
    mov cl, es:[bx+si]
    les bx, [bp-a]
    mov di, ax
    xor cl, es:[bx+di]
    mov es, [6e9c]
    mov es:[si], cl
    inc word ptr [bp-1a]

loc_1bd7_ee9a:
    mov ax, [bp-1a]
    cmp [bp-24], ax
    ja loc_1bd7_ee7e
    mov es, [6e96]
    push word ptr es:[0c78]
    push word ptr es:[0c76]
    push word ptr es:[0c76]
    push word ptr es:[0c74]
    push word ptr es:[0c72]
    nop
    push cs
    call sub_1bd7_d33e
    add sp, 0a
    push word ptr [bp-24]
    mov ax, 0000
    mov cx, 5387
    push cx
    push ax
    push word ptr [bp-8]
    push word ptr [bp-a]
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    sub ax, ax
    push ax
    mov ax, 000c
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    or ax, ax
    jz loc_1bd7_eefa

loc_1bd7_eef3:
    mov word ptr [bp-18], 0001
    jmp loc_1bd7_ef47

loc_1bd7_eefa:
    cmp word ptr [bp-16], 00
    jnz loc_1bd7_ef23
    mov ax, 0024
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
    add sp, 04
    or ax, ax
    jnz loc_1bd7_eef3

loc_1bd7_ef23:
    inc word ptr [bp-16]

loc_1bd7_ef26:
    cmp word ptr [bp-16], 0080
    jae loc_1bd7_ef47
    mov es, [6e98]
    mov bx, [bp-16]
    shl bx, 01
    shl bx, 01
    mov ax, es:[bx+ee6]
    or ax, es:[bx+ee4]
    jz loc_1bd7_ef47
    jmp loc_1bd7_ee1c

loc_1bd7_ef47:
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_efa3
    cmp word ptr [bp-18], 00
    jnz loc_1bd7_efa3
    inc word ptr [bp-14]

loc_1bd7_ef56:
    cmp word ptr [bp-14], 0c
    jae loc_1bd7_efa3
    sub ax, ax
    push ax
    mov ax, [bp-14]
    add ax, 0005
    shl ax, 01
    shl ax, 01
    sub dx, dx
    push dx
    push ax
    push word ptr [bp-2]
    push word ptr [bp-4]
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-2]
    push word ptr [bp-4]
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-e]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jnz loc_1bd7_ef9e
    jmp loc_1bd7_eb46

loc_1bd7_ef9e:
    mov word ptr [bp-6], 0509

loc_1bd7_efa3:
    push word ptr [bp-2]
    push word ptr [bp-4]
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_efb1:
    push word ptr [bp-1c]
    push word ptr [bp-1e]
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_efbf:
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_f02a
    cmp word ptr [bp-18], 00
    jnz loc_1bd7_f02a
    mov word ptr [bp-14], 0013
    jmp loc_1bd7_f013

loc_1bd7_efd2:
    mov ax, 000f
    push ax
    sub ax, ax
    push ax
    push cs
    call sub_1bd7_f334
    add sp, 04
    mov ax, 0480
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
    add sp, 04
    or ax, ax
    jz loc_1bd7_f010
    cmp word ptr [bp-14], 16
    jnz loc_1bd7_f010
    mov word ptr [bp-18], 0001
    jmp loc_1bd7_f02a

loc_1bd7_f010:
    inc word ptr [bp-14]

loc_1bd7_f013:
    cmp word ptr [bp-14], 17
    jae loc_1bd7_f02a
    push word ptr [bp-14]
    push cs
    call sub_1bd7_f0f6
    add sp, 02
    mov [bp-6], ax
    or ax, ax
    jz loc_1bd7_efd2

loc_1bd7_f02a:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_f033
    jmp loc_1bd7_eabe

loc_1bd7_f033:
    cmp word ptr [bp-18], 00
    jnz loc_1bd7_f03c
    jmp loc_1bd7_e989

loc_1bd7_f03c:
    jmp loc_1bd7_eabe

data_1bd7_f03f:
    db 90  ; |.|

loc_1bd7_f040:
    mov ax, 0082
    push ax
    mov ax, 03b8

loc_1bd7_f047:
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    jmp loc_1bd7_f0ac

loc_1bd7_f052:
    mov ax, 03da
    push ax
    nop
    push cs
    call sub_1bd7_75ce
    add sp, 02
    mov word ptr [bp-14], 0000

loc_1bd7_f063:
    push word ptr [bp-14]
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    sub ax, ax
    push ax
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    inc word ptr [bp-14]
    cmp word ptr [bp-14], 10
    jb loc_1bd7_f063
    mov ax, 0020
    push ax
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    sub ax, ax
    push ax
    mov ax, 03c0
    jmp loc_1bd7_f047

loc_1bd7_f0a2:
    dec ax
    jz loc_1bd7_f040
    dec ax
    dec ax
    jl loc_1bd7_f0ac
    dec ax
    jle loc_1bd7_f052

loc_1bd7_f0ac:
    mov ax, [bp-6]
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_f0b5:
    db 90  ; |.|
