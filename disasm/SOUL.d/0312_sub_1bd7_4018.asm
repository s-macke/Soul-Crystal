; ========================================
; New Subroutine: sub_1bd7_4018
; ========================================
sub_1bd7_4018:
    mov si, 57fa

loc_1bd7_401b:
    cmp [si+4], bx
    jz loc_1bd7_402b
    mov si, [si+4]
    cmp si, 5806
    jnz loc_1bd7_401b
    jmp loc_1bd7_402c

loc_1bd7_402b:
    ret

loc_1bd7_402c:
    jmp loc_1bd7_16a1
