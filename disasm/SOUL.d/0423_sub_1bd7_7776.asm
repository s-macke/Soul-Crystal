; ========================================
; New Subroutine: sub_1bd7_7776
; ========================================
sub_1bd7_7776:
    push bp
    mov bp, sp
    push si
    push di
    mov si, [bp+6]
    mov al, [si+a]
    test al, 83
    jz loc_1bd7_77e4
    test al, 40
    jnz loc_1bd7_77e4
    test al, 02
    jnz loc_1bd7_77d5
    or al, 01
    mov [si+a], al
    mov di, si
    sub di, 6b4c
    add di, 6c3c
    test al, 0c
    jnz loc_1bd7_77ad
    add byte ptr [di], 01
    jnz loc_1bd7_77ad
    push ds
    push si
    call sub_1bd7_854e
    add sp, 04

loc_1bd7_77ad:
    mov ax, [si+6]
    mov [si], ax
    push word ptr [di+2]
    push word ptr [si+8]
    push ax
    xor bx, bx
    mov bl, [si+b]
    push bx
    push cs
    call sub_1bd7_80e4
    add sp, 08
    or ax, ax
    jz loc_1bd7_77db
    cmp ax, ffff
    jnz loc_1bd7_77e9
    or byte ptr [si+a], 20
    jmp loc_1bd7_77df

loc_1bd7_77d5:
    or byte ptr [si+a], 20
    jmp loc_1bd7_77e4

loc_1bd7_77db:
    or byte ptr [si+a], 10

loc_1bd7_77df:
    mov word ptr [si+4], 0000

loc_1bd7_77e4:
    mov ax, ffff
    jmp loc_1bd7_780e

loc_1bd7_77e9:
    mov bh, [bx+67df]
    and bh, 82
    cmp bh, 82
    jnz loc_1bd7_7800
    mov bh, [si+a]
    add bh, 82
    jnz loc_1bd7_7800
    or byte ptr [di], 20

loc_1bd7_7800:
    dec ax
    mov [si+4], ax
    les bx, [si]
    xor ax, ax
    mov al, es:[bx]
    inc bx
    mov [si], bx

loc_1bd7_780e:
    pop di
    pop si
    pop bp
    retf
