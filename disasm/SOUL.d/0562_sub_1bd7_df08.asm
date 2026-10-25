; ========================================
; New Subroutine: sub_1bd7_df08
; ========================================
sub_1bd7_df08:
    push bp
    mov bp, sp
    sub sp, 08
    push di
    push si
    sub di, di
    mov [bp-2], di
    mov word ptr [bp-8], 000e
    mov word ptr [bp-6], 0001
    mov [bp-4], di
    lea ax, [bp-8]
    push ss
    push ax
    lea ax, [bp-2]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08

loc_1bd7_df34:
    sub ax, ax
    push ax
    mov ax, 0009
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04
    mov si, ax
    cmp si, 03
    jz loc_1bd7_df50
    cmp si, 0200
    jnz loc_1bd7_df53

loc_1bd7_df50:
    mov di, 0001

loc_1bd7_df53:
    cmp si, 02
    jz loc_1bd7_df69
    cmp si, 03
    jz loc_1bd7_df69
    cmp si, 0100
    jz loc_1bd7_df69
    cmp si, 0200
    jnz loc_1bd7_df34

loc_1bd7_df69:
    mov ax, di
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
