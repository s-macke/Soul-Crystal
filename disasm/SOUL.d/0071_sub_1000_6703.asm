; ========================================
; New Subroutine: sub_1000_6703
; ========================================
sub_1000_6703:
    push bp
    mov bp, sp
    sub sp, 0096
    push si
    mov cx, 0042
    lea di, [bp-96]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov word ptr [0072], 0000
    mov ax, [bp+6]
    mov [bp-14], ax
    cmp word ptr [bp-14], 2f
    jz loc_1000_672d
    jmp loc_1000_67db

loc_1000_672d:
    mov word ptr [bp-16], 0009
    mov ax, 0001
    push ax
    mov ax, 0044
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-18], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-18]
    push ax
    mov [bp-1a], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-1a]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-18]
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
    mov [bp-1c], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-1c]
    push ax
    mov [bp-1e], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-1e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-1c]
    mov es:[bx], ax
    jmp loc_1000_6ff4

loc_1000_67db:
    cmp word ptr [bp-14], 04
    jz loc_1000_67e4
    jmp loc_1000_68ed

loc_1000_67e4:
    mov word ptr [bp-16], 0009
    mov ax, 0001
    push ax
    mov ax, 0044
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-20], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-20]
    push ax
    mov [bp-22], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-22]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-20]
    mov es:[bx], ax
    mov ax, 00d7
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-24], ax
    mov ax, [bp-24]
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
    mov [bp-28], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-28]
    push ax
    mov [bp-2a], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-2a]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-28]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-2c], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-2c]
    push ax
    mov [bp-2e], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-2e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-2c]
    mov es:[bx], ax
    jmp loc_1000_6ff4

loc_1000_68ed:
    cmp word ptr [bp-14], 0f
    jz loc_1000_68f6
    jmp loc_1000_6a5a

loc_1000_68f6:
    mov word ptr [bp-16], 0009
    mov ax, 0001
    push ax
    mov ax, 0044
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, 0130
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-30], ax
    mov ax, [bp-30]
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
    mov [bp-32], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-32]
    push ax
    mov [bp-34], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-34]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-32]
    mov es:[bx], ax
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
    mov ax, 000f
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
    mov ax, 0133
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-3a], ax
    mov ax, [bp-3a]
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
    mov [bp-3c], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-3c]
    push ax
    mov [bp-3e], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-3e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-3c]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-40], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-40]
    push ax
    mov [bp-42], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-42]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-40]
    mov es:[bx], ax
    jmp loc_1000_6ff4

loc_1000_6a5a:
    cmp word ptr [bp-14], 10
    jz loc_1000_6a63
    jmp loc_1000_6c69

loc_1000_6a63:
    mov ax, 01af
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-44], ax
    mov ax, [bp-44]
    mov [bp-26], ax
    mov word ptr [bp-16], 0009
    cmp ax, [0032]
    jnz loc_1000_6ab1
    mov ax, 000a
    push ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 1e
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-46], ax
    mov ax, [bp-46]
    not ax
    mov [bp-48], ax
    jmp loc_1000_6ab6

loc_1000_6ab1:
    mov word ptr [bp-48], ffff

loc_1000_6ab6:
    mov ax, 0001
    push ax
    mov ax, 0044
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, [bp-48]
    and ax, ax
    jnz loc_1000_6ad0
    jmp loc_1000_6c66

loc_1000_6ad0:
    mov ax, 01af
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-4a], ax
    mov ax, [bp-4a]
    mov [bp-26], ax
    mov ax, 0014
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-4c], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-4c]
    push ax
    mov [bp-4e], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-4e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov ax, [bp-4c]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-26]
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
    call sub_1bd7_8acb
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
    imul word ptr [bp-26]
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
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-56]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-54]
    mov es:[bx], ax
    mov ax, 01b0
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-58], ax
    mov ax, [bp-58]
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
    mov [bp-5a], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-5a]
    push ax
    mov [bp-5c], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-5c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-5a]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-5e], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-5e]
    push ax
    mov [bp-60], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-60]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-5e]
    mov es:[bx], ax

loc_1000_6c66:
    jmp loc_1000_6ff4

loc_1000_6c69:
    cmp word ptr [bp-14], 53
    jz loc_1000_6c72
    jmp loc_1000_6e60

loc_1000_6c72:
    mov ax, 0001
    push ax
    push word ptr [0044]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-62], ax
    mov ax, [bp-62]
    and ax, ax
    jnz loc_1000_6c8f
    jmp loc_1000_6e3d

loc_1000_6c8f:
    mov word ptr [bp-16], 0009
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
    mov [bp-64], ax
    mov ax, [bp-64]
    mov [bp-26], ax
    mov ax, 0014
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    add bx, 08
    mov cx, es:[bx]
    mov [bp-66], cx
    mov bx, ax
    mov ax, 000f
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
    add bx, 04
    add bx, 08
    mov ax, [bp-66]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-6a], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-6a]
    push ax
    mov [bp-6c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-6c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-6a]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
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
    add bx, 06
    add bx, 08
    mov ax, [bp-6e]
    mov es:[bx], ax
    mov ax, 01b0
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-72], ax
    mov ax, [bp-72]
    mov [bp-26], ax
    mov ax, 0014
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov cx, es:[bx]
    mov [bp-74], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-74]
    push ax
    mov [bp-76], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-76]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-74]
    mov es:[bx], ax
    mov ax, 0014
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-78], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-78]
    push ax
    mov [bp-7a], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-7a]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-78]
    mov es:[bx], ax
    jmp loc_1000_6e5d

loc_1000_6e3d:
    mov word ptr [bp-16], 003c
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax

loc_1000_6e5d:
    jmp loc_1000_6ff4

loc_1000_6e60:
    cmp word ptr [bp-14], 69
    jz loc_1000_6e69
    jmp loc_1000_6f49

loc_1000_6e69:
    mov ax, 01aa
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-7c], ax
    mov ax, [bp-7c]
    mov [bp-26], ax
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 70
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-7e], ax
    mov ax, [bp-7e]
    mov [bp-82], ax
    mov ax, 0009
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 3a
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-80], ax
    mov ax, [bp-80]
    mov [bp-48], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    mov ax, [bp-82]
    and ax, ax
    jz loc_1000_6f06
    mov word ptr [0148], 0016
    mov word ptr [bp-16], 007d
    jmp loc_1000_6f46

loc_1000_6f06:
    mov ax, [bp-48]
    and ax, ax
    jz loc_1000_6f1b
    mov word ptr [0148], 0017
    mov word ptr [bp-16], 007e
    jmp loc_1000_6f46

loc_1000_6f1b:
    mov word ptr [bp-16], 0095
    mov ax, 01ac
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-84], ax
    mov ax, [bp-84]
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d

loc_1000_6f46:
    jmp loc_1000_6ff4

loc_1000_6f49:
    cmp word ptr [bp-14], 6a
    jz loc_1000_6f52
    jmp loc_1000_6ff4

loc_1000_6f52:
    mov ax, 01a6
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-86], ax
    mov ax, [bp-86]
    mov [bp-26], ax
    mov ax, 0009
    push ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 3a
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-88], ax
    mov ax, [bp-88]
    mov [bp-82], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    mov ax, [bp-82]
    and ax, ax
    jz loc_1000_6fc6
    mov word ptr [0148], 0019
    mov word ptr [bp-16], 007c
    jmp loc_1000_6ff1

loc_1000_6fc6:
    mov word ptr [bp-16], 0095
    mov ax, 01a6
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-8a], ax
    mov ax, [bp-8a]
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d

loc_1000_6ff1:
    jmp loc_1000_6ff4

loc_1000_6ff4:
    cmp word ptr [bp-16], 00
    jg loc_1000_6ffd
    jmp loc_1000_700c

loc_1000_6ffd:
    push word ptr [bp-16]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    jmp loc_1000_7141

loc_1000_700c:
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
    mov [bp-8c], ax
    cmp word ptr [bp-8c], 48
    jz loc_1000_7038
    jmp loc_1000_7054

loc_1000_7038:
    mov ax, 0066
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-8e], ax
    mov ax, [bp-8e]
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce
    jmp loc_1000_7134

loc_1000_7054:
    cmp word ptr [bp-8c], 49
    jz loc_1000_705e
    jmp loc_1000_708a

loc_1000_705e:
    cmp word ptr [0046], 01
    jz loc_1000_706e
    mov word ptr [0070], 008e
    jmp loc_1000_7087

loc_1000_706e:
    mov ax, 00e1
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-90], ax
    mov ax, [bp-90]
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce

loc_1000_7087:
    jmp loc_1000_7134

loc_1000_708a:
    cmp word ptr [bp-8c], 06
    jz loc_1000_7094
    jmp loc_1000_70f1

loc_1000_7094:
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-92], ax
    mov ax, [bp-92]
    not ax
    and ax, ax
    jnz loc_1000_70cc
    jmp loc_1000_70e8

loc_1000_70cc:
    mov ax, 01a3
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-94], ax
    mov ax, [bp-94]
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce
    jmp loc_1000_70ee

loc_1000_70e8:
    mov word ptr [0070], 0002

loc_1000_70ee:
    jmp loc_1000_7134

loc_1000_70f1:
    cmp word ptr [bp-8c], 27
    jz loc_1000_70fb
    jmp loc_1000_7117

loc_1000_70fb:
    mov ax, 019d
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-96], ax
    mov ax, [bp-96]
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce
    jmp loc_1000_7134

loc_1000_7117:
    cmp word ptr [bp-8c], 009a
    jnz loc_1000_7128
    mov word ptr [0070], 0091
    jmp loc_1000_7134

loc_1000_7128:
    mov word ptr [0070], 000a
    mov word ptr [0072], 0000

loc_1000_7134:
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d

loc_1000_7141:
    pop si
    mov sp, bp
    pop bp
    retf 0002
