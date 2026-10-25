; ========================================
; New Subroutine: sub_1bd7_021a
; ========================================
sub_1bd7_021a:
    mov dh, 01
    cmp dl, [675c]
    jnz loc_1bd7_0226
    mov dl, [675f]

loc_1bd7_0226:
    cmp [675f], dl
    jz loc_1bd7_022d
    inc dx

loc_1bd7_022d:
    ret
