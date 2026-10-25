; ========================================
; New Subroutine: sub_1000_ba88
; ========================================
sub_1000_ba88:
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
    mov word ptr [bp-14], ffff
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    mov ax, [bp+6]
    mov [bp-16], ax
    cmp word ptr [bp-16], 55
    jz loc_1000_bada
    cmp word ptr [bp-16], 56
    jz loc_1000_bada
    jmp loc_1000_bc60

loc_1000_bada:
    mov word ptr [bp-1c], ffff
    mov ax, 0139
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-18], ax
    mov ax, [bp-18]
    mov [bp-1e], ax
    cmp ax, [0032]
    jz loc_1000_bafa
    jmp loc_1000_bb90

loc_1000_bafa:
    mov ax, 000d
    push ax
    mov ax, 014a
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00d8
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    and ax, ax
    jnz loc_1000_bb2b
    jmp loc_1000_bb88

loc_1000_bb2b:
    mov ax, 0009
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, 0014
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-20], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-20]
    push ax
    mov [bp-22], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-22]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-20]
    mov es:[bx], ax
    jmp loc_1000_bb8d

loc_1000_bb88:
    mov word ptr [bp-1c], 0000

loc_1000_bb8d:
    jmp loc_1000_bc32

loc_1000_bb90:
    mov ax, 013b
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-24], ax
    mov ax, [bp-24]
    mov [bp-1e], ax
    mov ax, 014a
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00aa
    mov cx, es:[bx]
    mov [bp-26], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-26]
    push ax
    mov [bp-28], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-28]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00aa
    mov ax, [bp-26]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-2a], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-2a]
    push ax
    mov [bp-2c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-2c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-2a]
    mov es:[bx], ax

loc_1000_bc32:
    mov ax, [bp-1c]
    and ax, ax
    jnz loc_1000_bc3c
    jmp loc_1000_bc58

loc_1000_bc3c:
    mov word ptr [bp-14], 0000
    mov ax, [0144]
    and ax, ax
    jz loc_1000_bc50
    mov word ptr [bp-2e], 0074
    jmp loc_1000_bc55

loc_1000_bc50:
    mov word ptr [bp-2e], 003e

loc_1000_bc55:
    jmp loc_1000_bc5d

loc_1000_bc58:
    mov word ptr [bp-2e], 0002

loc_1000_bc5d:
    jmp loc_1000_bd28

loc_1000_bc60:
    cmp word ptr [bp-16], 34
    jz loc_1000_bc69
    jmp loc_1000_bd06

loc_1000_bc69:
    mov word ptr [bp-2e], 00ed
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 64
    mov cx, es:[bx]
    mov [bp-30], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-30]
    push ax
    mov [bp-32], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-32]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 64
    mov ax, [bp-30]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-34], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-34]
    push ax
    mov [bp-36], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-36]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-34]
    mov es:[bx], ax
    mov word ptr [bp-14], 0032
    jmp loc_1000_bd28

loc_1000_bd06:
    cmp word ptr [bp-16], 2f
    jz loc_1000_bd15
    cmp word ptr [bp-16], 04
    jz loc_1000_bd15
    jmp loc_1000_bd1d

loc_1000_bd15:
    mov word ptr [bp-2e], 0114
    jmp loc_1000_bd28

loc_1000_bd1d:
    mov word ptr [bp-2e], 0018
    mov word ptr [0072], 0000

loc_1000_bd28:
    cmp word ptr [bp-14], 00
    mov ax, 0000
    jl loc_1000_bd32
    dec ax

loc_1000_bd32:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_bd3d
    jmp loc_1000_bd54

loc_1000_bd3d:
    mov ax, [bp-14]
    add [0034], ax
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_bd54:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6
    push word ptr [bp-2e]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf 0002
