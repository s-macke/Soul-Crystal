; ========================================
; New Subroutine: sub_1000_adc0
; ========================================
sub_1000_adc0:
    push bp
    mov bp, sp
    sub sp, 0090
    push si
    mov cx, 003f
    lea di, [bp-90]
    push ss
    pop es
    xor ax, ax
    repz stosw
    push word ptr [bp+8]
    nop
    push cs
    call sub_1000_333c
    mov word ptr [0072], 0000
    mov ax, 0004
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    not ax
    and ax, ax
    jz loc_1000_ae07
    mov word ptr [bp-16], 0015
    jmp loc_1000_ae49

loc_1000_ae07:
    mov ax, 000a
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-18], ax
    mov ax, [bp-18]
    and ax, ax
    jz loc_1000_ae44
    mov word ptr [bp-16], 0050
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    jmp loc_1000_ae49

loc_1000_ae44:
    mov word ptr [bp-1a], ffff

loc_1000_ae49:
    mov ax, [bp-1a]
    and ax, ax
    jnz loc_1000_ae53
    jmp loc_1000_b70c

loc_1000_ae53:
    mov word ptr [bp-1a], 0000
    mov word ptr [bp-20], 0000
    mov ax, [bp+6]
    mov [bp-1c], ax
    cmp word ptr [bp-1c], 75
    jz loc_1000_ae6c
    jmp loc_1000_af32

loc_1000_ae6c:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-1e], ax
    cmp word ptr [bp-1e], 31
    jz loc_1000_ae80
    jmp loc_1000_aed3

loc_1000_ae80:
    mov word ptr [bp-1a], ffff
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
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
    add bx, 02
    add bx, 08
    mov ax, [bp-22]
    mov es:[bx], ax
    jmp loc_1000_af2f

loc_1000_aed3:
    cmp word ptr [bp-1e], 30
    jz loc_1000_aedc
    jmp loc_1000_af2f

loc_1000_aedc:
    mov word ptr [bp-1a], ffff
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
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
    add bx, 00
    add bx, 08
    mov ax, [bp-26]
    mov es:[bx], ax
    jmp loc_1000_af2f

loc_1000_af2f:
    jmp loc_1000_b684

loc_1000_af32:
    cmp word ptr [bp-1c], 3b
    jz loc_1000_af3b
    jmp loc_1000_b001

loc_1000_af3b:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-2a], ax
    cmp word ptr [bp-2a], 41
    jz loc_1000_af4f
    jmp loc_1000_afa2

loc_1000_af4f:
    mov word ptr [bp-1a], ffff
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-2c], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-2c]
    push ax
    mov [bp-2e], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-2e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-2c]
    mov es:[bx], ax
    jmp loc_1000_affe

loc_1000_afa2:
    cmp word ptr [bp-2a], 42
    jz loc_1000_afab
    jmp loc_1000_affe

loc_1000_afab:
    mov word ptr [bp-1a], ffff
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-30], cx
    mov bx, ax
    mov ax, 0010
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
    add bx, 02
    add bx, 08
    mov ax, [bp-30]
    mov es:[bx], ax
    jmp loc_1000_affe

loc_1000_affe:
    jmp loc_1000_b684

loc_1000_b001:
    cmp word ptr [bp-1c], 52
    jz loc_1000_b00a
    jmp loc_1000_b10e

loc_1000_b00a:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-34], ax
    cmp word ptr [bp-34], 51
    jz loc_1000_b01e
    jmp loc_1000_b10b

loc_1000_b01e:
    mov word ptr [bp-1a], ffff
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
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
    add bx, 00
    add bx, 08
    mov ax, [bp-36]
    mov es:[bx], ax
    cmp word ptr [0054], 00
    jle loc_1000_b07d
    mov word ptr [bp-16], 0109
    jmp loc_1000_b082

loc_1000_b07d:
    mov word ptr [bp-16], 010a

loc_1000_b082:
    mov word ptr [0054], ffff
    mov ax, 000d
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00a0
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-3a], ax
    mov ax, [bp-3a]
    not ax
    and ax, ax
    jnz loc_1000_b0bc
    jmp loc_1000_b108

loc_1000_b0bc:
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00a0
    mov cx, es:[bx]
    mov [bp-3c], cx
    mov bx, ax
    mov ax, 000d
    push ax
    lea ax, [bp-3c]
    push ax
    mov [bp-3e], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-3e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00a0
    mov ax, [bp-3c]
    mov es:[bx], ax
    add word ptr [0034], 32

loc_1000_b108:
    jmp loc_1000_b10b

loc_1000_b10b:
    jmp loc_1000_b684

loc_1000_b10e:
    cmp word ptr [bp-1c], 11
    jz loc_1000_b117
    jmp loc_1000_b2e9

loc_1000_b117:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-40], ax
    cmp word ptr [bp-40], 10
    jz loc_1000_b12b
    jmp loc_1000_b2e6

loc_1000_b12b:
    mov word ptr [bp-1a], ffff
    mov ax, 0001
    push ax
    push word ptr [0044]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-42], ax
    mov ax, [bp-42]
    and ax, ax
    jnz loc_1000_b14d
    jmp loc_1000_b2e3

loc_1000_b14d:
    mov ax, 01af
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-44], ax
    mov ax, [bp-44]
    mov [bp-46], ax
    mov ax, 0014
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-48], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-48]
    push ax
    mov [bp-4a], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-4a]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-48]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
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
    add bx, 00
    add bx, 08
    mov ax, [bp-4c]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-50], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-50]
    push ax
    mov [bp-52], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-52]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-50]
    mov es:[bx], ax
    mov ax, 01b0
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-54], ax
    mov ax, [bp-54]
    mov [bp-46], ax
    mov ax, 0014
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-56], cx
    mov bx, ax
    mov ax, 000f
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
    add bx, 02
    add bx, 08
    mov ax, [bp-56]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-5a], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-5a]
    push ax
    mov [bp-5c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-5c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-5a]
    mov es:[bx], ax

loc_1000_b2e3:
    jmp loc_1000_b2e6

loc_1000_b2e6:
    jmp loc_1000_b684

loc_1000_b2e9:
    cmp word ptr [bp-1c], 4b
    jz loc_1000_b2f2
    jmp loc_1000_b4fe

loc_1000_b2f2:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-5e], ax
    cmp word ptr [bp-5e], 008c
    jz loc_1000_b307
    jmp loc_1000_b3fc

loc_1000_b307:
    mov word ptr [bp-1a], ffff
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-60], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-60]
    push ax
    mov [bp-62], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-62]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-60]
    mov es:[bx], ax
    mov ax, 019f
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-64], ax
    mov ax, [bp-64]
    mov [bp-46], ax
    mov ax, 014a
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0118
    mov cx, es:[bx]
    mov [bp-66], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-66]
    push ax
    mov [bp-68], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-68]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0118
    mov ax, [bp-66]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
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
    add bx, 06
    add bx, 08
    mov ax, [bp-6a]
    mov es:[bx], ax
    jmp loc_1000_b4fb

loc_1000_b3fc:
    cmp word ptr [bp-5e], 008d
    jz loc_1000_b406
    jmp loc_1000_b4fb

loc_1000_b406:
    mov word ptr [bp-1a], ffff
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
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
    add bx, 06
    add bx, 08
    mov ax, [bp-6e]
    mov es:[bx], ax
    mov ax, 019e
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-72], ax
    mov ax, [bp-72]
    mov [bp-46], ax
    mov ax, 014a
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0116
    mov cx, es:[bx]
    mov [bp-74], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-74]
    push ax
    mov [bp-76], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-76]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 0116
    mov ax, [bp-74]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-78], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-78]
    push ax
    mov [bp-7a], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-7a]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-78]
    mov es:[bx], ax
    jmp loc_1000_b4fb

loc_1000_b4fb:
    jmp loc_1000_b684

loc_1000_b4fe:
    cmp word ptr [bp-1c], 0099
    jz loc_1000_b508
    jmp loc_1000_b684

loc_1000_b508:
    mov word ptr [bp-20], ffff
    mov ax, [bp+8]
    mov [bp-7c], ax
    cmp word ptr [bp-7c], 58
    jz loc_1000_b522
    cmp word ptr [bp-7c], 57
    jz loc_1000_b522
    jmp loc_1000_b681

loc_1000_b522:
    mov word ptr [bp-1a], ffff
    mov ax, 01a0
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-7e], ax
    mov ax, [bp-7e]
    mov [bp-46], ax
    mov ax, 014a
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00ae
    mov cx, es:[bx]
    mov [bp-80], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-80]
    push ax
    mov [bp-82], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-82]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00ae
    mov ax, [bp-80]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-84], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-84]
    push ax
    mov [bp-86], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-86]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-84]
    mov es:[bx], ax
    mov ax, 019e
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-88], ax
    mov ax, [bp-88]
    mov [bp-46], ax
    mov ax, 014a
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00ac
    mov cx, es:[bx]
    mov [bp-8a], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-8a]
    push ax
    mov [bp-8c], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-8c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00ac
    mov ax, [bp-8a]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-46]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-8e], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-8e]
    push ax
    mov [bp-90], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-90]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-8e]
    mov es:[bx], ax
    jmp loc_1000_b681

loc_1000_b681:
    jmp loc_1000_b684

loc_1000_b684:
    mov ax, [bp-1a]
    and ax, ax
    jnz loc_1000_b68e
    jmp loc_1000_b6e2

loc_1000_b68e:
    mov ax, 000a
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, 0009
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8ade
    add sp, 04
    cmp word ptr [bp-16], 00
    jnz loc_1000_b6bc
    mov word ptr [bp-16], 0013
    jmp loc_1000_b6d7

loc_1000_b6bc:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax

loc_1000_b6d7:
    push word ptr [bp+8]
    nop
    push cs
    call sub_1000_33e6
    jmp loc_1000_b70c

loc_1000_b6e2:
    mov ax, [bp-20]
    and ax, ax
    jnz loc_1000_b6ec
    jmp loc_1000_b70c

loc_1000_b6ec:
    mov word ptr [bp-16], 0052
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax

loc_1000_b70c:
    push word ptr [bp-16]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    pop si
    mov sp, bp
    pop bp
    retf 0004
