; ========================================
; New Subroutine: sub_1bd7_468d
; ========================================
sub_1bd7_468d:
    push si
    jcxz loc_1bd7_46aa
    inc cx
    cmp cx, ax
    jb loc_1bd7_46d9
    cmp cx, [580e]
    jbe loc_1bd7_46aa
    mov si, cx
    call sub_1bd7_46e0
    mov cx, si
    mov si, ax
    call sub_1bd7_1ce2
    xchg ax, si
    jmp loc_1bd7_46d8

loc_1bd7_46aa:
    cmp ax, [579e]
    jbe loc_1bd7_46b6
    call sub_1bd7_4414
    call sub_1bd7_1ec2

loc_1bd7_46b6:
    mov si, ax
    call sub_1bd7_1ce2
    xchg ax, si
    jb loc_1bd7_46d9
    cmp cx, [580e]
    jz loc_1bd7_46d9
    xor si, si
    call sub_1bd7_46e0
    xchg si, cx
    or si, si
    jz loc_1bd7_46d9
    cmp si, cx
    jbe loc_1bd7_46d9
    call sub_1bd7_46e0
    mov cx, si

loc_1bd7_46d8:
    clc

loc_1bd7_46d9:
    dec cx
    mov [6b2e], cx
    pop si
    ret
