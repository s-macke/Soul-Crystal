; ========================================
; New Subroutine: sub_1000_9c4d
; ========================================
sub_1000_9c4d:
    push bp
    mov bp, sp
    sub sp, 005c
    push si
    mov cx, 0025
    lea di, [bp-5c]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov word ptr [bp-16], ffff
    mov ax, [bp+6]
    mov [bp-14], ax
    cmp word ptr [bp-14], 37
    jnz loc_1000_9c9e
    mov word ptr [bp-18], 00e2
    jmp loc_1000_a382

loc_1000_9c9e:
    cmp word ptr [bp-14], 5b
    jnz loc_1000_9cac
    mov word ptr [bp-18], 00eb
    jmp loc_1000_a382

loc_1000_9cac:
    cmp word ptr [bp-14], 62
    jz loc_1000_9cb5
    jmp loc_1000_9cdc

loc_1000_9cb5:
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_9cbf
    jmp loc_1000_9cd4

loc_1000_9cbf:
    mov word ptr [bp-16], 0005
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6
    mov word ptr [bp-18], 0086
    jmp loc_1000_9cd9

loc_1000_9cd4:
    mov word ptr [bp-18], 0087

loc_1000_9cd9:
    jmp loc_1000_a382

loc_1000_9cdc:
    cmp word ptr [bp-14], 0098
    jz loc_1000_9ce6
    jmp loc_1000_9d3c

loc_1000_9ce6:
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0140
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1a], ax
    mov ax, [bp-1a]
    not ax
    and ax, ax
    jnz loc_1000_9d1a
    jmp loc_1000_9d39

loc_1000_9d1a:
    push word ptr [0032]
    mov ax, 0024
    push ax
    nop
    push cs
    call sub_1000_2f74
    push word ptr [0032]
    mov ax, 0098
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-18], 0088

loc_1000_9d39:
    jmp loc_1000_a382

loc_1000_9d3c:
    cmp word ptr [bp-14], 4a
    jz loc_1000_9d45
    jmp loc_1000_9d6c

loc_1000_9d45:
    mov word ptr [bp-16], 0000
    push word ptr [0032]
    mov ax, 0075
    push ax
    nop
    push cs
    call sub_1000_2f74
    push word ptr [0032]
    mov ax, 004a
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-18], 0085
    jmp loc_1000_a382

loc_1000_9d6c:
    cmp word ptr [bp-14], 1a
    jz loc_1000_9d75
    jmp loc_1000_9dd8

loc_1000_9d75:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-1c], ax
    cmp word ptr [bp-1c], 00cd
    jz loc_1000_9d8b
    jmp loc_1000_9dd5

loc_1000_9d8b:
    mov ax, 0003
    push ax
    mov ax, [003e]
    inc ax
    push ax
    call sub_1bd7_8b53
    add sp, 04
    mov [bp-1e], ax
    mov ax, [bp-1e]
    mov [003e], ax
    mov ax, [003e]
    mov [bp-20], ax
    cmp word ptr [bp-20], 01
    jnz loc_1000_9db9
    mov word ptr [bp-18], 00df
    jmp loc_1000_9dd5

loc_1000_9db9:
    cmp word ptr [bp-20], 02
    jnz loc_1000_9dc7
    mov word ptr [bp-18], 00e0
    jmp loc_1000_9dd5

loc_1000_9dc7:
    cmp word ptr [bp-20], 03
    jnz loc_1000_9dd5
    mov word ptr [bp-18], 00e1
    jmp loc_1000_9dd5

loc_1000_9dd5:
    jmp loc_1000_a382

loc_1000_9dd8:
    cmp word ptr [bp-14], 61
    jz loc_1000_9de1
    jmp loc_1000_9ef5

loc_1000_9de1:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-22], ax
    mov ax, [bp-22]
    mov [bp-26], ax
    cmp ax, 00cf
    jz loc_1000_9dfb
    jmp loc_1000_9e3f

loc_1000_9dfb:
    mov ax, 0001
    push ax
    push word ptr [0042]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-24], ax
    mov ax, [bp-24]
    and ax, ax
    jz loc_1000_9e1d
    mov word ptr [bp-18], 00ee
    jmp loc_1000_9e3c

loc_1000_9e1d:
    mov word ptr [bp-18], 00ec
    push word ptr [0032]
    mov ax, 0020
    push ax
    nop
    push cs
    call sub_1000_2f74
    push word ptr [0032]
    mov ax, 0050
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_9e3c:
    jmp loc_1000_9ef2

loc_1000_9e3f:
    cmp word ptr [bp-26], 00cc
    jz loc_1000_9e49
    jmp loc_1000_9ef2

loc_1000_9e49:
    mov ax, 00ca
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-28], ax
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [bp-28]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-2a], ax
    mov ax, [bp-2a]
    and ax, ax
    jnz loc_1000_9e85
    jmp loc_1000_9ed8

loc_1000_9e85:
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_9e8f
    jmp loc_1000_9ed0

loc_1000_9e8f:
    mov word ptr [bp-18], 00f1
    mov word ptr [bp-16], 000f
    push word ptr [0032]
    mov ax, 0014
    push ax
    nop
    push cs
    call sub_1000_2f74
    push word ptr [0032]
    mov ax, 0071
    push ax
    nop
    push cs
    call sub_1000_2f74
    push word ptr [0032]
    mov ax, 007d
    push ax
    nop
    push cs
    call sub_1000_2f74
    push word ptr [0032]
    mov ax, 0094
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_9ed5

loc_1000_9ed0:
    mov word ptr [bp-18], 00f2

loc_1000_9ed5:
    jmp loc_1000_9ef2

loc_1000_9ed8:
    mov ax, [37e4]
    and ax, ax
    jz loc_1000_9ee7
    mov word ptr [bp-18], 00f0
    jmp loc_1000_9ef2

loc_1000_9ee7:
    mov word ptr [37e4], ffff
    mov word ptr [bp-18], 00ef

loc_1000_9ef2:
    jmp loc_1000_a382

loc_1000_9ef5:
    cmp word ptr [bp-14], 7a
    jz loc_1000_9efe
    jmp loc_1000_9f0d

loc_1000_9efe:
    mov ax, [0144]
    and ax, ax
    jz loc_1000_9f0a
    mov word ptr [bp-18], 00f4

loc_1000_9f0a:
    jmp loc_1000_a382

loc_1000_9f0d:
    cmp word ptr [bp-14], 3a
    jz loc_1000_9f16
    jmp loc_1000_9fad

loc_1000_9f16:
    mov ax, [0048]
    mov [bp-2c], ax
    cmp word ptr [bp-2c], 00
    jnz loc_1000_9f2a
    mov word ptr [bp-18], 00e3
    jmp loc_1000_9f9e

loc_1000_9f2a:
    cmp word ptr [bp-2c], 01
    jnz loc_1000_9f38
    mov word ptr [bp-18], 00e4
    jmp loc_1000_9f9e

loc_1000_9f38:
    cmp word ptr [bp-2c], 02
    jz loc_1000_9f41
    jmp loc_1000_9f9e

loc_1000_9f41:
    mov word ptr [bp-18], 00e5
    mov ax, 00dc
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-2e], ax
    mov ax, [bp-2e]
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce
    push word ptr [0032]
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1000_2f74
    xor ax, ax
    push ax
    mov ax, 003b
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov ax, 00d7
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-30], ax
    push word ptr [bp-30]
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1000_2f74
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    jmp loc_1000_9f9e

loc_1000_9f9e:
    mov ax, 0048
    push ax
    call sub_1bd7_8aa4
    add sp, 02
    jmp loc_1000_a382

loc_1000_9fad:
    cmp word ptr [bp-14], 4f
    jz loc_1000_9fb6
    jmp loc_1000_a1ef

loc_1000_9fb6:
    mov ax, [0052]
    mov [bp-32], ax
    cmp word ptr [bp-32], 00
    jnz loc_1000_9fca
    mov word ptr [bp-18], 00e7
    jmp loc_1000_a1e0

loc_1000_9fca:
    cmp word ptr [bp-32], 01
    jnz loc_1000_9fd8
    mov word ptr [bp-18], 00e8
    jmp loc_1000_a1e0

loc_1000_9fd8:
    cmp word ptr [bp-32], 02
    jz loc_1000_9fe1
    jmp loc_1000_a1c2

loc_1000_9fe1:
    mov word ptr [bp-18], 00e9
    add word ptr [0034], 0f
    xor ax, ax
    push ax
    mov ax, 0088
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov ax, 00cf
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-34], ax
    mov ax, [bp-34]
    mov [bp-26], ax
    mov ax, 0014
    imul word ptr [bp-26]
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
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-38]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-36]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 62
    mov cx, es:[bx]
    mov [bp-3a], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-3a]
    push ax
    mov [bp-3c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-3c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 62
    mov ax, [bp-3a]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 62
    mov cx, es:[bx]
    mov [bp-3e], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-3e]
    push ax
    mov [bp-40], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-40]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 62
    mov ax, [bp-3e]
    mov es:[bx], ax
    mov ax, 00cc
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-42], ax
    mov ax, [bp-42]
    mov [bp-26], ax
    mov ax, 0014
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-44], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-44]
    push ax
    mov [bp-46], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-46]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-44]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 7e
    mov cx, es:[bx]
    mov [bp-48], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-48]
    push ax
    mov [bp-4a], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-4a]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 7e
    mov ax, [bp-48]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 7e
    mov cx, es:[bx]
    mov [bp-4c], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-4c]
    push ax
    mov [bp-4e], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-4e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 7e
    mov ax, [bp-4c]
    mov es:[bx], ax
    jmp loc_1000_a1e0

loc_1000_a1c2:
    cmp word ptr [bp-32], 03
    jz loc_1000_a1cb
    jmp loc_1000_a1e0

loc_1000_a1cb:
    mov word ptr [bp-18], 00ea
    push word ptr [0032]
    mov ax, 004f
    push ax
    nop
    push cs
    call sub_1000_3041
    jmp loc_1000_a1e0

loc_1000_a1e0:
    mov ax, 0052
    push ax
    call sub_1bd7_8aa4
    add sp, 02
    jmp loc_1000_a382

loc_1000_a1ef:
    cmp word ptr [bp-14], 4c
    jz loc_1000_a1f8
    jmp loc_1000_a218

loc_1000_a1f8:
    mov word ptr [004c], 0001
    add word ptr [0034], 0f
    push word ptr [0032]
    mov ax, 004c
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-18], 00e6
    jmp loc_1000_a382

loc_1000_a218:
    cmp word ptr [bp-14], 36
    jz loc_1000_a221
    jmp loc_1000_a265

loc_1000_a221:
    mov ax, [0056]
    mov [bp-50], ax
    cmp word ptr [bp-50], 00
    jnz loc_1000_a235
    mov word ptr [bp-18], 0075
    jmp loc_1000_a248

loc_1000_a235:
    cmp word ptr [bp-50], 01
    jnz loc_1000_a243
    mov word ptr [bp-18], 0076
    jmp loc_1000_a248

loc_1000_a243:
    mov word ptr [bp-18], 0077

loc_1000_a248:
    mov ax, [0056]
    inc ax
    push ax
    mov ax, 0002
    push ax
    call sub_1bd7_8b53
    add sp, 04
    mov [bp-52], ax
    mov ax, [bp-52]
    mov [0056], ax
    jmp loc_1000_a382

loc_1000_a265:
    cmp word ptr [bp-14], 38
    jz loc_1000_a26e
    jmp loc_1000_a2a6

loc_1000_a26e:
    mov ax, 0005
    push ax
    push word ptr [003a]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-54], ax
    mov ax, [bp-54]
    mov [bp-56], ax
    cmp word ptr [bp-56], ff
    jnz loc_1000_a295
    mov word ptr [bp-18], 0043
    jmp loc_1000_a2a3

loc_1000_a295:
    cmp word ptr [bp-56], 00
    jnz loc_1000_a2a3
    mov word ptr [bp-18], 00f1
    jmp loc_1000_a2a3

loc_1000_a2a3:
    jmp loc_1000_a382

loc_1000_a2a6:
    cmp word ptr [bp-14], 72
    jz loc_1000_a2b5
    cmp word ptr [bp-14], 02
    jz loc_1000_a2b5
    jmp loc_1000_a32a

loc_1000_a2b5:
    mov ax, 00e7
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-58], ax
    mov ax, [bp-58]
    mov [bp-26], ax
    mov ax, 000f
    push ax
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00e2
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-5a], ax
    mov ax, [bp-5a]
    mov [bp-5c], ax
    mov ax, [0032]
    cmp ax, [bp-26]
    mov cx, 0000
    jnz loc_1000_a2fa
    dec cx

loc_1000_a2fa:
    and cx, [bp-5c]
    and cx, cx
    jnz loc_1000_a304
    jmp loc_1000_a327

loc_1000_a304:
    mov word ptr [bp-16], 0064
    xor ax, ax
    push ax
    mov ax, 0072
    push ax
    nop
    push cs
    call sub_1000_3041
    push word ptr [0032]
    mov ax, 004c
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov word ptr [bp-18], 00fb

loc_1000_a327:
    jmp loc_1000_a382

loc_1000_a32a:
    cmp word ptr [bp-14], 01
    jnz loc_1000_a338
    mov word ptr [bp-18], 00ef
    jmp loc_1000_a382

loc_1000_a338:
    cmp word ptr [bp-14], 25
    jnz loc_1000_a346
    mov word ptr [bp-18], 00f0
    jmp loc_1000_a382

loc_1000_a346:
    cmp word ptr [bp-14], 00a4
    jnz loc_1000_a355
    mov word ptr [bp-18], 00f2
    jmp loc_1000_a382

loc_1000_a355:
    cmp word ptr [bp-14], 0084
    jz loc_1000_a37a
    cmp word ptr [bp-14], 0083
    jz loc_1000_a37a
    cmp word ptr [bp-14], 60
    jz loc_1000_a37a
    cmp word ptr [bp-14], 009f
    jz loc_1000_a37a
    cmp word ptr [bp-14], 00a5
    jz loc_1000_a37a
    jmp loc_1000_a382

loc_1000_a37a:
    mov word ptr [bp-18], 0042
    jmp loc_1000_a382

loc_1000_a382:
    cmp word ptr [bp-16], 00
    mov ax, 0000
    jl loc_1000_a38c
    dec ax

loc_1000_a38c:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_a397
    jmp loc_1000_a3b6

loc_1000_a397:
    mov ax, [bp-16]
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

loc_1000_a3b6:
    cmp word ptr [bp-18], 00
    jnz loc_1000_a3c1
    mov word ptr [bp-18], 0043

loc_1000_a3c1:
    push word ptr [bp-18]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf 0002
