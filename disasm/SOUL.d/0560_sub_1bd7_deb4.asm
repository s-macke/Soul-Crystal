; ========================================
; New Subroutine: sub_1bd7_deb4
; ========================================
sub_1bd7_deb4:
    push bp
    mov bp, sp
    sub sp, 08
    push di
    push si
    sub si, si
    mov [bp-2], si
    mov word ptr [bp-8], 0005
    mov word ptr [bp-6], 0001
    mov [bp-4], si
    lea ax, [bp-8]
    push ss
    push ax
    lea ax, [bp-2]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    sub ax, ax
    push ax
    mov ax, 0009
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    mov di, ax
    cmp di, 01
    jz loc_1bd7_deff
    cmp di, 0200
    jz loc_1bd7_deff
    mov si, 0001

loc_1bd7_deff:
    mov ax, si
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
