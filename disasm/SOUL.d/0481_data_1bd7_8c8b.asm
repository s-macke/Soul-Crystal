data_1bd7_8c8b:
    db 90  ; |.|

loc_1bd7_8c8c:
    mov bx, [6eac]
    or bx, bx
    jnz loc_1bd7_8ca7
    mov cl, 03
    mov ax, [bp+8]
    shl ax, cl
    add ax, 0000
    mov [6ea6], ax
    mov word ptr [6ea8], 6387

loc_1bd7_8ca7:
    mov ax, [6eae]
    mov es, [6e1e]
    mov si, [6ea4]
    shl si, 01
    mov es:[si+5a9a], ax
    mov es, [6e20]
    mov es:[si-3550], bx
    inc word ptr [6ea4]
    mov word ptr [bp-c], 0000
    jmp loc_1bd7_8d59

loc_1bd7_8cce:
    cmp byte ptr [bp-1], ff
    jnz loc_1bd7_8cdd
    cmp word ptr [bp-c], 00
    jz loc_1bd7_8cdd
    jmp loc_1bd7_8d6e

loc_1bd7_8cdd:
    inc word ptr [6eac]
    mov word ptr [bp-c], 0001
    cmp byte ptr [bp-1], ff
    jnz loc_1bd7_8cfc
    mov cl, 04
    mov ax, [bp+8]
    shl ax, cl
    add ax, 181e
    mov cx, 2c43
    jmp loc_1bd7_8d0b

data_1bd7_8cfb:
    db 90  ; |.|

loc_1bd7_8cfc:
    mov cl, 04
    mov al, [bp-1]
    sub ah, ah
    shl ax, cl
    add ax, 0000
    mov cx, 2c43

loc_1bd7_8d0b:
    mov di, ax
    mov [bp-8], cx
    sub dx, dx
    mov [bp-2], dx
    mov [bp-a], di
    mov si, dx
    mov di, ss:[6eae]
    lds cx, [bp-a]
    mov ax, 6387
    mov es, ax

loc_1bd7_8d27:
    mov bx, cx
    add bx, si
    mov al, [bx]
    mov es:[di+200], al
    inc di
    or al, al
    jz loc_1bd7_8d4a
    inc si
    cmp si, 10
    jl loc_1bd7_8d27
    mov ss:[6eae], di
    mov ax, 7fc1
    mov ds, ax
    jmp loc_1bd7_8d59

data_1bd7_8d49:
    db 90  ; |.|

loc_1bd7_8d4a:
    mov ax, 7fc1
    mov ds, ax
    mov byte ptr es:[di+1ff], 20
    mov [6eae], di

loc_1bd7_8d59:
    les bx, [6ea6]
    mov si, [6eac]
    mov al, es:[bx+si]
    mov [bp-1], al
    or al, al
    jz loc_1bd7_8d6e
    jmp loc_1bd7_8cce

loc_1bd7_8d6e:
    cmp byte ptr [bp-1], 00
    jnz loc_1bd7_8dce
    mov es, [6e1c]
    dec word ptr [6eae]
    mov bx, [6eae]
    mov byte ptr es:[bx+200], 2e
    jmp loc_1bd7_8ddc

loc_1bd7_8d88:
    mov bx, [6ea4]
    or bx, bx
    jz loc_1bd7_8d91
    dec bx

loc_1bd7_8d91:
    mov es, [6e20]
    mov si, bx
    shl si, 01
    mov ax, es:[si-3550]
    mov [6eac], ax
    mov es, [6e1e]
    mov ax, es:[si+5a9a]
    mov [6eae], ax
    mov [bp-2], ax
    mov [6ea4], bx
    cmp ax, 005a
    jge loc_1bd7_8dce
    mov ax, 0020
    mov bx, [bp-2]
    mov es, [6e1c]
    mov cx, 005a
    sub cx, bx
    lea di, [bx+200]
    repz stosb

loc_1bd7_8dce:
    mov es, [6e1c]
    mov bx, [6eae]
    mov byte ptr es:[bx+200], 5f

loc_1bd7_8ddc:
    push word ptr [6eaa]
    push cs
    call sub_1bd7_8e14
    add sp, 02
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_8ded:
    db 90  ; |.|

loc_1bd7_8dee:
    mov ax, 2020
    mov es, [6e1c]
    mov cx, 002d
    mov di, 0200
    repz stosw
    mov ax, [bp+8]
    mov [6eaa], ax
    sub ax, ax
    mov [6eae], ax

loc_1bd7_8e08:
    mov [6eac], ax
    mov [6ea4], ax
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
