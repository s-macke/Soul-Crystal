; ========================================
; New Subroutine: sub_1bd7_83a4
; ========================================
sub_1bd7_83a4:
    push bp
    mov bp, sp
    sub sp, 14
    push si
    mov si, [bp+6]
    mov ax, si
    sub ax, 6b4c
    add ax, 6c3c
    mov [bp-10], ax
    mov al, [si+b]
    sub ah, ah
    mov [bp-c], ax
    cmp word ptr [si+4], 00
    jge loc_1bd7_83cc
    mov word ptr [si+4], 0000

loc_1bd7_83cc:
    mov ax, 0001
    push ax
    sub ax, ax
    push ax
    push ax
    push word ptr [bp-c]
    nop
    push cs
    call sub_1bd7_806a
    add sp, 08
    mov [bp-4], ax
    mov [bp-2], dx
    or dx, dx
    jge loc_1bd7_83f0

loc_1bd7_83e9:
    mov ax, ffff
    cwd
    jmp loc_1bd7_8538

loc_1bd7_83f0:
    add byte ptr [si+a], 08
    jnz loc_1bd7_8414
    mov bx, [bp-10]
    add byte ptr [bx], 01
    jnz loc_1bd7_8414
    mov ax, [si+4]
    cwd
    mov cx, ax
    mov bx, dx
    mov ax, [bp-4]
    mov dx, [bp-2]
    sub ax, cx
    sbb dx, bx
    jmp loc_1bd7_8538
