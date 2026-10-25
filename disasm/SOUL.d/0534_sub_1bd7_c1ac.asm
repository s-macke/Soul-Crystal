; ========================================
; New Subroutine: sub_1bd7_c1ac
; ========================================
sub_1bd7_c1ac:
    push bp
    mov bp, sp
    sub sp, 20
    push si
    mov word ptr [bp-1c], 0000
    sub ax, ax
    mov [bp-6], ax
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov word ptr [bp-18], 0000

loc_1bd7_c1cf:
    mov es, [6e76]
    cmp byte ptr es:[0541], 43
    jz loc_1bd7_c210
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 0008
    mov word ptr [bp-a], 0001
    mov word ptr [bp-8], 0100
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    sub ax, ax
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04

loc_1bd7_c210:
    les bx, [bp+a]
    cmp word ptr es:[bx], 02
    jnz loc_1bd7_c21c
    jmp loc_1bd7_c2ae

loc_1bd7_c21c:
    mov ax, 64b0
    push ds
    push ax
    mov ax, 64b3
    push ds
    push ax
    nop
    push cs
    call sub_1bd7_70fa
    add sp, 08
    mov [bp-10], ax
    mov [bp-e], dx
    or dx, ax
    jz loc_1bd7_c246
    push word ptr [bp-e]
    push ax
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04
    jmp loc_1bd7_c2b2

loc_1bd7_c246:
    mov word ptr [bp-12], 0000
    mov word ptr [bp-c], 001c
    mov word ptr [bp-a], 0000
    mov word ptr [bp-8], 0100
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-12]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    mov word ptr [bp-18], 0000

loc_1bd7_c271:
    mov ax, 000a
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    mov [bp-2], ax
    sub ax, 0100
    jz loc_1bd7_c28e
    dec ax
    jz loc_1bd7_c2a8
    jmp loc_1bd7_c298

loc_1bd7_c28e:
    mov word ptr [bp-6], 0301

loc_1bd7_c293:
    mov word ptr [bp-18], 0001

loc_1bd7_c298:
    cmp word ptr [bp-18], 00
    jnz loc_1bd7_c2b7
    cmp word ptr [bp-2], 0102
    jnz loc_1bd7_c271
    jmp loc_1bd7_c2b7
