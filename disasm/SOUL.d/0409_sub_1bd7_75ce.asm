; ========================================
; New Subroutine: sub_1bd7_75ce
; ========================================
sub_1bd7_75ce:
    push bp
    mov bp, sp
    mov dx, [bp+6]
    in al, dx
    xor ah, ah
    mov sp, bp
    pop bp
    retf
