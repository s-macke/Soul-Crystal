data_1bd7_025a:
    db b9, 03, 07  ; |...|

loc_1bd7_025d:
    push bp
    mov bp, sp
    sub sp, 20
    push di
    push es
    push ds
    pop es
    mov bx, [bp+6]
    mov dx, [bp+8]
    xor ah, ah
    lea di, [bp-2]
    std

loc_1bd7_0273:
    mov al, bl
    and al, ch
    add al, 90
    daa
    adc al, 40
    daa
    stosb
    inc ah
    push cx
    xor ch, ch

loc_1bd7_0283:
    shr dx, 01
    rcr bx, 01
    loop loc_1bd7_0283
    pop cx
    push bx
    or bx, dx
    pop bx
    jnz loc_1bd7_0273
    cld
    inc di
    mov bl, ah
    mov dx, di
    call sub_1bd7_1dd3
    xchg ax, bx
    pop es
    pop di
    mov sp, bp
    pop bp
    retf 0004
