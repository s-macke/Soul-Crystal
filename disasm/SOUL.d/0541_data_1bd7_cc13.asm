data_1bd7_cc13:
    db 90  ; |.|

loc_1bd7_cc14:
    mov byte ptr [bp-f], 00
    mov byte ptr [bp-10], 03
    jmp loc_1bd7_ccb2

data_1bd7_cc1f:
    db 90  ; |.|

loc_1bd7_cc20:
    mov ax, 0003
    push ax
    mov ax, 03bf
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov ax, 0082
    push ax
    mov ax, 03b8
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov byte ptr [bp-1], 00

loc_1bd7_cc44:
    mov al, [bp-1]
    sub ah, ah
    push ax
    mov cx, 03b4
    push cx
    mov si, ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    les bx, [6528]
    mov al, es:[bx+si]
    sub ah, ah
    push ax
    mov ax, 03b5
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    inc byte ptr [bp-1]
    cmp byte ptr [bp-1], 10
    jb loc_1bd7_cc44
    sub ax, ax
    sub bx, bx
    mov cx, b800
    mov dx, cx
    mov cx, 3fff
    mov di, bx
    mov es, dx
    repz stosw
    stosb
    mov ax, 008a
    push ax
    mov ax, 03b8
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

loc_1bd7_cca0:
    mov byte ptr [bp-f], 00
    mov byte ptr [bp-10], 10
    jmp loc_1bd7_ccb2

loc_1bd7_ccaa:
    mov byte ptr [bp-f], 00
    mov byte ptr [bp-10], 12

loc_1bd7_ccb2:
    lea ax, [bp-10]
    push ss
    push ax
    push ss
    push ax
    mov ax, 0010
    push ax
    nop
    push cs
    call sub_1bd7_7456
    add sp, 0a
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_cccb:
    db 90  ; |.|
