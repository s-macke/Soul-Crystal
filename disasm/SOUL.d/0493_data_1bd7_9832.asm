data_1bd7_9832:
    db 90, 90  ; |..|

loc_1bd7_9834:
    mov word ptr [bp-2], 0001

loc_1bd7_9839:
    add byte ptr [di+4], ff
    jz loc_1bd7_985e
    cmp word ptr [bp-2], 00
    jz loc_1bd7_985e
    mov ax, 7fc1
    mov ds, ax
    mov ax, 0003
    push ax
    push si
    push cs
    call sub_1bd7_a3a2
    add sp, 04
    mov word ptr [bp-2], 0000
    jmp loc_1bd7_98a8

data_1bd7_985d:
    db 90  ; |.|

loc_1bd7_985e:
    mov ax, 7fc1
    mov ds, ax
    mov ax, 0002
    push ax
    mov es, [bp+c]
    mov ax, es:[di]
    sub ax, 0053
    jmp loc_1bd7_98a0

loc_1bd7_9872:
    cmp word ptr [di], 53
    jae loc_1bd7_98c8
    mov ax, 7fc1
    mov ds, ax
    mov ax, 0001
    push ax
    mov ax, es:[di]
    dec ax
    push ax
    push cs
    call sub_1bd7_a3a2
    add sp, 04

loc_1bd7_988c:
    mov es, [bp+c]
    cmp word ptr es:[di], 0243
    jbe loc_1bd7_98a8
    mov ax, 0001
    push ax
    mov ax, es:[di]
    sub ax, 01f2

loc_1bd7_98a0:
    push ax
    push cs
    call sub_1bd7_a3a2

loc_1bd7_98a5:
    add sp, 04

loc_1bd7_98a8:
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_98e0
    push word ptr [bp-2]
    mov ax, cab6
    mov cx, 458f
    push cx
    push ax
    push cs
    call sub_1bd7_a5b6
    add sp, 06
    mov word ptr [6eba], 0001
    jmp loc_1bd7_98e0

loc_1bd7_98c8:
    mov ax, 7fc1
    mov ds, ax
    jmp loc_1bd7_988c

data_1bd7_98cf:
    db 90  ; |.|

loc_1bd7_98d0:
    sub ax, ax
    mov [6eb8], ax
    mov [6eba], ax
    jmp loc_1bd7_98e0

loc_1bd7_98da:
    mov word ptr [6eba], 0000

loc_1bd7_98e0:
    mov ax, [bp-6]
    les bx, [bp+6]
    mov es:[bx], ax
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_98ef:
    db 90  ; |.|
