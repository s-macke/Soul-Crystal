; ========================================
; New Subroutine: sub_1bd7_95c2
; ========================================
sub_1bd7_95c2:
    push bp
    mov bp, sp
    sub sp, 10
    push di
    push si
    cmp word ptr [bp+a], 00
    jnz loc_1bd7_95f8
    mov word ptr [bp-8], 0000
    mov word ptr [bp-c], 001d
    mov word ptr [bp-a], 0001
    lea ax, [bp-c]
    push ss
    push ax
    lea ax, [bp-8]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
