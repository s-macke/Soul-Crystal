; ========================================
; New Subroutine: sub_1000_8432
; ========================================
sub_1000_8432:
    push bp
    mov bp, sp
    sub sp, 0028
    push si
    mov cx, 000b
    lea di, [bp-28]
    push ss
    pop es
    xor ax, ax
    repz stosw
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov ax, 0001
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    mov [bp-16], ax
    mov word ptr [0072], 0000
    cmp word ptr [0142], 01
    mov cx, 0000
    jnz loc_1000_8479
    dec cx

loc_1000_8479:
    and ax, cx
    and ax, ax
    jnz loc_1000_8482
    jmp loc_1000_8666

loc_1000_8482:
    push word ptr [0032]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_52d0
    mov word ptr [bp-1a], 000c
    mov ax, [bp+6]
    mov [bp-18], ax
    cmp word ptr [bp-18], 75
    jnz loc_1000_84a7
    mov word ptr [bp-1c], 0005
    jmp loc_1000_862f

loc_1000_84a7:
    cmp word ptr [bp-18], 24
    jnz loc_1000_84b5
    mov word ptr [bp-1c], 0005
    jmp loc_1000_862f

loc_1000_84b5:
    cmp word ptr [bp-18], 47
    jnz loc_1000_84c3
    mov word ptr [bp-1c], 0005
    jmp loc_1000_862f

loc_1000_84c3:
    cmp word ptr [bp-18], 1f
    jnz loc_1000_84d1
    mov word ptr [bp-1c], 0005
    jmp loc_1000_862f

loc_1000_84d1:
    cmp word ptr [bp-18], 008e
    jnz loc_1000_84e0
    mov word ptr [bp-1c], 0005
    jmp loc_1000_862f

loc_1000_84e0:
    cmp word ptr [bp-18], 52
    jnz loc_1000_84ee
    mov word ptr [bp-1c], 0005
    jmp loc_1000_862f

loc_1000_84ee:
    cmp word ptr [bp-18], 64
    jz loc_1000_84f7
    jmp loc_1000_854c

loc_1000_84f7:
    mov ax, 00d1
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-1e], ax
    mov ax, 014a
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 008a
    mov cx, es:[bx]
    mov [bp-20], cx
    mov bx, ax
    mov ax, 000d
    push ax
    lea ax, [bp-20]
    push ax
    mov [bp-22], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-22]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 008a
    mov ax, [bp-20]
    mov es:[bx], ax
    jmp loc_1000_862f

loc_1000_854c:
    cmp word ptr [bp-18], 6c
    jz loc_1000_8555
    jmp loc_1000_85a0

loc_1000_8555:
    mov word ptr [bp-1c], 0064
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-24], ax
    cmp word ptr [bp-24], 00cb
    jz loc_1000_8570
    jmp loc_1000_859d

loc_1000_8570:
    cmp word ptr [0040], 05
    jz loc_1000_859d
    mov word ptr [0148], 0004
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    mov word ptr [bp-1a], 00d2

loc_1000_859d:
    jmp loc_1000_862f

loc_1000_85a0:
    cmp word ptr [bp-18], 20
    jz loc_1000_85a9
    jmp loc_1000_85bc

loc_1000_85a9:
    mov ax, 0001
    push ax
    mov ax, 0042
    push ax
    call sub_1bd7_8acb
    add sp, 04
    jmp loc_1000_862f

loc_1000_85bc:
    cmp word ptr [bp-18], 0085
    jnz loc_1000_85cb
    mov word ptr [bp-1c], 000f
    jmp loc_1000_862f

loc_1000_85cb:
    cmp word ptr [bp-18], 03
    jz loc_1000_85d4
    jmp loc_1000_8621

loc_1000_85d4:
    mov word ptr [bp-1c], 0005
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-26], ax
    cmp word ptr [bp-26], 012e
    jz loc_1000_85ef
    jmp loc_1000_861e

loc_1000_85ef:
    mov word ptr [bp-1a], 0071
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0003
    push ax
    nop
    push cs
    call sub_1000_3041

loc_1000_861e:
    jmp loc_1000_862f

loc_1000_8621:
    cmp word ptr [bp-18], 78
    jnz loc_1000_862f
    mov word ptr [bp-1c], 0005
    jmp loc_1000_862f

loc_1000_862f:
    cmp word ptr [bp-1c], 00
    mov ax, 0000
    jle loc_1000_8639
    dec ax

loc_1000_8639:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_8644
    jmp loc_1000_8663

loc_1000_8644:
    mov ax, [bp-1c]
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

loc_1000_8663:
    jmp loc_1000_86fb

loc_1000_8666:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    mov ax, [bp+6]
    mov [bp-28], ax
    cmp word ptr [bp-28], 5e
    jnz loc_1000_8695
    mov word ptr [bp-1a], 007e
    jmp loc_1000_86fb

loc_1000_8695:
    cmp word ptr [bp-28], 65
    jz loc_1000_86a4
    cmp word ptr [bp-28], 59
    jz loc_1000_86a4
    jmp loc_1000_86ac

loc_1000_86a4:
    mov word ptr [bp-1a], 00da
    jmp loc_1000_86fb

loc_1000_86ac:
    cmp word ptr [bp-28], 009b
    jz loc_1000_86bc
    cmp word ptr [bp-28], 0e
    jz loc_1000_86bc
    jmp loc_1000_86c4

loc_1000_86bc:
    mov word ptr [bp-1a], 00dc
    jmp loc_1000_86fb

loc_1000_86c4:
    cmp word ptr [bp-28], 009e
    jnz loc_1000_86d3
    mov word ptr [bp-1a], 00dd
    jmp loc_1000_86fb

loc_1000_86d3:
    cmp word ptr [bp-28], 13
    jnz loc_1000_86e1
    mov word ptr [bp-1a], 00db
    jmp loc_1000_86fb

loc_1000_86e1:
    mov word ptr [0072], 0000
    mov ax, [bp-16]
    and ax, ax
    jz loc_1000_86f6
    mov word ptr [bp-1a], 000d
    jmp loc_1000_86fb

loc_1000_86f6:
    mov word ptr [bp-1a], 000e

loc_1000_86fb:
    push word ptr [bp-1a]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    mov si, 0080
    mov bx, 000e
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 04
    mov ax, [bp+6]
    mov es:[bx], ax
    pop si
    mov sp, bp
    pop bp
    retf 0002
