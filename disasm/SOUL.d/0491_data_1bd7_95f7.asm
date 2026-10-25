data_1bd7_95f7:
    db 90  ; |.|

loc_1bd7_95f8:
    mov ax, 0001
    push ax
    mov ax, 001b
    push ax
    nop
    push cs
    call sub_1bd7_a3a2
    add sp, 04
    sub di, di
    mov ax, 458f
    mov es, ax

loc_1bd7_960f:
    cmp byte ptr es:[di-354a], 00
    jz loc_1bd7_961e
    inc di
    cmp di, 1000
    jb loc_1bd7_960f

loc_1bd7_961e:
    mov byte ptr es:[di-354a], 20
    inc di
    mov word ptr [bp-4], 0000
    cmp word ptr [bp+a], 00
    jnz loc_1bd7_9633
    jmp loc_1bd7_96e7

loc_1bd7_9633:
    mov [bp-6], di

loc_1bd7_9636:
    sub si, si
    mov ax, [bp+6]
    mov dx, [bp+8]
    add ax, [bp-4]
    mov [bp-10], ax
    mov [bp-e], dx
    mov ax, 458f
    mov es, ax

loc_1bd7_964c:
    lds bx, [bp-10]
    mov bl, [bx]
    sub bh, bh
    mov cl, 04
    shl bx, cl
    add bx, si
    mov ax, 2c43
    mov ds, ax
    mov al, [bx+181e]
    mov bx, si
    add bx, di
    mov es:[bx-354a], al
    or al, al
    jz loc_1bd7_9675
    inc si
    cmp si, 10
    jb loc_1bd7_964c

loc_1bd7_9675:
    mov ax, 7fc1
    mov ds, ax
    add di, si
    mov byte ptr es:[di-354a], 2c
    inc di
    mov byte ptr es:[di-354a], 20
    inc di
    cmp word ptr [bp+a], 01
    jz loc_1bd7_96d6
    mov ax, [bp+a]
    sub ax, [bp-4]
    cmp ax, 0002
    jnz loc_1bd7_96d6
    dec di
    dec di
    mov byte ptr es:[di-354a], 20
    inc di
    sub si, si
    mov [bp-6], di
    mov ax, 2c43
    mov ds, ax

loc_1bd7_96ae:
    mov al, [si+2f0]
    mov bx, si
    add bx, di
    mov es:[bx-354a], al
    or al, al
    jz loc_1bd7_96c5
    inc si
    cmp si, 10
    jb loc_1bd7_96ae

loc_1bd7_96c5:
    mov [bp-2], si
    mov ax, 7fc1
    mov ds, ax
    add di, si
    mov byte ptr es:[di-354a], 20
    inc di

loc_1bd7_96d6:
    mov [bp-6], di
    inc word ptr [bp-4]
    mov ax, [bp+a]
    cmp [bp-4], ax
    jae loc_1bd7_96e7
    jmp loc_1bd7_9636

loc_1bd7_96e7:
    mov es, [6e30]
    lea bx, [di-2]
    mov byte ptr es:[bx-354a], 2e
    mov byte ptr es:[bx-3549], 00
    sub ax, ax
    push ax
    mov ax, cab6
    push es
    push ax
    nop
    push cs
    call sub_1bd7_a5b6
    add sp, 06
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
