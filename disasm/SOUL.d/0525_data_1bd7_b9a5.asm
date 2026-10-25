data_1bd7_b9a5:
    db 90  ; |.|

loc_1bd7_b9a6:
    mov ax, 2020
    mov es, [6e70]
    mov cx, 004e
    mov di, dcd6
    repz stosw
    mov ax, 0008
    push ax
    nop
    push cs
    call sub_1bd7_b924
    add sp, 02

loc_1bd7_b9c1:
    mov ax, 2020
    mov es, [6e70]
    mov cx, 004e
    mov di, dcd6
    repz stosw
    sub si, si
    mov di, [bp+10]

loc_1bd7_b9d5:
    mov cx, [6ec6]
    mov ax, si
    add ax, cx
    cmp ax, di
    jae loc_1bd7_ba0a
    mov cl, 04
    les bx, [bp+8]
    add bx, si
    add bx, [6ec6]
    mov al, es:[bx]
    sub ah, ah
    shl ax, cl
    add ax, 181e
    mov cx, 2c43
    push cx
    push ax
    mov es, [6e72]
    mov ax, es:[0c9a]
    mul si
    add ax, dcd6
    jmp loc_1bd7_ba80

loc_1bd7_ba0a:
    mov ax, [bp+12]
    add ax, di
    mov dx, si
    add dx, cx
    cmp ax, dx
    jbe loc_1bd7_ba8d
    mov cl, 04
    les bx, [bp+c]
    sub bx, di
    add bx, si
    add bx, [6ec6]
    mov al, es:[bx]
    sub ah, ah
    shl ax, cl
    add ax, 181e
    mov cx, 2c43
    push cx
    push ax
    mov bx, 0c9a
    mov es, [6e72]
    mov [bp-6], bx
    mov [bp-4], es
    mov ax, es:[bx]
    mul si
    add ax, dcd6
    mov cx, 458f
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7420
    add sp, 08
    mov ax, [6ec6]
    sub ax, di
    add ax, si
    mov cx, [bp+14]
    dec cx
    cmp ax, cx
    jb loc_1bd7_ba70
    cmp word ptr [bp+14], 00
    jz loc_1bd7_ba70
    mov ax, 632c
    jmp loc_1bd7_ba73

data_1bd7_ba6f:
    db 90  ; |.|

loc_1bd7_ba70:
    mov ax, 6328

loc_1bd7_ba73:
    push ds
    push ax
    les bx, [bp-6]
    mov ax, es:[bx]
    mul si
    add ax, dcf8

loc_1bd7_ba80:
    mov cx, 458f
    push cx
    push ax
    nop
    push cs
    call sub_1bd7_7420
    add sp, 08

loc_1bd7_ba8d:
    inc si
    cmp si, 04
    jge loc_1bd7_ba96
    jmp loc_1bd7_b9d5

loc_1bd7_ba96:
    mov ax, 0008
    push ax
    sub ax, ax
    push ax
    push cs
    call sub_1bd7_bba4
    add sp, 04
    mov si, ax
    sub ah, ah
    cmp ax, 0006
    ja loc_1bd7_bac4
    shl ax, 01
    xchg ax, bx
    jmp word ptr cs:[bx-454a]

data_1bd7_bab5:
    db 90, cc, ba, d4, ba, d4, ba, d4, ba, d4, ba, 18, bb, 3a, bb  ; |.............:.|

loc_1bd7_bac4:
    mov cx, [6ec6]
    jmp loc_1bd7_bb77

data_1bd7_bacb:
    db 90, c7, 46, fe, ff, 7f, eb, f1, 90, 8b, 0e, c6, 6e, 8b, c6, 2a  ; |..F.........n..*|
    db e4, 48, 8b, f0, 03, c1, 3b, c7, 73, 13, c4, 5e, 08, 03, de, 03  ; |.H....;.s..^....|
    db d9, 26, 8a, 07, 2a, e4, 89, 46, fe, e9, 80, 00, 90, 8b, 46, 12  ; |.&..*..F......F.|
    db 03, c7, 8b, d6, 03, d1, 3b, c2, 76, 72, 8b, de, 03, 5e, 0c, 8e  ; |......;.vr...^..|
    db 46, 0e, 2b, df, 8b, f1, 26, 8a, 00, eb, d9, 90, 90, 8b, c6, 2a  ; |F.+...&........*|
    db c0, 2d, 00, 01, 74, 0b, 2d, 00, 01, 74, 0e, 8b, 0e, c6, 6e, eb  ; |.-..t.-..t....n.|
    db 45, 8b, 0e, c6, 6e, 49, eb, 3e, 90, 8b, 0e, c6, 6e, eb, 34, 8b  ; |E...nI.>....n.4.|
    db c6, 2a, c0, 2d, 00, 01, 74, 0b, 2d, 00, 01, 74, 0e, 8b, 0e, c6  ; |.*.-..t.-..t....|
    db 6e, eb, 0f, 8b, 0e, c6, 6e, 41, eb, 08, 90, 8b, 0e, c6, 6e, 83  ; |n.....nA......n.|
    db c1, 04, 8b, 46, 12, 03, c7, 2d, 04, 00, 3b, c1, 73, 08, 8b, 4e  ; |...F...-..;.s..N|
    db 12, 03, cf, 83, e9, 04, 0b, c9, 7d, 02, 2b, c9  ; |........}.+.|

loc_1bd7_bb77:
    mov [6ec6], cx
    cmp word ptr [bp-2], 00
    jnz loc_1bd7_bb84
    jmp loc_1bd7_b9c1

loc_1bd7_bb84:
    jmp loc_1bd7_bb9a

loc_1bd7_bb86:
    sub ax, ax
    push ax
    mov cx, 0001
    push cx
    push cs
    call sub_1bd7_bba4
    add sp, 04
    mov word ptr [6ec6], 0000

loc_1bd7_bb9a:
    mov ax, [bp-2]
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_bba3:
    db 90  ; |.|
