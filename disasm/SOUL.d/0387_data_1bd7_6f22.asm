data_1bd7_6f22:
    db 55, 8b, ec, b9, 01, 00, eb, 0c, 56, 57, b9, 00, 01, eb, 05, 56  ; |U.......VW.....V|
    db 57, b9, 01, 01  ; |W...|

loc_1bd7_6f36:
    push cx
    or cl, cl
    jnz loc_1bd7_6f59
    mov si, 6eda
    mov di, 6eda
    call sub_1bd7_6fb8
    mov si, 6e18
    mov di, 6e1c
    call sub_1bd7_6fb8
    cmp word ptr [6e0a], d6d6
    jnz loc_1bd7_6f59
    call word ptr [6e10]

loc_1bd7_6f59:
    mov si, 6df2
    mov di, 6df6
    call sub_1bd7_6fb8
    mov si, 6e1c
    mov di, 6e1c
    call sub_1bd7_6fb8
    nop
    push cs
    call sub_1bd7_6d6c
    or ax, ax
    jz loc_1bd7_6f85
    pop ax
    or ah, ah
    push ax
    jnz loc_1bd7_6f85
    cmp word ptr [bp+6], 00
    jnz loc_1bd7_6f85
    mov word ptr [bp+6], 00ff

loc_1bd7_6f85:
    nop
    push cs
    call sub_1bd7_6f9f
    pop ax
    or ah, ah
    jnz loc_1bd7_6f9c
    mov ax, [bp+6]
    push ax
    call far, [681a]
    pop ax
    mov ah, 4c
    int 21

loc_1bd7_6f9c:
    pop di
    pop si
    retf
