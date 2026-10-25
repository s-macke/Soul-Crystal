; ========================================
; New Subroutine: sub_1000_714d
; ========================================
sub_1000_714d:
    push bp
    mov bp, sp
    sub sp, 003a
    push si
    mov cx, 0014
    lea di, [bp-3a]
    push ss
    pop es
    xor ax, ax
    repz stosw
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    cmp word ptr [0142], 01
    jz loc_1000_7174
    jmp loc_1000_7492

loc_1000_7174:
    mov ax, [bp+6]
    mov [bp-14], ax
    cmp word ptr [bp-14], 1c
    jz loc_1000_7183
    jmp loc_1000_7260

loc_1000_7183:
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c0
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-16], ax
    mov ax, [bp-16]
    and ax, ax
    jz loc_1000_71ba
    mov word ptr [bp-18], 00cf
    jmp loc_1000_725d

loc_1000_71ba:
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0a
    add bx, 08
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    mov [bp-1c], ax
    mov ax, [0144]
    and ax, ax
    jz loc_1000_71fe
    mov word ptr [bp-1e], 0032
    mov word ptr [bp-18], 00dc
    jmp loc_1000_7212

loc_1000_71fe:
    mov ax, [bp-1c]
    and ax, ax
    jz loc_1000_720d
    mov word ptr [bp-18], 003e
    jmp loc_1000_7212

loc_1000_720d:
    mov word ptr [bp-18], 0021

loc_1000_7212:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0a
    add bx, 08
    mov cx, es:[bx]
    mov [bp-20], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-20]
    push ax
    mov [bp-22], bx
    call sub_1bd7_8ab8
    add sp, 04
    mov si, 0112
    mov bx, [bp-22]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0a
    add bx, 08
    mov ax, [bp-20]
    mov es:[bx], ax

loc_1000_725d:
    jmp loc_1000_7492

loc_1000_7260:
    cmp word ptr [bp-14], 26
    jz loc_1000_7269
    jmp loc_1000_72f5

loc_1000_7269:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-24], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-24]
    push ax
    mov [bp-26], bx
    call sub_1bd7_8ab8
    add sp, 04
    mov si, 0112
    mov bx, [bp-26]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-24]
    mov es:[bx], ax
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-28], ax
    mov ax, [bp-28]
    and ax, ax
    jz loc_1000_72ed
    mov word ptr [bp-18], 010a
    jmp loc_1000_72f2

loc_1000_72ed:
    mov word ptr [bp-18], 00e5

loc_1000_72f2:
    jmp loc_1000_7492

loc_1000_72f5:
    cmp word ptr [bp-14], 7c
    jz loc_1000_7304
    cmp word ptr [bp-14], 12
    jz loc_1000_7304
    jmp loc_1000_7449

loc_1000_7304:
    mov ax, 01ab
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-2a], ax
    mov ax, [bp-2a]
    mov [bp-1c], ax
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-2c], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-2c]
    push ax
    mov [bp-2e], bx
    call sub_1bd7_8ab8
    add sp, 04
    mov si, 0112
    mov bx, [bp-2e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-2c]
    mov es:[bx], ax
    mov ax, 01a8
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-30], ax
    mov ax, [bp-30]
    mov [bp-1c], ax
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-32], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-32]
    push ax
    mov [bp-34], bx
    call sub_1bd7_8ab8
    add sp, 04
    mov si, 0112
    mov bx, [bp-34]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-32]
    mov es:[bx], ax
    mov word ptr [bp-18], 00e4
    mov ax, [0032]
    cmp ax, [bp-1c]
    jz loc_1000_73cc
    jmp loc_1000_740d

loc_1000_73cc:
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-36], ax
    mov ax, [bp-36]
    mov [bp-1c], ax
    and ax, ax
    jz loc_1000_7405
    mov word ptr [bp-18], 010b

loc_1000_7405:
    mov word ptr [bp-1e], 0032
    jmp loc_1000_7446

loc_1000_740d:
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-38], ax
    mov ax, [bp-38]
    mov [bp-1c], ax
    and ax, ax
    jz loc_1000_7446
    mov word ptr [bp-18], 010c

loc_1000_7446:
    jmp loc_1000_7492

loc_1000_7449:
    cmp word ptr [bp-14], 008a
    jz loc_1000_7453
    jmp loc_1000_7484

loc_1000_7453:
    mov word ptr [bp-18], 00e7
    mov word ptr [bp-1e], 0032
    mov ax, 01a0
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-3a], ax
    mov ax, [bp-3a]
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    jmp loc_1000_7492

loc_1000_7484:
    cmp word ptr [bp-14], 34
    jnz loc_1000_7492
    mov word ptr [bp-18], 00e6
    jmp loc_1000_7492

loc_1000_7492:
    cmp word ptr [bp-18], 00
    jnz loc_1000_74a6
    mov word ptr [0072], 0000
    mov word ptr [bp-18], 0010
    jmp loc_1000_74f5

loc_1000_74a6:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    cmp word ptr [bp-1e], 00
    mov ax, 0000
    jle loc_1000_74cb
    dec ax

loc_1000_74cb:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_74d6
    jmp loc_1000_74f5

loc_1000_74d6:
    mov ax, [bp-1e]
    add [0034], ax
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6

loc_1000_74f5:
    push word ptr [bp-18]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf 0002
