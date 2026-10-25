; ========================================
; New Subroutine: sub_1bd7_465a
; ========================================
sub_1bd7_465a:
    push ax
    push bx
    push es
    add bx, 09
    and bx, fe
    cmp dl, 08
    jnz loc_1bd7_466b
    add bx, 04

loc_1bd7_466b:
    call sub_1bd7_43a9
    jae loc_1bd7_467f
    push cx
    push dx
    push di
    call sub_1bd7_4360
    jae loc_1bd7_467c
    call word ptr [5814]

loc_1bd7_467c:
    pop di
    pop dx
    pop cx

loc_1bd7_467f:
    pop es
    pop bx
    pop ax
    ret
