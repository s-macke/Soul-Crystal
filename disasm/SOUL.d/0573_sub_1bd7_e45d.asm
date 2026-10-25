; ========================================
; New Subroutine: sub_1bd7_e45d
; ========================================
sub_1bd7_e45d:
    mov ah, 20
    mov al, 01
    call sub_1bd7_e3c2
    sti
    mov ah, 80
    mov al, 04
    call sub_1bd7_e3c2
    sti
    mov ah, 00
    mov al, 08
    call sub_1bd7_e3c2
    sti
    mov ah, 20
    mov al, bd
    call sub_1bd7_e3c2
    sti
    xor bl, bl

loc_1bd7_e47f:
    mov al, b0
    add al, bl
    mov ah, 00
    mov al, al
    call sub_1bd7_e3c2
    sti
    inc bl
    cmp bl, 08
    jbe loc_1bd7_e47f
    xor bl, bl

loc_1bd7_e494:
    mov al, 40
    add al, bl
    mov ah, 3f
    mov al, al
    call sub_1bd7_e3c2
    sti
    inc bl
    cmp bl, 15
    jbe loc_1bd7_e494
    ret
    push ax
    push bx
    mov bx, cs:[e2a0]  ; data_1bd7_e2a0 word read
    dec bl
    jnz loc_1bd7_e4be
    mov bl, 04
    pushf
    call far, cs:[e298]
    jmp loc_1bd7_e4c2
