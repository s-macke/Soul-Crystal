; ========================================
; New Subroutine: sub_1bd7_473c
; ========================================
sub_1bd7_473c:
    push es
    push ds
    pop es
    mov di, si
    sub di, [si-3]
    inc di

loc_1bd7_4745:
    cmp si, dx
    jz loc_1bd7_4778
    add si, [si+1]
    call sub_1bd7_45cc
    cmp byte ptr [si], 01
    jz loc_1bd7_4745
    lea cx, [si+1]
    sub cx, [si-3]
    mov ax, di
    sub ax, cx
    call sub_1bd7_4497
    mov si, cx
    mov cx, [si]
    shr cx, 01
    repz movsw
    neg ax
    dec si
    mov [si-3], ax
    mov byte ptr [si], 01
    mov [di], ax
    neg ax
    jmp loc_1bd7_4745

loc_1bd7_4778:
    dec di
    mov cx, dx
    sub cx, di
    mov si, dx
    mov [si-3], cx
    mov byte ptr [si], 01
    mov [di+1], cx
    pop es
    ret
