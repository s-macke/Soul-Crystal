; ========================================
; New Subroutine: sub_1bd7_0b3a
; ========================================
sub_1bd7_0b3a:
    mov al, ss:[6637]

loc_1bd7_0b3e:
    push dx
    mov dx, ss:[6ace]
    shl dx, 01
    shl dx, 01
    shl dx, 01
    shl dx, 01
    xor ah, ah
    push ds
    push ax
    mul dx
    mov ds, dx
    mov [044e], ax
    pop ax
    mov [0462], al
    pop ds
    pop dx
    ret
