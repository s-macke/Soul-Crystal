; ========================================
; New Subroutine: sub_1000_7ca3
; ========================================
sub_1000_7ca3:
    push bp
    mov bp, sp
    sub sp, 001a
    push si
    mov cx, 0004
    lea di, [bp-1a]
    push ss
    pop es
    xor ax, ax
    repz stosw
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov ax, [bp+6]
    mov [bp-14], ax
    cmp word ptr [bp-14], 0088
    jnz loc_1000_7cd5
    mov word ptr [bp-16], 00c6
    jmp loc_1000_7da4

loc_1000_7cd5:
    cmp word ptr [bp-14], 008e
    jz loc_1000_7cdf
    jmp loc_1000_7d20

loc_1000_7cdf:
    mov ax, [004a]
    mov [bp-18], ax
    cmp word ptr [bp-18], 00
    jnz loc_1000_7cf3
    mov word ptr [bp-16], 00c7
    jmp loc_1000_7d1d

loc_1000_7cf3:
    cmp word ptr [bp-18], 01
    jnz loc_1000_7d01
    mov word ptr [bp-16], 00c9
    jmp loc_1000_7d1d

loc_1000_7d01:
    cmp word ptr [bp-18], 02
    jnz loc_1000_7d0f
    mov word ptr [bp-16], 00c8
    jmp loc_1000_7d1d

loc_1000_7d0f:
    cmp word ptr [bp-18], 03
    jnz loc_1000_7d1d
    mov word ptr [bp-16], 0035
    jmp loc_1000_7d1d

loc_1000_7d1d:
    jmp loc_1000_7da4

loc_1000_7d20:
    cmp word ptr [bp-14], 6e
    jnz loc_1000_7d2e
    mov word ptr [bp-16], 0033
    jmp loc_1000_7da4

loc_1000_7d2e:
    cmp word ptr [bp-14], 24
    jnz loc_1000_7d3c
    mov word ptr [bp-16], 002c
    jmp loc_1000_7da4

loc_1000_7d3c:
    cmp word ptr [bp-14], 03
    jnz loc_1000_7d4a
    mov word ptr [bp-16], 002a
    jmp loc_1000_7da4

loc_1000_7d4a:
    cmp word ptr [bp-14], 00a3
    jnz loc_1000_7d59
    mov word ptr [bp-16], 0039
    jmp loc_1000_7da4

loc_1000_7d59:
    cmp word ptr [bp-14], 14
    jnz loc_1000_7d67
    mov word ptr [bp-16], 002b
    jmp loc_1000_7da4

loc_1000_7d67:
    cmp word ptr [bp-14], 7d
    jnz loc_1000_7d75
    mov word ptr [bp-16], 0034
    jmp loc_1000_7da4

loc_1000_7d75:
    cmp word ptr [bp-14], 0097
    jnz loc_1000_7d84
    mov word ptr [bp-16], 0037
    jmp loc_1000_7da4

loc_1000_7d84:
    cmp word ptr [bp-14], 0094
    jnz loc_1000_7d93
    mov word ptr [bp-16], 0036
    jmp loc_1000_7da4

loc_1000_7d93:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_10fc
    mov [bp-1a], ax
    mov ax, [bp-1a]
    mov [bp-16], ax

loc_1000_7da4:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6
    cmp word ptr [bp-16], 00
    jz loc_1000_7db5
    jmp loc_1000_7dc4

loc_1000_7db5:
    mov ax, 000b
    push ax
    xor ax, ax
    push ax
    nop
    push cs
    call sub_1000_0a2d
    jmp loc_1000_7de4

loc_1000_7dc4:
    push word ptr [bp-16]
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

loc_1000_7de4:
    pop si
    mov sp, bp
    pop bp
    retf 0002
