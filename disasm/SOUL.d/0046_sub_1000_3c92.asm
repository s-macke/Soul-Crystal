; ========================================
; New Subroutine: sub_1000_3c92
; ========================================
sub_1000_3c92:
    push bp
    mov bp, sp
    sub sp, 002e
    push si
    mov cx, 000e
    lea di, [bp-2e]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, 000f
    push ax
    push word ptr [bp+6]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    and ax, ax
    jz loc_1000_3cc9
    mov word ptr [0070], 0017
    jmp loc_1000_3ed9

loc_1000_3cc9:
    xor ax, ax
    push ax
    nop
    push cs
    call sub_1000_3230
    mov [bp-16], ax
    mov ax, [bp-16]
    and ax, ax
    jnz loc_1000_3cde
    jmp loc_1000_3ed9

loc_1000_3cde:
    mov ax, [bp+6]
    and ax, 3fff
    mov [0032], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov cx, es:[bx]
    mov [0070], cx
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-18], ax
    mov ax, [bp-18]
    mov [bp-1a], ax
    cmp word ptr [bp-1a], 6a
    jz loc_1000_3d2c
    jmp loc_1000_3d79

loc_1000_3d2c:
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0092
    mov ax, es:[bx]
    mov [bp-1c], ax
    push word ptr [0032]
    mov ax, 004a
    push ax
    nop
    push cs
    call sub_1000_3041
    mov ax, 000d
    push ax
    push word ptr [bp-1c]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1e], ax
    mov ax, [bp-1e]
    not ax
    and ax, ax
    jz loc_1000_3d76
    mov word ptr [0036], 0000

loc_1000_3d76:
    jmp loc_1000_3ed9

loc_1000_3d79:
    cmp word ptr [bp-1a], 6f
    jz loc_1000_3d82
    jmp loc_1000_3db2

loc_1000_3d82:
    lea ax, [bp-22]
    push ax
    lea ax, [bp-24]
    push ax
    nop
    push cs
    call sub_1000_5108
    cmp word ptr [bp-22], 02
    jg loc_1000_3da3
    lea ax, [bp-22]
    push ax
    call sub_1bd7_08b2
    cmp ax, 0097
    jz loc_1000_3daf

loc_1000_3da3:
    mov word ptr [0070], 0063
    mov word ptr [0148], 0002

loc_1000_3daf:
    jmp loc_1000_3ed9

loc_1000_3db2:
    cmp word ptr [bp-1a], 6b
    jnz loc_1000_3dc1
    mov word ptr [014a], ffff
    jmp loc_1000_3ed9

loc_1000_3dc1:
    cmp word ptr [bp-1a], 00d2
    jz loc_1000_3dcb
    jmp loc_1000_3e3c

loc_1000_3dcb:
    mov word ptr [003c], 0000
    mov word ptr [372e], 0001
    mov word ptr [3732], 008f
    mov word ptr [3734], 0090
    nop
    push cs
    call sub_1000_28ff
    mov ax, 008e
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1000_0a2d
    nop
    push cs
    call sub_1000_549d
    push word ptr [372e]
    call sub_1bd7_bfa2
    add sp, 02
    mov [bp-26], ax
    mov ax, [bp-26]
    mov [3730], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov cx, es:[bx]
    mov [0070], cx
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    jmp loc_1000_3ed9

loc_1000_3e3c:
    cmp word ptr [bp-1a], 71
    jz loc_1000_3e45
    jmp loc_1000_3e7d

loc_1000_3e45:
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
    mov [bp-28], ax
    mov ax, [bp-28]
    not ax
    and ax, ax
    jz loc_1000_3e7a
    add word ptr [0034], 05

loc_1000_3e7a:
    jmp loc_1000_3ed9

loc_1000_3e7d:
    cmp word ptr [bp-1a], 73
    jz loc_1000_3e86
    jmp loc_1000_3ed9

loc_1000_3e86:
    mov ax, 0073
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-2a], ax
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [bp-2a]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0140
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-2c], ax
    mov ax, [bp-2c]
    and ax, ax
    jz loc_1000_3ed6
    mov ax, 0062
    push ax
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0e97
    mov [bp-2e], ax
    mov ax, [bp-2e]
    mov [bp-1c], ax

loc_1000_3ed6:
    jmp loc_1000_3ed9

loc_1000_3ed9:
    lea ax, [bp-22]
    push ax
    call sub_1bd7_09be
    pop si
    mov sp, bp
    pop bp
    retf 0002
