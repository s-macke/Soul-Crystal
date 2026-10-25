; ========================================
; New Subroutine: sub_1000_a3d9
; ========================================
sub_1000_a3d9:
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
    mov word ptr [0072], 0000
    mov ax, [bp+6]
    mov [bp-14], ax
    cmp word ptr [bp-14], 2f
    jz loc_1000_a403
    jmp loc_1000_a501

loc_1000_a403:
    mov ax, 0001
    push ax
    push word ptr [0044]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-16], ax
    mov ax, [bp-16]
    and ax, ax
    jnz loc_1000_a420
    jmp loc_1000_a4de

loc_1000_a420:
    mov ax, 0001
    push ax
    mov ax, 0044
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov word ptr [bp-1a], 000f
    mov ax, 00d7
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-18], ax
    mov ax, [bp-18]
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
    mov [bp-1e], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-1e]
    push ax
    mov [bp-20], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-20]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-1e]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-22], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-22]
    push ax
    mov [bp-24], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-24]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-22]
    mov es:[bx], ax
    jmp loc_1000_a4fe

loc_1000_a4de:
    mov word ptr [bp-1a], 003c
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax

loc_1000_a4fe:
    jmp loc_1000_ab19

loc_1000_a501:
    cmp word ptr [bp-14], 04
    jz loc_1000_a50a
    jmp loc_1000_a6ed

loc_1000_a50a:
    mov ax, 0001
    push ax
    push word ptr [0044]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-26], ax
    mov ax, [bp-26]
    and ax, ax
    jnz loc_1000_a527
    jmp loc_1000_a6ca

loc_1000_a527:
    mov ax, 0001
    push ax
    mov ax, 0044
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, 00dc
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-28], ax
    mov ax, 0014
    imul word ptr [bp-28]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-2a], cx
    mov bx, ax
    mov ax, 000f
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
    add bx, 02
    add bx, 08
    mov ax, [bp-2a]
    mov es:[bx], ax
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-2e], ax
    cmp word ptr [bp-2e], 00d7
    jz loc_1000_a5a3
    jmp loc_1000_a677

loc_1000_a5a3:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-30], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-30]
    push ax
    mov [bp-32], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-32]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-30]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-34], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-34]
    push ax
    mov [bp-36], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-36]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-34]
    mov es:[bx], ax
    mov ax, 000f
    push ax
    xor ax, ax
    push ax
    nop
    push cs
    call sub_1000_0a2d
    mov word ptr [bp-1a], 007c
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
    mov ax, 0004
    push ax
    nop
    push cs
    call sub_1000_3041
    jmp loc_1000_a6c7

loc_1000_a677:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-38], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-38]
    push ax
    mov [bp-3a], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-3a]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-38]
    mov es:[bx], ax
    mov word ptr [bp-1a], 000f

loc_1000_a6c7:
    jmp loc_1000_a6ea

loc_1000_a6ca:
    mov word ptr [bp-1a], 003c
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax

loc_1000_a6ea:
    jmp loc_1000_ab19

loc_1000_a6ed:
    cmp word ptr [bp-14], 0f
    jz loc_1000_a6f6
    jmp loc_1000_a922

loc_1000_a6f6:
    mov ax, 0001
    push ax
    push word ptr [0044]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-3c], ax
    mov ax, [bp-3c]
    and ax, ax
    jnz loc_1000_a713
    jmp loc_1000_a8ff

loc_1000_a713:
    mov ax, 0131
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-3e], ax
    mov ax, [bp-3e]
    cmp ax, [0032]
    jnz loc_1000_a751
    mov word ptr [0148], 000d
    mov word ptr [bp-1a], 0062
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    jmp loc_1000_a8fc

loc_1000_a751:
    mov word ptr [bp-1a], 000f
    mov ax, 0001
    push ax
    mov ax, 0044
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, 0130
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-40], ax
    mov ax, [bp-40]
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
    mov [bp-42], cx
    mov bx, ax
    mov ax, 000f
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
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-46], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-46]
    push ax
    mov [bp-48], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-48]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-46]
    mov es:[bx], ax
    mov ax, 0133
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-4a], ax
    mov ax, [bp-4a]
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
    mov [bp-4c], cx
    mov bx, ax
    mov ax, 000f
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
    add bx, 02
    add bx, 08
    mov ax, [bp-4c]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-50], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-50]
    push ax
    mov [bp-52], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-52]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-50]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-54], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-54]
    push ax
    mov [bp-56], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-56]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-54]
    mov es:[bx], ax

loc_1000_a8fc:
    jmp loc_1000_a91f

loc_1000_a8ff:
    mov word ptr [bp-1a], 003c
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax

loc_1000_a91f:
    jmp loc_1000_ab19

loc_1000_a922:
    cmp word ptr [bp-14], 10
    jz loc_1000_a92b
    jmp loc_1000_ab19

loc_1000_a92b:
    mov ax, 0001
    push ax
    push word ptr [0044]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-58], ax
    mov ax, [bp-58]
    and ax, ax
    jnz loc_1000_a948
    jmp loc_1000_aaf6

loc_1000_a948:
    mov word ptr [bp-1a], 000f
    mov ax, 0001
    push ax
    mov ax, 0044
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, 01af
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-5a], ax
    mov ax, [bp-5a]
    mov [bp-1c], ax
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-5c], cx
    mov bx, ax
    mov ax, 000f
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
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-60], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-60]
    push ax
    mov [bp-62], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-62]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-60]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-64], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-64]
    push ax
    mov [bp-66], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-66]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-64]
    mov es:[bx], ax
    mov ax, 01b0
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-68], ax
    mov ax, [bp-68]
    mov [bp-1c], ax
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-6a], cx
    mov bx, ax
    mov ax, 000f
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
    add bx, 06
    add bx, 08
    mov ax, [bp-6a]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-1c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-6e], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-6e]
    push ax
    mov [bp-70], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-70]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-6e]
    mov es:[bx], ax
    jmp loc_1000_ab16

loc_1000_aaf6:
    mov word ptr [bp-1a], 003c
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax

loc_1000_ab16:
    jmp loc_1000_ab19

loc_1000_ab19:
    cmp word ptr [bp-1a], 00
    jnz loc_1000_ab3f
    mov word ptr [bp-1a], 003d
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax

loc_1000_ab3f:
    push word ptr [bp-1a]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf 0002
