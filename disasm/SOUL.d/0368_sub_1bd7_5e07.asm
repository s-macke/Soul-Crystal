; ========================================
; New Subroutine: sub_1bd7_5e07
; ========================================
sub_1bd7_5e07:
    mov si, [di-4]
    mov [di-4], di
    mov byte ptr [di-2], 07
    jmp loc_1bd7_5e16
