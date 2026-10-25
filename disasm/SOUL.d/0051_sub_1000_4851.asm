; ========================================
; New Subroutine: sub_1000_4851
; ========================================
sub_1000_4851:
    push bp
    mov bp, sp
    sub sp, 0038
    push si
    mov cx, 0013
    lea di, [bp-38]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, 000f
    push ax
    push word ptr [bp+8]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    and ax, ax
    jnz loc_1000_4882
    jmp loc_1000_48c0

loc_1000_4882:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-16], ax
    mov ax, [bp-16]
    mov [bp-18], ax
    cmp word ptr [bp-18], 012d
    jz loc_1000_489e
    jmp loc_1000_48ac

loc_1000_489e:
    cmp word ptr [bp+6], 21
    jnz loc_1000_48a9
    mov word ptr [bp-1a], 0017

loc_1000_48a9:
    jmp loc_1000_48ac

loc_1000_48ac:
    cmp word ptr [bp-1a], 00
    jnz loc_1000_48b7
    mov word ptr [bp-1a], 0002

loc_1000_48b7:
    mov ax, [bp-1a]
    mov [0070], ax
    jmp loc_1000_4b59

loc_1000_48c0:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_3230
    mov [bp-1c], ax
    mov ax, [bp-1c]
    and ax, ax
    jnz loc_1000_48d5
    jmp loc_1000_4b59

loc_1000_48d5:
    mov word ptr [bp-24], ffff
    mov word ptr [bp-26], 0000
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-1e], ax
    mov ax, [bp-1e]
    mov [bp-20], ax
    cmp word ptr [bp-20], 012d
    jz loc_1000_4916
    jmp loc_1000_49c5

loc_1000_4916:
    mov ax, 0005
    push ax
    push word ptr [003a]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-22], ax
    mov ax, [bp-22]
    and ax, ax
    jnz loc_1000_4933
    jmp loc_1000_49c2

loc_1000_4933:
    cmp word ptr [bp+6], 21
    jnz loc_1000_494d
    mov word ptr [0070], 0066
    mov word ptr [0148], 000c
    mov word ptr [bp-24], 0000
    jmp loc_1000_49c2

loc_1000_494d:
    mov word ptr [bp-28], ffff
    mov word ptr [bp-1a], 0067
    xor ax, ax
    push ax
    mov ax, fed2
    push ax
    mov ax, 0003
    push ax
    nop
    push cs
    call sub_1000_53b2
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-2a], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-2a]
    push ax
    mov [bp-2c], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-2c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-2a]
    mov es:[bx], ax
    mov ax, 0005
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8ade
    add sp, 04

loc_1000_49c2:
    jmp loc_1000_4a20

loc_1000_49c5:
    cmp word ptr [bp-20], 0139
    jz loc_1000_49cf
    jmp loc_1000_4a20

loc_1000_49cf:
    cmp word ptr [bp+6], 19
    jz loc_1000_49d8
    jmp loc_1000_4a1d

loc_1000_49d8:
    mov ax, 000d
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00d8
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-2e], ax
    mov ax, [bp-2e]
    not ax
    mov [bp-30], ax
    and ax, ax
    jz loc_1000_4a1d
    mov word ptr [bp-24], 0000
    mov word ptr [0148], 000f
    mov word ptr [0070], 0068

loc_1000_4a1d:
    jmp loc_1000_4a20

loc_1000_4a20:
    mov ax, [bp-24]
    and ax, ax
    jz loc_1000_4a4d
    mov ax, [bp+8]
    and ax, 3fff
    mov [0032], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov ax, es:[bx]
    mov [0070], ax
    mov word ptr [bp-26], ffff

loc_1000_4a4d:
    mov ax, [bp-26]
    and ax, ax
    jnz loc_1000_4a57
    jmp loc_1000_4b3c

loc_1000_4a57:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-32], ax
    mov ax, [bp-32]
    mov [bp-34], ax
    cmp word ptr [bp-34], 0132
    jnz loc_1000_4a79
    mov word ptr [014a], ffff
    jmp loc_1000_4b3c

loc_1000_4a79:
    cmp word ptr [bp-34], 0138
    jz loc_1000_4a83
    jmp loc_1000_4ad5

loc_1000_4a83:
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
    mov [bp-36], ax
    mov ax, [bp-36]
    mov [bp-30], ax
    and ax, ax
    jz loc_1000_4ac8
    mov word ptr [bp-24], 0000
    mov word ptr [0148], 000e
    mov word ptr [0070], 0065
    jmp loc_1000_4ad2

loc_1000_4ac8:
    mov word ptr [bp-28], ffff
    mov word ptr [bp-1a], 0063

loc_1000_4ad2:
    jmp loc_1000_4b3c

loc_1000_4ad5:
    cmp word ptr [bp-34], 0192
    jz loc_1000_4adf
    jmp loc_1000_4b3c

loc_1000_4adf:
    mov word ptr [003c], 0000
    mov ax, 0001
    push ax
    mov ax, 005e
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov word ptr [372e], 0003
    mov word ptr [3732], 007b
    mov word ptr [3734], 007c
    nop
    push cs
    call sub_1000_28ff
    mov ax, 007a
    push ax
    push word ptr [372e]
    nop
    push cs
    call sub_1000_0a2d
    nop
    push cs
    call sub_1000_549d
    push word ptr [372e]
    call sub_1bd7_bfa2
    add sp, 02
    mov [bp-38], ax
    mov ax, [bp-38]
    mov [3730], ax
    mov word ptr [3736], 0079
    jmp loc_1000_4b3c

loc_1000_4b3c:
    mov ax, [bp-28]
    and ax, ax
    jnz loc_1000_4b46
    jmp loc_1000_4b59

loc_1000_4b46:
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    mov ax, [bp-1a]
    mov [0070], ax

loc_1000_4b59:
    pop si
    mov sp, bp
    pop bp
    retf 0004
