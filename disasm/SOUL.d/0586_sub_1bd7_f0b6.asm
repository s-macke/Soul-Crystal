; ========================================
; New Subroutine: sub_1bd7_f0b6
; ========================================
sub_1bd7_f0b6:
    push bp
    mov bp, sp
    push si
    mov si, [bp+8]
    cmp si, 01
    jnz loc_1bd7_f0c6
    push cs
    call sub_1bd7_f9ec

loc_1bd7_f0c6:
    or si, si
    jnz loc_1bd7_f0ce
    push cs
    call sub_1bd7_fa4c

loc_1bd7_f0ce:
    push word ptr [bp+6]
    push cs
    call sub_1bd7_f4ea
    add sp, 02
    push cs
    call sub_1bd7_fb56
    mov si, ax
    cmp si, 01
    jnz loc_1bd7_f0ee
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_cbee
    add sp, 02

loc_1bd7_f0ee:
    mov ax, si
    pop si
    mov sp, bp
    pop bp
    retf
