data_1bd7_a071:
    db 90  ; |.|

loc_1bd7_a072:
    inc bx
    cmp bx, si
    jb loc_1bd7_a02f
    jmp loc_1bd7_a06a

data_1bd7_a079:
    db 90  ; |.|

loc_1bd7_a07a:
    cmp word ptr [bp-4], 00
    jz loc_1bd7_a09d
    mov es, [6e34]
    mov ax, [bp+6]
    mov dx, [bp+8]
    mov cx, [bp-4]
    shr cx, 01
    push ds
    mov di, 648a
    mov si, ax
    mov ds, dx
    repz movsw
    jae loc_1bd7_a09c
    movsb

loc_1bd7_a09c:
    pop ds

loc_1bd7_a09d:
    les bx, [bp-e]
    cmp byte ptr es:[bx], 00
    jz loc_1bd7_a0fd
    mov ax, [bp+a]
    sub ax, [bp-4]
    mov [bp-6], ax
    or ax, ax
    jz loc_1bd7_a0fd
    mov cx, [bp-4]
    mov ax, 458f
    mov ds, ax

loc_1bd7_a0bb:
    sub di, di
    or cx, cx
    jz loc_1bd7_a0f2

loc_1bd7_a0c1:
    cmp byte ptr [di+648a], 21
    jae loc_1bd7_a0e7
    mov si, cx
    dec si
    cmp si, di
    jb loc_1bd7_a0e2
    mov [bp-4], cx

loc_1bd7_a0d2:
    mov al, [si+648a]
    mov [si+648b], al
    dec si
    cmp si, di
    jae loc_1bd7_a0d2
    mov cx, [bp-4]

loc_1bd7_a0e2:
    inc di
    inc cx
    dec word ptr [bp-6]

loc_1bd7_a0e7:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_a0f2
    inc di
    cmp di, cx
    jb loc_1bd7_a0c1

loc_1bd7_a0f2:
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_a0bb
    mov ax, 7fc1
    mov ds, ax

loc_1bd7_a0fd:
    les bx, [bp-e]
    cmp byte ptr es:[bx], 00
    jz loc_1bd7_a109
    inc word ptr [bp-e]

loc_1bd7_a109:
    mov ax, [bp-e]
    mov dx, es
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
