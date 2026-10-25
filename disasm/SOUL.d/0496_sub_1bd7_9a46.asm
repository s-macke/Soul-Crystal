; ========================================
; New Subroutine: sub_1bd7_9a46
; ========================================
sub_1bd7_9a46:
    push bp
    mov bp, sp
    sub sp, 20
    mov word ptr [bp-2], 0001
    mov ax, [bp+a]
    or ax, ax
    jz loc_1bd7_9a68
    dec ax
    jz loc_1bd7_9ad4
    dec ax
    jnz loc_1bd7_9a61
    jmp loc_1bd7_9b1c

loc_1bd7_9a61:
    mov ax, [bp-2]
    mov sp, bp
    pop bp
    retf

loc_1bd7_9a68:
    mov word ptr [bp-14], 045a
    mov word ptr [bp-12], 2c43
    mov word ptr [bp-1c], 5680
    mov word ptr [bp-1a], 2c43
    mov word ptr [bp-20], d466
    mov word ptr [bp-1e], 36ad
    mov word ptr [bp-6], 0494
    mov word ptr [bp-4], 2c43
    mov word ptr [bp-18], 0cba
    mov word ptr [bp-16], 2c43
    mov word ptr [bp-10], eb9a
    mov word ptr [bp-e], 36ad
    mov word ptr [bp-c], 5848
    mov word ptr [bp-a], 458f

loc_1bd7_9aae:
    mov ax, 0001
    push ax
    mov ax, 5d4d
    push ds
    push ax
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_b10e
    add sp, 0a
    or dx, ax
    jz loc_1bd7_9acc
    jmp loc_1bd7_9b66

loc_1bd7_9acc:
    mov word ptr [bp-2], 0000
    jmp loc_1bd7_9c0c

loc_1bd7_9ad4:
    mov word ptr [bp-14], 6488
    mov word ptr [bp-12], 458f
    mov word ptr [bp-1c], 0cb6
    mov word ptr [bp-1a], 2c43
    mov word ptr [bp-20], 53be
    mov word ptr [bp-1e], 2c43
    mov word ptr [bp-6], c50e
    mov word ptr [bp-4], 458f
    mov word ptr [bp-18], dab6
    mov word ptr [bp-16], 458f
    mov word ptr [bp-10], 569a
    mov word ptr [bp-e], 2c43
    mov word ptr [bp-c], 5aa0
    mov word ptr [bp-a], 2c43
    jmp loc_1bd7_9aae

loc_1bd7_9b1c:
    mov word ptr [bp-14], 650c
    mov word ptr [bp-12], 458f
    mov word ptr [bp-1c], 0ee2
    mov word ptr [bp-1a], 2c43
    mov word ptr [bp-20], 54f2
    mov word ptr [bp-1e], 2c43
    mov word ptr [bp-6], c922
    mov word ptr [bp-4], 458f
    mov word ptr [bp-18], dd72
    mov word ptr [bp-16], 458f
    mov word ptr [bp-10], 589a
    mov word ptr [bp-e], 2c43
    mov word ptr [bp-c], 0000
    mov word ptr [bp-a], 36ad
    jmp loc_1bd7_9aae
