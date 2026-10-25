; ========================================
; New Subroutine: sub_1bd7_4485
; ========================================
sub_1bd7_4485:
    push ds
    pop es
    push ax
    push si
    call sub_1bd7_45c6
    xor ax, ax
    call sub_1bd7_4497
    mov byte ptr [si], 01
    pop si
    pop ax
    ret
