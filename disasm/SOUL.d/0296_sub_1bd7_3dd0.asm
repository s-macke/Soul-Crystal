; ========================================
; New Subroutine: sub_1bd7_3dd0
; ========================================
sub_1bd7_3dd0:
    push si
    push ds
    push ax
    mov al, 0a
    call sub_1bd7_3c83
    mov ds, bx
    xchg ax, si
    xor bx, bx
    mov dx, bx
    pop cx

loc_1bd7_3de0:
    lodsw word ptr [si]
    or ax, ax
    jz loc_1bd7_3dfb
    cmp ax, cx
    jae loc_1bd7_3df8
    cmp ax, bx
    jb loc_1bd7_3df8
    xchg ax, bx
    lodsw word ptr [si]
    jnz loc_1bd7_3df5
    cmp ax, dx
    jbe loc_1bd7_3de0

loc_1bd7_3df5:
    xchg ax, dx
    jmp loc_1bd7_3de0

loc_1bd7_3df8:
    lodsw word ptr [si]
    jmp loc_1bd7_3de0

loc_1bd7_3dfb:
    pop ds
    or bx, bx
    xchg ax, dx
    pop si
    ret
