; ========================================
; New Subroutine: sub_1bd7_a3a2
; ========================================
sub_1bd7_a3a2:
    push bp
    mov bp, sp
    sub sp, 24
    push di
    push si
    sub ax, ax
    mov es, [6e3c]
    mov cx, 0800
    mov di, cab6
    repz stosw
    mov ax, [bp+8]
    or ax, ax
    jz loc_1bd7_a3d4
    dec ax
    jz loc_1bd7_a42a
    dec ax
    jnz loc_1bd7_a3c8
    jmp loc_1bd7_a480

loc_1bd7_a3c8:
    dec ax
    jnz loc_1bd7_a3ce
    jmp loc_1bd7_a4d6

loc_1bd7_a3ce:
    mov bx, [bp-2]
    jmp loc_1bd7_a527

loc_1bd7_a3d4:
    mov es, [6e3e]
    mov ax, es:[045a]
    mov [bp-4], ax
    mov si, [bp+6]
    mov es, [6e40]
    mov bx, si
    shl bx, 01
    mov ax, es:[bx+494]
    mov [bp-6], ax
    mov ax, bx
    mov es, [6e42]
    mov bx, es:[5680]
    mov word ptr [bp-16], 0cba
    mov word ptr [bp-14], 2c43
    mov word ptr [bp-1a], eb9a
    mov word ptr [bp-18], 36ad
    mov di, ax
    mov es, [6e44]
    mov ax, es:[di-2b9a]
    add ax, 5848
    mov [bp-1e], ax
    mov word ptr [bp-1c], 458f
    jmp loc_1bd7_a527

loc_1bd7_a42a:
    mov es, [6e46]
    mov ax, es:[6488]
    mov [bp-4], ax
    mov si, [bp+6]
    mov es, [6e48]
    mov bx, si
    shl bx, 01
    mov ax, es:[bx-3af2]
    mov [bp-6], ax
    mov ax, bx
    mov es, [6e4a]
    mov bx, es:[0cb6]
    mov word ptr [bp-16], dab6
    mov word ptr [bp-14], 458f
    mov word ptr [bp-1a], 569a
    mov word ptr [bp-18], 2c43
    mov di, ax
    mov es, [6e4c]
    mov ax, es:[di+53be]
    add ax, 5aa0
    mov [bp-1e], ax
    mov word ptr [bp-1c], 2c43
    jmp loc_1bd7_a527

loc_1bd7_a480:
    mov es, [6e4e]
    mov ax, es:[650c]
    mov [bp-4], ax
    mov si, [bp+6]
    mov es, [6e50]
    mov bx, si
    shl bx, 01
    mov ax, es:[bx-36de]
    mov [bp-6], ax
    mov ax, bx
    mov es, [6e52]
    mov bx, es:[0ee2]
    mov word ptr [bp-16], dd72
    mov word ptr [bp-14], 458f
    mov word ptr [bp-1a], 589a
    mov word ptr [bp-18], 2c43
    mov di, ax
    mov es, [6e54]
    mov ax, es:[di+54f2]
    add ax, 0000
    mov [bp-1e], ax
    mov word ptr [bp-1c], 36ad
    jmp loc_1bd7_a527
