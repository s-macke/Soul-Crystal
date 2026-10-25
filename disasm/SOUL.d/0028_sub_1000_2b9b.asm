; ========================================
; New Subroutine: sub_1000_2b9b
; ========================================
sub_1000_2b9b:
    push bp
    mov bp, sp
    sub sp, 0014
    push si
    mov word ptr [bp-14], 0000
    mov ax, [bp+6]
    and ax, 3fff
    mov [bp+6], ax
    mov bx, 0014
    imul bx
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov ax, es:[bx]
    and ax, 3fff
    mov [bp-14], ax
    mov ax, [bp-14]
    pop si
    mov sp, bp
    pop bp
    retf 0002
