; ========================================
; New Subroutine: sub_1000_0f0a
; ========================================
sub_1000_0f0a:
    push bp
    mov bp, sp
    sub sp, 0022
    mov cx, 0008
    lea di, [bp-22]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, [bp+8]
    mov [bp-14], ax
    cmp word ptr [bp-14], 01
    jnz loc_1000_0f3a
    mov ax, 37f6
    push ax
    lea ax, [bp-18]
    push ax
    call sub_1bd7_0696
    jmp loc_1000_0fd4

loc_1000_0f3a:
    cmp word ptr [bp-14], 02
    jnz loc_1000_0f50
    mov ax, 37fe
    push ax
    lea ax, [bp-18]
    push ax
    call sub_1bd7_0696
    jmp loc_1000_0fd4

loc_1000_0f50:
    cmp word ptr [bp-14], 03
    jnz loc_1000_0f66
    mov ax, 3808
    push ax
    lea ax, [bp-18]
    push ax
    call sub_1bd7_0696
    jmp loc_1000_0fd4

loc_1000_0f66:
    cmp word ptr [bp-14], 04
    jnz loc_1000_0f7c
    mov ax, 3812
    push ax
    lea ax, [bp-18]
    push ax
    call sub_1bd7_0696
    jmp loc_1000_0fd4

loc_1000_0f7c:
    cmp word ptr [bp-14], 05
    jnz loc_1000_0f92
    mov ax, 381a
    push ax
    lea ax, [bp-18]
    push ax
    call sub_1bd7_0696
    jmp loc_1000_0fd4

loc_1000_0f92:
    cmp word ptr [bp-14], 06
    jnz loc_1000_0fa8
    mov ax, 3824
    push ax
    lea ax, [bp-18]
    push ax
    call sub_1bd7_0696
    jmp loc_1000_0fd4

loc_1000_0fa8:
    cmp word ptr [bp-14], 07
    jnz loc_1000_0fbe
    mov ax, 382c
    push ax
    lea ax, [bp-18]
    push ax
    call sub_1bd7_0696
    jmp loc_1000_0fd4

loc_1000_0fbe:
    cmp word ptr [bp-14], 08
    jnz loc_1000_0fd4
    mov ax, 383a
    push ax
    lea ax, [bp-18]
    push ax
    call sub_1bd7_0696
    jmp loc_1000_0fd4

loc_1000_0fd4:
    cmp word ptr [bp+6], 00
    jg loc_1000_0fdd
    jmp loc_1000_10e7

loc_1000_0fdd:
    mov ax, ffff
    push ax
    call sub_1bd7_118a
    mov [bp-1c], ax
    mov [bp-1a], dx
    call sub_1bd7_de9e
    xor ax, ax
    push ax
    mov ax, 0001
    push ax
    call sub_1bd7_e70a
    add sp, 04
    mov [bp-1e], ax
    mov ax, [bp-1e]
    mov [bp-20], ax
    cmp word ptr [bp+8], 08
    jz loc_1000_1012
    jmp loc_1000_106c

loc_1000_1012:
    push word ptr [005a]
    push word ptr [0058]
    xor ax, ax
    cwd
    push dx
    push ax
    call sub_1bd7_01dd
    jle loc_1000_104c
    push word ptr [005a]
    push word ptr [0058]
    mov ax, 03e8
    cwd
    push dx
    push ax
    mov ax, [0034]
    cwd
    push dx
    push ax
    call sub_1bd7_01ce
    push dx
    push ax
    call sub_1bd7_01d3
    mov [bp-20], ax
    jmp loc_1000_1051

loc_1000_104c:
    mov word ptr [bp-20], 0000

loc_1000_1051:
    push word ptr [373a]
    push word ptr [bp-20]
    call sub_1bd7_f0b6
    add sp, 04
    mov [bp-22], ax
    mov ax, [bp-22]
    mov [bp-20], ax
    jmp loc_1000_1071

loc_1000_106c:
    mov word ptr [bp-20], 0001

loc_1000_1071:
    cmp word ptr [bp-20], 01
    jz loc_1000_107a
    jmp loc_1000_10e7

loc_1000_107a:
    xor ax, ax
    push ax
    call sub_1bd7_cbee
    add sp, 02
    mov ax, 0001
    push ax
    xor ax, ax
    push ax
    mov ax, 0002
    push ax
    call sub_1bd7_01be
    cmp word ptr [bp+8], 08
    jz loc_1000_10e2
    lea ax, [bp-18]
    push ax
    mov ax, 3842
    push ax
    call sub_1bd7_06cf
    push ax
    mov ax, [bp+6]
    cwd
    and ax, ffff
    and dx, 00
    push dx
    push ax
    call sub_1bd7_0255
    push ax
    call sub_1bd7_06cf
    push ax
    mov ax, 3842
    push ax
    call sub_1bd7_06cf
    push ax
    push word ptr [bp-1a]
    push word ptr [bp-1c]
    call sub_1bd7_0255
    push ax
    call sub_1bd7_06cf
    push ax
    call sub_1bd7_03b5

loc_1000_10e2:
    call sub_1bd7_0ef8

loc_1000_10e7:
    lea ax, [bp-18]
    push ax
    call sub_1bd7_09be
    mov sp, bp
    pop bp
    retf 0004
