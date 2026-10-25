; ========================================
; New Subroutine: sub_1bd7_17c5
; ========================================
sub_1bd7_17c5:
    mov bx, 000a
    xor dx, dx

loc_1bd7_17ca:
    push dx
    xor dx, dx
    div bx
    add dl, 30
    or ax, ax
    jnz loc_1bd7_17ca
    mov ax, dx

loc_1bd7_17d8:
    call cx
    pop ax
    or ax, ax
    jnz loc_1bd7_17d8
    ret
