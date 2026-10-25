; ========================================
; New Subroutine: sub_1bd7_40e0
; ========================================
sub_1bd7_40e0:
    mov ax, ds
    add ah, 10
    cmp ax, [5808]
    ja loc_1bd7_40ec
    ret

loc_1bd7_40ec:
    push ax
    push bx
    push cx
    push dx
    push si
    mov dx, fffe
    sub dx, [6b2e]
    mov cl, 04
    shr dx, cl
    call sub_1bd7_402f
    call sub_1bd7_41d5
    cmp ax, dx
    jb loc_1bd7_4108
    mov ax, dx

loc_1bd7_4108:
    add [5808], ax
    shl ax, cl
    mov cx, ax
    add cx, [6b2e]
    or cl, 0e
    mov ax, [6b2c]
    call sub_1bd7_468d
    mov [6b2e], cx
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
