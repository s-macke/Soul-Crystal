; ========================================
; New Subroutine: sub_1bd7_4005
; ========================================
sub_1bd7_4005:
    push ax
    push si
    call sub_1bd7_4018
    mov ax, [bx+4]
    mov [si+4], ax
    mov word ptr [bx+2], 0000
    pop si
    pop ax
    ret
