; ========================================
; New Subroutine: sub_1bd7_09e8
; ========================================
sub_1bd7_09e8:
    push bp
    mov bp, sp
    push si
    mov bx, [bp+6]
    call sub_1bd7_1e8c
    mov si, [bx+2]
    push bx
    mov byte ptr [684b], 08
    call sub_1bd7_0006
    pop bx
    call sub_1bd7_1e08
    mov ax, 683a
    pop si
    pop bp
    retf 0002
