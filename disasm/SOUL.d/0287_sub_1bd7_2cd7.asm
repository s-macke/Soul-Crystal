; ========================================
; New Subroutine: sub_1bd7_2cd7
; ========================================
sub_1bd7_2cd7:
    out dx, al
    xchg ah, al
    inc dx
    out dx, al
    dec dx
    ret
