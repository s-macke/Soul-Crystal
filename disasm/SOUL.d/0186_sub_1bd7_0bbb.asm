; ========================================
; New Subroutine: sub_1bd7_0bbb
; ========================================
sub_1bd7_0bbb:
    mov ax, 2707

loc_1bd7_0bbe:
    push bx
    push cx
    push ax
    push dx
    call sub_1bd7_23fd
    cmp byte ptr [6ac0], 00
    jnz loc_1bd7_0b7d

loc_1bd7_0bcc:
    dec dx
    xchg dl, dh
    dec dx
    mov bh, [6637]
    push ax
    mov ah, 02
    call sub_1bd7_0b1a
    pop ax
    cmp byte ptr [6ac0], 00
    jnz loc_1bd7_0c1a
    cmp ax, [6634]
    jz loc_1bd7_0c12
    xchg ax, cx
    mov ah, 01
    call sub_1bd7_0b1a
    add ch, 20
    jnz loc_1bd7_0c12
    add byte ptr [57b4], 04
    jz loc_1bd7_0c12
    cmp byte ptr [6ac4], 19
    jz loc_1bd7_0c12
    push es
    xor ax, ax
    mov es, ax
    mov dx, es:[0463]
    pop es
    xchg ax, cx
    mov al, 0a
    call sub_1bd7_2cd7

loc_1bd7_0c12:
    pop dx
    pop ax
    mov [6634], ax
    pop cx
    pop bx
    ret

loc_1bd7_0c1a:
    call sub_1bd7_0c1f
    jmp loc_1bd7_0c12
