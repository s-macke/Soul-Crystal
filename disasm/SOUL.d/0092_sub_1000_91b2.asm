; ========================================
; New Subroutine: sub_1000_91b2
; ========================================
sub_1000_91b2:
    push bp
    mov bp, sp
    sub sp, 0022
    push si
    mov cx, 0008
    lea di, [bp-22]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, [0032]
    mov [bp-16], ax
    mov cx, [bp+6]
    mov [bp-14], cx
    cmp word ptr [bp-14], 19
    jnz loc_1000_91f8
    mov bx, 0014
    imul bx
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, es:[bx]
    mov [bp-18], ax
    jmp loc_1000_92bb

loc_1000_91f8:
    cmp word ptr [bp-14], 21
    jnz loc_1000_921f
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, es:[bx]
    mov [bp-18], ax
    jmp loc_1000_92bb

loc_1000_921f:
    cmp word ptr [bp-14], 14
    jnz loc_1000_9246
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, es:[bx]
    mov [bp-18], ax
    jmp loc_1000_92bb

loc_1000_9246:
    cmp word ptr [bp-14], 26
    jnz loc_1000_926d
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, es:[bx]
    mov [bp-18], ax
    jmp loc_1000_92bb

loc_1000_926d:
    cmp word ptr [bp-14], 23
    jnz loc_1000_9294
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 08
    add bx, 08
    mov ax, es:[bx]
    mov [bp-18], ax
    jmp loc_1000_92bb

loc_1000_9294:
    cmp word ptr [bp-14], 13
    jnz loc_1000_92bb
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0a
    add bx, 08
    mov ax, es:[bx]
    mov [bp-18], ax
    jmp loc_1000_92bb

loc_1000_92bb:
    mov ax, 0010
    push ax
    push word ptr [bp-18]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, 000f
    push ax
    push word ptr [bp-18]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1c], ax
    mov ax, [bp-1c]
    not ax
    and ax, [bp-1a]
    and ax, ax
    jz loc_1000_92f0
    mov word ptr [bp-18], 0000

loc_1000_92f0:
    cmp word ptr [bp-18], 00
    jz loc_1000_92f9
    jmp loc_1000_933f

loc_1000_92f9:
    mov ax, 0146
    push ax
    call sub_1bd7_8aa4
    add sp, 02
    cmp word ptr [0146], 0a
    jnz loc_1000_9330
    mov word ptr [0070], 000f
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    jmp loc_1000_933c

loc_1000_9330:
    mov word ptr [0070], 0005
    mov word ptr [0072], 0000

loc_1000_933c:
    jmp loc_1000_93cc

loc_1000_933f:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    mov word ptr [0070], 0000
    mov ax, [0072]
    mov [bp-1e], ax
    cmp word ptr [bp-1e], 01
    jz loc_1000_936f
    jmp loc_1000_937a

loc_1000_936f:
    push word ptr [bp-18]
    nop
    push cs
    call sub_1000_3c92
    jmp loc_1000_93bf

loc_1000_937a:
    cmp word ptr [bp-1e], 02
    jz loc_1000_9383
    jmp loc_1000_9391

loc_1000_9383:
    push word ptr [bp-18]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_3efb
    jmp loc_1000_93bf

loc_1000_9391:
    cmp word ptr [bp-1e], 03
    jz loc_1000_939a
    jmp loc_1000_93a8

loc_1000_939a:
    push word ptr [bp-18]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_4851
    jmp loc_1000_93bf

loc_1000_93a8:
    cmp word ptr [bp-1e], 04
    jz loc_1000_93b1
    jmp loc_1000_93bf

loc_1000_93b1:
    push word ptr [bp-18]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_4b65
    jmp loc_1000_93bf

loc_1000_93bf:
    cmp word ptr [0070], 00
    jnz loc_1000_93cc
    mov word ptr [0070], 0016

loc_1000_93cc:
    mov ax, [0032]
    cmp ax, [bp-16]
    jnz loc_1000_93d7
    jmp loc_1000_9424

loc_1000_93d7:
    cmp word ptr [bp-16], 00
    jg loc_1000_93e0
    jmp loc_1000_9424

loc_1000_93e0:
    mov ax, 0014
    imul word ptr [bp-16]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov cx, es:[bx]
    mov [bp-20], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-20]
    push ax
    mov [bp-22], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-22]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    mov ax, [bp-20]
    mov es:[bx], ax

loc_1000_9424:
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf 0002
