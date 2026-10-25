; ========================================
; New Subroutine: sub_1000_294f
; ========================================
sub_1000_294f:
    push bp
    mov bp, sp
    sub sp, 002a
    push si
    mov cx, 000c
    lea di, [bp-2a]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov word ptr [bp-16], 0000
    mov ax, [bp+6]
    mov [bp-14], ax
    cmp word ptr [bp-14], 008f
    jnz loc_1000_2983
    mov word ptr [bp-18], 0002
    mov word ptr [bp-1a], 008b
    jmp loc_1000_2a1e

loc_1000_2983:
    cmp word ptr [bp-14], 0097
    jnz loc_1000_2997
    mov word ptr [bp-18], 0003
    mov word ptr [bp-1a], 004a
    jmp loc_1000_2a1e

loc_1000_2997:
    cmp word ptr [bp-14], 4d
    jnz loc_1000_29aa
    mov word ptr [bp-18], 0003
    mov word ptr [bp-1a], 0089
    jmp loc_1000_2a1e

loc_1000_29aa:
    cmp word ptr [bp-14], 7e
    jnz loc_1000_29bd
    mov word ptr [bp-18], 0004
    mov word ptr [bp-1a], 008a
    jmp loc_1000_2a1e

loc_1000_29bd:
    cmp word ptr [bp-14], 14
    jnz loc_1000_29d0
    mov word ptr [bp-18], 0004
    mov word ptr [bp-1a], 0045
    jmp loc_1000_2a1e

loc_1000_29d0:
    cmp word ptr [bp-14], 0094
    jnz loc_1000_29e4
    mov word ptr [bp-18], 0003
    mov word ptr [bp-1a], 0049
    jmp loc_1000_2a1e

loc_1000_29e4:
    cmp word ptr [bp-14], 7d
    jnz loc_1000_29f7
    mov word ptr [bp-18], 0002
    mov word ptr [bp-1a], 0047
    jmp loc_1000_2a1e

loc_1000_29f7:
    cmp word ptr [bp-14], 03
    jnz loc_1000_2a0a
    mov word ptr [bp-18], 0005
    mov word ptr [bp-1a], 0044
    jmp loc_1000_2a1e

loc_1000_2a0a:
    cmp word ptr [bp-14], 0093
    jnz loc_1000_2a1e
    mov word ptr [bp-18], 0005
    mov word ptr [bp-1a], 00fe
    jmp loc_1000_2a1e

loc_1000_2a1e:
    cmp word ptr [bp-18], 00
    jg loc_1000_2a27
    jmp loc_1000_2b7e

loc_1000_2a27:
    push word ptr [bp-18]
    push word ptr [003a]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1c], ax
    mov ax, [bp-1c]
    not ax
    and ax, ax
    jnz loc_1000_2a45
    jmp loc_1000_2b79

loc_1000_2a45:
    cmp word ptr [0142], 01
    jz loc_1000_2a4f
    jmp loc_1000_2a5a

loc_1000_2a4f:
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_52d0

loc_1000_2a5a:
    mov ax, 000e
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1e], ax
    mov ax, [bp-1e]
    not ax
    and ax, ax
    jnz loc_1000_2a79
    jmp loc_1000_2b71

loc_1000_2a79:
    mov ax, 000e
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    push word ptr [bp-18]
    mov ax, 003a
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, [bp+6]
    mov [bp-20], ax
    cmp word ptr [bp-20], 0097
    jz loc_1000_2aa8
    jmp loc_1000_2ac0

loc_1000_2aa8:
    mov ax, 0001
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov word ptr [bp-22], 0005
    jmp loc_1000_2b3c

loc_1000_2ac0:
    cmp word ptr [bp-20], 03
    jz loc_1000_2ac9
    jmp loc_1000_2b2d

loc_1000_2ac9:
    mov ax, 00d2
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-24], ax
    mov ax, [bp-24]
    mov [bp-18], ax
    mov ax, 0014
    imul word ptr [bp-18]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-26], cx
    mov bx, ax
    mov ax, 000f
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
    add bx, 00
    add bx, 08
    mov ax, [bp-26]
    mov es:[bx], ax
    mov word ptr [bp-22], 000f
    jmp loc_1000_2b3c

loc_1000_2b2d:
    cmp word ptr [bp-20], 0093
    jnz loc_1000_2b3c
    mov word ptr [bp-22], 000f
    jmp loc_1000_2b3c

loc_1000_2b3c:
    cmp word ptr [bp-22], 00
    mov ax, 0000
    jle loc_1000_2b46
    dec ax

loc_1000_2b46:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_2b51
    jmp loc_1000_2b68

loc_1000_2b51:
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, [bp-22]
    add [0034], ax

loc_1000_2b68:
    mov ax, [bp-1a]
    mov [bp-16], ax
    jmp loc_1000_2b76

loc_1000_2b71:
    mov word ptr [bp-16], ffff

loc_1000_2b76:
    jmp loc_1000_2b7e

loc_1000_2b79:
    mov word ptr [bp-16], ffff

loc_1000_2b7e:
    mov ax, [bp-16]
    mov [bp-2a], ax
    mov ax, [bp-2a]
    pop si
    mov sp, bp
    pop bp
    retf 0004
