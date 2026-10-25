; ========================================
; New Subroutine: sub_1bd7_08b2
; ========================================
sub_1bd7_08b2:
    push bp
    mov bp, sp
    push si
    mov bx, [bp+6]
    cmp word ptr [bx], 00
    jz loc_1bd7_08ce
    mov si, [bx+2]
    mov si, [si]
    call sub_1bd7_1e08
    xchg ax, si
    xor ah, ah
    pop si
    pop bp
    retf 0002

loc_1bd7_08ce:
    jmp loc_1bd7_1615
