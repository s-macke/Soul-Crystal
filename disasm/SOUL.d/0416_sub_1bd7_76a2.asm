; ========================================
; New Subroutine: sub_1bd7_76a2
; ========================================
sub_1bd7_76a2:
    mov ax, 43fd
    mov dx, 0003
    push dx
    push ax
    push word ptr [6b36]
    push word ptr [6b34]
    nop
    push cs
    call sub_1bd7_6bc4
    add ax, 9ec3
    adc dx, 26
    mov [6b34], ax
    mov [6b36], dx
    mov ax, dx
    and ah, 7f
    retf
