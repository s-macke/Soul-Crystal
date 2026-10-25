; ========================================
; New Subroutine: sub_1000_8229
; ========================================
sub_1000_8229:
    push bp
    mov bp, sp
    sub sp, 0018
    push si
    xor ax, ax
    mov [bp-14], ax
    mov [bp-16], ax
    mov [bp-18], ax
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov ax, [bp+6]
    mov [bp-14], ax
    cmp word ptr [bp-14], 00a3
    jnz loc_1000_8259
    mov word ptr [bp-16], 003a
    jmp loc_1000_83fb

loc_1000_8259:
    cmp word ptr [bp-14], 4a
    jnz loc_1000_8267
    mov word ptr [bp-16], 007f
    jmp loc_1000_83fb

loc_1000_8267:
    cmp word ptr [bp-14], 62
    jnz loc_1000_8275
    mov word ptr [bp-16], 0080
    jmp loc_1000_83fb

loc_1000_8275:
    cmp word ptr [bp-14], 1a
    jnz loc_1000_8283
    mov word ptr [bp-16], 00d3
    jmp loc_1000_83fb

loc_1000_8283:
    cmp word ptr [bp-14], 3a
    jnz loc_1000_8291
    mov word ptr [bp-16], 00d5
    jmp loc_1000_83fb

loc_1000_8291:
    cmp word ptr [bp-14], 4f
    jnz loc_1000_829f
    mov word ptr [bp-16], 00d6
    jmp loc_1000_83fb

loc_1000_829f:
    cmp word ptr [bp-14], 4c
    jnz loc_1000_82ad
    mov word ptr [bp-16], 00d6
    jmp loc_1000_83fb

loc_1000_82ad:
    cmp word ptr [bp-14], 0083
    jnz loc_1000_82bc
    mov word ptr [bp-16], 00d6
    jmp loc_1000_83fb

loc_1000_82bc:
    cmp word ptr [bp-14], 0098
    jz loc_1000_82c6
    jmp loc_1000_8317

loc_1000_82c6:
    mov ax, 000d
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-18], ax
    mov ax, [bp-18]
    not ax
    and ax, ax
    jnz loc_1000_82e5
    jmp loc_1000_8314

loc_1000_82e5:
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    add word ptr [0034], 0f
    push word ptr [0032]
    mov ax, 00a1
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-16], 0081
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6

loc_1000_8314:
    jmp loc_1000_83fb

loc_1000_8317:
    cmp word ptr [bp-14], 37
    jnz loc_1000_8325
    mov word ptr [bp-16], 00d4
    jmp loc_1000_83fb

loc_1000_8325:
    cmp word ptr [bp-14], 5b
    jnz loc_1000_8333
    mov word ptr [bp-16], 00d7
    jmp loc_1000_83fb

loc_1000_8333:
    cmp word ptr [bp-14], 61
    jnz loc_1000_8341
    mov word ptr [bp-16], 00d8
    jmp loc_1000_83fb

loc_1000_8341:
    cmp word ptr [bp-14], 7a
    jnz loc_1000_834f
    mov word ptr [bp-16], 00d9
    jmp loc_1000_83fb

loc_1000_834f:
    cmp word ptr [bp-14], 009f
    jnz loc_1000_8364
    mov word ptr [bp-16], 00da
    mov word ptr [014a], ffff
    jmp loc_1000_83fb

loc_1000_8364:
    cmp word ptr [bp-14], 00a2
    jnz loc_1000_8373
    mov word ptr [bp-16], 00db
    jmp loc_1000_83fb

loc_1000_8373:
    cmp word ptr [bp-14], 00a1
    jnz loc_1000_8388
    mov word ptr [bp-16], 0082
    mov word ptr [0148], 0003
    jmp loc_1000_83fb

loc_1000_8388:
    cmp word ptr [bp-14], 00a5
    jnz loc_1000_8397
    mov word ptr [bp-16], 0073
    jmp loc_1000_83fb

loc_1000_8397:
    cmp word ptr [bp-14], 36
    jnz loc_1000_83a5
    mov word ptr [bp-16], 0072
    jmp loc_1000_83fb

loc_1000_83a5:
    cmp word ptr [bp-14], 01
    jnz loc_1000_83b3
    mov word ptr [bp-16], 00de
    jmp loc_1000_83fb

loc_1000_83b3:
    cmp word ptr [bp-14], 25
    jnz loc_1000_83c1
    mov word ptr [bp-16], 00df
    jmp loc_1000_83fb

loc_1000_83c1:
    cmp word ptr [bp-14], 38
    jnz loc_1000_83cf
    mov word ptr [bp-16], 00e0
    jmp loc_1000_83fb

loc_1000_83cf:
    cmp word ptr [bp-14], 60
    jnz loc_1000_83dd
    mov word ptr [bp-16], 00e1
    jmp loc_1000_83fb

loc_1000_83dd:
    cmp word ptr [bp-14], 0084
    jnz loc_1000_83ec
    mov word ptr [bp-16], 00e2
    jmp loc_1000_83fb

loc_1000_83ec:
    cmp word ptr [bp-14], 00a4
    jnz loc_1000_83fb
    mov word ptr [bp-16], 00e3
    jmp loc_1000_83fb

loc_1000_83fb:
    cmp word ptr [bp-16], 00
    jnz loc_1000_8406
    mov word ptr [bp-16], 003b

loc_1000_8406:
    push word ptr [bp-16]
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
    retf 0002
