; ========================================
; New Subroutine: sub_1bd7_8a3a
; ========================================
sub_1bd7_8a3a:
    push es
    push di
    mov di, ax
    add di, bx
    mov [bx+4], di
    dec di
    dec di
    sub ax, 0016
    lea si, [bx+14]
    mov word ptr [di], fffe
    mov [bx+a], di
    dec ax
    mov [si], ax
    mov [bx], ds
    mov ax, si
    mov dx, ds
    mov es, dx
    lea di, [bx+6]
    cld
    stosw
    stosw
    inc di
    inc di
    xor ax, ax
    stosw
    stosw
    stosw
    stosw
    pop di
    pop es
    ret
