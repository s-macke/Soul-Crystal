; ========================================
; New Subroutine: sub_1bd7_0d16
; ========================================
sub_1bd7_0d16:
    push ax
    push bx
    push cx
    push dx
    cmp al, 0e
    cmc
    jb loc_1bd7_0d2c
    mov dl, al
    xor dh, dh
    mov bx, dx
    add bx, dx
    call word ptr cs:[bx+afe]

loc_1bd7_0d2c:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
