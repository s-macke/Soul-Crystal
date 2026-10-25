; ========================================
; New Subroutine: sub_1bd7_118a
; ========================================
sub_1bd7_118a:
    push bp
    mov bp, sp
    mov bx, [bp+6]
    push si
    xor ax, ax
    cwd
    inc bx
    jz loc_1bd7_119f
    inc bx
    jz loc_1bd7_11af
    inc bx
    jz loc_1bd7_11cc
    jmp loc_1bd7_11a5

loc_1bd7_119f:
    call sub_1bd7_402f
    call sub_1bd7_41c7

loc_1bd7_11a5:
    call sub_1bd7_4683
    call sub_1bd7_1ef6
    add ax, bx
    jmp loc_1bd7_11c4

loc_1bd7_11af:
    mov si, [6829]
    mov bx, fe7e

loc_1bd7_11b6:
    inc bx
    inc bx
    cmp bx, [si]
    lodsw word ptr [si]
    jz loc_1bd7_11b6
    mov dx, ffff
    xchg ax, bx
    cmp ax, fe80

loc_1bd7_11c4:
    adc dx, 00

loc_1bd7_11c7:
    pop si
    pop bp
    retf 0002

loc_1bd7_11cc:
    call far, [681e]
    cwd
    mov cl, 04
    shl ax, cl
    jmp loc_1bd7_11c7
