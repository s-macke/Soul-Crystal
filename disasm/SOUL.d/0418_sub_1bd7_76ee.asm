; ========================================
; New Subroutine: sub_1bd7_76ee
; ========================================
sub_1bd7_76ee:
    push bp
    mov bp, sp
    mov ax, [bp+6]
    or ax, ax
    jnz loc_1bd7_7708
    int 1a
    les bx, [bp+8]
    mov es:[bx], dx
    mov es:[bx+2], cx
    mov ah, 00
    jmp loc_1bd7_771e

loc_1bd7_7708:
    dec ax
    mov ax, ffff
    jnz loc_1bd7_771e
    les bx, [bp+8]
    mov dx, es:[bx]
    mov cx, es:[bx+2]
    mov ah, 01
    int 1a
    xor ax, ax

loc_1bd7_771e:
    pop bp
    retf

loc_1bd7_7720:
    jb loc_1bd7_7737
    xor ax, ax
    mov sp, bp
    pop bp
    retf
