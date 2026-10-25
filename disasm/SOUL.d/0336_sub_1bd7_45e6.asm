; ========================================
; New Subroutine: sub_1bd7_45e6
; ========================================
sub_1bd7_45e6:
    mov di, [5810]
    cmp byte ptr [di], 01
    jnz loc_1bd7_45fa
    mov ax, di
    sub ax, [di-3]
    cmp ax, [5812]
    jz loc_1bd7_4614

loc_1bd7_45fa:
    mov di, [5812]
    cmp di, [580e]
    jz loc_1bd7_4610
    mov ax, di
    add ax, [di+1]
    xchg ax, di
    cmp byte ptr [di], 01
    jz loc_1bd7_4610
    xchg ax, di

loc_1bd7_4610:
    mov [5810], di

loc_1bd7_4614:
    ret
