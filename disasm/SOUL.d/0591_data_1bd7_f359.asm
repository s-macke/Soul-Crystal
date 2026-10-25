data_1bd7_f359:
    db 90  ; |.|

loc_1bd7_f35a:
    mov ax, 008a
    push ax
    mov ax, 03b8
    jmp loc_1bd7_f4da

loc_1bd7_f364:
    mov ax, 03d0
    push ax
    nop
    push cs
    call sub_1bd7_75ce
    add sp, 02
    mov di, [bp+6]
    cmp di, [bp+8]
    jbe loc_1bd7_f37b
    jmp loc_1bd7_f4c4

loc_1bd7_f37b:
    mov si, di
    mov ax, di
    shl si, 01
    add si, ax
    add si, 1358

loc_1bd7_f387:
    mov cl, 03
    mov es, [6e9e]
    mov al, es:[si]
    mov dx, ax
    and al, 80
    cmp al, 01
    sbb al, al
    inc al
    and dl, 40
    cmp dl, 01
    sbb dl, dl
    inc dl
    shl dl, cl
    or dl, al
    shl dl, 01
    shl dl, 01
    mov [bp-1], dl
    mov al, es:[si+1]
    mov dx, ax
    and al, 80
    cmp al, 01
    sbb al, al
    inc al
    and dl, 40
    cmp dl, 01
    sbb dl, dl
    inc dl
    shl dl, cl
    or dl, al
    shl dl, 01
    mov [bp-2], dl
    mov al, es:[si+2]
    mov dx, ax
    and al, 80
    cmp al, 01
    sbb al, al
    inc al
    and dl, 40
    cmp dl, 01
    sbb dl, dl
    inc dl
    shl dl, cl
    or dl, al
    mov [bp-3], dl
    push di
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov al, [bp-3]
    or al, [bp-2]
    or al, [bp-1]
    sub ah, ah
    push ax
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    add si, 03
    inc di
    cmp [bp+8], di
    jb loc_1bd7_f420
    jmp loc_1bd7_f387

loc_1bd7_f420:
    jmp loc_1bd7_f4c4

data_1bd7_f423:
    db 90  ; |.|

loc_1bd7_f424:
    mov si, [bp+6]
    mov ax, 03d0
    push ax
    nop
    push cs
    call sub_1bd7_75ce
    add sp, 02
    push si
    mov ax, 03c8
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov di, si
    cmp si, [bp+8]
    ja loc_1bd7_f4c4
    mov ax, si
    shl si, 01
    add si, ax
    add si, 1358

loc_1bd7_f451:
    push di
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    push di
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov es, [6e9e]  ; data_7fc1_6e9e word read
    mov al, es:[si]
    shr al, 01
    shr al, 01
    sub ah, ah
    push ax
    mov ax, 03c9
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov es, [6e9e]  ; data_7fc1_6e9e word read
    mov al, es:[si+1]
    shr al, 01
    shr al, 01
    sub ah, ah
    push ax
    mov ax, 03c9
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    mov es, [6e9e]  ; data_7fc1_6e9e word read
    mov al, es:[si+2]
    shr al, 01
    shr al, 01
    sub ah, ah
    push ax
    mov ax, 03c9
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    add si, 03
    inc di
    cmp [bp+8], di
    jae loc_1bd7_f451

loc_1bd7_f4c4:
    mov ax, 0020
    push ax
    mov ax, 03c0
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    sub ax, ax
    push ax
    mov ax, 03c0

loc_1bd7_f4da:
    push ax
    nop
    push cs
    call sub_1bd7_75dc
    add sp, 04
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_f4e9:
    db 90  ; |.|
