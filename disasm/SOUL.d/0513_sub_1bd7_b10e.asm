; ========================================
; New Subroutine: sub_1bd7_b10e
; ========================================
sub_1bd7_b10e:
    push bp
    mov bp, sp
    sub sp, 10
    push di
    push si
    mov si, [bp+6]
    mov word ptr [bp-4], 0001
    mov word ptr [bp-2], 0000
    sub ax, ax
    push ax
    mov ax, 000c
    cwd
    push dx
    push ax
    push word ptr [bp+8]
    push si
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    mov di, [bp+e]

loc_1bd7_b13b:
    push word ptr [bp+8]
    push si
    mov ax, 0008
    push ax
    mov cx, 0001
    push cx
    lea cx, [bp-10]
    push ss
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0008
    jnz loc_1bd7_b1d8
    mov al, [bp-c]
    sub ah, ah
    sub dx, dx
    mov dh, dl
    mov dl, ah
    mov ah, al
    sub al, al
    mov cl, [bp-b]
    sub ch, ch
    add ax, cx
    adc dx, 00
    mov dh, dl
    mov dl, ah
    mov ah, al
    sub al, al
    mov cl, [bp-a]
    add ax, cx
    adc dx, 00
    mov dh, dl
    mov dl, ah
    mov ah, al
    sub al, al
    mov cl, [bp-9]
    add ax, cx
    adc dx, 00
    mov [bp-8], ax
    mov [bp-6], dx
    push word ptr [bp+c]
    push word ptr [bp+a]
    lea ax, [bp-10]
    push ss
    push ax
    push cs
    call sub_1bd7_b214
    add sp, 08
    dec ax
    jnz loc_1bd7_b1b0
    dec di
    jz loc_1bd7_b1ef

loc_1bd7_b1b0:
    add byte ptr [bp-8], 01
    jz loc_1bd7_b1be
    add word ptr [bp-8], 01
    adc word ptr [bp-6], 00

loc_1bd7_b1be:
    mov ax, 0001
    push ax
    push word ptr [bp-6]
    push word ptr [bp-8]
    push word ptr [bp+8]
    push si
    nop
    push cs
    call sub_1bd7_74e0
    add sp, 0a
    or ax, ax
    jz loc_1bd7_b1e0

loc_1bd7_b1d8:
    sub ax, ax
    mov [bp-2], ax
    mov [bp-4], ax

loc_1bd7_b1e0:
    cmp word ptr [bp-4], 01
    jnz loc_1bd7_b1ef
    cmp word ptr [bp-2], 00
    jnz loc_1bd7_b1ef
    jmp loc_1bd7_b13b

loc_1bd7_b1ef:
    cmp word ptr [bp-4], 01
    jnz loc_1bd7_b207
    cmp word ptr [bp-2], 00
    jnz loc_1bd7_b207
    mov ax, [bp-8]
    mov dx, [bp-6]
    mov [bp-4], ax
    mov [bp-2], dx

loc_1bd7_b207:
    mov ax, [bp-4]
    mov dx, [bp-2]
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
