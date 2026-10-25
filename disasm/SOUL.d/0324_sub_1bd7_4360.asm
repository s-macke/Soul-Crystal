; ========================================
; New Subroutine: sub_1bd7_4360
; ========================================
sub_1bd7_4360:
    mov si, [580e]

loc_1bd7_4364:
    cmp byte ptr [si], 04
    jz loc_1bd7_43a3
    cmp byte ptr [si], 01
    jz loc_1bd7_4373
    sub si, [si-3]
    jmp loc_1bd7_4364

loc_1bd7_4373:
    mov ax, [si-3]

loc_1bd7_4376:
    mov di, si
    sub di, ax
    cmp byte ptr [di], 04
    jz loc_1bd7_4389
    cmp byte ptr [di], 01
    jnz loc_1bd7_4389
    add ax, [di-3]
    jmp loc_1bd7_4376

loc_1bd7_4389:
    mov [si-3], ax
    sub si, ax
    mov [si+1], ax
    add si, ax
    cmp ax, bx
    jae loc_1bd7_43bf
    cmp byte ptr [di], 04
    jz loc_1bd7_43a3
    sub di, [di-3]
    mov si, di
    jmp loc_1bd7_4364

loc_1bd7_43a3:
    mov [5810], si
    stc
    ret
