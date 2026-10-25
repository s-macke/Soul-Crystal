; ========================================
; New Subroutine: sub_1000_1fca
; ========================================
sub_1000_1fca:
    push bp
    mov bp, sp
    sub sp, 002c
    push si
    mov cx, 000d
    lea di, [bp-2c]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov word ptr [bp-16], 0064
    mov ax, [bp+6]
    and ax, ax
    jnz loc_1000_1fee
    jmp loc_1000_216a

loc_1000_1fee:
    mov word ptr [3724], 0000
    mov ax, ds
    push ax
    mov ax, 3724
    push ax
    mov ax, ds
    push ax
    mov ax, 0152
    push ax
    call sub_1bd7_c1ac
    add sp, 08
    mov [bp-14], ax
    mov ax, [bp-14]
    mov [bp-18], ax
    or ax, ax
    jz loc_1000_201a
    jmp loc_1000_2162

loc_1000_201a:
    nop
    push cs
    call sub_1000_2300
    mov ax, ds
    push ax
    mov ax, 0152
    push ax
    mov ax, 0032
    push ax
    mov ax, ds
    push ax
    mov ax, 0032
    push ax
    mov ax, 0032
    push ax
    call sub_1bd7_0786
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [bp-18], ax
    mov bx, [bp-18]
    shl bx, 01
    shl bx, 01
    shl bx, 01
    mov si, 00b6
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    push word ptr es:[bx]
    nop
    push cs
    call sub_1000_34e1
    mov [bp-1a], ax
    mov ax, [bp-1a]
    mov [bp-1e], ax
    mov bx, [bp-18]
    shl bx, 01
    shl bx, 01
    shl bx, 01
    mov si, 00b6
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    push word ptr es:[bx]
    nop
    push cs
    call sub_1000_34e1
    mov [bp-1c], ax
    mov ax, [bp-1c]
    mov [bp-20], ax
    mov word ptr [bp-22], 014a
    mov ax, ds
    push ax
    mov ax, 0152
    add ax, [bp-16]
    push ax
    push word ptr [bp-22]
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    mov ax, es
    push ax
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    push bx
    push word ptr [bp-22]
    call sub_1bd7_0786
    mov ax, [bp-22]
    add [bp-16], ax
    mov cx, [bp-20]
    sub cx, [bp-1e]
    inc cx
    imul cx
    mov [bp-24], ax
    mov ax, ds
    push ax
    mov ax, 0152
    add ax, [bp-16]
    push ax
    push word ptr [bp-24]
    mov ax, 014a
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    mov dx, ax
    mov ax, es
    push ax
    mov bx, dx
    add bx, [si+a]
    mov es, [si+2]
    push bx
    push word ptr [bp-24]
    call sub_1bd7_0786
    mov ax, [bp-24]
    add [bp-16], ax
    mov ax, [bp-20]
    sub ax, [bp-1e]
    mov cx, 0014
    imul cx
    add cx, ax
    mov [bp-26], cx
    mov ax, ds
    push ax
    mov ax, 0152
    add ax, [bp-16]
    push ax
    push word ptr [bp-26]
    mov ax, 0014
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov dx, ax
    mov ax, es
    push ax
    mov bx, dx
    add bx, [si+a]
    mov es, [si+2]
    push bx
    push word ptr [bp-26]
    call sub_1bd7_0786

loc_1000_2162:
    nop
    push cs
    call sub_1000_28ff
    jmp loc_1000_22f4

loc_1000_216a:
    mov ax, ds
    push ax
    mov ax, 0032
    push ax
    mov ax, 0032
    push ax
    mov ax, ds
    push ax
    mov ax, 0152
    push ax
    mov ax, 0032
    push ax
    call sub_1bd7_0786
    mov word ptr [bp-22], 014a
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    mov ax, es
    push ax
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    push bx
    push word ptr [bp-22]
    mov ax, ds
    push ax
    mov ax, 0152
    add ax, [bp-16]
    push ax
    push word ptr [bp-22]
    call sub_1bd7_0786
    mov ax, [bp-22]
    add [bp-16], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [bp-18], ax
    mov bx, [bp-18]
    shl bx, 01
    shl bx, 01
    shl bx, 01
    mov si, 00b6
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    push word ptr es:[bx]
    nop
    push cs
    call sub_1000_34e1
    mov [bp-28], ax
    mov ax, [bp-28]
    mov [bp-1e], ax
    mov bx, [bp-18]
    shl bx, 01
    shl bx, 01
    shl bx, 01
    mov si, 00b6
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    push word ptr es:[bx]
    nop
    push cs
    call sub_1000_34e1
    mov [bp-2a], ax
    mov ax, [bp-2a]
    mov [bp-20], ax
    sub ax, [bp-1e]
    inc ax
    imul word ptr [bp-22]
    mov [bp-24], ax
    mov ax, 014a
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    mov dx, ax
    mov ax, es
    push ax
    mov bx, dx
    add bx, [si+a]
    mov es, [si+2]
    push bx
    push word ptr [bp-24]
    mov ax, ds
    push ax
    mov ax, 0152
    add ax, [bp-16]
    push ax
    push word ptr [bp-24]
    call sub_1bd7_0786
    mov ax, [bp-24]
    add [bp-16], ax
    mov ax, [bp-20]
    sub ax, [bp-1e]
    mov cx, 0014
    imul cx
    add cx, ax
    mov [bp-26], cx
    mov ax, 0014
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov dx, ax
    mov ax, es
    push ax
    mov bx, dx
    add bx, [si+a]
    mov es, [si+2]
    push bx
    push word ptr [bp-26]
    mov ax, ds
    push ax
    mov ax, 0152
    add ax, [bp-16]
    push ax
    push word ptr [bp-26]
    call sub_1bd7_0786
    mov ax, [bp-26]
    add [bp-16], ax
    mov word ptr [3724], 0001
    mov ax, [bp-16]
    mov [3726], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov ax, es:[bx]
    mov [3728], ax
    mov ax, ds
    push ax
    mov ax, 3724
    push ax
    mov ax, ds
    push ax
    mov ax, 0152
    push ax
    call sub_1bd7_c1ac
    add sp, 08
    mov [bp-2c], ax
    mov ax, [bp-2c]
    mov [bp-18], ax

loc_1000_22f4:
    pop si
    mov sp, bp
    pop bp
    retf 0002
