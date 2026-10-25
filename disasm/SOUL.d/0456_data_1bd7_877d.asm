data_1bd7_877d:
    db 90, 90, 00, 8b, 4e, 0e, 8b, 46, 06, 8b, 56, 08, 1e, c5, 7e, 0a  ; |....N..F..V...~.|

loc_1bd7_878d:
    push di
    push ds
    pop es
    cld
    xchg ax, bx
    or al, al
    jz loc_1bd7_87a9
    cmp cx, 0a
    jnz loc_1bd7_87a9
    or dx, dx
    jns loc_1bd7_87a9
    mov al, 2d
    stosb
    neg bx
    adc dx, 00
    neg dx

loc_1bd7_87a9:
    mov si, di

loc_1bd7_87ab:
    xchg ax, dx
    xor dx, dx
    or ax, ax
    jz loc_1bd7_87b4
    div cx

loc_1bd7_87b4:
    xchg ax, bx
    div cx
    xchg ax, dx
    xchg bx, dx
    add al, 30
    cmp al, 39
    jbe loc_1bd7_87c2
    add al, 27

loc_1bd7_87c2:
    stosb
    mov ax, dx
    or ax, bx
    jnz loc_1bd7_87ab
    mov [di], al

loc_1bd7_87cb:
    dec di
    lodsb byte ptr [si]
    xchg [di], al
    mov [si-1], al
    lea ax, [si+1]
    cmp ax, di
    jb loc_1bd7_87cb
    mov dx, ds
    pop ax
    pop ds
    pop di
    pop si
    mov sp, bp
    pop bp
    retf

data_1bd7_87e3:
    db 00  ; |.|
