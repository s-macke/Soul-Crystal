; ========================================
; New Subroutine: sub_1000_3041
; ========================================
sub_1000_3041:
    push bp
    mov bp, sp
    sub sp, 0030
    push si
    mov cx, 000f
    lea di, [bp-30]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, [bp+8]
    mov [bp-14], ax
    cmp word ptr [bp-14], 00
    jl loc_1000_3065
    jmp loc_1000_3144

loc_1000_3065:
    cwd
    xor ax, dx
    sub ax, dx
    mov [bp+8], ax
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    mov cx, es:[bx]
    mov [bp-16], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-16]
    push ax
    mov [bp-18], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, [bp-18]
    mov ax, [bp-16]
    mov es:[bx], ax
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    mov cx, es:[bx]
    mov [bp-1a], cx
    mov bx, ax
    mov ax, 000e
    push ax
    lea ax, [bp-1a]
    push ax
    mov [bp-1c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, [bp-1c]
    mov ax, [bp-1a]
    mov es:[bx], ax
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 014a
    imul word ptr [bp+8]
    mov dx, bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    mov cx, es:[bx]
    mov [bp-1e], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-1e]
    push ax
    mov [bp-20], dx
    mov [bp-22], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-22]
    add bx, [si+a]
    mov es, [si+2]
    add bx, [bp-20]
    mov ax, [bp-1e]
    mov es:[bx], ax
    jmp loc_1000_3224

loc_1000_3144:
    cmp word ptr [bp-14], 00
    jz loc_1000_314d
    jmp loc_1000_31d4

loc_1000_314d:
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
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
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, [bp-26]
    mov ax, [bp-24]
    mov es:[bx], ax
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    mov cx, es:[bx]
    mov [bp-28], cx
    mov bx, ax
    mov ax, 000e
    push ax
    lea ax, [bp-28]
    push ax
    mov [bp-2a], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, [bp-2a]
    mov ax, [bp-28]
    mov es:[bx], ax
    jmp loc_1000_3224

loc_1000_31d4:
    mov ax, [bp+6]
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 014a
    imul word ptr [bp+8]
    mov dx, bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    mov cx, es:[bx]
    mov [bp-2c], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-2c]
    push ax
    mov [bp-2e], dx
    mov [bp-30], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-30]
    add bx, [si+a]
    mov es, [si+2]
    add bx, [bp-2e]
    mov ax, [bp-2c]
    mov es:[bx], ax

loc_1000_3224:
    pop si
    mov sp, bp
    pop bp
    retf 0004
