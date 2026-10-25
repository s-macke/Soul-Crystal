; ========================================
; New Subroutine: sub_1bd7_b06c
; ========================================
sub_1bd7_b06c:
    push bp
    mov bp, sp
    sub sp, 06
    push di
    push si
    sub ax, ax
    cwd
    mov di, ax
    mov [bp-2], dx
    mov ax, [bp+6]
    or ax, ax
    jz loc_1bd7_b088
    dec ax
    jz loc_1bd7_b0fe
    jmp loc_1bd7_b102

loc_1bd7_b088:
    mov si, [bp+8]
    cmp si, 25
    jge loc_1bd7_b102
    mov ax, 2c43
    mov es, ax
    mov ax, si
    shl ax, 01
    shl ax, 01
    add ax, 621c
    mov [bp-6], ax

loc_1bd7_b0a1:
    mov al, es:[si+543]
    sub ah, ah
    cmp ax, [6ec4]  ; 7fc1:6ec4 word read
    jz loc_1bd7_b0bb
    cmp byte ptr es:[0541], 43
    jz loc_1bd7_b0bb
    nop
    push cs
    call sub_1bd7_deae

loc_1bd7_b0bb:
    mov ax, 6218
    push ds
    push ax
    mov bx, [bp-6]
    push word ptr [bx+2]
    push word ptr [bx]
    nop
    push cs
    call sub_1bd7_70fa
    add sp, 08
    mov di, ax
    mov [bp-2], dx
    or dx, ax
    jnz loc_1bd7_b0ef
    nop
    push cs
    call sub_1bd7_deb0
    dec ax
    jnz loc_1bd7_b102
    mov es, [6e64]
    mov al, es:[si+543]
    sub ah, ah
    mov [6ec4], ax

loc_1bd7_b0ef:
    mov ax, [bp-2]
    or ax, di
    jnz loc_1bd7_b102
    mov ax, 2c43
    mov es, ax
    jmp loc_1bd7_b0a1
