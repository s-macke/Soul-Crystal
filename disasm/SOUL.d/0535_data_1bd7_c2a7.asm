data_1bd7_c2a7:
    db 90  ; |.|

loc_1bd7_c2a8:
    push cs
    call sub_1bd7_ca46
    jmp loc_1bd7_c293

loc_1bd7_c2ae:
    push cs
    call sub_1bd7_ca46

loc_1bd7_c2b2:
    mov word ptr [bp-18], 0001

loc_1bd7_c2b7:
    cmp word ptr [bp-18], 00
    jnz loc_1bd7_c2c0
    jmp loc_1bd7_c1cf

loc_1bd7_c2c0:
    les bx, [bp+a]
    cmp word ptr es:[bx], 02
    jnz loc_1bd7_c2cc
    jmp loc_1bd7_ca3d

loc_1bd7_c2cc:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_c2d5
    jmp loc_1bd7_c39d

loc_1bd7_c2d5:
    mov ax, 64c0
    push ds
    push ax
    mov ax, 64c3
    push ds
    push ax
    nop
    push cs
    call sub_1bd7_70fa
    add sp, 08
    mov [bp-10], ax
    mov [bp-e], dx
    or dx, ax
    jnz loc_1bd7_c320
    mov word ptr [bp-6], 0302
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 001d
    mov word ptr [bp-a], 0000
    mov word ptr [bp-8], 0100
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    jmp loc_1bd7_c39d

data_1bd7_c31e:
    db 90, 90  ; |..|

loc_1bd7_c320:
    push word ptr [bp-e]
    push ax
    mov ax, 0014
    push ax
    mov cx, 0001
    push cx
    mov cx, 0472
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0014
    jnz loc_1bd7_c364
    push word ptr [bp-e]
    push word ptr [bp-10]
    mov ax, 02f8
    push ax
    mov cx, 0001
    push cx
    mov cx, c62a
    mov dx, 458f
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 02f8
    jz loc_1bd7_c38f

loc_1bd7_c364:
    mov word ptr [bp-6], 0302
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 001d
    mov word ptr [bp-a], 0000
    mov word ptr [bp-8], 0100
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08

loc_1bd7_c38f:
    push word ptr [bp-e]
    push word ptr [bp-10]
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_c39d:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_c3a6
    jmp loc_1bd7_c4fd

loc_1bd7_c3a6:
    mov word ptr [bp-12], 0000
    les bx, [bp+a]
    mov ax, es:[bx]
    or ax, ax
    jz loc_1bd7_c3ba
    dec ax
    jz loc_1bd7_c408
    jmp loc_1bd7_c3bf

loc_1bd7_c3ba:
    mov word ptr [bp-c], 001f

loc_1bd7_c3bf:
    mov word ptr [bp-a], 0000
    mov word ptr [bp-8], 0100
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    sub ax, ax
    push ax
    mov cx, 0001
    push cx
    nop
    push cs
    call sub_1bd7_bba4
    add sp, 04
    mov word ptr [bp-4], 0000
    mov word ptr [bp-1c], 0000
    mov ax, 0009
    push ax
    nop
    push cs
    call sub_1bd7_b924
    add sp, 02

loc_1bd7_c400:
    mov word ptr [bp-12], 0000
    jmp loc_1bd7_c413

data_1bd7_c407:
    db 90  ; |.|

loc_1bd7_c408:
    mov word ptr [bp-c], 0020
    jmp loc_1bd7_c3bf

data_1bd7_c40f:
    db 90  ; |.|

loc_1bd7_c410:
    inc word ptr [bp-12]

loc_1bd7_c413:
    cmp word ptr [bp-12], 0098
    jge loc_1bd7_c43c
    mov ax, 0026
    imul word ptr [bp-4]
    mov bx, ax
    add bx, [bp-12]
    mov es, [6e78]
    mov al, es:[bx-39d6]
    mov es, [6e7a]
    mov bx, [bp-12]
    mov es:[bx-232a], al
    jmp loc_1bd7_c410

loc_1bd7_c43c:
    mov ax, 0009
    push ax
    sub ax, ax
    mov [bp-18], ax
    push ax
    nop
    push cs
    call sub_1bd7_bba4
    add sp, 04
    mov [bp-1c], ax
    sub ah, ah
    jmp loc_1bd7_c4d8

data_1bd7_c456:
    db c7, 46, fa, 01, 03, c7, 46, e8, 01, 00, e9, 91, 00, 90, 8e, 06  ; |.F....F.........|
    db 7c, 6e, 8a, 5e, e4, 2a, ff, 03, 5e, fc, 4b, 89, 5e, ec, 26, 80  ; ||n.^.*..^.K.^.&.|
    db bf, 72, 04, 00, 75, df, c4, 5e, 0a, 26, 83, 3f, 00, 74, 6f, eb  ; |.r..u..^.&.?.to.|
    db d4, 90, 8a, 66, e5, 2a, c0, 2d, 00, 01, 74, 08, 2d, 00, 01, 74  ; |...f.*.-..t.-..t|
    db 13, eb, 04, 90, ff, 4e, fc, 83, 7e, fc, 00, 7d, 51, c7, 46, fc  ; |.....N..~..}Q.F.|
    db 00, 00, eb, 4a, 83, 6e, fc, 04, eb, ed, 8a, 66, e5, 2a, c0, 2d  ; |...J.n.....f.*.-|
    db 00, 01, 74, 08, 2d, 00, 01, 74, 13, eb, 04, 90, ff, 46, fc, 83  ; |..t.-..t.....F..|
    db 7e, fc, 10, 7e, d2, c7, 46, fc, 10, 00, eb, cb, 83, 46, fc, 04  ; |~..~..F......F..|
    db eb, ed  ; |..|

loc_1bd7_c4d8:
    cmp ax, 0006
    ja loc_1bd7_c4f4
    shl ax, 01
    xchg ax, bx
    jmp word ptr cs:[bx-3b1a]

data_1bd7_c4e5:
    db 90, 56, c4, 64, c4, 64, c4, 64, c4, 64, c4, 88, c4, b0, c4  ; |.V.d.d.d.d.....|

loc_1bd7_c4f4:
    cmp word ptr [bp-18], 00
    jnz loc_1bd7_c4fd
    jmp loc_1bd7_c400

loc_1bd7_c4fd:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_c506
    jmp loc_1bd7_ca3d

loc_1bd7_c506:
    les bx, [bp+a]
    mov ax, es:[bx]
    jmp loc_1bd7_ca30

data_1bd7_c50f:
    db 90  ; |.|

loc_1bd7_c510:
    mov ax, [bp-14]
    inc ax
    push ax
    mov ax, 64d0
    push ds
    push ax
    mov ax, 0486
    mov cx, 2c43
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7562
    add sp, 0a
    mov ax, 64df
    push ds
    push ax
    mov ax, 0486
    mov cx, 2c43
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_70fa
    add sp, 08
    mov [bp-10], ax
    mov [bp-e], dx
    or dx, ax
    jnz loc_1bd7_c578
    mov word ptr [bp-6], 0301
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 001a

loc_1bd7_c558:
    mov word ptr [bp-a], 0000
    mov word ptr [bp-8], 0100
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    jmp loc_1bd7_ca3d

data_1bd7_c577:
    db 90  ; |.|

loc_1bd7_c578:
    sub ax, ax
    push ax
    mov cx, 0027
    sub dx, dx
    push dx
    push cx
    push word ptr [bp-e]
    push word ptr [bp-10]
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    or ax, ax
    jnz loc_1bd7_c5b4
    push word ptr [bp-e]
    push word ptr [bp-10]
    mov ax, 0002
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-20]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0002
    jz loc_1bd7_c5c6

loc_1bd7_c5b4:
    mov word ptr [bp-6], 0301
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 001a
    jmp loc_1bd7_c60d

data_1bd7_c5c5:
    db 90  ; |.|

loc_1bd7_c5c6:
    lea ax, [bp-20]
    push ss
    push ax
    mov cx, 0002
    push cx
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    cmp word ptr [bp-20], 3864
    jbe loc_1bd7_c5e3
    mov word ptr [bp-20], 3864

loc_1bd7_c5e3:
    push word ptr [bp-e]
    push word ptr [bp-10]
    push word ptr [bp-20]
    mov ax, 0001
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, [bp-20]
    jnz loc_1bd7_c5b4
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 0022

loc_1bd7_c60d:
    mov word ptr [bp-a], 0000
    mov word ptr [bp-8], 0100
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    push word ptr [bp-e]
    push word ptr [bp-10]
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04
    jmp loc_1bd7_ca3d

loc_1bd7_c63a:
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 0021
    mov word ptr [bp-a], 0000
    mov word ptr [bp-8], 0100
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    mov es, [6e7c]
    mov bx, [bp-14]
    cmp byte ptr es:[bx+472], 00
    jz loc_1bd7_c672
    jmp loc_1bd7_c70e

loc_1bd7_c672:
    mov word ptr [bp-12], 0000

loc_1bd7_c677:
    mov es, [6e7e]
    mov bx, [bp-12]
    mov byte ptr es:[bx+64e4], 20
    inc word ptr [bp-12]
    cmp word ptr [bp-12], 26
    jl loc_1bd7_c677
    mov es, [6e80]
    mov byte ptr es:[cab6], 00
    mov word ptr [bp-16], 0000
    jmp loc_1bd7_c6a1

loc_1bd7_c69e:
    inc word ptr [bp-16]

loc_1bd7_c6a1:
    mov es, [6e82]
    mov ax, [bp-16]
    cmp es:[5682], ax
    jbe loc_1bd7_c6d2
    mov bx, ax
    mov es, [6e84]
    mov cl, es:[bx+6448]
    sub ch, ch
    les si, [bp+a]
    cmp cx, es:[si+4]
    jnz loc_1bd7_c69e
    mov cx, 0003
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_a3a2
    add sp, 04

loc_1bd7_c6d2:
    mov word ptr [bp-16], 0000
    jmp loc_1bd7_c6eb

data_1bd7_c6d9:
    db 90  ; |.|

loc_1bd7_c6da:
    mov al, es:[bx-354a]
    mov es, [6e7e]
    mov es:[bx+64e4], al
    inc word ptr [bp-16]

loc_1bd7_c6eb:
    mov es, [6e76]
    mov ax, es:[0c9a]
    dec ax
    cmp ax, [bp-16]
    jbe loc_1bd7_c708
    mov es, [6e80]
    mov bx, [bp-16]
    cmp byte ptr es:[bx-354a], 00
    jnz loc_1bd7_c6da

loc_1bd7_c708:
    mov ax, [bp-16]
    jmp loc_1bd7_c755

data_1bd7_c70d:
    db 90  ; |.|

loc_1bd7_c70e:
    mov ax, 0026
    push ax
    mul bx
    add ax, c62a
    mov cx, 458f
    push cx
    push ax
    mov ax, 64e4
    mov cx, 458f
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    mov es, [6e76]
    mov ax, es:[0c9a]
    dec ax
    mov [bp-12], ax
    jmp loc_1bd7_c73d

loc_1bd7_c73a:
    dec word ptr [bp-12]

loc_1bd7_c73d:
    cmp word ptr [bp-12], ff
    jle loc_1bd7_c752
    mov es, [6e7e]
    mov bx, [bp-12]
    cmp byte ptr es:[bx+64e3], 20
    jz loc_1bd7_c73a

loc_1bd7_c752:
    mov ax, [bp-12]

loc_1bd7_c755:
    mov [bp-1e], ax
    mov word ptr [bp-18], 0000

loc_1bd7_c75d:
    mov es, [6e7e]
    mov bx, [bp-1e]
    mov byte ptr es:[bx+64e4], 5f
    mov al, 31
    push ax
    mov es, [6e76]
    push word ptr es:[0c9a]
    mov ax, 64e4
    mov cx, 458f
    push cx
    push ax
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
    mov es, [6e76]
    push word ptr es:[0c9a]
    mov cx, d512
    mov dx, 36ad
    push dx
    push cx
    push word ptr es:[0ca6]
    push word ptr es:[0c9a]
    push ax
    push ax
    mov cx, 005a
    push cx
    nop
    push cs
    call sub_1bd7_d058
    add sp, 18
    mov ax, 0001
    push ax
    push ax
    mov es, [6e76]
    push word ptr es:[0ca6]
    push word ptr es:[0c9a]
    sub cx, cx
    push cx
    push cx
    push word ptr es:[0c9a]
    mov dx, ax
    mov al, [bp-1c]
    sub ah, ah
    sub ax, dx
    mul word ptr es:[0ca6]
    add ax, es:[0c98]
    push ax
    push word ptr es:[0c96]
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
    mov [bp-1a], al
    sub ah, ah
    cmp ax, 001b
    jz loc_1bd7_c846
    ja loc_1bd7_c81d
    sub al, 08
    jnz loc_1bd7_c816
    jmp loc_1bd7_c8ca

loc_1bd7_c816:
    sub al, 05
    jnz loc_1bd7_c81d
    jmp loc_1bd7_c8e4

loc_1bd7_c81d:
    cmp byte ptr [bp-1a], 1f
    jbe loc_1bd7_c850
    mov es, [6e76]
    mov ax, es:[0c9a]
    dec ax
    cmp ax, [bp-1e]
    jbe loc_1bd7_c850
    mov al, [bp-1a]
    mov es, [6e7e]
    mov bx, [bp-1e]
    mov es:[bx+64e4], al
    inc word ptr [bp-1e]
    jmp loc_1bd7_c850

data_1bd7_c845:
    db 90  ; |.|

loc_1bd7_c846:
    mov word ptr [bp-6], 0301

loc_1bd7_c84b:
    mov word ptr [bp-18], 0001

loc_1bd7_c850:
    cmp word ptr [bp-18], 00
    jnz loc_1bd7_c859
    jmp loc_1bd7_c75d

loc_1bd7_c859:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_c862
    jmp loc_1bd7_c9d8

loc_1bd7_c862:
    mov ax, [bp-14]
    inc ax
    push ax
    mov ax, 64e2
    push ds
    push ax
    mov ax, 0486
    mov cx, 2c43
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7562
    add sp, 0a
    mov ax, 64f1
    push ds
    push ax
    mov ax, 0486
    mov cx, 2c43
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_70fa
    add sp, 08
    mov [bp-10], ax
    mov [bp-e], dx
    or dx, ax
    jnz loc_1bd7_c914
    mov word ptr [bp-6], 0301
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 001b
    mov word ptr [bp-a], 0000
    mov word ptr [bp-8], 0100
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    jmp loc_1bd7_c9d8

data_1bd7_c8c9:
    db 90  ; |.|

loc_1bd7_c8ca:
    mov es, [6e7e]
    mov bx, [bp-1e]
    mov byte ptr es:[bx+64e4], 20
    or bx, bx
    jnz loc_1bd7_c8de
    jmp loc_1bd7_c850

loc_1bd7_c8de:
    dec word ptr [bp-1e]
    jmp loc_1bd7_c850

loc_1bd7_c8e4:
    mov word ptr [bp-12], 0000
    jmp loc_1bd7_c8ef

data_1bd7_c8eb:
    db 90  ; |.|

loc_1bd7_c8ec:
    inc word ptr [bp-12]

loc_1bd7_c8ef:
    mov ax, [bp-12]
    cmp [bp-1e], ax
    ja loc_1bd7_c8fa
    jmp loc_1bd7_c850

loc_1bd7_c8fa:
    mov bx, ax
    mov es, [6e7e]
    cmp byte ptr es:[bx+64e4], 20
    jz loc_1bd7_c8ec
    mov bx, [bp-1e]
    mov byte ptr es:[bx+64e4], 20
    jmp loc_1bd7_c84b

loc_1bd7_c914:
    mov es, [6e7e]
    mov byte ptr es:[650a], 1a
    push word ptr [bp-e]
    push ax
    mov ax, 0027
    push ax
    mov cx, 0001
    push cx
    mov cx, 64e4
    push es
    push cx
    nop
    push cs
    call sub_1bd7_7288
    add sp, 0c
    cmp ax, 0027
    jnz loc_1bd7_c99f
    les bx, [bp+a]
    mov ax, es:[bx+2]
    mov [bp-20], ax
    lea ax, [bp-20]
    push ss
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_d10e
    add sp, 06
    push word ptr [bp-e]
    push word ptr [bp-10]
    mov ax, 0002
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-20]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7288
    add sp, 0c
    cmp ax, 0002
    jnz loc_1bd7_c99f
    push word ptr [bp-e]
    push word ptr [bp-10]
    les bx, [bp+a]
    push word ptr es:[bx+2]
    mov ax, 0001
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_7288
    add sp, 0c
    les bx, [bp+a]
    cmp es:[bx+2], ax
    jz loc_1bd7_c9ca

loc_1bd7_c99f:
    mov word ptr [bp-6], 0301
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 001b
    mov word ptr [bp-a], 0000
    mov word ptr [bp-8], 0100
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08

loc_1bd7_c9ca:
    push word ptr [bp-e]
    push word ptr [bp-10]
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_c9d8:
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_ca3d
    mov es, [6e7c]
    mov bx, [bp-14]
    mov byte ptr es:[bx+472], ff
    mov ax, 0026
    push ax
    mov cx, 64e4
    mov dx, 458f
    push dx
    push cx
    mul bx
    add ax, c62a
    mov cx, 458f
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    push cs
    call sub_1bd7_cb6c
    or ax, ax
    jnz loc_1bd7_ca22
    mov word ptr [bp-6], 0301
    mov [bp-12], ax
    mov word ptr [bp-c], 001e
    jmp loc_1bd7_c558

data_1bd7_ca21:
    db 90  ; |.|

loc_1bd7_ca22:
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 0023
    jmp loc_1bd7_c558

data_1bd7_ca2f:
    db 90  ; |.|

loc_1bd7_ca30:
    or ax, ax
    jnz loc_1bd7_ca37
    jmp loc_1bd7_c510

loc_1bd7_ca37:
    dec ax
    jnz loc_1bd7_ca3d
    jmp loc_1bd7_c63a

loc_1bd7_ca3d:
    mov ax, [bp-6]
    pop si
    mov sp, bp
    pop bp
    retf

data_1bd7_ca45:
    db 90  ; |.|
