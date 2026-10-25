; ========================================
; New Subroutine: sub_1bd7_3fda
; ========================================
sub_1bd7_3fda:
    push ax
    mov di, [si+4]
    mov dx, [si+2]
    mov cx, [di+2]
    add cx, [di+6]
    sub cx, dx
    neg cx
    sub dx, ax
    cmp cx, ax
    jb loc_1bd7_4003
    mov [bx+2], dx
    mov [bx+6], ax
    mov [bx+4], di
    mov [si+4], bx
    mov bx, dx
    call sub_1bd7_4086
    clc

loc_1bd7_4003:
    pop ax
    ret
