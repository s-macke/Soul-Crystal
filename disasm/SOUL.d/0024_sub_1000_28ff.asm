; ========================================
; New Subroutine: sub_1000_28ff
; ========================================
sub_1000_28ff:
    push bp
    mov bp, sp
    sub sp, 0014
    push si
    mov word ptr [bp-14], 0000
    mov ax, 0001
    jmp loc_1000_293b

loc_1000_2912:
    mov ax, 3716
    push ds
    push ax
    mov ax, 000e
    push ax
    mov ax, 000e
    imul word ptr [bp-14]
    mov bx, ax
    mov si, 0080
    add bx, [si+a]
    mov es, [si+2]
    push es
    push bx
    mov ax, 000e
    push ax
    call sub_1bd7_0786
    mov ax, [bp-14]
    inc ax

loc_1000_293b:
    mov [bp-14], ax
    cmp ax, 000a
    jle loc_1000_2912
    pop si
    mov sp, bp
    pop bp
    retf
