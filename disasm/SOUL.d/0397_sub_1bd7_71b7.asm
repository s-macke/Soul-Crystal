; ========================================
; New Subroutine: sub_1bd7_71b7
; ========================================
sub_1bd7_71b7:
    push bp
    mov bp, sp
    sub sp, 04
    mov [bp-2], cx
    mov di, 6c3c
    mov ax, si
    sub ax, 6b4c
    add di, ax
    add byte ptr [si+a], 0c
    jnz loc_1bd7_71d5
    add byte ptr [di], 01
    jz loc_1bd7_71da

loc_1bd7_71d5:
    mov ax, [di+2]
    jmp loc_1bd7_71dd

loc_1bd7_71da:
    mov ax, 0200

loc_1bd7_71dd:
    mov [bp-4], ax

loc_1bd7_71e0:
    add byte ptr [si+a], 0c
    jnz loc_1bd7_71eb
    add byte ptr [di], 01
    jz loc_1bd7_721e

loc_1bd7_71eb:
    mov ax, [si+4]
    or ax, ax
    jz loc_1bd7_721e
    cmp ax, cx
    jbe loc_1bd7_71f8
    mov ax, cx

loc_1bd7_71f8:
    push ax
    push bx
    push cx
    push es
    push ax
    push word ptr [si+2]
    push word ptr [si]
    push es
    push bx
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
    jmp loc_1bd7_721a

loc_1bd7_721a:
    jcxz loc_1bd7_727e
    jmp loc_1bd7_71e0

loc_1bd7_721e:
    cmp cx, [bp-4]
    jb loc_1bd7_7253
    xor dx, dx
    mov ax, cx
    div word ptr [bp-4]
    mov ax, cx
    sub ax, dx
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
    call sub_1bd7_80e4
    add sp, 08
    pop es
    pop cx
    pop bx
    or ax, ax
    jz loc_1bd7_7274
    cmp ax, ffff
    jz loc_1bd7_727a
    sub cx, ax
    add bx, ax
    jmp loc_1bd7_721a

loc_1bd7_7253:
    push bx
    push cx
    push es
    push ds
    push si
    push cs
    call sub_1bd7_7776
    add sp, 04
    pop es
    pop cx
    pop bx
    cmp ax, ffff
    jz loc_1bd7_727e
    mov es:[bx], al
    inc bx
    dec cx
    mov ax, [di+2]
    mov [bp-4], ax
    jmp loc_1bd7_721a

loc_1bd7_7274:
    or byte ptr [si+a], 10
    jmp loc_1bd7_727e

loc_1bd7_727a:
    or byte ptr [si+a], 20

loc_1bd7_727e:
    mov ax, [bp-2]
    sub ax, cx
    mov sp, bp
    pop bp
    ret
