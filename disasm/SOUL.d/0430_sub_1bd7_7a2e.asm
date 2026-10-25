; ========================================
; New Subroutine: sub_1bd7_7a2e
; ========================================
sub_1bd7_7a2e:
    push bp
    mov bp, sp
    sub sp, 02
    push di
    push si
    sub di, di
    mov ax, [bp+8]
    or ax, [bp+6]
    jnz loc_1bd7_7a48
    sub ax, ax
    push ax
    call sub_1bd7_7ab6
    jmp loc_1bd7_7aa7

loc_1bd7_7a48:
    mov si, [bp+6]
    mov al, [si+a]
    mov cx, ax
    and al, 03
    cmp al, 02
    jnz loc_1bd7_7a95
    add cl, 08
    jnz loc_1bd7_7a68
    mov bx, si
    sub bx, 6b4c
    add byte ptr [bx+6c3c], 01
    jz loc_1bd7_7a95

loc_1bd7_7a68:
    mov ax, [si]
    sub ax, [si+6]
    mov [bp-2], ax
    or ax, ax
    jle loc_1bd7_7a95
    push ax
    push word ptr [si+8]
    push word ptr [si+6]
    mov cl, [si+b]
    sub ch, ch
    push cx
    nop
    push cs
    call sub_1bd7_81e2
    add sp, 08
    cmp [bp-2], ax
    jz loc_1bd7_7a95
    or byte ptr [si+a], 20
    mov di, ffff

loc_1bd7_7a95:
    mov ax, [si+6]
    mov dx, [si+8]
    mov [si], ax
    mov [si+2], dx
    mov word ptr [si+4], 0000
    mov ax, di

loc_1bd7_7aa7:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
