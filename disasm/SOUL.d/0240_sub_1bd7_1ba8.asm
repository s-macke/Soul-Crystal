; ========================================
; New Subroutine: sub_1bd7_1ba8
; ========================================
sub_1bd7_1ba8:
    push ax
    push si
    inc bx
    jz loc_1bd7_1bcd
    or bl, 01
    call sub_1bd7_1bd6
    jae loc_1bd7_1bd3
    push cx
    push dx
    push di
    call sub_1bd7_1c0b
    jae loc_1bd7_1bd0
    call sub_1bd7_1ec2
    call sub_1bd7_1bd6
    jae loc_1bd7_1bd0
    call sub_1bd7_1c7b
    call sub_1bd7_1bd6
    jae loc_1bd7_1bd0

loc_1bd7_1bcd:
    jmp loc_1bd7_162a

loc_1bd7_1bd0:
    pop di
    pop dx
    pop cx

loc_1bd7_1bd3:
    pop si
    pop ax
    ret
