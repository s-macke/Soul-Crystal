; ========================================
; New Subroutine: sub_1bd7_4309
; ========================================
sub_1bd7_4309:
    push ax
    push si
    push di
    call sub_1bd7_1ea4
    mov ax, [57a2]
    sub ax, si
    jz loc_1bd7_435c
    mov di, [5812]
    cmp di, [580e]
    jz loc_1bd7_432d
    add di, [di+1]
    cmp byte ptr [di], 01
    jnz loc_1bd7_432d
    add ax, [di-3]
    jmp loc_1bd7_4339

loc_1bd7_432d:
    cmp ax, 0008
    jb loc_1bd7_435c
    mov di, si
    add di, 07
    add di, ax

loc_1bd7_4339:
    mov word ptr [si], ffff
    mov [57a2], si
    mov [57a0], si
    add si, 07
    mov byte ptr [si], 04
    mov [5812], si
    mov byte ptr [di], 01
    mov [di-3], ax
    mov [si+1], ax
    mov [5810], di

loc_1bd7_435c:
    pop di
    pop si
    pop ax
    ret
