; ========================================
; New Subroutine: sub_1bd7_b214
; ========================================
sub_1bd7_b214:
    push bp
    mov bp, sp
    sub sp, 02
    push di
    push si
    lds di, [bp+a]
    mov cx, 0001
    sub si, si
    cmp byte ptr [di], 00
    jz loc_1bd7_b250
    mov [bp-2], cx
    mov cx, [bp+6]
    mov es, [bp+8]

loc_1bd7_b232:
    mov bx, cx
    add bx, si
    mov al, es:[bx]
    mov bx, di
    cmp [bx+si], al
    jnz loc_1bd7_b258
    inc si
    cmp byte ptr [bx+si], 00
    jnz loc_1bd7_b232
    mov ax, 7fc1
    mov ds, ax
    mov cx, [bp-2]
    jmp loc_1bd7_b25f
