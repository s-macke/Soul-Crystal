; ========================================
; New Subroutine: sub_1000_361b
; ========================================
sub_1000_361b:
    push bp
    mov bp, sp
    sub sp, 0040
    push si
    mov cx, 0017
    lea di, [bp-40]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, [0058]
    mov dx, [005a]
    add ax, 0001
    adc dx, 00
    mov [0058], ax
    mov [005a], dx
    mov ax, 000f
    push ax
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 42
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    and ax, ax
    jz loc_1000_3686
    xor ax, ax
    push ax
    mov ax, [0034]
    sub ax, 000a
    push ax
    call sub_1bd7_8b65
    add sp, 04
    mov [bp-16], ax
    mov ax, [bp-16]
    mov [0034], ax

loc_1000_3686:
    cmp word ptr [3734], 00
    mov ax, 0000
    jle loc_1000_3691
    dec ax

loc_1000_3691:
    mov cx, [372a]
    not cx
    and ax, cx
    and ax, ax
    jnz loc_1000_36a0
    jmp loc_1000_36ea

loc_1000_36a0:
    mov ax, 372c
    push ax
    call sub_1bd7_8aa4
    add sp, 02
    cmp word ptr [372c], 02
    jle loc_1000_36b9
    mov word ptr [373a], 0003

loc_1000_36b9:
    nop
    push cs
    call sub_1000_28ff
    push word ptr [3734]
    push word ptr [372e]
    nop
    push cs
    call sub_1000_0a2d
    mov ax, [3738]
    mov [0032], ax
    cmp word ptr [372c], 03
    mov ax, 0000
    jge loc_1000_36dc
    dec ax

loc_1000_36dc:
    mov cx, 0003
    imul cx
    inc ax
    neg ax
    mov [014a], ax
    jmp loc_1000_3c86

loc_1000_36ea:
    cmp word ptr [0148], 00
    jz loc_1000_36f4
    jmp loc_1000_37ca

loc_1000_36f4:
    mov ax, [003a]
    and ax, 000e
    cmp ax, 000e
    jnz loc_1000_3702
    jmp loc_1000_37c4

loc_1000_3702:
    mov ax, 000f
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
    mov [bp-18], ax
    mov ax, [bp-18]
    not ax
    and ax, ax
    jnz loc_1000_3735
    jmp loc_1000_37bb

loc_1000_3735:
    mov ax, 003c
    push ax
    call sub_1bd7_8aa4
    add sp, 02
    mov ax, [003c]
    mov [bp-1a], ax
    cmp word ptr [bp-1a], 19
    jz loc_1000_375c
    cmp word ptr [bp-1a], 32
    jz loc_1000_375c
    cmp word ptr [bp-1a], 4b
    jz loc_1000_375c
    jmp loc_1000_3780

loc_1000_375c:
    mov ax, 0018
    push ax
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
    jmp loc_1000_37b8

loc_1000_3780:
    cmp word ptr [bp-1a], 64
    jz loc_1000_3789
    jmp loc_1000_37b8

loc_1000_3789:
    mov word ptr [0148], 0001
    nop
    push cs
    call sub_1000_28ff
    mov ax, 0019
    push ax
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
    jmp loc_1000_37b8

loc_1000_37b8:
    jmp loc_1000_37c1

loc_1000_37bb:
    mov word ptr [003c], 0000

loc_1000_37c1:
    jmp loc_1000_37ca

loc_1000_37c4:
    mov word ptr [003c], 0000

loc_1000_37ca:
    cmp word ptr [0148], 00
    jz loc_1000_37d4
    jmp loc_1000_3b4a

loc_1000_37d4:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-1c], ax
    mov ax, [bp-1c]
    mov [bp-20], ax
    mov [bp-1e], ax
    cmp word ptr [bp-1e], 00cb
    jz loc_1000_37f3
    jmp loc_1000_383c

loc_1000_37f3:
    cmp word ptr [0040], 06
    jl loc_1000_37fd
    jmp loc_1000_3839

loc_1000_37fd:
    mov ax, 0040
    push ax
    call sub_1bd7_8aa4
    add sp, 02
    cmp word ptr [0040], 05
    jz loc_1000_3813
    jmp loc_1000_3839

loc_1000_3813:
    nop
    push cs
    call sub_1000_28ff
    mov ax, 0077
    push ax
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

loc_1000_3839:
    jmp loc_1000_3b4a

loc_1000_383c:
    cmp word ptr [bp-1e], 00db
    jz loc_1000_3846
    jmp loc_1000_386a

loc_1000_3846:
    cmp word ptr [0046], 00
    jl loc_1000_3867
    mov ax, 0003
    push ax
    mov ax, [0046]
    inc ax
    push ax
    call sub_1bd7_8b53
    add sp, 04
    mov [bp-22], ax
    mov ax, [bp-22]
    mov [0046], ax

loc_1000_3867:
    jmp loc_1000_3b4a

loc_1000_386a:
    cmp word ptr [bp-1e], 00e3
    jz loc_1000_3874
    jmp loc_1000_3910

loc_1000_3874:
    mov ax, 0004
    push ax
    mov ax, [004e]
    inc ax
    push ax
    call sub_1bd7_8b53
    add sp, 04
    mov [bp-24], ax
    mov ax, [bp-24]
    mov [004e], ax
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 013c
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-26], ax
    mov ax, [bp-26]
    and ax, ax
    jnz loc_1000_38c0
    jmp loc_1000_38f6

loc_1000_38c0:
    cmp word ptr [004e], 03
    jz loc_1000_38ca
    jmp loc_1000_38f6

loc_1000_38ca:
    mov word ptr [0148], 0007
    nop
    push cs
    call sub_1000_28ff
    mov ax, 0098
    push ax
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

loc_1000_38f6:
    cmp word ptr [004e], 02
    jz loc_1000_3900
    jmp loc_1000_390d

loc_1000_3900:
    push word ptr [0032]
    mov ax, 009f
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_390d:
    jmp loc_1000_3b4a

loc_1000_3910:
    cmp word ptr [bp-1e], 00e6
    jz loc_1000_3921
    cmp word ptr [bp-1e], 00e4
    jz loc_1000_3921
    jmp loc_1000_395a

loc_1000_3921:
    cmp word ptr [004e], 02
    jz loc_1000_392b
    jmp loc_1000_3957

loc_1000_392b:
    mov word ptr [0148], 0007
    nop
    push cs
    call sub_1000_28ff
    mov ax, 0099
    push ax
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

loc_1000_3957:
    jmp loc_1000_3b4a

loc_1000_395a:
    cmp word ptr [bp-1e], 00e8
    jge loc_1000_3964
    jmp loc_1000_3a8b

loc_1000_3964:
    cmp word ptr [bp-1e], 00ea
    jle loc_1000_396e
    jmp loc_1000_3a8b

loc_1000_396e:
    cmp word ptr [bp-20], 00ea
    jz loc_1000_3978
    jmp loc_1000_39f6

loc_1000_3978:
    cmp word ptr [0050], 00
    jg loc_1000_3982
    jmp loc_1000_39f6

loc_1000_3982:
    mov ax, [0050]
    mov [bp-28], ax
    cmp word ptr [bp-28], 02
    jnz loc_1000_39bb
    mov ax, 0080
    push ax
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
    call sub_1000_0e97
    mov [bp-2a], ax
    mov ax, [bp-2a]
    mov [bp-20], ax
    jmp loc_1000_39f3

loc_1000_39bb:
    cmp word ptr [bp-28], 02
    jg loc_1000_39c4
    jmp loc_1000_39f3

loc_1000_39c4:
    mov word ptr [0148], 0009
    nop
    push cs
    call sub_1000_28ff
    mov ax, 0082
    push ax
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
    jmp loc_1000_39f3

loc_1000_39f3:
    jmp loc_1000_3a67

loc_1000_39f6:
    push word ptr [0054]
    mov ax, 0004
    push ax
    mov ax, 0001
    push ax
    call sub_1bd7_8c03
    add sp, 06
    mov [bp-2c], ax
    mov ax, [bp-2c]
    and ax, ax
    jnz loc_1000_3a17
    jmp loc_1000_3a67

loc_1000_3a17:
    cmp word ptr [0054], 04
    jz loc_1000_3a21
    jmp loc_1000_3a4d

loc_1000_3a21:
    nop
    push cs
    call sub_1000_28ff
    mov word ptr [0148], 000b
    mov ax, 0083
    push ax
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

loc_1000_3a4d:
    mov ax, [0054]
    inc ax
    push ax
    mov ax, 0004
    push ax
    call sub_1bd7_8b53
    add sp, 04
    mov [bp-2e], ax
    mov ax, [bp-2e]
    mov [0054], ax

loc_1000_3a67:
    cmp word ptr [0050], 00
    jle loc_1000_3a88
    mov ax, [0050]
    inc ax
    push ax
    mov ax, 0003
    push ax
    call sub_1bd7_8b53
    add sp, 04
    mov [bp-30], ax
    mov ax, [bp-30]
    mov [0050], ax

loc_1000_3a88:
    jmp loc_1000_3b4a

loc_1000_3a8b:
    cmp word ptr [bp-1e], 0138
    jz loc_1000_3a95
    jmp loc_1000_3b4a

loc_1000_3a95:
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
    mov [bp-32], ax
    mov ax, [bp-32]
    mov [bp-20], ax
    cmp word ptr [00ae], 21
    mov cx, 0000
    jz loc_1000_3acd
    dec cx

loc_1000_3acd:
    and ax, cx
    and ax, ax
    jnz loc_1000_3ad6
    jmp loc_1000_3b02

loc_1000_3ad6:
    nop
    push cs
    call sub_1000_28ff
    mov ax, 0064
    push ax
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
    mov word ptr [0148], 000e

loc_1000_3b02:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov cx, es:[bx]
    mov [bp-34], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-34]
    push ax
    mov [bp-36], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-36]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov ax, [bp-34]
    mov es:[bx], ax
    jmp loc_1000_3b4a

loc_1000_3b4a:
    cmp word ptr [0148], 00
    jz loc_1000_3b54
    jmp loc_1000_3c86

loc_1000_3b54:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-38], ax
    mov ax, [bp-38]
    mov [bp-20], ax
    mov [bp-3a], ax
    cmp word ptr [bp-3a], 0198
    jz loc_1000_3b73
    jmp loc_1000_3c05

loc_1000_3b73:
    push word ptr [005c]
    mov ax, 0004
    push ax
    xor ax, ax
    push ax
    call sub_1bd7_8c03
    add sp, 06
    mov [bp-3c], ax
    mov ax, [bp-3c]
    and ax, ax
    jnz loc_1000_3b93
    jmp loc_1000_3bcc

loc_1000_3b93:
    mov ax, 007a
    push ax
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
    call sub_1000_0e97
    mov [bp-3e], ax
    mov ax, [bp-3e]
    mov [bp-20], ax
    mov ax, 005c
    push ax
    call sub_1bd7_8aa4
    add sp, 02
    jmp loc_1000_3c02

loc_1000_3bcc:
    cmp word ptr [005c], 05
    jz loc_1000_3bd6
    jmp loc_1000_3c02

loc_1000_3bd6:
    nop
    push cs
    call sub_1000_28ff
    mov ax, 007b
    push ax
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
    mov word ptr [0148], 0012

loc_1000_3c02:
    jmp loc_1000_3c86

loc_1000_3c05:
    cmp word ptr [bp-3a], 01ac
    jz loc_1000_3c0f
    jmp loc_1000_3c86

loc_1000_3c0f:
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0146
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-40], ax
    mov ax, [bp-40]
    and ax, ax
    jnz loc_1000_3c41
    jmp loc_1000_3c83

loc_1000_3c41:
    cmp word ptr [0060], 03
    jz loc_1000_3c4b
    jmp loc_1000_3c77

loc_1000_3c4b:
    nop
    push cs
    call sub_1000_28ff
    mov ax, 008b
    push ax
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
    mov word ptr [0148], 0018

loc_1000_3c77:
    mov ax, 0060
    push ax
    call sub_1bd7_8aa4
    add sp, 02

loc_1000_3c83:
    jmp loc_1000_3c86

loc_1000_3c86:
    pop si
    mov sp, bp
    pop bp
    retf
