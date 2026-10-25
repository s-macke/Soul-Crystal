; ========================================
; New Subroutine: sub_1000_34e1
; ========================================
sub_1000_34e1:
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
    mov ax, [bp+6]
    and ax, 3fff
    mov [bp-16], ax
    or ax, ax
    jg loc_1000_3506
    jmp loc_1000_3606

loc_1000_3506:
    mov [bp-14], ax
    mov si, 00b6
    mov bx, 0008
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    cmp ax, [bp-14]
    jg loc_1000_353c
    mov bx, 0008
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    mov ax, es:[bx]
    cmp ax, [bp-14]
    jl loc_1000_353c
    mov word ptr [bp-18], 0001
    jmp loc_1000_35d5

loc_1000_353c:
    mov si, 00b6
    mov bx, 0010
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    cmp ax, [bp-14]
    jg loc_1000_356f
    mov bx, 0010
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    mov ax, es:[bx]
    cmp ax, [bp-14]
    jl loc_1000_356f
    mov word ptr [bp-18], 0002
    jmp loc_1000_35d5

loc_1000_356f:
    mov si, 00b6
    mov bx, 0018
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    cmp ax, [bp-14]
    jg loc_1000_35a2
    mov bx, 0018
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    mov ax, es:[bx]
    cmp ax, [bp-14]
    jl loc_1000_35a2
    mov word ptr [bp-18], 0003
    jmp loc_1000_35d5

loc_1000_35a2:
    mov si, 00b6
    mov bx, 0020
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    cmp ax, [bp-14]
    jg loc_1000_35d5
    mov bx, 0020
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    mov ax, es:[bx]
    cmp ax, [bp-14]
    jl loc_1000_35d5
    mov word ptr [bp-18], 0004
    jmp loc_1000_35d5

loc_1000_35d5:
    cmp word ptr [bp-18], 00
    jle loc_1000_3606
    mov bx, [bp-18]
    shl bx, 01
    shl bx, 01
    shl bx, 01
    mov si, 00b6
    mov dx, bx
    add bx, [si+a]
    mov es, [si+2]
    mov ax, es:[bx]
    mov bx, dx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    sub ax, es:[bx]
    add ax, [bp-16]
    mov [bp-1a], ax

loc_1000_3606:
    mov ax, [bp-1a]
    mov [bp-1c], ax
    mov ax, [bp-1c]
    pop si
    mov sp, bp
    pop bp
    retf 0002
