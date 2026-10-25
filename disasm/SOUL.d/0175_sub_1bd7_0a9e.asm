; ========================================
; New Subroutine: sub_1bd7_0a9e
; ========================================
sub_1bd7_0a9e:
    cmp word ptr [bp-10], 00
    jnz loc_1bd7_0abe
    pop word ptr [5746]
    pop word ptr [5748]
    dec word ptr [6849]
    lea sp, [bp-6]
    pop di
    pop si
    pop word ptr [6847]
    pop bp
    jmp far, [5746]

loc_1bd7_0abe:
    push bp
    mov bp, sp
    jmp loc_1bd7_1630
