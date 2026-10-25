; ========================================
; New Subroutine: sub_1bd7_7288
; ========================================
sub_1bd7_7288:
    push bp
    mov bp, sp
    sub sp, 04
    push si
    push di
    mov ax, [bp+a]
    mul word ptr [bp+c]
    mov cx, ax
    or cx, dx
    jz loc_1bd7_72fd
    mov [bp-4], ax
    mov [bp-2], dx
    les bx, [bp+6]
    mov si, [bp+e]

loc_1bd7_72a8:
    or dx, dx
    jnz loc_1bd7_72cb
    cmp ax, ffff
    jz loc_1bd7_72cb
    mov cx, bx
    add cx, ax
    jb loc_1bd7_72cb
    push ax
    push bx
    push dx
    mov cx, ax
    call sub_1bd7_7329
    mov cx, ax
    pop dx
    pop bx
    pop ax
    sub ax, cx
    sbb dx, 00
    jmp loc_1bd7_7307

loc_1bd7_72cb:
    cmp bx, 01
    ja loc_1bd7_72d5
    mov cx, 8000
    jmp loc_1bd7_72d9

loc_1bd7_72d5:
    mov cx, bx
    neg cx

loc_1bd7_72d9:
    push cx
    push ax
    push bx
    push dx
    call sub_1bd7_7329
    mov cx, ax
    pop dx
    pop bx
    pop ax
    pop di
    sub ax, cx
    sbb dx, 00
    cmp cx, di
    jb loc_1bd7_7307
    add bx, cx
    jae loc_1bd7_72ff
    mov cx, es
    add cx, 1000
    mov es, cx
    jmp loc_1bd7_72ff

loc_1bd7_72fd:
    jmp loc_1bd7_7323

loc_1bd7_72ff:
    mov cx, ax
    or cx, dx
    jnz loc_1bd7_72a8
    jmp loc_1bd7_7307

loc_1bd7_7307:
    mov cx, ax
    or cx, dx
    jz loc_1bd7_7320
    mov cx, [bp-4]
    sub cx, ax
    mov ax, cx
    mov cx, [bp-2]
    sbb cx, dx
    mov dx, cx
    div word ptr [bp+a]
    jmp loc_1bd7_7323

loc_1bd7_7320:
    mov ax, [bp+c]

loc_1bd7_7323:
    pop di
    pop si
    mov sp, bp
    pop bp
    retf
