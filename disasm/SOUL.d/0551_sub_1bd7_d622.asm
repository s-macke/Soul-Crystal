; ========================================
; New Subroutine: sub_1bd7_d622
; ========================================
sub_1bd7_d622:
    push bp
    mov bp, sp
    sub sp, 10
    push di
    push si
    mov si, [bp+6]
    sub ax, ax
    mov es, [bp+8]
    mov es:[si], ax
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    sub ax, ax
    push ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov di, ax
    mov [bp-c], dx
    or dx, ax
    jz loc_1bd7_d678
    push word ptr [bp-c]
    push di
    mov ax, 0228
    push ax
    mov cx, 0001
    push cx
    mov cx, 0540
    mov dx, 2c43
    push dx
    push cx
    nop
    push cs
    call sub_1bd7_7116
    add sp, 0c
    cmp ax, 0228
    jz loc_1bd7_d6aa

loc_1bd7_d678:
    mov es, [bp+8]
    mov word ptr es:[si], 0001

loc_1bd7_d680:
    mov es, [bp+8]
    cmp word ptr es:[si], 00
    jz loc_1bd7_d68c
    jmp loc_1bd7_d983

loc_1bd7_d68c:
    mov es, [6e88]  ; data_7fc1_6e88 word read
    mov al, es:[0540]  ; data_2c43_0540 byte read
    sub ah, ah
    dec ax
    jz loc_1bd7_d6ba
    dec ax
    dec ax
    jnz loc_1bd7_d6a0
    jmp loc_1bd7_d7aa

loc_1bd7_d6a0:
    dec ax
    jnz loc_1bd7_d6a6
    jmp loc_1bd7_d89a

loc_1bd7_d6a6:
    jmp loc_1bd7_d983
