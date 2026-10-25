; ========================================
; New Subroutine: sub_1bd7_1ce2
; ========================================
sub_1bd7_1ce2:
    push ax
    push si
    mov ax, [579e]
    cmp si, ax
    jz loc_1bd7_1d01
    jb loc_1bd7_1cf8
    call sub_1bd7_1c7b
    call sub_1bd7_1ec2
    call sub_1bd7_1d0b
    jmp loc_1bd7_1d08

loc_1bd7_1cf8:
    sub ax, si
    dec ax
    mov [si], ax
    mov [579e], si

loc_1bd7_1d01:
    call sub_1bd7_1c7b
    call sub_1bd7_1ec2
    clc

loc_1bd7_1d08:
    pop si
    pop ax
    ret
