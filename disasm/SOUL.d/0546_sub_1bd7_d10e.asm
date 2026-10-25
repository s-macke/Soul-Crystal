; ========================================
; New Subroutine: sub_1bd7_d10e
; ========================================
sub_1bd7_d10e:
    push bp
    mov bp, sp
    sub sp, 04
    push di
    push si
    mov dx, [bp+6]
    mov ax, dx
    dec ax
    mov [bp-4], ax
    sub si, si
    mov ax, dx
    and ax, fffe
    jz loc_1bd7_d158
    mov di, [bp+8]
    mov ds, [bp+a]

loc_1bd7_d12e:
    mov bx, di
    mov al, [bx+si]
    mov [bp-1], al
    sub bx, si
    add bx, [bp-4]
    mov al, [bx]
    mov cx, bx
    mov bx, di
    mov [bx+si], al
    mov al, [bp-1]
    mov bx, cx
    mov [bx], al
    mov ax, [bp+6]
    shr ax, 01
    inc si
    cmp ax, si
    ja loc_1bd7_d12e
    mov cx, 7fc1
    mov ds, cx

loc_1bd7_d158:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
