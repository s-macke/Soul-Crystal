; ========================================
; New Subroutine: sub_1bd7_e256
; ========================================
sub_1bd7_e256:
    push bp
    mov bp, sp
    sub sp, 04
    lea ax, [bp-4]
    push ss
    push ax
    sub cx, cx
    push cx
    nop
    push cs
    call sub_1bd7_76ee
    mov ax, [bp-4]
    mov dx, [bp-2]
    mov sp, bp
    pop bp
    retf
