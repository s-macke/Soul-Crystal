data_1bd7_8413:
    db 90  ; |.|

loc_1bd7_8414:
    mov ax, [si]
    sub ax, [si+6]
    mov [bp-a], ax
    add byte ptr [si+a], 03
    jz loc_1bd7_8460
    mov bx, [bp-c]
    add byte ptr [bx+67df], 80
    jz loc_1bd7_8450
    mov ax, [si+6]
    mov dx, [si+8]
    mov [bp-14], ax
    mov [bp-12], dx
    jmp loc_1bd7_8449

loc_1bd7_843a:
    les bx, [bp-14]
    cmp byte ptr es:[bx], 0a
    jnz loc_1bd7_8446
    inc word ptr [bp-a]

loc_1bd7_8446:
    inc word ptr [bp-14]

loc_1bd7_8449:
    mov ax, [si]
    cmp [bp-14], ax
    jb loc_1bd7_843a

loc_1bd7_8450:
    mov ax, [bp-2]
    or ax, [bp-4]
    jnz loc_1bd7_8470
    mov ax, [bp-a]
    sub dx, dx
    jmp loc_1bd7_8538

loc_1bd7_8460:
    add byte ptr [si+a], 80
    jnz loc_1bd7_8450
    mov word ptr [67b4], 0016
    jmp loc_1bd7_83e9

data_1bd7_846f:
    db 90  ; |.|

loc_1bd7_8470:
    add byte ptr [si+a], 01
    jnz loc_1bd7_8479
    jmp loc_1bd7_852c

loc_1bd7_8479:
    cmp word ptr [si+4], 00
    jnz loc_1bd7_8488
    mov word ptr [bp-a], 0000
    jmp loc_1bd7_852c

data_1bd7_8487:
    db 90  ; |.|

loc_1bd7_8488:
    mov ax, [si]
    sub ax, [si+6]
    add ax, [si+4]
    mov [bp-e], ax
    mov bx, [bp-c]
    add byte ptr [bx+67df], 80
    jnz loc_1bd7_84a0
    jmp loc_1bd7_8521

loc_1bd7_84a0:
    mov cx, 0002
    push cx
    sub cx, cx
    push cx
    push cx
    push bx
    nop
    push cs
    call sub_1bd7_806a
    add sp, 08
    cmp ax, [bp-4]
    jnz loc_1bd7_84f6
    cmp dx, [bp-2]
    jnz loc_1bd7_84f6
    mov ax, [bp-e]
    add ax, [si+6]
    mov [bp-8], ax
    mov ax, [si+6]
    mov dx, [si+8]
    mov [bp-14], ax
    mov [bp-12], dx
    jmp loc_1bd7_84e1

loc_1bd7_84d2:
    les bx, [bp-14]
    cmp byte ptr es:[bx], 0a
    jnz loc_1bd7_84de
    inc word ptr [bp-e]

loc_1bd7_84de:
    inc word ptr [bp-14]

loc_1bd7_84e1:
    mov ax, [bp-14]
    cmp [bp-8], ax
    ja loc_1bd7_84d2
    mov bx, [bp-10]
    add byte ptr [bx], 20
    jz loc_1bd7_8521
    inc word ptr [bp-e]
    jmp loc_1bd7_8521

loc_1bd7_84f6:
    sub ax, ax
    push ax
    push word ptr [bp-2]
    push word ptr [bp-4]
    push word ptr [bp-c]
    nop
    push cs
    call sub_1bd7_806a
    add sp, 08
    mov bx, [bp-10]
    mov ax, [bx+2]
    mov [bp-e], ax
    mov bx, [bp-c]
    add byte ptr [bx+67df], 04
    jz loc_1bd7_8521
    inc ax
    mov [bp-e], ax

loc_1bd7_8521:
    mov ax, [bp-e]
    sub dx, dx
    sub [bp-4], ax
    sbb [bp-2], dx

loc_1bd7_852c:
    mov ax, [bp-4]
    mov dx, [bp-2]
    add ax, [bp-a]
    adc dx, 00

loc_1bd7_8538:
    pop si
    mov sp, bp
    pop bp
    retf

data_1bd7_853d:
    db 90  ; |.|
