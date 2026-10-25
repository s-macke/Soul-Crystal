; ========================================
; New Subroutine: sub_1000_5108
; ========================================
sub_1000_5108:
    push bp
    mov bp, sp
    sub sp, 001c
    push si
    mov cx, 0005
    lea di, [bp-1c]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov si, [bp+6]
    mov word ptr [si], 0000
    mov ax, 3850
    push ax
    lea ax, [bp-16]
    push ax
    call sub_1bd7_0696
    mov ax, 3850
    push ax
    push word ptr [bp+8]
    call sub_1bd7_0696
    mov ax, 0001
    jmp loc_1000_51dc
