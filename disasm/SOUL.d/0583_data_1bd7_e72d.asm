data_1bd7_e72d:
    db 90  ; |.|

loc_1bd7_e72e:
    mov ax, 0010
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov si, ax
    mov [bp-c], dx
    or dx, ax
    jnz loc_1bd7_e749
    jmp loc_1bd7_e8ca

loc_1bd7_e749:
    mov di, [bp+8]
    mov ax, [bp-c]
    push ax
    push si
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04
    cmp [6ecc], di  ; 7fc1:6ecc word read
    jnz loc_1bd7_e762
    jmp loc_1bd7_e8ca

loc_1bd7_e762:
    cmp word ptr [6ecc], 00  ; 7fc1:6ecc word read
    jz loc_1bd7_e779
    nop
    push cs
    call sub_1bd7_e6c9
    nop
    push cs
    call sub_1bd7_e60b
    mov word ptr [6ecc], 0000

loc_1bd7_e779:
    or di, di
    jnz loc_1bd7_e780
    jmp loc_1bd7_e8ca

loc_1bd7_e780:
    dec di
    mov ax, 0010
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov si, ax
    mov [bp-c], dx
    or dx, ax
    jnz loc_1bd7_e7a2
    mov word ptr [bp-2], 0601
    jmp loc_1bd7_e8ca

data_1bd7_e7a1:
    db 90  ; |.|

loc_1bd7_e7a2:
    sub ax, ax
    push ax
    lea ax, [di+5]
    shl ax, 01
    shl ax, 01
    sub dx, dx
    push dx
    push ax
    push word ptr [bp-c]
    push si
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-c]
    push si
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-a]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jz loc_1bd7_e7e2

loc_1bd7_e7da:
    mov word ptr [bp-2], 0602
    jmp loc_1bd7_e8bd

loc_1bd7_e7e2:
    sub ax, ax
    push ax
    lea ax, [di+85]
    shl ax, 01
    shl ax, 01
    sub dx, dx
    push dx
    push ax
    push word ptr [bp-c]
    push si
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-c]
    push si
    mov ax, 0004
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-6]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0004
    jnz loc_1bd7_e7da
    mov [bp+8], di
    lea ax, [bp-a]
    push ss
    push ax
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    lea ax, [bp-6]
    push ss
    push ax
    mov cx, 0004
    push cx
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    mov ax, [bp-4]
    or ax, [bp-6]
    jnz loc_1bd7_e850
    mov word ptr [bp-2], 0603
    jmp loc_1bd7_e8bd

data_1bd7_e84f:
    db 90  ; |.|

loc_1bd7_e850:
    cmp word ptr [bp-4], 00
    jnz loc_1bd7_e85d
    cmp word ptr [bp-6], 5848
    jbe loc_1bd7_e864

loc_1bd7_e85d:
    mov word ptr [bp-2], 0604
    jmp loc_1bd7_e8bd

loc_1bd7_e864:
    sub ax, ax
    push ax
    mov ax, [bp-a]
    mov dx, [bp-8]
    add ax, 041c
    adc dx, 00
    push dx
    push ax
    push word ptr [bp-c]
    push si
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    push word ptr [bp-c]
    push si
    push word ptr [bp-6]
    mov ax, 0001
    push ax
    mov ax, 0000
    mov cx, 458f
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, [bp-6]
    jz loc_1bd7_e8a4
    jmp loc_1bd7_e7da

loc_1bd7_e8a4:
    nop
    push cs
    call sub_1bd7_e5de
    mov ax, 0000
    mov cx, 458f
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_e6d3
    mov ax, [bp+8]
    inc ax
    mov [6ecc], ax  ; 7fc1:6ecc word write

loc_1bd7_e8bd:
    mov ax, [bp-c]
    push ax
    push si
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_e8ca:
    mov ax, [bp-2]
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_e8d3:
    db 90  ; |.|
