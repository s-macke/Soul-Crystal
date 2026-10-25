; ========================================
; New Subroutine: sub_1bd7_8f62
; ========================================
sub_1bd7_8f62:
    push bp
    mov bp, sp
    sub sp, 1c
    push di
    push si
    mov word ptr [bp-a], 0000
    les bx, [bp+6]
    mov ax, es:[bx]
    or ax, ax
    jz loc_1bd7_8f82
    dec ax
    jnz loc_1bd7_8f7f
    jmp loc_1bd7_92fa

loc_1bd7_8f7f:
    jmp loc_1bd7_9305

loc_1bd7_8f82:
    les bx, [bp+a]
    mov ax, [6eb2]
    cmp es:[bx], ax
    jnz loc_1bd7_8f99
    mov ax, [6eb0]
    cmp es:[bx+2], ax
    jnz loc_1bd7_8f99
    jmp loc_1bd7_9305

loc_1bd7_8f99:
    mov ax, es:[bx]
    mov [6eb2], ax
    mov cx, es:[bx+2]
    mov [6eb0], cx
    mov bl, 06
    xchg bx, cx
    shl bx, cl
    add bx, ax
    shl bx, 01
    mov es, [6e24]
    mov al, es:[bx+4e8]
    sub ah, ah
    mov [bp-4], ax
    mov di, [6eb4]
    cmp ax, di
    jz loc_1bd7_8fe8
    or di, di
    jnz loc_1bd7_8fe8
    mov cl, 06
    mov bx, [6eb0]
    shl bx, cl
    add bx, [6eb2]
    shl bx, 01
    mov al, es:[bx+4e9]
    mov [bp-6], ax
    cmp ax, di
    jz loc_1bd7_8fe8
    mov [bp-4], ax

loc_1bd7_8fe8:
    push word ptr [bp-4]
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov di, ax
    mov [bp-14], dx
    or dx, ax
    jnz loc_1bd7_9008
    mov word ptr [bp-a], 0000
    jmp loc_1bd7_9305
