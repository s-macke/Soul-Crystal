; ========================================
; New Subroutine: sub_1000_50ce
; ========================================
sub_1000_50ce:
    push bp
    mov bp, sp
    push si
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov cx, es:[bx]
    mov [0070], cx
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    pop si
    pop bp
    retf
