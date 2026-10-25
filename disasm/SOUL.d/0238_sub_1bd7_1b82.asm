; ========================================
; New Subroutine: sub_1bd7_1b82
; ========================================
sub_1bd7_1b82:
    mov si, [bp+c]
    push si
    lodsw word ptr [si]
    mov si, [si]
    les di, [bp+8]
    mov cx, [bp+6]
    or cx, cx
    jnz loc_1bd7_1b98
    mov cx, [di]
    mov di, [di+2]

loc_1bd7_1b98:
    sub cx, ax
    jae loc_1bd7_1ba0
    add ax, cx
    xor cx, cx

loc_1bd7_1ba0:
    shr cx, 01
    mov dx, 2020
    pop bx
    ret
