; ========================================
; New Subroutine: sub_1bd7_5ec0
; ========================================
sub_1bd7_5ec0:
    mov di, [69fa]
    cld
    lodsw word ptr [si]
    mov cx, ax
    lodsw word ptr [si]
    or cl, al
    mov dl, ah
    lodsw word ptr [si]
    mov dh, al
    mov bl, ah
    lodsw word ptr [si]
    mov bh, al
    shl dx, 01
    rcl bx, 01
    shl dx, 01
    rcl bx, 01
    shl dx, 01
    rcl bx, 01
    or cl, ch
    jz loc_1bd7_5ee8
    or dl, 01

loc_1bd7_5ee8:
    mov cl, 80
    or bh, cl
    mov ch, ah
    and ch, cl
    and ax, 7ff0
    cmp ax, 47e0
    ja loc_1bd7_5f35
    sub ax, 3800
    jb loc_1bd7_5f38
    shl ax, 01
    shl ax, 01
    shl ax, 01
    cmp dl, cl
    ja loc_1bd7_5f0e
    jb loc_1bd7_5f1e
    add dh, 01
    jz loc_1bd7_5f1e

loc_1bd7_5f0e:
    add dh, 01
    adc bx, 00
    jae loc_1bd7_5f1e
    add ax, 0080
    cmp ax, 7f80
    jz loc_1bd7_5f35

loc_1bd7_5f1e:
    or ax, ax
    jz loc_1bd7_5f38
    and bh, 7f
    or al, bh
    or ah, ch
    mov [di+2], ax
    mov ah, bl
    mov al, dh
    mov [di], ax
    mov si, di
    ret

loc_1bd7_5f35:
    jmp loc_1bd7_5e5e

loc_1bd7_5f38:
    xor ax, ax
    mov [di], ax
    mov [di+2], ax
    mov si, di
    ret
