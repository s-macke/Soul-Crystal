; ========================================
; New Subroutine: sub_1bd7_78fe
; ========================================
sub_1bd7_78fe:
    push bp
    mov bp, sp
    push si
    mov si, [bp+4]
    mov al, [si+a]
    test al, 83
    jz loc_1bd7_7932
    test al, 08
    jz loc_1bd7_7932
    push word ptr [si+8]
    push word ptr [si+6]
    nop
    push cs
    call sub_1bd7_877a
    add sp, 04
    and byte ptr [si+a], f7
    xor ax, ax
    mov [si+6], ax
    mov [si+8], ax
    mov [si], ax
    mov [si+2], ax
    mov [si+4], ax

loc_1bd7_7932:
    pop si
    pop bp
    ret
