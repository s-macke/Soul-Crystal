; ========================================
; New Subroutine: sub_1bd7_1f96
; ========================================
sub_1bd7_1f96:
    push si
    mov si, es:[579e]
    mov cx, bx

loc_1bd7_1f9e:
    mov bx, [si]
    add bl, 01
    jz loc_1bd7_1fac
    inc bx
    jz loc_1bd7_1fd2
    add si, bx
    jmp loc_1bd7_1f9e

loc_1bd7_1fac:
    cmp bx, ax
    jb loc_1bd7_1fc8
    cmp bx, cx
    ja loc_1bd7_1fc8
    cmp bx, es:[5812]
    jae loc_1bd7_1fc8
    mov bx, [bx]
    inc bx
    or bl, 01
    mov [si], bx
    stc
    adc si, bx
    jmp loc_1bd7_1f9e

loc_1bd7_1fc8:
    add si, [bx]
    add si, 03
    and si, fe
    jmp loc_1bd7_1f9e

loc_1bd7_1fd2:
    pop si
    ret
