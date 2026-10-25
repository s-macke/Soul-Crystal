; ========================================
; New Subroutine: sub_1bd7_7116
; ========================================
sub_1bd7_7116:
    push bp
    mov bp, sp
    sub sp, 04
    push si
    push di
    mov ax, [bp+a]
    mul word ptr [bp+c]
    mov cx, ax
    or cx, dx
    jz loc_1bd7_718b
    mov [bp-4], ax
    mov [bp-2], dx
    les bx, [bp+6]
    mov si, [bp+e]

loc_1bd7_7136:
    or dx, dx
    jnz loc_1bd7_7159
    cmp ax, ffff
    jz loc_1bd7_7159
    mov cx, bx
    add cx, ax
    jb loc_1bd7_7159
    push ax
    push bx
    push dx
    mov cx, ax
    call sub_1bd7_71b7
    mov cx, ax
    pop dx
    pop bx
    pop ax
    sub ax, cx
    sbb dx, 00
    jmp loc_1bd7_7195

loc_1bd7_7159:
    cmp bx, 01
    ja loc_1bd7_7163
    mov cx, 8000
    jmp loc_1bd7_7167

loc_1bd7_7163:
    mov cx, bx
    neg cx

loc_1bd7_7167:
    push cx
    push ax
    push bx
    push dx
    call sub_1bd7_71b7
    mov cx, ax
    pop dx
    pop bx
    pop ax
    pop di
    sub ax, cx
    sbb dx, 00
    cmp cx, di
    jb loc_1bd7_7195
    add bx, cx
    jae loc_1bd7_718d
    mov cx, es
    add cx, 1000
    mov es, cx
    jmp loc_1bd7_718d

loc_1bd7_718b:
    jmp loc_1bd7_71b1

loc_1bd7_718d:
    mov cx, ax
    or cx, dx
    jnz loc_1bd7_7136
    jmp loc_1bd7_7195

loc_1bd7_7195:
    mov cx, ax
    or cx, dx
    jz loc_1bd7_71ae
    mov cx, [bp-4]
    sub cx, ax
    mov ax, cx
    mov cx, [bp-2]
    sbb cx, dx
    mov dx, cx
    div word ptr [bp+a]
    jmp loc_1bd7_71b1

loc_1bd7_71ae:
    mov ax, [bp+c]

loc_1bd7_71b1:
    pop di
    pop si
    mov sp, bp
    pop bp
    retf
