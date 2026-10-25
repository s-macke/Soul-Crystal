; ========================================
; New Subroutine: sub_1bd7_0d31
; ========================================
sub_1bd7_0d31:
    mov ah, 01
    std
    or cx, cx
    jz loc_1bd7_0d48
    lodsw word ptr [si]
    dec cx
    or ax, ax
    mov ah, 01
    jz loc_1bd7_0d48
    lodsw word ptr [si]
    or ah, ah
    jnz loc_1bd7_0d4a
    dec cx
    or sp, sp

loc_1bd7_0d48:
    cld
    ret

loc_1bd7_0d4a:
    cld
    jmp loc_1bd7_1615
