; ========================================
; New Subroutine: sub_1000_0dcb
; ========================================
sub_1000_0dcb:
    push bp
    mov bp, sp
    sub sp, 0016
    mov word ptr [bp-14], 0000
    mov word ptr [bp-16], 0000
    call sub_1bd7_e074
    mov [bp-14], ax
    mov ax, [bp-14]
    mov [bp-16], ax
    or ax, ax
    jg loc_1000_0df1
    jmp loc_1000_0e06

loc_1000_0df1:
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d

loc_1000_0e06:
    mov sp, bp
    pop bp
    retf
