; ========================================
; New Subroutine: sub_1bd7_9438
; ========================================
sub_1bd7_9438:
    push bp
    mov bp, sp
    sub sp, 06
    push di
    push si
    sub bx, bx
    mov cx, bx
    mov di, [bp+6]
    mov ds, [bp+8]

loc_1bd7_944a:
    mov si, di
    add si, bx
    cmp byte ptr [si], 00
    jz loc_1bd7_9454
    inc cx

loc_1bd7_9454:
    inc bx
    cmp bx, 06
    jb loc_1bd7_944a
    mov [bp-6], cx
    mov ax, 7fc1
    mov ds, ax
    sub ax, ax
    push ax
    mov ax, 0018
    push ax
    nop
    push cs
    call sub_1bd7_a3a2
    add sp, 04
    sub di, di
    mov ax, 458f
    mov es, ax

loc_1bd7_9478:
    cmp byte ptr es:[di-354a], 00
    jz loc_1bd7_9487
    inc di
    cmp di, 1000
    jb loc_1bd7_9478

loc_1bd7_9487:
    mov byte ptr es:[di-354a], 20
    inc di
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_94c0
    sub si, si
    mov ax, 2c43
    mov ds, ax

loc_1bd7_949b:
    mov al, [si+330]
    mov bx, di
    add bx, si
    mov es:[bx-354a], al
    or al, al
    jz loc_1bd7_94b2
    inc si
    cmp si, 10
    jb loc_1bd7_949b

loc_1bd7_94b2:
    mov ax, 7fc1
    mov ds, ax
    lea ax, [si+2]
    add di, ax
    jmp loc_1bd7_9598
