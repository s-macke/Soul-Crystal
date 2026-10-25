; ========================================
; New Subroutine: sub_1bd7_04ad
; ========================================
sub_1bd7_04ad:
    mov si, [686a]
    or si, si
    jz sub_1bd7_04ca
    mov word ptr [686a], 0000
    cmp si, 684d
    jz sub_1bd7_04ca
    add byte ptr [si+5], 80
    jz sub_1bd7_04ca
    call sub_1bd7_0f72
