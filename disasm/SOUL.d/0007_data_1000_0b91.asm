data_1000_0b91:
    db 90  ; |.|

loc_1000_0b92:
    mov ax, 0008
    push ax
    mov si, [bp-30]
    shl si, 01
    push word ptr [si+373c]
    mov [bp-34], si
    call sub_1bd7_8b87
    add sp, 04
    mov [bp-32], ax
    mov si, [bp-34]
    mov bx, si
    add si, 38
    mov ax, [si+373c]
    add ax, [bp-32]
    add bx, 00ce
    lea si, [bp-24]
    add bx, [si+a]
    mov es, [si+2]
    mov es:[bx], ax
    mov ax, [bp-30]
    inc ax

loc_1000_0bd0:
    mov [bp-30], ax
    cmp ax, 001b
    jle loc_1000_0b92
    push word ptr [bp-26]
    lea si, [bp-24]
    mov bx, 0002
    add bx, [si+a]
    mov es, [si+2]
    mov ax, es
    push ax
    mov bx, 0002
    add bx, [si+a]
    mov es, [si+2]
    push bx
    call sub_1bd7_dfc6
    add sp, 06
    lea ax, [bp-24]
    push ax
    call sub_1bd7_12be
    pop si
    mov sp, bp
    pop bp
    retf

data_1000_0c0a:
    db 90, 90, 90, e9, 1e, 00, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90  ; |................|
    db 90, 90, 90, 90, 90, 90, 90, 90, 90, 55, 8b, ec, 5d, cb, 90, 90  ; |.........U..]...|
    db 90, 90, 90, 90, e9, 92, 01, 90  ; |........|
