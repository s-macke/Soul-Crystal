; ========================================
; New Subroutine: sub_1000_0c32
; ========================================
sub_1000_0c32:
    push bp
    mov bp, sp
    sub sp, 0028
    push si
    mov cx, 000b
    lea di, [bp-28]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, 0001
    jmp loc_1000_0d8f
