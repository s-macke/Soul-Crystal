; ========================================
; New Subroutine: sub_1000_ab57
; ========================================
sub_1000_ab57:
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
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov ax, 0002
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    cmp word ptr [0142], 02
    mov ax, 0000
    jnz loc_1000_ab92
    dec ax

loc_1000_ab92:
    and ax, [bp-14]
    and ax, ax
    jnz loc_1000_ab9c
    jmp loc_1000_ad49

loc_1000_ab9c:
    mov ax, 00cf
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-16], ax
    cmp word ptr [bp+6], 0097
    jnz loc_1000_abdb
    mov ax, [bp-16]
    cmp ax, [0032]
    jnz loc_1000_abdb
    mov word ptr [bp-18], 0002
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    jmp loc_1000_ad46

loc_1000_abdb:
    push word ptr [0032]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_0e1a
    mov ax, [bp+6]
    mov [bp-1a], ax
    cmp word ptr [bp-1a], 008f
    jz loc_1000_ac09
    lea bx, [bp-1e]
    call sub_1bd7_57a4
    call sub_1bd7_59fa
    cmp ax, [bp-1a]
    jz loc_1000_ac09
    jmp loc_1000_ac1c

loc_1000_ac09:
    mov ax, 0002
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8ade
    add sp, 04
    jmp loc_1000_ad23

loc_1000_ac1c:
    cmp word ptr [bp-1a], 4d
    jz loc_1000_ac2c
    cmp word ptr [bp-1a], 0094
    jz loc_1000_ac2c
    jmp loc_1000_ac3f

loc_1000_ac2c:
    mov ax, 0003
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8ade
    add sp, 04
    jmp loc_1000_ad23

loc_1000_ac3f:
    cmp word ptr [bp-1a], 7e
    jz loc_1000_ac4e
    cmp word ptr [bp-1a], 14
    jz loc_1000_ac4e
    jmp loc_1000_ac61

loc_1000_ac4e:
    mov ax, 0004
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8ade
    add sp, 04
    jmp loc_1000_ad23

loc_1000_ac61:
    cmp word ptr [bp-1a], 0097
    jz loc_1000_ac6b
    jmp loc_1000_ac8e

loc_1000_ac6b:
    mov ax, 0003
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, 0001
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8ade
    add sp, 04
    jmp loc_1000_ad23

loc_1000_ac8e:
    cmp word ptr [bp-1a], 03
    jz loc_1000_ac97
    jmp loc_1000_ad06

loc_1000_ac97:
    mov ax, 0005
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, 00d2
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-20], ax
    mov ax, [bp-20]
    mov [bp-22], ax
    mov ax, 0014
    imul word ptr [bp-22]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-24], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-24]
    push ax
    mov [bp-26], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-26]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-24]
    mov es:[bx], ax
    jmp loc_1000_ad23

loc_1000_ad06:
    cmp word ptr [bp-1a], 0093
    jz loc_1000_ad10
    jmp loc_1000_ad23

loc_1000_ad10:
    mov ax, 0005
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8ade
    add sp, 04
    jmp loc_1000_ad23

loc_1000_ad23:
    mov word ptr [bp-18], 0008
    mov word ptr [0072], 0000
    mov si, 0080
    mov bx, 000e
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 04
    mov ax, [bp+6]
    mov es:[bx], ax

loc_1000_ad46:
    jmp loc_1000_ada8

loc_1000_ad49:
    mov ax, [bp+6]
    mov [bp-28], ax
    cmp word ptr [bp-28], 0d
    jnz loc_1000_ad5d
    mov word ptr [bp-18], 010f
    jmp loc_1000_ad8d

loc_1000_ad5d:
    cmp word ptr [bp-28], 72
    jnz loc_1000_ad6b
    mov word ptr [bp-18], 0110
    jmp loc_1000_ad8d

loc_1000_ad6b:
    cmp word ptr [bp-28], 0088
    jnz loc_1000_ad7a
    mov word ptr [bp-18], 0111
    jmp loc_1000_ad8d

loc_1000_ad7a:
    cmp word ptr [bp-28], 1d
    jnz loc_1000_ad88
    mov word ptr [bp-18], 0109
    jmp loc_1000_ad8d

loc_1000_ad88:
    mov word ptr [bp-18], 0029

loc_1000_ad8d:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax

loc_1000_ada8:
    push word ptr [bp-18]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf 0002
