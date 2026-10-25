; ========================================
; New Subroutine: sub_1bd7_675c
; ========================================
sub_1bd7_675c:
    cld
    mov si, 0004

loc_1bd7_6760:
    or di, di
    jnz loc_1bd7_677c
    add bh, e0
    jnz loc_1bd7_677c
    sub bp, 0200
    jbe loc_1bd7_67af
    dec si
    jz loc_1bd7_67af
    mov di, bx
    mov bx, cx
    mov cx, dx
    xor dx, dx
    jmp loc_1bd7_6760

loc_1bd7_677c:
    add di, 1fe0
    jnz loc_1bd7_679a
    sub bp, 0100
    jbe loc_1bd7_67af
    xchg ax, di
    mov ah, al
    mov al, bh
    mov bh, bl
    mov bl, ch
    mov ch, cl
    mov cl, dh
    mov dh, dl
    mov dl, 00
    xchg ax, di

loc_1bd7_679a:
    add di, 1000
    jnz sub_1bd7_67b1
    sub bp, 20
    jz loc_1bd7_6815
    shl dx, 01
    rcl cx, 01
    rcl bx, 01
    rcl di, 01
    jmp loc_1bd7_679a

loc_1bd7_67af:
    jmp loc_1bd7_6815
