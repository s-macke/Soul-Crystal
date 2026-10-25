; ========================================
; New Subroutine: sub_1000_3230
; ========================================
sub_1000_3230:
    push bp
    mov bp, sp
    sub sp, 0020
    push si
    mov cx, 0007
    lea di, [bp-20]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, 0001
    push ax
    push word ptr [003a]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [003a]
    and ax, 000e
    cmp ax, 000e
    mov cx, 0000
    jz loc_1000_3267
    dec cx

loc_1000_3267:
    mov ax, [bp-14]
    not ax
    and cx, ax
    mov [bp-1c], cx
    cmp word ptr [003a], 00
    mov ax, 0000
    jnz loc_1000_327c
    dec ax

loc_1000_327c:
    mov [bp-1e], ax
    or cx, ax
    mov [bp-1e], cx
    and cx, cx
    jnz loc_1000_328b
    jmp loc_1000_3318

loc_1000_328b:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-16], ax
    mov ax, [bp-16]
    mov [bp-1c], ax
    cmp ax, 00cc
    jz loc_1000_32aa
    cmp ax, 00ca
    jz loc_1000_32aa
    jmp loc_1000_3318

loc_1000_32aa:
    cmp word ptr [bp-1c], 00cc
    jz loc_1000_32b4
    jmp loc_1000_3300

loc_1000_32b4:
    cmp word ptr [bp+6], 21
    jz loc_1000_32bd
    jmp loc_1000_3300

loc_1000_32bd:
    mov ax, 00ca
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-18], ax
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [bp-18]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    not ax
    and ax, ax
    jz loc_1000_32fd
    mov word ptr [bp-1e], 0000

loc_1000_32fd:
    jmp loc_1000_3318

loc_1000_3300:
    cmp word ptr [bp-1c], 00ca
    jz loc_1000_330a
    jmp loc_1000_3318

loc_1000_330a:
    cmp word ptr [bp+6], 19
    jz loc_1000_3313
    jmp loc_1000_3318

loc_1000_3313:
    mov word ptr [bp-1e], 0000

loc_1000_3318:
    mov ax, [bp-1e]
    and ax, ax
    jz loc_1000_3325
    mov word ptr [0070], 0016

loc_1000_3325:
    mov ax, [bp-1e]
    not ax
    mov [bp-20], ax
    mov ax, [bp-20]
    pop si
    mov sp, bp
    pop bp
    retf 0002
