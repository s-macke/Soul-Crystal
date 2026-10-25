; ========================================
; New Subroutine: sub_1bd7_5d4e
; ========================================
sub_1bd7_5d4e:
    push bp
    mov bp, sp
    push si
    push di
    push ds
    mov ax, 2c33
    mov ds, ax
    push ds
    pop es
    mov dx, [bp+6]
    mov si, 0014

loc_1bd7_5d61:
    lodsw word ptr [si]
    cmp ax, dx
    jz loc_1bd7_5d76
    inc ax
    xchg ax, si
    jz loc_1bd7_5d76
    xchg ax, di
    xor ax, ax
    mov cx, ffff
    repnz scasb
    mov si, di
    jmp loc_1bd7_5d61

loc_1bd7_5d76:
    xchg ax, si
    cwd
    or ax, ax
    jz loc_1bd7_5d7e
    mov dx, ds

loc_1bd7_5d7e:
    pop ds
    pop di
    pop si
    mov sp, bp
    pop bp
    retf 0002

data_1bd7_5d87:
    db 00, 00, 00, 00, 00, 00, 00, 00, 00  ; |.........|

loc_1bd7_5d90:
    xchg ax, bx
    mov bh, 9a
    push ss
    pop ds
    jmp loc_1bd7_1740

data_1bd7_5d98:
    db 90, 90, 00, 00, 00, 00, 00, 00  ; |........|
