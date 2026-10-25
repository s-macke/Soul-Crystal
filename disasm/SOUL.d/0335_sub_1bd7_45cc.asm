; ========================================
; New Subroutine: sub_1bd7_45cc
; ========================================
sub_1bd7_45cc:
    push ax
    push di
    mov ax, [si-3]
    mov di, si
    sub di, ax
    cmp [di+1], ax
    jnz loc_1bd7_45e1
    or ax, ax
    jz loc_1bd7_45e1
    pop di
    pop ax
    ret

loc_1bd7_45e1:
    push es
    pop ds
    jmp loc_1bd7_1688
