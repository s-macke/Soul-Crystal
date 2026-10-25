data_1000_2397:
    db 90  ; |.|

loc_1000_2398:
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 0014
    imul word ptr [bp-14]
    mov dx, bx
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    add bx, 08
    mov word ptr es:[bx], 0000
    mov ax, [bp-16]
    inc ax

loc_1000_23be:
    mov [bp-16], ax
    cmp ax, 0006
    jle loc_1000_2398
    mov ax, [bp-14]
    inc ax

loc_1000_23ca:
    mov [bp-14], ax
    cmp ax, 0067
    jg loc_1000_23d5
    jmp loc_1000_231a

loc_1000_23d5:
    mov word ptr [0032], 0000
    mov word ptr [0034], 0000
    mov word ptr [0036], 0000
    mov word ptr [0038], ffff
    mov word ptr [003a], 0000
    mov word ptr [003c], 0000
    mov word ptr [003e], 0000
    mov word ptr [0040], 0000
    mov word ptr [0042], 0000
    mov word ptr [0044], 0000
    mov word ptr [0046], ffff
    mov word ptr [0048], 0000
    mov word ptr [004a], 0000
    mov word ptr [004c], 0000
    mov word ptr [004e], 0000
    mov word ptr [0050], 0000
    mov word ptr [0052], 0000
    mov word ptr [0054], 0000
    mov word ptr [0056], 0000
    mov word ptr [0058], 0000
    mov word ptr [005a], 0000
    mov word ptr [005c], ffff
    mov word ptr [005e], 0000
    mov word ptr [0060], 0000
    mov ax, 0002
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, 0003
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, 0004
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov word ptr [3716], ffff
    mov word ptr [3718], ffff
    mov ax, 0001
    jmp loc_1000_24b7

data_1000_24a7:
    db 90  ; |.|

loc_1000_24a8:
    dec ax
    mov si, ax
    shl si, 01
    mov word ptr [si+371a], 0000
    mov ax, [bp-14]
    inc ax

loc_1000_24b7:
    mov [bp-14], ax
    cmp ax, 0005
    jle loc_1000_24a8
    mov ax, 0001
    jmp loc_1000_24ef

data_1000_24c5:
    db 90  ; |.|

loc_1000_24c6:
    mov ax, 3716
    push ds
    push ax
    mov ax, 000e
    push ax
    mov ax, 000e
    imul word ptr [bp-14]
    mov bx, ax
    mov si, 0080
    add bx, [si+a]
    mov es, [si+2]
    push es
    push bx
    mov ax, 000e
    push ax
    call sub_1bd7_0786
    mov ax, [bp-14]
    inc ax

loc_1000_24ef:
    mov [bp-14], ax
    cmp ax, 000a
    jle loc_1000_24c6
    mov word ptr [014a], 0000
    mov word ptr [0148], 0000
    mov ax, 09a0
    push ax
    call sub_1bd7_05a2
    mov ax, 0001
    jmp loc_1000_256e

loc_1000_2512:
    shl ax, 01
    shl ax, 01
    shl ax, 01
    mov bx, ax
    mov si, 00b6
    add bx, [si+a]
    mov es, [si+2]
    push es
    push bx
    mov [bp-28], ax
    call sub_1bd7_05c9
    mov bx, [bp-28]
    mov dx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    push es
    push bx
    call sub_1bd7_05c9
    mov bx, [bp-28]
    mov dx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    push es
    push bx
    call sub_1bd7_05c9
    mov bx, [bp-28]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    push es
    push bx
    call sub_1bd7_05c9
    mov ax, [bp-14]
    inc ax

loc_1000_256e:
    mov [bp-14], ax
    cmp ax, 0004
    jle loc_1000_2512
    mov ax, 08f6
    push ax
    call sub_1bd7_05a2
    lea bx, [bp-2a]
    push ds
    pop es
    push es
    push bx
    call sub_1bd7_05c9
    nop

loc_1000_258c:
    cmp word ptr [bp-2a], 0100
    jl loc_1000_2596
    jmp loc_1000_26c2

loc_1000_2596:
    lea bx, [bp-2c]
    push ds
    pop es
    push es
    push bx
    call sub_1bd7_05c9
    mov word ptr [bp-2e], 0000
    lea ax, [bp-26]
    push ds
    push ax
    mov ax, 0010
    push ax
    call sub_1bd7_05cf
    mov ax, 0001
    jmp loc_1000_2609

data_1000_25bb:
    db 90  ; |.|

loc_1000_25bc:
    mov bx, 3848
    call sub_1bd7_57f2
    lea ax, [bp-26]
    push ds
    push ax
    mov ax, 0010
    push ax
    call sub_1bd7_075e
    push ax
    push word ptr [bp-14]
    mov ax, 0001
    push ax
    call sub_1bd7_0952
    push ax
    call sub_1bd7_09e8
    mov bx, ax
    call sub_1bd7_57f2
    call sub_1bd7_5c6f
    jnz loc_1000_25f6
    jmp loc_1000_2605

loc_1000_25f6:
    push word ptr [bp-14]
    lea ax, [bp-2e]
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_2605:
    mov ax, [bp-14]
    inc ax

loc_1000_2609:
    mov [bp-14], ax
    cmp ax, 0010
    jle loc_1000_25bc
    mov ax, [bp-2e]
    mov [bp-30], ax
    mov ax, 0010
    push ax
    lea ax, [bp-30]
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, 000f
    push ax
    lea ax, [bp-30]
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, 000e
    push ax
    lea ax, [bp-30]
    push ax
    call sub_1bd7_8ade
    add sp, 04
    xor ax, ax
    jmp loc_1000_267b

loc_1000_264c:
    mov cx, [bp-2a]
    dec cx
    shl cx, 01
    mov bx, 014a
    imul bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, cx
    mov dx, es:[bx]
    or dx, [bp-30]
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, cx
    mov es:[bx], dx
    mov ax, [bp-14]
    inc ax

loc_1000_267b:
    mov [bp-14], ax
    cmp ax, 0067
    jle loc_1000_264c
    push word ptr [bp-2c]
    nop
    push cs
    call sub_1000_34e1
    mov [bp-32], ax
    mov ax, [bp-32]
    mov [bp-34], ax
    mov cx, [bp-2a]
    dec cx
    shl cx, 01
    mov bx, 014a
    imul bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, cx
    mov ax, [bp-2e]
    mov es:[bx], ax
    lea bx, [bp-2a]
    push ds
    pop es
    push es
    push bx
    call sub_1bd7_05c9
    jmp loc_1000_258c

data_1000_26c1:
    db 90  ; |.|

loc_1000_26c2:
    mov ax, 09a4
    push ax
    call sub_1bd7_05a2
    mov ax, 0001
    jmp loc_1000_270f

data_1000_26d1:
    db 90  ; |.|

loc_1000_26d2:
    shl ax, 01
    mov bx, ax
    add ax, 0038
    add ax, 373c
    mov dx, bx
    mov bx, ax
    push ds
    pop es
    push es
    push bx
    mov [bp-36], dx
    call sub_1bd7_05c9
    mov ax, [bp-36]
    add ax, 373c
    mov bx, ax
    push ds
    pop es
    push es
    push bx
    call sub_1bd7_05c9
    lea bx, [bp-38]
    push ds
    pop es
    push es
    push bx
    call sub_1bd7_05c9
    mov ax, [bp-14]
    inc ax

loc_1000_270f:
    mov [bp-14], ax
    cmp ax, 001b
    jle loc_1000_26d2
    mov ax, 09bf
    push ax
    call sub_1bd7_05a2

loc_1000_2720:
    lea bx, [bp-3c]
    push ds
    pop es
    push es
    push bx
    call sub_1bd7_05c9
    cmp word ptr [bp-3c], 03e8
    jg loc_1000_2736
    jmp loc_1000_27ac

loc_1000_2736:
    sub word ptr [bp-3c], 03e8
    push word ptr [bp-3c]
    nop
    push cs
    call sub_1000_34e1
    mov [bp-3a], ax
    mov ax, [bp-3a]
    mov [bp-34], ax
    mov bx, 0014
    imul bx
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov ax, [bp-3c]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-34]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov cx, es:[bx]
    mov [bp-3e], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-3e]
    push ax
    mov [bp-40], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-40]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov ax, [bp-3e]
    mov es:[bx], ax
    jmp loc_1000_27d6

loc_1000_27ac:
    push word ptr [bp-3c]
    nop
    push cs
    call sub_1000_34e1
    mov [bp-42], ax
    mov ax, [bp-42]
    mov [bp-34], ax
    mov bx, 0014
    imul bx
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov ax, [bp-3c]
    mov es:[bx], ax

loc_1000_27d6:
    mov cx, 0064
    mov ax, [bp-3c]
    cwd
    idiv cx
    add dx, 52
    mov ax, 0014
    mov bx, dx
    imul word ptr [bp-34]
    mov dx, bx
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov es:[bx], dx
    mov bx, ax
    mov ax, [bp-3c]
    cwd
    idiv cx
    mov dx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov es:[bx], ax
    mov bx, dx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    push es
    push bx
    call sub_1bd7_05c9
    mov ax, 0001
    jmp loc_1000_28b4

loc_1000_2828:
    mov word ptr [bp-44], 0000
    lea bx, [bp-46]
    push ds
    pop es
    push es
    push bx
    call sub_1bd7_05c9
    cmp word ptr [bp-46], 07cf
    jle loc_1000_284d
    sub word ptr [bp-46], 07d0
    mov word ptr [bp-44], 000f
    jmp loc_1000_2861

loc_1000_284d:
    cmp word ptr [bp-46], 03e7
    jg loc_1000_2857
    jmp loc_1000_2861

loc_1000_2857:
    sub word ptr [bp-46], 03e8
    mov word ptr [bp-44], 0010

loc_1000_2861:
    push word ptr [bp-46]
    nop
    push cs
    call sub_1000_34e1
    mov [bp-48], ax
    mov ax, [bp-48]
    mov [bp-46], ax
    cmp word ptr [bp-44], 00
    jg loc_1000_287b
    jmp loc_1000_288a

loc_1000_287b:
    push word ptr [bp-44]
    lea ax, [bp-46]
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_288a:
    mov ax, [bp-14]
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 0014
    imul word ptr [bp-34]
    mov dx, bx
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    add bx, 08
    mov ax, [bp-46]
    mov es:[bx], ax
    mov ax, [bp-14]
    inc ax

loc_1000_28b4:
    mov [bp-14], ax
    cmp ax, 0006
    jg loc_1000_28bf
    jmp loc_1000_2828

loc_1000_28bf:
    cmp word ptr [bp-34], 67
    jz loc_1000_28c8
    jmp loc_1000_2720

loc_1000_28c8:
    mov word ptr [0032], 0003
    nop
    push cs
    call sub_1000_50ce
    nop
    push cs
    call sub_1000_28ff
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    mov word ptr [373a], 0000
    pop si
    mov sp, bp
    pop bp
    retf

data_1000_28f0:
    db 90, 90, 90, e9, 55, 00, 90, 90, 90, 90, 90, 90, 90, 90, 90  ; |....U..........|
