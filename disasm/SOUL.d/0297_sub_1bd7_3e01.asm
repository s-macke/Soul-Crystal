; ========================================
; New Subroutine: sub_1bd7_3e01
; ========================================
sub_1bd7_3e01:
    push bp
    mov bp, sp
    call sub_1bd7_178d
    mov ax, [6860]
    call sub_1bd7_1767
    mov bp, [bp+4]
    cmp word ptr [6860], 9800
    jae loc_1bd7_3e1b
    call sub_1bd7_3d5d

loc_1bd7_3e1b:
    call sub_1bd7_178d
    jmp sub_1bd7_0f01
