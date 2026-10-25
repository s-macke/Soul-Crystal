; ========================================
; New Subroutine: sub_1bd7_a814
; ========================================
sub_1bd7_a814:
    push bp
    mov bp, sp
    sub sp, 0e
    push di
    push si
    mov word ptr [bp-a], 0001
    mov ax, 000c
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov [bp-e], ax
    mov [bp-c], dx
    or dx, ax
    jnz loc_1bd7_a840
    sub si, si
    jmp loc_1bd7_a94c
