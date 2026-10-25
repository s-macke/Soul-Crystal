; ========================================
; New Subroutine: sub_1bd7_e3c2
; ========================================
sub_1bd7_e3c2:
    push cx
    push ax
    mov dx, 0388
    out dx, al
    mov cx, cs:[e294]  ; data_1bd7_e294 word read
    cli
    mov ah, 00
    nop

loc_1bd7_e3d1:
    in al, dx
    and al, ah
    jnz loc_1bd7_e3d1
    loop loc_1bd7_e3d1
    pop ax
    mov al, ah
    inc dx
    out dx, al
    dec dx
    mov cx, cs:[e296]  ; data_1bd7_e296 word read
    cli
    mov ah, 00
    nop

loc_1bd7_e3e7:
    in al, dx
    and al, ah
    jnz loc_1bd7_e3e7
    loop loc_1bd7_e3e7
    pop cx
    ret
