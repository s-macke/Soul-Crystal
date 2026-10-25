; ========================================
; New Subroutine: sub_1000_0ade
; ========================================
sub_1000_0ade:
    push bp
    mov bp, sp
    sub sp, 0034
    push si
    mov cx, 0011
    lea di, [bp-34]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov word ptr [bp-26], 0082
    mov ax, 0001
    push ax
    push word ptr [bp-26]
    mov ax, 0002
    push ax
    mov ax, 0101
    push ax
    lea ax, [bp-24]
    push ax
    call sub_1bd7_14e6
    mov ax, 0001
    jmp loc_1000_0b83

loc_1000_0b16:
    mov bx, 0014
    imul bx
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    mov ax, es:[bx]
    mov [bp-2a], ax
    mov cx, 0064
    cwd
    idiv cx
    mov [bp-2c], ax
    imul cx
    sub ax, [bp-2a]
    neg ax
    mov [bp-2e], ax
    mov ax, 0008
    push ax
    mov ax, 0014
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    push word ptr es:[bx]
    call sub_1bd7_8b87
    add sp, 04
    mov [bp-28], ax
    mov ax, [bp-2e]
    add ax, [bp-28]
    mov bx, [bp-30]
    shl bx, 01
    lea si, [bp-24]
    add bx, [si+a]
    mov es, [si+2]
    mov es:[bx], ax
    mov ax, [bp-30]
    inc ax

loc_1000_0b83:
    mov [bp-30], ax
    cmp ax, 0067
    jle loc_1000_0b16
    mov ax, 0001
    jmp loc_1000_0bd0
