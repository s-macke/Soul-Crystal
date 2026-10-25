; ========================================
; New Subroutine: sub_1000_76d3
; ========================================
sub_1000_76d3:
    push bp
    mov bp, sp
    sub sp, 0058
    push si
    mov cx, 0023
    lea di, [bp-58]
    push ss
    pop es
    xor ax, ax
    repz stosw
    push word ptr [bp+8]
    nop
    push cs
    call sub_1000_333c
    mov word ptr [0072], 0000
    mov word ptr [bp-16], 0000
    mov ax, 0004
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    not ax
    and ax, ax
    jz loc_1000_771f
    mov word ptr [bp-18], 0018
    jmp loc_1000_7763

loc_1000_771f:
    mov ax, 000a
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    not ax
    and ax, ax
    jz loc_1000_775e
    mov word ptr [bp-18], 0051
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    jmp loc_1000_7763

loc_1000_775e:
    mov word ptr [bp-16], ffff

loc_1000_7763:
    mov ax, [bp-16]
    and ax, ax
    jnz loc_1000_776d
    jmp loc_1000_7c8b

loc_1000_776d:
    mov word ptr [bp-16], 0000
    mov word ptr [bp-20], 0000
    mov ax, [bp+6]
    mov [bp-1c], ax
    cmp word ptr [bp-1c], 75
    jz loc_1000_7786
    jmp loc_1000_77b0

loc_1000_7786:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-1e], ax
    cmp word ptr [bp-1e], 31
    jnz loc_1000_779f
    mov word ptr [bp-16], ffff
    jmp loc_1000_77ad

loc_1000_779f:
    cmp word ptr [bp-1e], 30
    jnz loc_1000_77ad
    mov word ptr [bp-16], ffff
    jmp loc_1000_77ad

loc_1000_77ad:
    jmp loc_1000_7c05

loc_1000_77b0:
    cmp word ptr [bp-1c], 3b
    jz loc_1000_77b9
    jmp loc_1000_77e8

loc_1000_77b9:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-22], ax
    cmp word ptr [bp-22], 41
    jnz loc_1000_77d7
    mov word ptr [bp-16], ffff
    mov word ptr [bp-24], 000f
    jmp loc_1000_77e5

loc_1000_77d7:
    cmp word ptr [bp-22], 42
    jnz loc_1000_77e5
    mov word ptr [bp-16], ffff
    jmp loc_1000_77e5

loc_1000_77e5:
    jmp loc_1000_7c05

loc_1000_77e8:
    cmp word ptr [bp-1c], 52
    jz loc_1000_77f1
    jmp loc_1000_783f

loc_1000_77f1:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-26], ax
    cmp word ptr [bp-26], 51
    jz loc_1000_7805
    jmp loc_1000_783c

loc_1000_7805:
    cmp word ptr [0054], ff
    jnz loc_1000_7834
    mov word ptr [bp-20], 0000
    mov word ptr [bp-18], 0113
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    jmp loc_1000_7839

loc_1000_7834:
    mov word ptr [bp-16], ffff

loc_1000_7839:
    jmp loc_1000_783c

loc_1000_783c:
    jmp loc_1000_7c05

loc_1000_783f:
    cmp word ptr [bp-1c], 54
    jz loc_1000_7848
    jmp loc_1000_789b

loc_1000_7848:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-28], ax
    cmp word ptr [bp-28], 6f
    jz loc_1000_785c
    jmp loc_1000_7898

loc_1000_785c:
    mov word ptr [bp-16], ffff
    mov word ptr [bp-24], 000f
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0054
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-18], 0079
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    jmp loc_1000_7898

loc_1000_7898:
    jmp loc_1000_7c05

loc_1000_789b:
    cmp word ptr [bp-1c], 11
    jz loc_1000_78a4
    jmp loc_1000_7a9b

loc_1000_78a4:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-2a], ax
    cmp word ptr [bp-2a], 10
    jz loc_1000_78b8
    jmp loc_1000_7a98

loc_1000_78b8:
    mov word ptr [bp-16], ffff
    mov word ptr [bp-18], 0105
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    mov word ptr [bp-24], 0014
    mov ax, 0001
    push ax
    push word ptr [0044]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-2c], ax
    mov ax, [bp-2c]
    and ax, ax
    jnz loc_1000_78ff
    jmp loc_1000_7a95

loc_1000_78ff:
    mov ax, 01af
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-2e], ax
    mov ax, [bp-2e]
    mov [bp-30], ax
    mov ax, 0014
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-32], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-32]
    push ax
    mov [bp-34], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-34]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-32]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-36], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-36]
    push ax
    mov [bp-38], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-38]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-36]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-3a], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-3a]
    push ax
    mov [bp-3c], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-3c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-3a]
    mov es:[bx], ax
    mov ax, 01b0
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-3e], ax
    mov ax, [bp-3e]
    mov [bp-30], ax
    mov ax, 0014
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-40], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-40]
    push ax
    mov [bp-42], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-42]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-40]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-44], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-44]
    push ax
    mov [bp-46], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-46]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-44]
    mov es:[bx], ax

loc_1000_7a95:
    jmp loc_1000_7a98

loc_1000_7a98:
    jmp loc_1000_7c05

loc_1000_7a9b:
    cmp word ptr [bp-1c], 4b
    jz loc_1000_7aa4
    jmp loc_1000_7b8b

loc_1000_7aa4:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-48], ax
    cmp word ptr [bp-48], 008c
    jz loc_1000_7ab9
    jmp loc_1000_7b19

loc_1000_7ab9:
    mov word ptr [bp-16], ffff
    mov ax, 019f
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-4a], ax
    mov ax, [bp-4a]
    mov [bp-30], ax
    mov ax, 014a
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0118
    mov cx, es:[bx]
    mov [bp-4c], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-4c]
    push ax
    mov [bp-4e], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-4e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0118
    mov ax, [bp-4c]
    mov es:[bx], ax
    jmp loc_1000_7b88

loc_1000_7b19:
    cmp word ptr [bp-48], 008d
    jz loc_1000_7b23
    jmp loc_1000_7b88

loc_1000_7b23:
    mov word ptr [bp-16], ffff
    mov word ptr [bp-24], 000f
    mov ax, 019e
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-50], ax
    mov ax, [bp-50]
    mov [bp-30], ax
    mov ax, 014a
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0116
    mov cx, es:[bx]
    mov [bp-52], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-52]
    push ax
    mov [bp-54], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-54]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0116
    mov ax, [bp-52]
    mov es:[bx], ax
    jmp loc_1000_7b88

loc_1000_7b88:
    jmp loc_1000_7c05

loc_1000_7b8b:
    cmp word ptr [bp-1c], 1d
    jz loc_1000_7b94
    jmp loc_1000_7bc7

loc_1000_7b94:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-56], ax
    cmp word ptr [bp-56], 76
    jz loc_1000_7ba8
    jmp loc_1000_7bc4

loc_1000_7ba8:
    mov word ptr [bp-16], ffff
    mov word ptr [bp-24], 0014
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 001d
    push ax
    nop
    push cs
    call sub_1000_3041
    jmp loc_1000_7bc4

loc_1000_7bc4:
    jmp loc_1000_7c05

loc_1000_7bc7:
    cmp word ptr [bp-1c], 0099
    jz loc_1000_7bd1
    jmp loc_1000_7c00

loc_1000_7bd1:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-58], ax
    cmp word ptr [bp-58], 57
    jnz loc_1000_7bea
    mov word ptr [bp-16], ffff
    jmp loc_1000_7bfd

loc_1000_7bea:
    cmp word ptr [bp-58], 58
    jnz loc_1000_7bfd
    mov word ptr [bp-16], ffff
    mov word ptr [bp-24], 0005
    jmp loc_1000_7bfd

loc_1000_7bfd:
    jmp loc_1000_7c05

loc_1000_7c00:
    mov word ptr [bp-18], 0017

loc_1000_7c05:
    mov ax, [bp-16]
    and ax, ax
    jnz loc_1000_7c0f
    jmp loc_1000_7c61

loc_1000_7c0f:
    mov ax, 000a
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8ade
    add sp, 04
    cmp word ptr [bp-18], 00
    jnz loc_1000_7c2a
    mov word ptr [bp-18], 0016

loc_1000_7c2a:
    cmp word ptr [bp-24], 00
    mov ax, 0000
    jle loc_1000_7c34
    dec ax

loc_1000_7c34:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_7c3f
    jmp loc_1000_7c56

loc_1000_7c3f:
    mov ax, [bp-24]
    add [0034], ax
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_7c56:
    push word ptr [bp+8]
    nop
    push cs
    call sub_1000_33e6
    jmp loc_1000_7c8b

loc_1000_7c61:
    mov ax, [bp-20]
    and ax, ax
    jnz loc_1000_7c6b
    jmp loc_1000_7c8b

loc_1000_7c6b:
    mov word ptr [bp-18], 0052
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax

loc_1000_7c8b:
    push word ptr [bp-18]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf 0004
