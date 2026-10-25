; ========================================
; New Subroutine: sub_1000_b724
; ========================================
sub_1000_b724:
    push bp
    mov bp, sp
    sub sp, 0028
    push si
    mov cx, 000b
    lea di, [bp-28]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, [bp+6]
    mov [bp-14], ax
    cmp word ptr [bp-14], 3a
    jz loc_1000_b748
    jmp loc_1000_b75d

loc_1000_b748:
    mov word ptr [bp-16], 0094
    push word ptr [0032]
    mov ax, 003a
    push ax
    nop
    push cs
    call sub_1000_3041
    jmp loc_1000_ba47

loc_1000_b75d:
    cmp word ptr [bp-14], 4f
    jnz loc_1000_b76b
    mov word ptr [bp-16], 0095
    jmp loc_1000_ba47

loc_1000_b76b:
    cmp word ptr [bp-14], 4c
    jnz loc_1000_b779
    mov word ptr [bp-16], 0095
    jmp loc_1000_ba47

loc_1000_b779:
    cmp word ptr [bp-14], 02
    jnz loc_1000_b787
    mov word ptr [bp-16], 0092
    jmp loc_1000_ba47

loc_1000_b787:
    cmp word ptr [bp-14], 4a
    jnz loc_1000_b795
    mov word ptr [bp-16], 0064
    jmp loc_1000_ba47

loc_1000_b795:
    cmp word ptr [bp-14], 61
    jz loc_1000_b79e
    jmp loc_1000_b7bf

loc_1000_b79e:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-18], ax
    cmp word ptr [bp-18], 00cf
    jnz loc_1000_b7bc
    mov word ptr [0148], 0005
    mov word ptr [bp-16], 0096

loc_1000_b7bc:
    jmp loc_1000_ba47

loc_1000_b7bf:
    cmp word ptr [bp-14], 1a
    jz loc_1000_b7c8
    jmp loc_1000_b7dd

loc_1000_b7c8:
    mov word ptr [bp-16], 0093
    push word ptr [0032]
    mov ax, 001a
    push ax
    nop
    push cs
    call sub_1000_3041
    jmp loc_1000_ba47

loc_1000_b7dd:
    cmp word ptr [bp-14], 00a3
    jnz loc_1000_b7f2
    mov word ptr [bp-16], 0024
    mov word ptr [014a], ffff
    jmp loc_1000_ba47

loc_1000_b7f2:
    cmp word ptr [bp-14], 009f
    jz loc_1000_b7fc
    jmp loc_1000_b850

loc_1000_b7fc:
    cmp word ptr [004a], 03
    mov ax, 0000
    jnz loc_1000_b807
    dec ax

loc_1000_b807:
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 011a
    and ax, es:[bx]
    and ax, ax
    jnz loc_1000_b820
    jmp loc_1000_b84d

loc_1000_b820:
    add word ptr [0034], 64
    mov word ptr [004e], 0004
    mov ax, 0001
    push ax
    mov ax, 005e
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov word ptr [bp-16], 009a
    push word ptr [0032]
    mov ax, 009f
    push ax
    nop
    push cs
    call sub_1000_3041

loc_1000_b84d:
    jmp loc_1000_ba47

loc_1000_b850:
    cmp word ptr [bp-14], 74
    jz loc_1000_b859
    jmp loc_1000_b87f

loc_1000_b859:
    add word ptr [0034], 32
    mov word ptr [0050], 0000
    push word ptr [0032]
    mov ax, 0074
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-16], 0097
    mov word ptr [0054], 0001
    jmp loc_1000_ba47

loc_1000_b87f:
    cmp word ptr [bp-14], 19
    jnz loc_1000_b893
    mov word ptr [0148], 0010
    mov word ptr [bp-16], 008d
    jmp loc_1000_ba47

loc_1000_b893:
    cmp word ptr [bp-14], 20
    jz loc_1000_b89c
    jmp loc_1000_b8cd

loc_1000_b89c:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    cmp word ptr es:[bx], 04
    jnz loc_1000_b8c5
    mov word ptr [bp-16], 008e
    mov word ptr [0148], 0015
    jmp loc_1000_b8ca

loc_1000_b8c5:
    mov word ptr [bp-16], 010e

loc_1000_b8ca:
    jmp loc_1000_ba47

loc_1000_b8cd:
    cmp word ptr [bp-14], 23
    jz loc_1000_b8d6
    jmp loc_1000_b9c3

loc_1000_b8d6:
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00d2
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    mov [bp-20], ax
    mov ax, 01a6
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-1c], ax
    mov ax, [bp-1c]
    mov [bp-22], ax
    mov ax, 0009
    push ax
    mov ax, 014a
    imul word ptr [bp-22]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 3a
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1e], ax
    mov ax, [bp-1e]
    mov [bp-24], ax
    mov cx, [bp-20]
    and cx, cx
    jnz loc_1000_b94c
    jmp loc_1000_b97d

loc_1000_b94c:
    and ax, ax
    jz loc_1000_b95e
    mov word ptr [0148], 0019
    mov word ptr [bp-16], 007c
    jmp loc_1000_b97a

loc_1000_b95e:
    mov word ptr [bp-16], 0090
    mov ax, 01a6
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-26], ax
    mov ax, [bp-26]
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce

loc_1000_b97a:
    jmp loc_1000_b9c0

loc_1000_b97d:
    mov word ptr [bp-16], 008f
    add word ptr [0034], 0320
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0023
    push ax
    nop
    push cs
    call sub_1000_3041
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 00a4
    push ax
    nop
    push cs
    call sub_1000_3041
    push word ptr [0032]
    mov ax, 0022
    push ax
    nop
    push cs
    call sub_1000_2f74
    push word ptr [0032]
    mov ax, 0078
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_b9c0:
    jmp loc_1000_ba47

loc_1000_b9c3:
    cmp word ptr [bp-14], 4e
    jz loc_1000_b9cc
    jmp loc_1000_ba1c

loc_1000_b9cc:
    mov ax, 0002
    push ax
    push word ptr [005e]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-28], ax
    mov ax, [bp-28]
    and ax, ax
    jnz loc_1000_b9e9
    jmp loc_1000_ba14

loc_1000_b9e9:
    mov word ptr [bp-16], 0091
    add word ptr [0034], 32
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 004e
    push ax
    nop
    push cs
    call sub_1000_3041
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 006a
    push ax
    nop
    push cs
    call sub_1000_3041
    jmp loc_1000_ba19

loc_1000_ba14:
    mov word ptr [bp-16], 0092

loc_1000_ba19:
    jmp loc_1000_ba47

loc_1000_ba1c:
    cmp word ptr [bp-14], 00a5
    jnz loc_1000_ba2b
    mov word ptr [bp-16], 0069
    jmp loc_1000_ba47

loc_1000_ba2b:
    cmp word ptr [bp-14], 01
    jnz loc_1000_ba39
    mov word ptr [bp-16], 008c
    jmp loc_1000_ba47

loc_1000_ba39:
    cmp word ptr [bp-14], 60
    jnz loc_1000_ba47
    mov word ptr [bp-16], 0093
    jmp loc_1000_ba47

loc_1000_ba47:
    cmp word ptr [bp-16], 00
    jnz loc_1000_ba5c
    mov cx, 0004
    mov ax, [0030]
    cwd
    idiv cx
    add dx, 25
    mov [bp-16], dx

loc_1000_ba5c:
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
    pop si
    mov sp, bp
    pop bp
    retf 0002
