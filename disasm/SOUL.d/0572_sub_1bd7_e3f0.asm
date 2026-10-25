; ========================================
; New Subroutine: sub_1bd7_e3f0
; ========================================
sub_1bd7_e3f0:
    mov ah, 80
    mov al, 04
    call sub_1bd7_e3c2
    sti
    mov ah, 80
    mov al, 02
    call sub_1bd7_e3c2
    sti
    mov dx, 0388
    mov al, 02
    out dx, al
    mov cx, cs:[e294]  ; data_1bd7_e294 word read
    cli
    mov ah, 00
    nop

loc_1bd7_e40f:
    in al, dx
    and al, ah
    jnz loc_1bd7_e40f
    loop loc_1bd7_e40f
    xor cx, cx
    mov al, 01
    inc dx
    cli
    mov ah, 40
    out dx, al
    dec dx
    nop

loc_1bd7_e421:
    in al, dx
    and al, ah
    jnz loc_1bd7_e42b
    loop loc_1bd7_e421
    mov cx, e4a8

loc_1bd7_e42b:
    sti
    neg cx
    mov ax, cx
    xor dx, dx
    mov bx, 0c1f
    div bx
    add ax, 0001
    mov ax, 0004
    mov cs:[e294], ax  ; data_1bd7_e294 word write
    xor dx, dx
    mov ax, cx
    mov bx, 01bd
    div bx
    add ax, 0001
    mov ax, 0017
    mov cs:[e296], ax  ; data_1bd7_e296 word write
    mov ah, 80
    mov al, 04
    call sub_1bd7_e3c2
    sti
    ret
