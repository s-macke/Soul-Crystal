; ========================================
; New Subroutine: sub_1bd7_e70a
; ========================================
sub_1bd7_e70a:
    push bp
    mov bp, sp
    sub sp, 0e
    push di
    push si
    mov word ptr [bp-2], 0000
    mov ax, [bp+6]
    or ax, ax
    jz loc_1bd7_e724
    dec ax
    jz loc_1bd7_e72e
    jmp loc_1bd7_e8ca

loc_1bd7_e724:
    mov word ptr [6ecc], 0000  ; 7fc1:6ecc word write
    jmp loc_1bd7_e8ca
