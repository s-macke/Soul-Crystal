; ========================================
; New Subroutine: sub_1bd7_4086
; ========================================
sub_1bd7_4086:
    push si
    push ds
    cmp bx, [5804]  ; data_7fc1_5804 word read
    jnz loc_1bd7_4092
    mov [5804], dx

loc_1bd7_4092:
    cmp bx, dx
    jae loc_1bd7_409b
    std
    add bx, ax
    add dx, ax

loc_1bd7_409b:
    mov cx, 1000
    cmp cx, ax
    jb loc_1bd7_40a4
    mov cx, ax

loc_1bd7_40a4:
    sub ax, cx
    cmp bx, dx
    jae loc_1bd7_40ae
    sub bx, cx
    sub dx, cx

loc_1bd7_40ae:
    mov ds, bx
    mov es, dx
    cmp bx, dx
    jb loc_1bd7_40ba
    add bx, cx
    add dx, cx

loc_1bd7_40ba:
    shl cx, 01
    shl cx, 01
    shl cx, 01
    xor si, si
    cmp bx, dx
    jae loc_1bd7_40cb
    mov si, cx
    dec si
    shl si, 01

loc_1bd7_40cb:
    mov di, si
    cmp bx, dx
    jnz loc_1bd7_40d6
    mov [si], si
    inc di
    inc di
    dec cx

loc_1bd7_40d6:
    repz movsw
    or ax, ax
    jnz loc_1bd7_409b
    cld
    pop ds
    pop si
    ret
