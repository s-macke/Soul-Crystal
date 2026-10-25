; ========================================
; New Subroutine: sub_1bd7_0c1f
; ========================================
sub_1bd7_0c1f:
    cmp ax, 2707
    jz loc_1bd7_0c9a
    push es
    mov bl, [6ac1]
    cmp bl, 13
    jz loc_1bd7_0c9b
    xor cx, cx
    mov es, cx
    cmp bl, 40
    jnz loc_1bd7_0c43
    add byte ptr [57b4], 06
    jz loc_1bd7_0c43
    call sub_1bd7_2786
    jmp loc_1bd7_0c99

loc_1bd7_0c43:
    push word ptr es:[007c]
    push word ptr es:[007e]
    mov word ptr es:[007c], 6dc6
    mov es:[007e], ds
    cmp ax, [6ab2]
    pushf
    cmp byte ptr [6ac1], 08
    jz loc_1bd7_0c6c
    cmp byte ptr [6ac1], 0d
    jb loc_1bd7_0c7c

loc_1bd7_0c6c:
    mov bl, [6ae9]
    or bl, 80
    mov al, dc
    popf
    jz loc_1bd7_0c85
    dec al
    jmp loc_1bd7_0c85

loc_1bd7_0c7c:
    popf
    mov al, 80
    jz loc_1bd7_0c83
    inc al

loc_1bd7_0c83:
    mov bl, 87

loc_1bd7_0c85:
    mov bh, [6637]
    inc cx
    mov ah, 09
    call sub_1bd7_0b1a
    pop word ptr es:[007e]
    pop word ptr es:[007c]

loc_1bd7_0c99:
    pop es

loc_1bd7_0c9a:
    ret

loc_1bd7_0c9b:
    push dx
    push ax
    mov ah, 03
    call sub_1bd7_0b1a
    xor ax, ax
    xchg dh, al
    mov cl, 03
    shl ax, cl
    shl dx, cl
    mov cx, dx
    mov dx, ax
    call word ptr [6af9]
    mov al, [6ae9]
    mov ah, al
    les bx, [57d2]
    mov cx, 0008
    pop dx
    cmp dx, [6ab2]
    jnz loc_1bd7_0ccd
    shr cx, 01
    add bx, 0500

loc_1bd7_0ccd:
    push cx
    mov cx, 0004

loc_1bd7_0cd1:
    xor es:[bx], ax
    inc bx
    inc bx
    loop loc_1bd7_0cd1
    pop cx
    add bx, 0138
    loop loc_1bd7_0ccd
    pop dx
    jmp loc_1bd7_0c99
