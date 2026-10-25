; ========================================
; New Subroutine: sub_1000_33e6
; ========================================
sub_1000_33e6:
    push bp
    mov bp, sp
    sub sp, 001e
    push si
    mov cx, 0006
    lea di, [bp-1e]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov word ptr [bp-14], 1fff
    mov ax, 000e
    push ax
    lea ax, [bp-14]
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, [bp-14]
    and ax, [0140]
    mov [bp-18], ax
    mov word ptr [bp-1a], e000
    mov ax, [0142]
    mov [bp-16], ax
    cmp word ptr [bp-16], 01
    jnz loc_1000_3452
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 014a
    imul word ptr [0032]
    mov dx, bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    mov ax, es:[bx]
    mov [bp-1c], ax
    jmp loc_1000_3474

loc_1000_3452:
    cmp word ptr [bp-16], 02
    jnz loc_1000_3474
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    mov ax, es:[bx]
    mov [bp-1c], ax
    jmp loc_1000_3474

loc_1000_3474:
    mov ax, [bp-1a]
    and ax, [bp-1c]
    mov [bp-1c], ax
    or ax, [bp-18]
    mov [bp-1c], ax
    mov cx, [0142]
    mov [bp-1e], cx
    cmp word ptr [bp-1e], 01
    jnz loc_1000_34b3
    mov cx, [bp+6]
    dec cx
    shl cx, 01
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, cx
    mov ax, [bp-1c]
    mov es:[bx], ax
    jmp loc_1000_34d5

loc_1000_34b3:
    cmp word ptr [bp-1e], 02
    jnz loc_1000_34d5
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    mov ax, [bp-1c]
    mov es:[bx], ax
    jmp loc_1000_34d5

loc_1000_34d5:
    pop si
    mov sp, bp
    pop bp
    retf 0002
