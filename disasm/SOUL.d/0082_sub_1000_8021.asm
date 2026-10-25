; ========================================
; New Subroutine: sub_1000_8021
; ========================================
sub_1000_8021:
    mov ax, [0042]
    and ax, 0018
    cmp ax, 0018
    jz loc_1000_802f
    jmp loc_1000_80b5

loc_1000_802f:
    add word ptr [0034], 14
    xor ax, ax
    push ax
    mov ax, 0097
    push ax
    nop
    push cs
    call sub_1000_3041
    push word ptr [0032]
    mov ax, 0097
    push ax
    nop
    push cs
    call sub_1000_3041
    mov ax, 00cf
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-26], ax
    push word ptr [bp-26]
    mov ax, 0097
    push ax
    nop
    push cs
    call sub_1000_3041
    mov ax, 0003
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, 0001
    push ax
    mov ax, 003a
    push ax
    call sub_1bd7_8ade
    add sp, 04
    push word ptr [0032]
    mov ax, ff34
    push ax
    mov ax, ff9f
    push ax
    nop
    push cs
    call sub_1000_53b2
    nop
    push cs
    call sub_1000_50ce
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    mov ax, 0079
    push ax
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d

loc_1000_80b5:
    ret

loc_1000_80b6:
    call sub_1bd7_0a9e
    retf 0004
