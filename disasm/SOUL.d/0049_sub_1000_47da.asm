; ========================================
; New Subroutine: sub_1000_47da
; ========================================
sub_1000_47da:
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 26
    mov ax, es:[bx]
    mov [bp-30], ax
    mov ax, 000f
    push ax
    push word ptr [bp-30]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-82], ax
    mov ax, 000d
    push ax
    push word ptr [bp-30]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-84], ax
    mov ax, [bp-84]
    and ax, [bp-82]
    not ax
    and ax, ax
    jz loc_1000_4831
    mov word ptr [0148], 0006
    mov word ptr [0070], 008c
    jmp loc_1000_4844

loc_1000_4831:
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    mov word ptr [0070], 008b

loc_1000_4844:
    ret

loc_1000_4845:
    call sub_1bd7_0a9e
    retf 0004
