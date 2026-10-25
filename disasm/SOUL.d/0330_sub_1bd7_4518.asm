; ========================================
; New Subroutine: sub_1bd7_4518
; ========================================
sub_1bd7_4518:
    push ax
    push bx
    push cx
    push di
    xor ax, ax
    mov bx, ax
    mov cx, ax
    xchg [si-9], cx
    xchg [si-7], bx
    inc cx
    mov [bx-2], cx
    shr cx, 01

loc_1bd7_452e:
    mov di, [bx]
    mov [di], ax
    mov [di+2], ax
    add bx, 02
    loop loc_1bd7_452e
    pop di
    pop cx
    pop bx
    pop ax
    ret
