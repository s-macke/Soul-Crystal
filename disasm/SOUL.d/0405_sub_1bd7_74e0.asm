; ========================================
; New Subroutine: sub_1bd7_74e0
; ========================================
sub_1bd7_74e0:
    push bp
    mov bp, sp
    push si
    mov si, [bp+6]
    add byte ptr [si+a], 83
    jz loc_1bd7_74f9
    cmp word ptr [bp+e], 02
    jg loc_1bd7_74f9
    cmp word ptr [bp+e], 00
    jge loc_1bd7_7502

loc_1bd7_74f9:
    mov word ptr [67b4], 0016
    jmp loc_1bd7_7555
