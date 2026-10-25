data_1bd7_4599:
    db 06, 1e, 07  ; |...|

loc_1bd7_459c:
    or si, si
    jnz loc_1bd7_45a8
    mov si, es:[580e]
    add si, 03

loc_1bd7_45a8:
    sub si, 03

loc_1bd7_45ab:
    cmp byte ptr [si], 04
    jz loc_1bd7_45c2
    cmp byte ptr [si], 08
    jz loc_1bd7_45ba
    sub si, [si-3]
    jmp loc_1bd7_45ab

loc_1bd7_45ba:
    sub si, [si-3]
    add si, 03
    pop es
    ret

loc_1bd7_45c2:
    xor si, si
    pop es
    ret
