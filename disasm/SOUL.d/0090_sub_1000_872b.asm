; ========================================
; New Subroutine: sub_1000_872b
; ========================================
sub_1000_872b:
    push bp
    mov bp, sp
    sub sp, 0090
    push si
    mov cx, 003f
    lea di, [bp-90]
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
    mov word ptr [bp-16], 0000
    cmp word ptr [bp+6], 13
    jnz loc_1000_877b
    mov word ptr [bp-18], 00e9
    jmp loc_1000_880a

loc_1000_877b:
    cmp word ptr [bp+6], 19
    jnz loc_1000_8789
    mov word ptr [bp-18], 00ec
    jmp loc_1000_880a

loc_1000_8789:
    mov ax, 0004
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    and ax, ax
    jnz loc_1000_87a6
    jmp loc_1000_880a

loc_1000_87a6:
    mov ax, 000a
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1c], ax
    mov ax, [bp-1c]
    and ax, ax
    jz loc_1000_87ce
    mov word ptr [bp-18], 0011
    mov word ptr [0072], 0000
    jmp loc_1000_880a

loc_1000_87ce:
    mov ax, 0009
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1e], ax
    mov ax, [bp-1e]
    and ax, ax
    jz loc_1000_87f0
    mov word ptr [bp-18], 003f
    jmp loc_1000_880a

loc_1000_87f0:
    mov ax, 0009
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov word ptr [bp-18], 003e
    mov word ptr [bp-16], ffff

loc_1000_880a:
    mov ax, [bp-16]
    and ax, ax
    jnz loc_1000_8814
    jmp loc_1000_9159

loc_1000_8814:
    mov ax, [bp+6]
    mov [bp-20], ax
    cmp word ptr [bp-20], 30
    jz loc_1000_8823
    jmp loc_1000_8871

loc_1000_8823:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-22], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-22]
    push ax
    mov [bp-24], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-24]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-22]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_8871:
    cmp word ptr [bp-20], 31
    jz loc_1000_887a
    jmp loc_1000_88c8

loc_1000_887a:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-26], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-26]
    push ax
    mov [bp-28], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-28]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-26]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_88c8:
    cmp word ptr [bp-20], 5a
    jz loc_1000_88d1
    jmp loc_1000_891f

loc_1000_88d1:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
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
    add bx, 04
    add bx, 08
    mov ax, [bp-2a]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_891f:
    cmp word ptr [bp-20], 40
    jz loc_1000_8928
    jmp loc_1000_8976

loc_1000_8928:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-2e], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-2e]
    push ax
    mov [bp-30], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-30]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-2e]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_8976:
    cmp word ptr [bp-20], 63
    jz loc_1000_897f
    jmp loc_1000_89cd

loc_1000_897f:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-32], cx
    mov bx, ax
    mov ax, 0010
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
    add bx, 00
    add bx, 08
    mov ax, [bp-32]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_89cd:
    cmp word ptr [bp-20], 41
    jz loc_1000_89d6
    jmp loc_1000_8a24

loc_1000_89d6:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-36], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-36]
    push ax
    mov [bp-38], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-38]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-36]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_8a24:
    cmp word ptr [bp-20], 42
    jz loc_1000_8a2d
    jmp loc_1000_8a7b

loc_1000_8a2d:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-3a], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-3a]
    push ax
    mov [bp-3c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-3c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-3a]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_8a7b:
    cmp word ptr [bp-20], 77
    jz loc_1000_8a84
    jmp loc_1000_8aa3

loc_1000_8a84:
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_8a8e
    jmp loc_1000_8aa0

loc_1000_8a8e:
    push word ptr [0032]
    mov ax, 0083
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov word ptr [bp-14], 0005

loc_1000_8aa0:
    jmp loc_1000_9122

loc_1000_8aa3:
    cmp word ptr [bp-20], 00a0
    jz loc_1000_8aad
    jmp loc_1000_8afb

loc_1000_8aad:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-3e], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-3e]
    push ax
    mov [bp-40], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-40]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-3e]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_8afb:
    cmp word ptr [bp-20], 35
    jz loc_1000_8b04
    jmp loc_1000_8b4f

loc_1000_8b04:
    mov ax, [0144]
    not ax
    mov [bp-44], ax
    mov ax, 000d
    push ax
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00a2
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-42], ax
    mov ax, [bp-42]
    mov [bp-46], ax
    not ax
    and ax, [bp-44]
    and ax, ax
    jnz loc_1000_8b3f
    jmp loc_1000_8b4c

loc_1000_8b3f:
    push word ptr [0032]
    mov ax, 0052
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_8b4c:
    jmp loc_1000_9122

loc_1000_8b4f:
    cmp word ptr [bp-20], 51
    jz loc_1000_8b58
    jmp loc_1000_8bc8

loc_1000_8b58:
    cmp word ptr [0054], ff
    jz loc_1000_8b62
    jmp loc_1000_8b7a

loc_1000_8b62:
    mov word ptr [bp-18], 0113
    mov ax, 0009
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8ade
    add sp, 04
    jmp loc_1000_8bc5

loc_1000_8b7a:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-48], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-48]
    push ax
    mov [bp-4a], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-4a]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-48]
    mov es:[bx], ax

loc_1000_8bc5:
    jmp loc_1000_9122

loc_1000_8bc8:
    cmp word ptr [bp-20], 55
    jz loc_1000_8bd7
    cmp word ptr [bp-20], 56
    jz loc_1000_8bd7
    jmp loc_1000_8d90

loc_1000_8bd7:
    mov word ptr [bp-16], ffff
    mov ax, 0139
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-4c], ax
    mov ax, [bp-4c]
    mov [bp-44], ax
    cmp ax, [0032]
    jz loc_1000_8bf7
    jmp loc_1000_8cc8

loc_1000_8bf7:
    mov ax, 000d
    push ax
    mov ax, 014a
    imul word ptr [bp-44]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00d8
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-4e], ax
    mov ax, [bp-4e]
    and ax, ax
    jnz loc_1000_8c28
    jmp loc_1000_8cbb

loc_1000_8c28:
    mov ax, 014a
    imul word ptr [bp-44]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00a8
    mov cx, es:[bx]
    mov [bp-50], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-50]
    push ax
    mov [bp-52], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-52]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00a8
    mov ax, [bp-50]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-44]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-54], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-54]
    push ax
    mov [bp-56], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-56]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-54]
    mov es:[bx], ax
    jmp loc_1000_8cc5

loc_1000_8cbb:
    mov word ptr [bp-16], 0000
    mov word ptr [bp-18], 0002

loc_1000_8cc5:
    jmp loc_1000_8d6a

loc_1000_8cc8:
    mov ax, 013b
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-58], ax
    mov ax, [bp-58]
    mov [bp-44], ax
    mov ax, 014a
    imul word ptr [bp-44]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00aa
    mov cx, es:[bx]
    mov [bp-5a], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-5a]
    push ax
    mov [bp-5c], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-5c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00aa
    mov ax, [bp-5a]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-44]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-5e], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-5e]
    push ax
    mov [bp-60], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-60]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-5e]
    mov es:[bx], ax

loc_1000_8d6a:
    mov ax, [bp-16]
    and ax, ax
    jnz loc_1000_8d74
    jmp loc_1000_8d8d

loc_1000_8d74:
    mov word ptr [bp-14], 0000
    mov ax, [0144]
    and ax, ax
    jz loc_1000_8d88
    mov word ptr [bp-18], 0074
    jmp loc_1000_8d8d

loc_1000_8d88:
    mov word ptr [bp-18], 003e

loc_1000_8d8d:
    jmp loc_1000_9122

loc_1000_8d90:
    cmp word ptr [bp-20], 6f
    jz loc_1000_8d99
    jmp loc_1000_8de7

loc_1000_8d99:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-62], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-62]
    push ax
    mov [bp-64], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-64]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-62]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_8de7:
    cmp word ptr [bp-20], 06
    jz loc_1000_8df0
    jmp loc_1000_8e43

loc_1000_8df0:
    mov word ptr [bp-14], 000f
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-66], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-66]
    push ax
    mov [bp-68], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-68]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-66]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_8e43:
    cmp word ptr [bp-20], 1e
    jz loc_1000_8e4c
    jmp loc_1000_8e68

loc_1000_8e4c:
    mov ax, [0144]
    not ax
    and ax, ax
    jnz loc_1000_8e58
    jmp loc_1000_8e65

loc_1000_8e58:
    push word ptr [0032]
    mov ax, 0060
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_8e65:
    jmp loc_1000_9122

loc_1000_8e68:
    cmp word ptr [bp-20], 008d
    jz loc_1000_8e72
    jmp loc_1000_8f1c

loc_1000_8e72:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-6a], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-6a]
    push ax
    mov [bp-6c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-6c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-6a]
    mov es:[bx], ax
    mov ax, 019e
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-6e], ax
    mov ax, [bp-6e]
    mov [bp-44], ax
    mov ax, 0014
    imul word ptr [bp-44]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-70], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-70]
    push ax
    mov [bp-72], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-72]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-70]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_8f1c:
    cmp word ptr [bp-20], 008c
    jz loc_1000_8f26
    jmp loc_1000_8fd0

loc_1000_8f26:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-74], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-74]
    push ax
    mov [bp-76], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-76]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-74]
    mov es:[bx], ax
    mov ax, 019f
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-78], ax
    mov ax, [bp-78]
    mov [bp-44], ax
    mov ax, 0014
    imul word ptr [bp-44]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-7a], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-7a]
    push ax
    mov [bp-7c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-7c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-7a]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_8fd0:
    cmp word ptr [bp-20], 33
    jnz loc_1000_8fde
    mov word ptr [bp-18], 00eb
    jmp loc_1000_9122

loc_1000_8fde:
    cmp word ptr [bp-20], 58
    jz loc_1000_8fed
    cmp word ptr [bp-20], 57
    jz loc_1000_8fed
    jmp loc_1000_90b1

loc_1000_8fed:
    mov ax, 01a0
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-7e], ax
    mov ax, [bp-7e]
    mov [bp-44], ax
    mov ax, 0014
    imul word ptr [bp-44]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-80], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-80]
    push ax
    mov [bp-82], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-82]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-80]
    mov es:[bx], ax
    mov ax, 019e
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-84], ax
    mov ax, [bp-84]
    mov [bp-44], ax
    mov ax, 0014
    imul word ptr [bp-44]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-86], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-86]
    push ax
    mov [bp-88], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-88]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-86]
    mov es:[bx], ax
    jmp loc_1000_9122

loc_1000_90b1:
    cmp word ptr [bp-20], 76
    jz loc_1000_90ba
    jmp loc_1000_9122

loc_1000_90ba:
    mov ax, 000d
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 38
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-8a], ax
    mov ax, [bp-8a]
    mov [bp-8e], ax
    mov ax, 0001
    push ax
    push word ptr [0042]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-8c], ax
    mov ax, [bp-8c]
    not ax
    mov [bp-46], ax
    and ax, [bp-8e]
    and ax, ax
    jnz loc_1000_9112
    jmp loc_1000_911f

loc_1000_9112:
    push word ptr [0032]
    mov ax, 0020
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_911f:
    jmp loc_1000_9122

loc_1000_9122:
    cmp word ptr [bp-14], 00
    mov ax, 0000
    jl loc_1000_912c
    dec ax

loc_1000_912c:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_9137
    jmp loc_1000_914e

loc_1000_9137:
    mov ax, [bp-14]
    add [0034], ax
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_914e:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6
    jmp loc_1000_918f

loc_1000_9159:
    mov ax, [bp+6]
    mov [bp-90], ax
    cmp word ptr [bp-90], 0097
    jnz loc_1000_9170
    mov word ptr [bp-18], 0268
    jmp loc_1000_918f

loc_1000_9170:
    cmp word ptr [bp-90], 0094
    jnz loc_1000_9180
    mov word ptr [bp-18], 0268
    jmp loc_1000_918f

loc_1000_9180:
    cmp word ptr [bp-90], 4d
    jnz loc_1000_918f
    mov word ptr [bp-18], 0268
    jmp loc_1000_918f

loc_1000_918f:
    cmp word ptr [bp-18], 00
    jnz loc_1000_919a
    mov word ptr [bp-18], 0040

loc_1000_919a:
    push word ptr [bp-18]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf 0002
