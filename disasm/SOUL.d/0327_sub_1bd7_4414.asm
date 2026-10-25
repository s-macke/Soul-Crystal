; ========================================
; New Subroutine: sub_1bd7_4414
; ========================================
sub_1bd7_4414:
    push ax
    push bx
    push cx
    push si
    push di
    push es
    push ds
    pop es
    mov si, [580e]

loc_1bd7_4420:
    cmp byte ptr [si], 04
    jz loc_1bd7_447d
    call sub_1bd7_45cc
    cmp byte ptr [si], 01
    jz loc_1bd7_4432
    sub si, [si-3]
    jmp loc_1bd7_4420

loc_1bd7_4432:
    mov di, si

loc_1bd7_4434:
    sub si, [si-3]

loc_1bd7_4437:
    cmp byte ptr [si], 04
    jz loc_1bd7_4463
    call sub_1bd7_45cc
    cmp byte ptr [si], 01
    jz loc_1bd7_4434
    mov ax, di
    sub ax, si
    call sub_1bd7_4497
    mov cx, [si-3]
    shr cx, 01
    dec si
    dec di
    std
    repz movsw
    cld
    inc si
    inc di
    mov byte ptr [di], 01
    mov [di-3], ax
    mov [si+1], ax
    jmp loc_1bd7_4437

loc_1bd7_4463:
    mov ax, di
    sub ax, si
    jz loc_1bd7_4472
    mov byte ptr [di], 01
    mov [di-3], ax
    mov [si+1], ax

loc_1bd7_4472:
    mov [5810], di

loc_1bd7_4476:
    pop es
    pop di
    pop si
    pop cx
    pop bx
    pop ax
    ret

loc_1bd7_447d:
    mov ax, [5812]
    mov [5810], ax
    jmp loc_1bd7_4476
