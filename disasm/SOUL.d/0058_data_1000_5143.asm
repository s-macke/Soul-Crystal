data_1000_5143:
    db 90  ; |.|

loc_1000_5144:
    mov ax, 000f
    push ax
    mov ax, [bp-1c]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-18], ax
    mov ax, [bp-18]
    and ax, ax
    jnz loc_1000_5173
    jmp loc_1000_51d8

loc_1000_5173:
    mov ax, 000e
    push ax
    mov ax, [bp-1c]
    dec ax
    shl ax, 01
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, ax
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    and ax, ax
    jz loc_1000_51be
    lea ax, [bp-16]
    push ax
    push word ptr [bp-1c]
    call sub_1bd7_0852
    push ax
    call sub_1bd7_06cf
    push ax
    lea ax, [bp-16]
    push ax
    call sub_1bd7_0696
    jmp loc_1000_51d8

loc_1000_51be:
    push word ptr [bp+8]
    push word ptr [bp-1c]
    call sub_1bd7_0852
    push ax
    call sub_1bd7_06cf
    push ax
    push word ptr [bp+8]
    call sub_1bd7_0696

loc_1000_51d8:
    mov ax, [bp-1c]
    inc ax

loc_1000_51dc:
    mov [bp-1c], ax
    cmp ax, 00a5
    jg loc_1000_51e7
    jmp loc_1000_5144

loc_1000_51e7:
    cmp word ptr [bp-16], 00
    jle loc_1000_51f8
    mov si, [bp+8]
    mov ax, [si]
    inc ax
    mov si, [bp+6]
    mov [si], ax

loc_1000_51f8:
    push word ptr [bp+8]
    push word ptr [bp+8]
    lea ax, [bp-16]
    push ax
    call sub_1bd7_070c
    lea ax, [bp-16]
    push ax
    call sub_1bd7_09be
    pop si
    mov sp, bp
    pop bp
    retf 0004

data_1000_5217:
    db 90, e9, af, 00, 90  ; |.....|
