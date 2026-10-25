; ========================================
; New Subroutine: sub_1bd7_8c36
; ========================================
sub_1bd7_8c36:
    push bp
    mov bp, sp
    sub sp, 0c
    push di
    push si
    mov ax, [bp+6]
    or ax, ax
    jz loc_1bd7_8c5a
    dec ax
    jz loc_1bd7_8c8c
    dec ax
    jnz loc_1bd7_8c4e
    jmp loc_1bd7_8d88

loc_1bd7_8c4e:
    dec ax
    jnz loc_1bd7_8c54
    jmp loc_1bd7_8dee

loc_1bd7_8c54:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

loc_1bd7_8c5a:
    mov ax, 2020
    mov es, [6e1c]
    mov cx, 002d
    mov di, 0200
    repz stosw
    mov byte ptr es:[0200], 3e
    mov byte ptr es:[0202], 5f
    push word ptr [6eaa]
    push cs
    call sub_1bd7_8e14
    add sp, 02
    mov word ptr [6eae], 0002
    sub ax, ax
    jmp loc_1bd7_8e08
