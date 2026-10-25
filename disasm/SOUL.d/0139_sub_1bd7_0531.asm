; ========================================
; New Subroutine: sub_1bd7_0531
; ========================================
sub_1bd7_0531:
    push si
    push di
    or cx, cx
    jle loc_1bd7_054c
    push cx
    push ss
    pop es
    mov di, 6644
    push di
    inc cx
    shr cx, 01
    mov ax, 2020
    repz stosw
    pop si
    pop cx
    call word ptr [662d]

loc_1bd7_054c:
    pop di
    pop si
    ret
