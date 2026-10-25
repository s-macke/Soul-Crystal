; ========================================
; New Subroutine: sub_1000_0e97
; ========================================
sub_1000_0e97:
    push bp
    mov bp, sp
    sub sp, 0018
    push si
    xor ax, ax
    mov [bp-14], ax
    mov [bp-16], ax
    mov [bp-18], ax
    mov ax, 0001
    jmp loc_1000_0ef2

loc_1000_0eb0:
    mov bx, 000e
    imul bx
    mov bx, ax
    mov si, 0080
    add bx, [si+a]
    mov es, [si+2]
    cmp word ptr es:[bx], ff
    jnz loc_1000_0eee
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    mov cx, [bp+8]
    mov es:[bx], cx
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov ax, [bp+6]
    mov es:[bx], ax
    mov ax, [bp-14]
    mov [bp-16], ax
    jmp loc_1000_0efa

loc_1000_0eee:
    mov ax, [bp-14]
    inc ax

loc_1000_0ef2:
    mov [bp-14], ax
    cmp ax, 000a
    jle loc_1000_0eb0

loc_1000_0efa:
    mov ax, [bp-18]
    pop si
    mov sp, bp
    pop bp
    retf 0004
