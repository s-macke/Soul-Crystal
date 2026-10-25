; ========================================
; New Subroutine: sub_1bd7_7562
; ========================================
sub_1bd7_7562:
    push bp
    mov bp, sp
    sub sp, 04
    push di
    push si
    mov byte ptr [6ed8], 42
    mov ax, [bp+6]
    mov dx, [bp+8]
    mov [6ed4], ax
    mov [6ed6], dx
    mov si, 6ece
    mov [si], ax
    mov [si+2], dx
    mov word ptr [6ed2], 7fff
    lea ax, [bp+e]
    push ss
    push ax
    push word ptr [bp+c]
    push word ptr [bp+a]
    mov ax, si
    push ds
    push ax
    nop
    push cs
    call sub_1bd7_7b12
    add sp, 0c
    mov di, ax
    dec word ptr [6ed2]
    js loc_1bd7_75b8
    les bx, [6ece]
    inc word ptr [6ece]
    mov byte ptr es:[bx], 00
    jmp loc_1bd7_75c5
