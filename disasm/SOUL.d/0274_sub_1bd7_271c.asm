; ========================================
; New Subroutine: sub_1bd7_271c
; ========================================
sub_1bd7_271c:
    push ds
    mov ax, fc00
    mov ds, ax
    cmp word ptr [0050], 4c4f
    jnz loc_1bd7_2782
    cmp word ptr [0052], 5649
    jnz loc_1bd7_2782
    mov ah, f0
    mov ds, ax
    mov ax, [fffd]
    cmp ax, ff46
    jz loc_1bd7_2782
    cmp ax, fe00
    jz loc_1bd7_2782
    mov ax, c000
    mov ds, ax
    cmp word ptr [0000], aa55
    jnz loc_1bd7_277c
    cmp word ptr [003c], 4150
    jz loc_1bd7_277c
    cmp word ptr [0010], 4c4f
    jnz loc_1bd7_2782
    mov ax, [0022]
    cmp ax, 4756
    jz loc_1bd7_277c
    cmp ax, 4745
    jnz loc_1bd7_2782
    xor ax, ax
    mov ds, ax
    mov ax, [0488]
    and ax, 00a0
    cmp ax, 00a0
    jz loc_1bd7_2782

loc_1bd7_277c:
    mov al, 3f
    inc al
    jmp loc_1bd7_2784

loc_1bd7_2782:
    xor al, al

loc_1bd7_2784:
    pop ds
    ret
