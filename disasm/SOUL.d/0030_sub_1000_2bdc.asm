; ========================================
; New Subroutine: sub_1000_2bdc
; ========================================
sub_1000_2bdc:
    push bp
    mov bp, sp
    sub sp, 0036
    push si
    mov cx, 0012
    lea di, [bp-36]
    push ss
    pop es
    xor ax, ax
    repz stosw
    cmp word ptr [0148], 00
    jz loc_1000_2bfb
    jmp loc_1000_2c94

loc_1000_2bfb:
    cmp word ptr [014a], 00
    jz loc_1000_2c05
    jmp loc_1000_2c94

loc_1000_2c05:
    mov ax, [00ae]
    mov [bp-14], ax
    cmp word ptr [bp-14], 0f
    jz loc_1000_2c2c
    cmp word ptr [bp-14], 10
    jz loc_1000_2c2c
    cmp word ptr [bp-14], 11
    jz loc_1000_2c2c
    cmp word ptr [bp-14], 15
    jz loc_1000_2c2c
    cmp word ptr [bp-14], 17
    jz loc_1000_2c2c
    jmp loc_1000_2c34

loc_1000_2c2c:
    mov word ptr [bp-16], 0000
    jmp loc_1000_2c85

loc_1000_2c34:
    cmp word ptr [bp-14], 1b
    jz loc_1000_2c55
    cmp word ptr [bp-14], 1c
    jz loc_1000_2c55
    cmp word ptr [bp-14], 1e
    jz loc_1000_2c55
    cmp word ptr [bp-14], 1f
    jz loc_1000_2c55
    cmp word ptr [bp-14], 20
    jz loc_1000_2c55
    jmp loc_1000_2c5d

loc_1000_2c55:
    mov word ptr [bp-16], 0000
    jmp loc_1000_2c85

loc_1000_2c5d:
    cmp word ptr [bp-14], 22
    jz loc_1000_2c78
    cmp word ptr [bp-14], 24
    jz loc_1000_2c78
    cmp word ptr [bp-14], 18
    jz loc_1000_2c78
    cmp word ptr [bp-14], 1d
    jz loc_1000_2c78
    jmp loc_1000_2c80

loc_1000_2c78:
    mov word ptr [bp-16], 0000
    jmp loc_1000_2c85

loc_1000_2c80:
    mov word ptr [bp-16], ffff

loc_1000_2c85:
    mov ax, [bp-16]
    and ax, ax
    jnz loc_1000_2c8f
    jmp loc_1000_2c94

loc_1000_2c8f:
    nop
    push cs
    call sub_1000_361b

loc_1000_2c94:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    mov ax, es:[bx]
    mov [bp-18], ax
    mov cx, 0064
    cwd
    idiv cx
    mov [bp-1a], ax
    imul cx
    sub ax, [bp-18]
    neg ax
    mov [bp-1c], ax
    mov ax, [0062]
    not ax
    and ax, ax
    jz loc_1000_2cd0
    mov word ptr [bp-1a], 0000

loc_1000_2cd0:
    cmp word ptr [0148], 00
    jnz loc_1000_2ce0
    mov ax, [bp-1c]
    mov [0064], ax
    jmp loc_1000_2cf7

loc_1000_2ce0:
    mov ax, [0148]
    shl ax, 01
    add ax, 0038
    mov si, ax
    mov cx, [si+373c]
    mov [0064], cx
    mov word ptr [bp-1a], 0002

loc_1000_2cf7:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0066], ax
    mov word ptr [bp-1e], 0000
    mov ax, ds
    push ax
    mov ax, 0064
    push ax
    mov ax, ds
    push ax
    lea ax, [bp-1e]
    push ax
    call sub_1bd7_8f62
    add sp, 08
    mov ax, 0004
    push ax
    push word ptr [bp-1e]
    nop
    push cs
    call sub_1000_0f0a
    push word ptr [bp-1a]
    mov ax, 0001
    push ax
    call sub_1bd7_e70a
    add sp, 04
    mov [bp-20], ax
    mov ax, 0005
    push ax
    push word ptr [bp-20]
    nop
    push cs
    call sub_1000_0f0a
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-22], ax
    mov ax, [bp-22]
    mov [bp-18], ax
    cmp word ptr [00ae], 18
    mov cx, 0000
    jz loc_1000_2d8f
    dec cx

loc_1000_2d8f:
    and ax, cx
    and ax, [0038]
    and ax, 0001
    mov [0074], ax
    nop
    push cs
    call sub_1000_549d
    cmp word ptr [0148], 00
    jz loc_1000_2daa
    jmp loc_1000_2efd

loc_1000_2daa:
    cmp word ptr [014a], 00
    jz loc_1000_2db4
    jmp loc_1000_2efd

loc_1000_2db4:
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0144
    mov cx, es:[bx]
    mov [bp-24], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-24]
    push ax
    mov [bp-26], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-26]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0144
    mov ax, [bp-24]
    mov es:[bx], ax
    lea ax, [bp-2a]
    push ax
    lea ax, [bp-2c]
    push ax
    nop
    push cs
    call sub_1000_5108
    nop
    push cs
    call sub_1000_521c
    push ax
    lea ax, [bp-30]
    push ax
    call sub_1bd7_0696
    lea ax, [bp-30]
    push ax
    lea ax, [bp-34]
    push ax
    call sub_1bd7_0696
    mov word ptr [0068], 0000
    mov ax, [bp-34]
    mov [006a], ax
    mov ax, [bp-2a]
    mov [006c], ax
    mov ax, [bp-2c]
    mov [006e], ax
    mov ax, ds
    push ax
    mov ax, 0068
    push ax
    lea ax, [bp-2a]
    push ax
    call sub_1bd7_0887
    push ax
    lea ax, [bp-2a]
    push ax
    call sub_1bd7_0891
    push ax
    lea ax, [bp-34]
    push ax
    call sub_1bd7_0887
    push ax
    lea ax, [bp-34]
    push ax
    call sub_1bd7_0891
    push ax
    call sub_1bd7_b268
    add sp, 0c
    cmp word ptr [0146], 00
    jg loc_1000_2e7d
    jmp loc_1000_2ebc

loc_1000_2e7d:
    mov ax, [0068]
    mov [bp-36], ax
    cmp word ptr [bp-36], 19
    jz loc_1000_2eaa
    cmp word ptr [bp-36], 21
    jz loc_1000_2eaa
    cmp word ptr [bp-36], 14
    jz loc_1000_2eaa
    cmp word ptr [bp-36], 26
    jz loc_1000_2eaa
    cmp word ptr [bp-36], 23
    jz loc_1000_2eaa
    cmp word ptr [bp-36], 13
    jz loc_1000_2eaa
    jmp loc_1000_2ebc

loc_1000_2eaa:
    mov ax, [00ae]
    cmp ax, [0068]
    jz loc_1000_2eb9
    mov word ptr [0146], 0000

loc_1000_2eb9:
    jmp loc_1000_2ebc

loc_1000_2ebc:
    mov ax, [0068]
    mov [00ae], ax
    mov cx, [006a]
    mov [00b0], cx
    mov cx, [006c]
    mov [00b2], cx
    add ax, [0030]
    cmp ax, 3e80
    jle loc_1000_2ee1
    mov word ptr [0030], 0000

loc_1000_2ee1:
    cmp word ptr [00ae], 1a
    jnz loc_1000_2eee
    mov word ptr [373a], 0002

loc_1000_2eee:
    mov ax, [0032]
    cmp ax, [3738]
    jz loc_1000_2efa
    mov [3738], ax

loc_1000_2efa:
    jmp loc_1000_2f4d

loc_1000_2efd:
    cmp word ptr [373a], 03
    jz loc_1000_2f07
    jmp loc_1000_2f31

loc_1000_2f07:
    mov word ptr [0068], 0000
    mov ax, 0007
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    push word ptr es:[bx]
    nop
    push cs
    call sub_1000_0f0a
    jmp loc_1000_2f4d

loc_1000_2f31:
    cmp word ptr [014a], 02
    jnz loc_1000_2f3b
    jmp loc_1000_2f4d

loc_1000_2f3b:
    mov word ptr [0068], 0000
    mov word ptr [00ae], 001a
    mov word ptr [373a], 0000

loc_1000_2f4d:
    lea ax, [bp-30]
    push ax
    call sub_1bd7_09be
    lea ax, [bp-2a]
    push ax
    call sub_1bd7_09be
    lea ax, [bp-34]
    push ax
    call sub_1bd7_09be
    pop si
    mov sp, bp
    pop bp
    retf
