; ========================================
; New Subroutine: sub_1000_0a2d
; ========================================
sub_1000_0a2d:
    push bp
    mov bp, sp
    sub sp, 0016
    push si
    mov word ptr [bp-14], 0000
    mov word ptr [bp-16], 0000
    mov ax, 0001
    jmp loc_1000_0a63
