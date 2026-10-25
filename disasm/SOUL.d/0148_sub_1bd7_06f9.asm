; ========================================
; New Subroutine: sub_1bd7_06f9
; ========================================
sub_1bd7_06f9:
    mov bx, si
    lodsw word ptr [si]
    xchg ax, cx
    lodsw word ptr [si]
    xchg ax, si
    shr cx, 01
    repz movsw
    jae loc_1bd7_0706
    movsb

loc_1bd7_0706:
    jmp sub_1bd7_1e08

loc_1bd7_0709:
    jmp loc_1bd7_1615
