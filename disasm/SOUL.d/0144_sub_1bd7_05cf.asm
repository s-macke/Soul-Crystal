    push bp
    mov bp, sp
    push si
    push di
    mov [5744], bp
    mov [684b], bl
    push bx
    push ds
    pop es
    call word ptr [6632]
    pop cx
    shr cl, 01
    jb loc_1bd7_05f8
    les di, [bp+6]
    and cx, 07
    repz movsw
    pop di
    pop si
    pop bp
    retf 0004

loc_1bd7_05f8:
    xor ax, ax
    push ds
    push word ptr [si]
    push ax
    push word ptr [bp+a]
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_0786
    pop di
    pop si
    pop bp
    retf 0006
