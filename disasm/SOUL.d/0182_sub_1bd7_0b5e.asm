; ========================================
; New Subroutine: sub_1bd7_0b5e
; ========================================
sub_1bd7_0b5e:
    push ax
    push bx
    mov bh, [6637]  ; data_7fc1_6637 byte read
    mov ah, 03
    call sub_1bd7_0b1a
    inc dx
    xchg dl, dh
    inc dx
    cmp ch, cl
    jbe loc_1bd7_0b75
    mov cx, [6ab4]

loc_1bd7_0b75:
    mov byte ptr [6634], ff  ; data_7fc1_6634 byte write
    pop bx
    pop ax
    ret

loc_1bd7_0b7d:
    push ax
    mov ax, [6634]
    cmp al, ff
    jz loc_1bd7_0b88
    call sub_1bd7_0c1f

loc_1bd7_0b88:
    pop ax
    jmp loc_1bd7_0bcc
