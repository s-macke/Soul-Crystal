; ========================================
; New Subroutine: sub_1000_80c2
; ========================================
sub_1000_80c2:
    push bp
    mov bp, sp
    sub sp, 0022
    push si
    mov cx, 0008
    lea di, [bp-22]
    push ss
    pop es
    xor ax, ax
    repz stosw
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-14], ax
    mov ax, [bp-14]
    mov [bp-16], ax
    cmp word ptr [bp-16], 6e
    jl loc_1000_80fd
    cmp word ptr [bp-16], 71
    jg loc_1000_80fd
    mov word ptr [bp-18], 001a
    jmp loc_1000_81f0

loc_1000_80fd:
    cmp word ptr [bp-16], 00dd
    jz loc_1000_8107
    jmp loc_1000_81af

loc_1000_8107:
    mov ax, 000f
    push ax
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00fc
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    mov [bp-20], ax
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00fc
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1c], ax
    mov ax, [bp-1c]
    not ax
    and ax, [bp-20]
    mov [bp-20], ax
    mov ax, 000d
    push ax
    push word ptr [004c]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1e], ax
    mov ax, [bp-1e]
    not ax
    and ax, [bp-20]
    mov [bp-20], ax
    and ax, [004c]
    and ax, ax
    jnz loc_1000_818a
    jmp loc_1000_81ac

loc_1000_818a:
    mov word ptr [bp-18], 0091
    push word ptr [0032]
    mov ax, 0085
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov ax, 000d
    push ax
    mov ax, 004c
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_81ac:
    jmp loc_1000_81f0

loc_1000_81af:
    cmp word ptr [bp-16], 00e3
    jz loc_1000_81c0
    cmp word ptr [bp-16], 00e4
    jz loc_1000_81c0
    jmp loc_1000_81f0

loc_1000_81c0:
    mov ax, 000f
    push ax
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00fc
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-22], ax
    mov ax, [bp-22]
    and ax, ax
    jz loc_1000_81ed
    mov word ptr [bp-18], 0116

loc_1000_81ed:
    jmp loc_1000_81f0

loc_1000_81f0:
    cmp word ptr [bp-18], 00
    jnz loc_1000_81fb
    mov word ptr [bp-18], 001b

loc_1000_81fb:
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
    retf
