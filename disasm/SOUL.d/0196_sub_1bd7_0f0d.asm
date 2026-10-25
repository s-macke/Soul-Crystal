; ========================================
; New Subroutine: sub_1bd7_0f0d
; ========================================
sub_1bd7_0f0d:
    and byte ptr [6839], fb
    add byte ptr [6839], 02
    jz loc_1bd7_0f1c
    jmp sub_1bd7_0f72

loc_1bd7_0f1c:
    ret
