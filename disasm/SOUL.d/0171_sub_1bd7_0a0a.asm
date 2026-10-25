; ========================================
; New Subroutine: sub_1bd7_0a0a
; ========================================
sub_1bd7_0a0a:
    mov bx, 683e
    nop
    push cs
    call sub_1bd7_5872
    mov al, [684b]
    cmp al, 04
    jnz loc_1bd7_0a23
    mov bx, 683e
    nop
    push cs
    call sub_1bd7_5941
    jmp loc_1bd7_0a4b

loc_1bd7_0a23:
    cmp al, 08
    jnz loc_1bd7_0a31
    mov bx, 683a
    nop
    push cs
    call sub_1bd7_598f
    jmp loc_1bd7_0a4b

loc_1bd7_0a31:
    nop
    push cs
    call sub_1bd7_5a02
    mov [683e], ax
    mov [6840], dx
    cmp byte ptr [684b], 14
    jz loc_1bd7_0a4b
    mov bx, dx
    cwd
    cmp dx, bx
    jnz loc_1bd7_0a4c

loc_1bd7_0a4b:
    ret

loc_1bd7_0a4c:
    jmp loc_1bd7_1618
