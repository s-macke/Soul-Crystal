; ========================================
; New Subroutine: sub_1bd7_1767
; ========================================
sub_1bd7_1767:
    push si
    or ah, ah
    jnz loc_1bd7_176e
    mov ah, 10

loc_1bd7_176e:
    call sub_1bd7_0168
    or ax, ax
    jnz loc_1bd7_177b
    mov ax, 10ff
    call sub_1bd7_0168

loc_1bd7_177b:
    mov si, ax

loc_1bd7_177d:
    push ds
    mov ds, dx
    lodsb byte ptr [si]
    pop ds
    or al, al
    jz loc_1bd7_178b
    call sub_1bd7_17bc
    jmp loc_1bd7_177d

loc_1bd7_178b:
    pop si
    ret
