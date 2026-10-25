; ========================================
; New Subroutine: sub_1bd7_75dc
; ========================================
sub_1bd7_75dc:
    push bp
    mov bp, sp
    mov dx, [bp+6]
    mov al, [bp+8]
    out dx, al
    mov ah, 00
    pop bp
    retf
