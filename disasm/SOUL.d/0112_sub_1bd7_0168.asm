; ========================================
; New Subroutine: sub_1bd7_0168
; ========================================
sub_1bd7_0168:
    push di
    push es
    cmp ax, 9000
    mov bx, 8010
    jae loc_1bd7_01b4
    mov bx, ax
    cmp ax, 8000
    jae loc_1bd7_01b4
    mov bx, 800f
    push cs
    pop es
    mov di, 013c

loc_1bd7_0181:
    cmp byte ptr es:[di], ff
    jz loc_1bd7_01b4
    scasb
    jnz loc_1bd7_0181
    xor ah, ah
    mov bl, 0a
    div bl
    or ax, 3030
    push ax
    mov bx, 800e
    push bx
    nop
    push cs
    call sub_1bd7_5d4e
    mov es, dx
    push ax
    xchg ax, bx

loc_1bd7_01a1:
    mov al, es:[bx]
    inc bx
    sub al, 30
    cmp al, 09
    ja loc_1bd7_01a1
    dec bx
    pop cx
    pop ax
    mov es:[bx], ax
    xchg ax, cx
    jmp loc_1bd7_01ba

loc_1bd7_01b4:
    push bx
    nop
    push cs
    call sub_1bd7_5d4e

loc_1bd7_01ba:
    pop es
    pop di
    ret
