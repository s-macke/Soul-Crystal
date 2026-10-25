; ========================================
; New Subroutine: sub_1bd7_67b1
; ========================================
sub_1bd7_67b1:
    cld
    cmp byte ptr [6a1e], 00
    jz loc_1bd7_67bc
    jmp loc_1bd7_6b41

loc_1bd7_67bc:
    cmp dl, 80
    ja loc_1bd7_67c8
    jb loc_1bd7_67e2
    add dh, 01
    jz loc_1bd7_67e2

loc_1bd7_67c8:
    add dh, 01
    adc cx, 00
    adc bx, 00
    adc di, 00
    add di, 2000
    jz loc_1bd7_67e2
    add bp, 20
    cmp bp, e0
    jz loc_1bd7_6812

loc_1bd7_67e2:
    mov si, di
    mov di, [69fa]
    xchg si, bx
    and al, 80
    and bh, 0f
    shr bp, 01
    jz loc_1bd7_6815
    xchg al, ah
    xor al, al
    or ax, bp
    or al, bh
    mov [di+6], ax
    mov [di+5], bl
    mov al, dh
    stosb
    mov ax, cx
    stosw
    mov ax, si
    stosw
    sub di, 05
    mov si, di
    ret
