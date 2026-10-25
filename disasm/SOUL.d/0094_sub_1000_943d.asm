; ========================================
; New Subroutine: sub_1000_943d
; ========================================
sub_1000_943d:
    push bp
    mov bp, sp
    sub sp, 0070
    push si
    mov cx, 002f
    lea di, [bp-70]
    push ss
    pop es
    xor ax, ax
    repz stosw
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov word ptr [bp-16], 0000
    mov ax, 0004
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    not ax
    and ax, ax
    jz loc_1000_9483
    mov word ptr [bp-18], 0023
    jmp loc_1000_9510

loc_1000_9483:
    mov ax, 0009
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    not ax
    and ax, ax
    jnz loc_1000_94a2
    jmp loc_1000_94f6

loc_1000_94a2:
    cmp word ptr [bp+6], 55
    mov ax, 0000
    jnz loc_1000_94ac
    dec ax

loc_1000_94ac:
    mov [bp-1e], ax
    mov ax, 000d
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00d8
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1c], ax
    mov ax, [bp-1c]
    not ax
    and ax, [bp-1e]
    mov [bp-1e], ax
    and ax, ax
    jz loc_1000_94ee
    mov word ptr [bp-18], 0002
    jmp loc_1000_94f3

loc_1000_94ee:
    mov word ptr [bp-18], 0022

loc_1000_94f3:
    jmp loc_1000_9510

loc_1000_94f6:
    mov ax, 0009
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov word ptr [bp-18], 0021
    mov word ptr [bp-16], ffff

loc_1000_9510:
    mov ax, [bp-16]
    and ax, ax
    jnz loc_1000_951a
    jmp loc_1000_9c09

loc_1000_951a:
    mov ax, [bp+6]
    mov [bp-20], ax
    cmp word ptr [bp-20], 30
    jz loc_1000_9529
    jmp loc_1000_9577

loc_1000_9529:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-22], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-22]
    push ax
    mov [bp-24], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-24]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-22]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_9577:
    cmp word ptr [bp-20], 31
    jz loc_1000_9580
    jmp loc_1000_95ce

loc_1000_9580:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-26], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-26]
    push ax
    mov [bp-28], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-28]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-26]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_95ce:
    cmp word ptr [bp-20], 40
    jz loc_1000_95d7
    jmp loc_1000_9625

loc_1000_95d7:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-2a], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-2a]
    push ax
    mov [bp-2c], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-2c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-2a]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_9625:
    cmp word ptr [bp-20], 63
    jz loc_1000_962e
    jmp loc_1000_967c

loc_1000_962e:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-2e], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-2e]
    push ax
    mov [bp-30], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-30]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-2e]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_967c:
    cmp word ptr [bp-20], 41
    jz loc_1000_9685
    jmp loc_1000_96d3

loc_1000_9685:
    mov ax, 0014
    imul word ptr [0032]
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
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-34]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-32]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_96d3:
    cmp word ptr [bp-20], 42
    jz loc_1000_96dc
    jmp loc_1000_972a

loc_1000_96dc:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-36], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-36]
    push ax
    mov [bp-38], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-38]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-36]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_972a:
    cmp word ptr [bp-20], 5a
    jz loc_1000_9733
    jmp loc_1000_9781

loc_1000_9733:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-3a], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-3a]
    push ax
    mov [bp-3c], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-3c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-3a]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_9781:
    cmp word ptr [bp-20], 00a0
    jz loc_1000_978b
    jmp loc_1000_97d9

loc_1000_978b:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-3e], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-3e]
    push ax
    mov [bp-40], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-40]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-3e]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_97d9:
    cmp word ptr [bp-20], 35
    jz loc_1000_97e2
    jmp loc_1000_97f2

loc_1000_97e2:
    push word ptr [0032]
    mov ax, 0052
    push ax
    nop
    push cs
    call sub_1000_3041
    jmp loc_1000_9bd5

loc_1000_97f2:
    cmp word ptr [bp-20], 51
    jz loc_1000_97fb
    jmp loc_1000_9849

loc_1000_97fb:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-42], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-42]
    push ax
    mov [bp-44], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-44]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-42]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_9849:
    cmp word ptr [bp-20], 06
    jz loc_1000_9852
    jmp loc_1000_98a0

loc_1000_9852:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-46], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-46]
    push ax
    mov [bp-48], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-48]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-46]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_98a0:
    cmp word ptr [bp-20], 1e
    jz loc_1000_98a9
    jmp loc_1000_98be

loc_1000_98a9:
    mov word ptr [bp-4a], 0014
    push word ptr [0032]
    mov ax, 0060
    push ax
    nop
    push cs
    call sub_1000_3041
    jmp loc_1000_9bd5

loc_1000_98be:
    cmp word ptr [bp-20], 008c
    jz loc_1000_98c8
    jmp loc_1000_9972

loc_1000_98c8:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-4c], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-4c]
    push ax
    mov [bp-4e], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-4e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-4c]
    mov es:[bx], ax
    mov ax, 019f
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-50], ax
    mov ax, [bp-50]
    mov [bp-1e], ax
    mov ax, 0014
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-52], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-52]
    push ax
    mov [bp-54], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-54]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-52]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_9972:
    cmp word ptr [bp-20], 008d
    jz loc_1000_997c
    jmp loc_1000_9a26

loc_1000_997c:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-56], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-56]
    push ax
    mov [bp-58], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-58]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-56]
    mov es:[bx], ax
    mov ax, 019e
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-5a], ax
    mov ax, [bp-5a]
    mov [bp-1e], ax
    mov ax, 0014
    imul word ptr [bp-1e]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-5c], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-5c]
    push ax
    mov [bp-5e], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-5e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-5c]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_9a26:
    cmp word ptr [bp-20], 55
    jz loc_1000_9a2f
    jmp loc_1000_9b0e

loc_1000_9a2f:
    mov ax, 000d
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00d8
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-60], ax
    mov ax, [bp-60]
    and ax, ax
    jnz loc_1000_9a61
    jmp loc_1000_9af6

loc_1000_9a61:
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00a8
    mov cx, es:[bx]
    mov [bp-62], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-62]
    push ax
    mov [bp-64], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-64]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00a8
    mov ax, [bp-62]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-66], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-66]
    push ax
    mov [bp-68], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-68]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-66]
    mov es:[bx], ax
    jmp loc_1000_9b0b

loc_1000_9af6:
    mov ax, 0009
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov word ptr [bp-18], 0002

loc_1000_9b0b:
    jmp loc_1000_9bd5

loc_1000_9b0e:
    cmp word ptr [bp-20], 56
    jz loc_1000_9b17
    jmp loc_1000_9b65

loc_1000_9b17:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-6a], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-6a]
    push ax
    mov [bp-6c], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-6c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-6a]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_9b65:
    cmp word ptr [bp-20], 58
    jz loc_1000_9b6e
    jmp loc_1000_9bbc

loc_1000_9b6e:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-6e], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-6e]
    push ax
    mov [bp-70], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-70]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-6e]
    mov es:[bx], ax
    jmp loc_1000_9bd5

loc_1000_9bbc:
    cmp word ptr [bp-20], 76
    jz loc_1000_9bc5
    jmp loc_1000_9bd5

loc_1000_9bc5:
    push word ptr [0032]
    mov ax, 0020
    push ax
    nop
    push cs
    call sub_1000_3041
    jmp loc_1000_9bd5

loc_1000_9bd5:
    cmp word ptr [bp-4a], 00
    mov ax, 0000
    jle loc_1000_9bdf
    dec ax

loc_1000_9bdf:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_9bea
    jmp loc_1000_9c01

loc_1000_9bea:
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, [bp-4a]
    add [0034], ax

loc_1000_9c01:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6

loc_1000_9c09:
    push word ptr [bp-18]
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    push word ptr es:[bx]
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
