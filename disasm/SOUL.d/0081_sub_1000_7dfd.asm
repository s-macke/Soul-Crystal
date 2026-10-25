; ========================================
; New Subroutine: sub_1000_7dfd
; ========================================
sub_1000_7dfd:
    mov cx, 0014
    call sub_1bd7_0a67
    push word ptr [bp+8]
    nop
    push cs
    call sub_1000_333c
    mov word ptr [bp-16], 0000
    mov ax, [bp+8]
    mov [bp-14], ax
    cmp word ptr [bp-14], 24
    jz loc_1000_7e21
    jmp loc_1000_7e86

loc_1000_7e21:
    cmp word ptr [bp+6], 1a
    jz loc_1000_7e2a
    jmp loc_1000_7e83

loc_1000_7e2a:
    add word ptr [0034], 14
    mov word ptr [bp-18], 0107
    push word ptr [0032]
    mov ax, ff35
    push ax
    mov ax, [bp+6]
    neg ax
    push ax
    nop
    push cs
    call sub_1000_53b2
    nop
    push cs
    call sub_1000_50ce
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0e97
    mov [bp-1a], ax
    mov ax, [bp-1a]
    mov [bp-1e], ax
    mov ax, 0076
    push ax
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0e97
    mov [bp-1c], ax
    mov ax, [bp-1c]
    mov [bp-1e], ax
    mov word ptr [0040], ffff
    mov word ptr [bp-16], ffff

loc_1000_7e83:
    jmp loc_1000_7fce

loc_1000_7e86:
    cmp word ptr [bp-14], 20
    jz loc_1000_7e8f
    jmp loc_1000_7edd

loc_1000_7e8f:
    cmp word ptr [bp+6], 61
    jz loc_1000_7e98
    jmp loc_1000_7eda

loc_1000_7e98:
    mov ax, 0003
    push ax
    push word ptr [0042]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-20], ax
    mov ax, [bp-20]
    and ax, ax
    jnz loc_1000_7eb5
    jmp loc_1000_7ed5

loc_1000_7eb5:
    mov word ptr [bp-16], ffff
    mov word ptr [bp-18], 0106
    mov ax, 0004
    push ax
    mov ax, 0042
    push ax
    call sub_1bd7_8acb
    add sp, 04
    call sub_1000_8021
    jmp loc_1000_7eda

loc_1000_7ed5:
    mov word ptr [bp-18], 00ed

loc_1000_7eda:
    jmp loc_1000_7fce

loc_1000_7edd:
    cmp word ptr [bp-14], 50
    jz loc_1000_7ee6
    jmp loc_1000_7f34

loc_1000_7ee6:
    cmp word ptr [bp+6], 61
    jz loc_1000_7eef
    jmp loc_1000_7f31

loc_1000_7eef:
    mov ax, 0003
    push ax
    push word ptr [0042]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-22], ax
    mov ax, [bp-22]
    and ax, ax
    jnz loc_1000_7f0c
    jmp loc_1000_7f2c

loc_1000_7f0c:
    mov word ptr [bp-16], ffff
    mov ax, 0005
    push ax
    mov ax, 0042
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov word ptr [bp-18], 0105
    call sub_1000_8021
    jmp loc_1000_7f31

loc_1000_7f2c:
    mov word ptr [bp-18], 0002

loc_1000_7f31:
    jmp loc_1000_7fce

loc_1000_7f34:
    cmp word ptr [bp-14], 1f
    jz loc_1000_7f3d
    jmp loc_1000_7f8b

loc_1000_7f3d:
    cmp word ptr [bp+6], 7a
    jz loc_1000_7f46
    jmp loc_1000_7f88

loc_1000_7f46:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
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
    mov word ptr [bp-16], ffff
    mov ax, 00d7
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-24], ax
    push word ptr [bp-24]
    mov ax, 002f
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov word ptr [bp-18], 0108

loc_1000_7f88:
    jmp loc_1000_7fce

loc_1000_7f8b:
    cmp word ptr [bp-14], 15
    jz loc_1000_7f94
    jmp loc_1000_7fce

loc_1000_7f94:
    cmp word ptr [bp+6], 73
    jz loc_1000_7f9d
    jmp loc_1000_7fcb

loc_1000_7f9d:
    mov ax, [0144]
    and ax, ax
    jz loc_1000_7fac
    mov word ptr [bp-18], 0104
    jmp loc_1000_7fcb

loc_1000_7fac:
    mov word ptr [bp-18], 0103
    add word ptr [0034], 19
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0073
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [005c], ffff

loc_1000_7fcb:
    jmp loc_1000_7fce

loc_1000_7fce:
    cmp word ptr [bp-18], 00
    jnz loc_1000_7fd7
    jmp loc_1000_8012

loc_1000_7fd7:
    mov ax, [bp-16]
    and ax, ax
    jnz loc_1000_7fe1
    jmp loc_1000_7fef

loc_1000_7fe1:
    mov ax, [0032]
    neg ax
    push ax
    push word ptr [bp+8]
    nop
    push cs
    call sub_1000_3041

loc_1000_7fef:
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
    jmp loc_1000_801e

loc_1000_8012:
    mov ax, 0012
    push ax
    xor ax, ax
    push ax
    nop
    push cs
    call sub_1000_0a2d

loc_1000_801e:
    jmp loc_1000_80b6
