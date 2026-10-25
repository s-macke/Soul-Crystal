; ========================================
; New Subroutine: sub_1bd7_7b12
; ========================================
sub_1bd7_7b12:
    push bp
    mov bp, sp
    mov ax, 0171
    push cs
    call sub_1bd7_6d48
    push si
    push di
    xor ax, ax
    mov [bp-8], ax
    mov [bp-5], al
    les si, [bp+a]
    lodsb byte ptr es:[si]
    mov [bp+a], si
    mov [bp-2], al
    or al, al
    jz loc_1bd7_7b3b
    cmp word ptr [bp-8], 00
    jge loc_1bd7_7b41

loc_1bd7_7b3b:
    mov ax, [bp-8]
    jmp loc_1bd7_7ff6

loc_1bd7_7b41:
    mov bx, 6d30
    sub al, 20
    cmp al, 58
    ja loc_1bd7_7b4f
    xlat
    and al, 0f
    jmp loc_1bd7_7b51

loc_1bd7_7b4f:
    mov al, 00

loc_1bd7_7b51:
    mov cl, 03
    shl al, cl
    add al, [bp-5]
    xlat
    inc cl
    shr al, cl
    mov [bp-5], al
    cbw
    mov bx, ax
    shl bx, 01
    jmp word ptr cs:[bx+7b02]
