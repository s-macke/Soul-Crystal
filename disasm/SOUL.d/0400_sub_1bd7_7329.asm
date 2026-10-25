; ========================================
; New Subroutine: sub_1bd7_7329
; ========================================
sub_1bd7_7329:
    push bp
    mov bp, sp
    sub sp, 04
    mov [bp-2], cx
    mov di, 6c3c
    mov ax, si
    sub ax, 6b4c
    add di, ax
    add byte ptr [si+a], 0c
    jnz loc_1bd7_7347
    add byte ptr [di], 01
    jz loc_1bd7_734c

loc_1bd7_7347:
    mov ax, [di+2]
    jmp loc_1bd7_734f

loc_1bd7_734c:
    mov ax, 0200

loc_1bd7_734f:
    mov [bp-4], ax

loc_1bd7_7352:
    add byte ptr [si+a], 08
    jnz loc_1bd7_735d
    add byte ptr [di], 01
    jz loc_1bd7_7393

loc_1bd7_735d:
    mov ax, [si+4]
    or ax, ax
    jz loc_1bd7_7393
    cmp ax, cx
    jbe loc_1bd7_736a
    mov ax, cx

loc_1bd7_736a:
    push ax
    push bx
    push cx
    push es
    push ax
    push es
    push bx
    push word ptr [si+2]
    push word ptr [si]
    push cs
    call sub_1bd7_75ea
    add sp, 0a
    pop es
    pop cx
    pop bx
    pop ax
    sub cx, ax
    sub [si+4], ax
    add bx, ax
    add [si], ax
    jmp loc_1bd7_738c

loc_1bd7_738c:
    or cx, cx
    jnz loc_1bd7_7352
    jmp loc_1bd7_7416

loc_1bd7_7393:
    cmp cx, [bp-4]
    jb loc_1bd7_73e8
    add byte ptr [si+a], 08
    jnz loc_1bd7_73a3
    add byte ptr [di], 01
    jz loc_1bd7_73b6

loc_1bd7_73a3:
    push bx
    push cx
    push es
    push ds
    push si
    push cs
    call sub_1bd7_7a2e
    add sp, 04
    pop es
    pop cx
    pop bx
    or ax, ax
    jnz loc_1bd7_7416

loc_1bd7_73b6:
    xor dx, dx
    mov ax, cx
    div word ptr [bp-4]
    mov ax, cx
    sub ax, dx
    push ax
    push bx
    push cx
    push es
    push ax
    push es
    push bx
    xor ax, ax
    mov al, [si+b]
    push ax
    push cs
    call sub_1bd7_81e2
    add sp, 08
    pop es
    pop cx
    pop bx
    pop dx
    cmp ax, ffff
    jz loc_1bd7_7412
    sub cx, ax
    cmp ax, dx
    jnz loc_1bd7_7412
    add bx, ax
    jmp loc_1bd7_738c

loc_1bd7_73e8:
    xor ax, ax
    mov al, es:[bx]
    push bx
    push cx
    push es
    push ds
    push si
    push ax
    push cs
    call sub_1bd7_7812
    add sp, 06
    pop es
    pop cx
    pop bx
    cmp ax, ffff
    jz loc_1bd7_7416
    inc bx
    dec cx
    mov ax, [di+2]
    or ax, ax
    jnz loc_1bd7_740c
    inc ax

loc_1bd7_740c:
    mov [bp-4], ax
    jmp loc_1bd7_738c

loc_1bd7_7412:
    or byte ptr [si+a], 20

loc_1bd7_7416:
    mov ax, [bp-2]
    sub ax, cx
    mov sp, bp
    pop bp
    ret
