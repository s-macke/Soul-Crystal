; ========================================
; New Subroutine: sub_1bd7_2c06
; ========================================
sub_1bd7_2c06:
    push si
    push di
    push es
    push ds
    push ds
    pop es
    cmp cx, 29
    jnz loc_1bd7_2c1e
    push cx
    mov di, 6af9
    mov cx, 0017
    mov ax, 0e21
    repz stosw
    pop cx

loc_1bd7_2c1e:
    mov di, 6ac0
    push cs
    pop ds
    mov si, bx
    cld
    repz movsb
    push es
    pop ds
    mov al, [6ad2]  ; data_7fc1_6ad2 byte read
    call word ptr [6b05]
    mov byte ptr [57f0], 00  ; data_7fc1_57f0 byte write
    pop ds
    pop es
    pop di
    pop si
    ret
