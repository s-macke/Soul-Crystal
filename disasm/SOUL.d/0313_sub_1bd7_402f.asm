; ========================================
; New Subroutine: sub_1bd7_402f
; ========================================
sub_1bd7_402f:
    push ax
    push bx
    push cx
    push dx
    push di
    push es
    mov si, 57fa
    mov dx, [si+2]

loc_1bd7_403b:
    mov bx, [si+2]
    mov ax, [si+6]
    sub dx, ax
    cmp bx, dx
    jz loc_1bd7_4054
    call sub_1bd7_4086
    cmp word ptr [5802], 00
    jnz loc_1bd7_4079

loc_1bd7_4051:
    mov [si+2], dx

loc_1bd7_4054:
    mov ax, si
    mov si, [si+4]
    cmp [si+2], bx
    ja loc_1bd7_4083
    cmp si, 5806
    jnz loc_1bd7_403b
    cmp word ptr [si+6], 00
    jnz loc_1bd7_4083
    cmp word ptr [si+4], 00
    jnz loc_1bd7_4083
    mov si, ax
    pop es
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

loc_1bd7_4079:
    xchg ax, dx
    mov dx, [si+2]
    call sub_1bd7_0f72
    xchg ax, dx
    jmp loc_1bd7_4051

loc_1bd7_4083:
    jmp loc_1bd7_16a1
