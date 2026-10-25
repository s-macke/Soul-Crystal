; ========================================
; New Subroutine: sub_1bd7_7000
; ========================================
sub_1bd7_7000:
    push bp
    mov bp, sp
    sub sp, 10
    push di
    push si
    mov di, ffff
    mov si, [bp+6]
    add byte ptr [si+a], 40
    jz loc_1bd7_7017
    jmp loc_1bd7_70ba

loc_1bd7_7017:
    add byte ptr [si+a], 83
    jnz loc_1bd7_7020
    jmp loc_1bd7_70ba

loc_1bd7_7020:
    push ds
    push si
    nop
    push cs
    call sub_1bd7_7a2e
    add sp, 04
    mov di, ax
    mov bx, si
    sub bx, 6b4c
    mov ax, [bx+6c40]
    mov [bp-6], ax
    push ds
    push si
    call sub_1bd7_78fe
    add sp, 04
    mov al, [si+b]
    sub ah, ah
    push ax
    nop
    push cs
    call sub_1bd7_804a
    add sp, 02
    or ax, ax
    jl loc_1bd7_70b7
    cmp word ptr [bp-6], 00
    jz loc_1bd7_70ba
    mov ax, 6b30
    push ds
    push ax
    lea ax, [bp-10]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_7420
    add sp, 08
    lea ax, [bp-e]
    mov [bp-4], ax
    mov [bp-2], ss
    cmp byte ptr [bp-10], 5c
    jz loc_1bd7_708e
    mov ax, 6b32
    push ds
    push ax
    lea ax, [bp-10]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_8342
    add sp, 08
    jmp loc_1bd7_7091

loc_1bd7_708e:
    dec word ptr [bp-4]

loc_1bd7_7091:
    mov ax, 000a
    push ax
    push word ptr [bp-2]
    push word ptr [bp-4]
    push word ptr [bp-6]
    nop
    push cs
    call sub_1bd7_8388
    add sp, 08
    lea ax, [bp-10]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_853e
    add sp, 04
    or ax, ax
    jz loc_1bd7_70ba

loc_1bd7_70b7:
    mov di, ffff

loc_1bd7_70ba:
    mov byte ptr [si+a], 00
    mov ax, di
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
