; ========================================
; New Subroutine: sub_1bd7_bfa2
; ========================================
sub_1bd7_bfa2:
    push bp
    mov bp, sp
    sub sp, 1e
    push di
    push si
    mov si, [bp+6]
    mov word ptr [bp-a], 0000
    nop
    push cs
    call sub_1bd7_e256
    push ax
    nop
    push cs
    call sub_1bd7_7690
    add sp, 02
    cmp si, 04
    jz loc_1bd7_c016
    mov word ptr [bp-a], 0000
    mov word ptr [bp-1a], 0002
    sub ax, ax
    mov [bp-18], ax
    mov [bp-16], ax
    nop
    push cs
    call sub_1bd7_76a2
    mov cx, 0020
    cwd
    idiv cx
    mov bx, dx
    mov [bp-1], bl
    sub bh, bh
    mov ax, bx
    shl bx, 01
    add bx, ax
    shl bx, 01
    mov al, [bx+6334]
    sub ah, ah
    mov [bp-14], ax
    mov al, [bx+6333]
    mov [bp-12], ax
    mov al, [bx+6330]
    mov [bp-10], ax
    mov al, [bx+6331]
    mov [bp-e], ax
    mov al, [bx+6332]
    jmp loc_1bd7_c064
