; ========================================
; New Subroutine: sub_1bd7_03b5
; ========================================
sub_1bd7_03b5:
    mov ax, 0203
    push bp
    mov bp, sp
    push si
    mov [684b], ax
    mov bx, [bp+6]
    call word ptr [661d]
    jmp loc_1bd7_03d9
