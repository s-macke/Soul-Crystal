; ========================================
; New Subroutine: sub_1000_750d
; ========================================
sub_1000_750d:
    push bp
    mov bp, sp
    sub sp, 0024
    push si
    mov cx, 0009
    lea di, [bp-24]
    push ss
    pop es
    xor ax, ax
    repz stosw
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov word ptr [bp-1c], ffff
    mov ax, 0005
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    and ax, ax
    jnz loc_1000_754c
    jmp loc_1000_7684

loc_1000_754c:
    mov ax, [bp+6]
    mov [bp-16], ax
    cmp word ptr [bp-16], 0c
    jz loc_1000_755b
    jmp loc_1000_75db

loc_1000_755b:
    mov ax, 0003
    push ax
    mov cx, [0036]
    inc cx
    push cx
    call sub_1bd7_8b53
    add sp, 04
    mov [bp-18], ax
    mov ax, [bp-18]
    mov [0036], ax
    cmp word ptr [0036], 03
    mov ax, 0000
    jnz loc_1000_7581
    dec ax

loc_1000_7581:
    mov [bp-1e], ax
    mov ax, 000d
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0092
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    not ax
    and ax, [bp-1e]
    mov [bp-1e], ax
    and ax, ax
    jnz loc_1000_75be
    jmp loc_1000_75d3

loc_1000_75be:
    push word ptr [0032]
    mov ax, 004a
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov word ptr [bp-20], 0084
    jmp loc_1000_75d8

loc_1000_75d3:
    mov word ptr [bp-20], 0083

loc_1000_75d8:
    jmp loc_1000_7650

loc_1000_75db:
    cmp word ptr [bp-16], 34
    jnz loc_1000_75ef
    mov word ptr [0148], 0014
    mov word ptr [bp-20], 00ee
    jmp loc_1000_7650

loc_1000_75ef:
    cmp word ptr [bp-16], 32
    jz loc_1000_75f8
    jmp loc_1000_7650

loc_1000_75f8:
    mov word ptr [bp-20], 0101
    mov ax, 00cc
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-22], ax
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [bp-22]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-24], ax
    mov ax, [bp-24]
    not ax
    and ax, ax
    jnz loc_1000_763b
    jmp loc_1000_7648

loc_1000_763b:
    push word ptr [0032]
    mov ax, 0061
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_7648:
    mov word ptr [bp-1c], 000a
    jmp loc_1000_7650

loc_1000_7650:
    cmp word ptr [bp-1c], 00
    mov ax, 0000
    jl loc_1000_765a
    dec ax

loc_1000_765a:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_7665
    jmp loc_1000_7684

loc_1000_7665:
    mov ax, [bp-1c]
    add [0034], ax
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6

loc_1000_7684:
    cmp word ptr [bp-20], 00
    jnz loc_1000_768f
    mov word ptr [bp-20], 0041

loc_1000_768f:
    push word ptr [bp-20]
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
    mov si, 0080
    mov bx, 000e
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 04
    mov ax, [bp+6]
    mov es:[bx], ax
    pop si
    mov sp, bp
    pop bp
    retf 0002
