; ========================================
; New Subroutine: sub_1000_65cf
; ========================================
sub_1000_65cf:
    push bp
    mov bp, sp
    sub sp, 001c
    push si
    mov cx, 0005
    lea di, [bp-1c]
    push ss
    pop es
    xor ax, ax
    repz stosw
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    cmp word ptr [bp+8], 47
    jz loc_1000_65f5
    jmp loc_1000_6637

loc_1000_65f5:
    mov ax, [bp+6]
    mov [bp-14], ax
    cmp word ptr [bp-14], 14
    jz loc_1000_6604
    jmp loc_1000_6620

loc_1000_6604:
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0047
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-16], 0014
    mov word ptr [bp-18], 0104
    jmp loc_1000_6634

loc_1000_6620:
    cmp word ptr [bp-14], 0095
    jnz loc_1000_662f
    mov word ptr [bp-18], 0117
    jmp loc_1000_6634

loc_1000_662f:
    mov word ptr [bp-18], 0119

loc_1000_6634:
    jmp loc_1000_6698

loc_1000_6637:
    cmp word ptr [bp+8], 10
    jz loc_1000_6640
    jmp loc_1000_6698

loc_1000_6640:
    cmp word ptr [bp+6], 53
    jz loc_1000_6649
    jmp loc_1000_6698

loc_1000_6649:
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 1e
    mov cx, es:[bx]
    mov [bp-1a], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-1a]
    push ax
    mov [bp-1c], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-1c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 1e
    mov ax, [bp-1a]
    mov es:[bx], ax
    mov word ptr [bp-16], 002d
    mov word ptr [bp-18], 0102

loc_1000_6698:
    cmp word ptr [bp-16], 00
    mov ax, 0000
    jle loc_1000_66a2
    dec ax

loc_1000_66a2:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_66ad
    jmp loc_1000_66cc

loc_1000_66ad:
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, [bp-16]
    add [0034], ax
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6

loc_1000_66cc:
    cmp word ptr [bp-18], 00
    jnz loc_1000_66d7
    mov word ptr [bp-18], 004f

loc_1000_66d7:
    push word ptr [bp-18]
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
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf 0004
