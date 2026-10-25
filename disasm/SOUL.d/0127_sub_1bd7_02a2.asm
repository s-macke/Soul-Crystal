; ========================================
; New Subroutine: sub_1bd7_02a2
; ========================================
sub_1bd7_02a2:
    push bp
    mov bp, sp
    push si
    push di
    push es
    mov cx, [bp+6]
    dec cx
    jl loc_1bd7_02ec
    mov ax, [bp+8]
    or ax, ax
    jl loc_1bd7_02ec
    les di, [bp+e]
    mov dx, [bp+c]
    or dx, dx
    jnz loc_1bd7_02c4
    mov dx, [di]
    mov di, [di+2]

loc_1bd7_02c4:
    cmp cx, dx
    jae loc_1bd7_02ec
    add di, cx
    sub cx, dx
    neg cx
    cmp cx, ax
    jb loc_1bd7_02d4
    mov cx, ax

loc_1bd7_02d4:
    mov bx, [bp+a]
    cmp cx, [bx]
    jbe loc_1bd7_02dd
    mov cx, [bx]

loc_1bd7_02dd:
    mov si, [bx+2]
    repz movsb
    call sub_1bd7_1e08
    pop es
    pop di
    pop si
    pop bp
    retf 000c

loc_1bd7_02ec:
    jmp loc_1bd7_1615
