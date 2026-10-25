; ========================================
; New Subroutine: sub_1bd7_43a9
; ========================================
sub_1bd7_43a9:
    mov si, [5810]
    cmp byte ptr [si], 01
    jnz loc_1bd7_43b9
    mov ax, [si-3]
    cmp ax, bx
    jae loc_1bd7_43bf

loc_1bd7_43b9:
    stc
    ret

loc_1bd7_43bb:
    add bx, ax
    jmp loc_1bd7_43d9

loc_1bd7_43bf:
    jz loc_1bd7_43d9
    sub ax, bx
    cmp ax, 0008
    jb loc_1bd7_43bb
    sub si, bx
    mov byte ptr [si], 01
    mov [si-3], ax
    sub si, ax
    mov [si+1], ax
    add si, ax
    add si, bx

loc_1bd7_43d9:
    push cx
    push di
    push es
    push ds
    pop es
    mov di, si
    sub di, bx
    mov [5810], di
    inc di
    xor ax, ax
    mov cx, bx
    shr cx, 01
    repz stosw
    pop es
    pop di
    pop cx
    mov [si], dl
    mov [si-3], bx
    sub si, bx
    mov [si+1], bx
    add si, bx
    cmp byte ptr [si], 08
    jnz loc_1bd7_4408
    mov [si-1], cl
    jmp loc_1bd7_440b

loc_1bd7_4408:
    mov [si-5], cx

loc_1bd7_440b:
    sub si, bx
    add si, 03
    ret
