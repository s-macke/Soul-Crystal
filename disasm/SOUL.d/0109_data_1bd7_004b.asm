data_1bd7_004b:
    db e9, c7, 15  ; |...|

loc_1bd7_004e:
    cmp byte ptr [684b], 02
    pushf
    jnz loc_1bd7_005a
    or dx, dx
    jnz loc_1bd7_0048

loc_1bd7_005a:
    or di, di
    jz loc_1bd7_0065
    neg bx
    adc dx, 00
    neg dx

loc_1bd7_0065:
    popf
    jnz loc_1bd7_006a
    mov dx, bx

loc_1bd7_006a:
    xor di, dx
    js loc_1bd7_0048
    mov [683e], bx
    mov [6840], dx
    cmp byte ptr [684b], 02
    jz loc_1bd7_0080
    call sub_1bd7_0a0a

loc_1bd7_0080:
    dec si
    call sub_1bd7_1a04
    pop di
    ret
