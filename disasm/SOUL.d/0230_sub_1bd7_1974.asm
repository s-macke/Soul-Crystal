; ========================================
; New Subroutine: sub_1bd7_1974
; ========================================
sub_1bd7_1974:
    push bx
    push cx
    push si
    push di
    mov cl, [bx+8]
    xor ch, ch
    mov di, [bx+c]
    xor si, si

loc_1bd7_1982:
    mov ax, di
    mul word ptr [bx+e]
    mov di, ax
    mov ax, si
    mov si, dx
    mul word ptr [bx+e]
    jb loc_1bd7_199f
    add si, ax
    jb loc_1bd7_199f
    add bx, 04
    loop loc_1bd7_1982
    mov ax, di
    mov dx, si

loc_1bd7_199f:
    pop di
    pop si
    pop cx
    pop bx
    ret
