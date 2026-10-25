; ========================================
; New Subroutine: sub_1bd7_7456
; ========================================
sub_1bd7_7456:
    push bp
    mov bp, sp
    push si
    push di
    sub sp, 0a
    mov byte ptr [bp-a], cd
    mov ax, [bp+6]
    mov [bp-9], al
    cmp al, 25
    jz loc_1bd7_7476
    cmp al, 26
    jz loc_1bd7_7476
    mov byte ptr [bp-8], cb
    jmp loc_1bd7_7482

loc_1bd7_7476:
    mov byte ptr [bp-6], cb
    mov byte ptr [bp-7], 44
    mov byte ptr [bp-8], 44

loc_1bd7_7482:
    mov [bp-c], ss
    lea ax, [bp-a]
    mov [bp-e], ax
    push ds
    lds di, [bp+8]
    mov ax, [di]
    mov bx, [di+2]
    mov cx, [di+4]
    mov dx, [di+6]
    mov si, [di+8]
    mov di, [di+a]
    pop ds
    push bp
    call far, [bp-e]
    pop bp
    cld
    push ds
    push di
    lds di, [bp+c]
    mov [di], ax
    mov [di+2], bx
    mov [di+4], cx
    mov [di+6], dx
    mov [di+8], si
    pop word ptr [di+a]
    jb loc_1bd7_74c3
    xor si, si
    jmp loc_1bd7_74d2

loc_1bd7_74c3:
    pop cx
    push cx
    push ds
    mov ds, cx
    push cs
    call sub_1bd7_7742
    pop ds
    mov si, 0001
    mov ax, [di]

loc_1bd7_74d2:
    mov [di+c], si
    pop ds
    add sp, 0a
    pop di
    pop si
    mov sp, bp
    pop bp
    retf
