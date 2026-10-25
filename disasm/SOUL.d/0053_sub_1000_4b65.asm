; ========================================
; New Subroutine: sub_1000_4b65
; ========================================
sub_1000_4b65:
    push bp
    mov bp, sp
    sub sp, 0050
    push si
    mov cx, 001f
    lea di, [bp-50]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, 000f
    push ax
    push word ptr [bp+8]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    and ax, ax
    jnz loc_1000_4b96
    jmp loc_1000_4bd4

loc_1000_4b96:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-16], ax
    mov ax, [bp-16]
    mov [bp-18], ax
    cmp word ptr [bp-18], 0192
    jz loc_1000_4bb2
    jmp loc_1000_4bc0

loc_1000_4bb2:
    cmp word ptr [bp+6], 21
    jnz loc_1000_4bbd
    mov word ptr [bp-1a], 0086

loc_1000_4bbd:
    jmp loc_1000_4bc0

loc_1000_4bc0:
    cmp word ptr [bp-1a], 00
    jnz loc_1000_4bcb
    mov word ptr [bp-1a], 0002

loc_1000_4bcb:
    mov ax, [bp-1a]
    mov [0070], ax
    jmp loc_1000_50b1

loc_1000_4bd4:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_3230
    mov [bp-1c], ax
    mov ax, [bp-1c]
    and ax, ax
    jnz loc_1000_4be9
    jmp loc_1000_50b1

loc_1000_4be9:
    mov word ptr [bp-24], ffff
    mov word ptr [bp-26], 0000
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-1e], ax
    mov ax, [bp-1e]
    mov [bp-20], ax
    cmp word ptr [bp-20], 0198
    jz loc_1000_4c2a
    jmp loc_1000_4c77

loc_1000_4c2a:
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00e4
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-22], ax
    cmp word ptr [bp+6], 26
    mov ax, 0000
    jnz loc_1000_4c5c
    dec ax

loc_1000_4c5c:
    and ax, [bp-22]
    and ax, ax
    jz loc_1000_4c74
    mov word ptr [bp-24], 0000
    mov word ptr [0148], 0012
    mov word ptr [0070], 0082

loc_1000_4c74:
    jmp loc_1000_4e80

loc_1000_4c77:
    cmp word ptr [bp-20], 01ab
    jz loc_1000_4c81
    jmp loc_1000_4d2d

loc_1000_4c81:
    cmp word ptr [bp+6], 14
    jz loc_1000_4c8a
    jmp loc_1000_4d2a

loc_1000_4c8a:
    mov ax, 01a6
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-28], ax
    mov ax, [bp-28]
    mov [bp-2c], ax
    mov ax, 0009
    push ax
    mov ax, 014a
    imul word ptr [bp-2c]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 3a
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-2a], ax
    mov ax, [bp-2a]
    and ax, ax
    jz loc_1000_4cdd
    mov word ptr [0148], 0017
    mov word ptr [0070], 007e
    mov word ptr [bp-24], 0000
    jmp loc_1000_4d2a

loc_1000_4cdd:
    mov ax, 01aa
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-2e], ax
    mov ax, [bp-2e]
    mov [bp-2c], ax
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [bp-2c]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 70
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-30], ax
    mov ax, [bp-30]
    mov [bp-2c], ax
    and ax, ax
    jz loc_1000_4d2a
    mov word ptr [0070], 007f
    mov word ptr [bp-24], 0000

loc_1000_4d2a:
    jmp loc_1000_4e80

loc_1000_4d2d:
    cmp word ptr [bp-20], 01af
    jz loc_1000_4d37
    jmp loc_1000_4d4a

loc_1000_4d37:
    cmp word ptr [bp+6], 14
    jnz loc_1000_4d47
    mov word ptr [bp-32], ffff
    mov word ptr [bp-1a], 0089

loc_1000_4d47:
    jmp loc_1000_4e80

loc_1000_4d4a:
    cmp word ptr [bp-20], 01b0
    jz loc_1000_4d54
    jmp loc_1000_4e80

loc_1000_4d54:
    cmp word ptr [bp+6], 26
    jz loc_1000_4d5d
    jmp loc_1000_4daf

loc_1000_4d5d:
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 1e
    mov cx, es:[bx]
    mov [bp-34], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-34]
    push ax
    mov [bp-36], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-36]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 1e
    mov ax, [bp-34]
    mov es:[bx], ax
    mov word ptr [bp-32], ffff
    mov word ptr [bp-1a], 008a
    jmp loc_1000_4e7d

loc_1000_4daf:
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 1e
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-38], ax
    mov ax, [bp-38]
    mov [bp-2c], ax
    mov ax, 000a
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 1e
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-3a], ax
    mov ax, [bp-3a]
    not ax
    and ax, [bp-2c]
    mov [bp-2c], ax
    cmp word ptr [bp+6], 21
    mov cx, 0000
    jnz loc_1000_4e18
    dec cx

loc_1000_4e18:
    and ax, cx
    and ax, ax
    jnz loc_1000_4e21
    jmp loc_1000_4e7d

loc_1000_4e21:
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 1e
    mov cx, es:[bx]
    mov [bp-3c], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-3c]
    push ax
    mov [bp-3e], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-3e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 1e
    mov ax, [bp-3c]
    mov es:[bx], ax
    push word ptr [0032]
    mov ax, 0010
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-32], ffff
    mov word ptr [bp-1a], 0094

loc_1000_4e7d:
    jmp loc_1000_4e80

loc_1000_4e80:
    mov ax, [bp-24]
    and ax, ax
    jz loc_1000_4ead
    mov ax, [bp+8]
    and ax, 3fff
    mov [0032], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov ax, es:[bx]
    mov [0070], ax
    mov word ptr [bp-26], ffff

loc_1000_4ead:
    mov ax, [bp-26]
    and ax, ax
    jnz loc_1000_4eb7
    jmp loc_1000_5094

loc_1000_4eb7:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-40], ax
    mov ax, [bp-40]
    mov [bp-42], ax
    cmp word ptr [bp-42], 0198
    jz loc_1000_4ed3
    jmp loc_1000_4f2e

loc_1000_4ed3:
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00e4
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-44], ax
    mov ax, [bp-44]
    and ax, ax
    jnz loc_1000_4f05
    jmp loc_1000_4f2b

loc_1000_4f05:
    cmp word ptr [005c], ff
    jnz loc_1000_4f15
    mov word ptr [005c], 0000
    jmp loc_1000_4f2b

loc_1000_4f15:
    cmp word ptr [005c], 05
    jz loc_1000_4f1f
    jmp loc_1000_4f2b

loc_1000_4f1f:
    mov word ptr [0148], 0012
    mov word ptr [0070], 0083

loc_1000_4f2b:
    jmp loc_1000_5094

loc_1000_4f2e:
    cmp word ptr [bp-42], 01ac
    jnz loc_1000_4f48
    mov word ptr [0060], 0000
    mov word ptr [bp-32], ffff
    mov word ptr [bp-1a], 0080
    jmp loc_1000_5094

loc_1000_4f48:
    cmp word ptr [bp-42], 01ae
    jz loc_1000_4f52
    jmp loc_1000_4fba

loc_1000_4f52:
    mov ax, 0005
    push ax
    push word ptr [003a]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-46], ax
    mov ax, [bp-46]
    mov [bp-2c], ax
    mov ax, 0007
    push ax
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 20
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-48], ax
    mov ax, [bp-48]
    not ax
    and ax, [bp-2c]
    mov [bp-2c], ax
    and ax, ax
    jnz loc_1000_4f9d
    jmp loc_1000_4fb7

loc_1000_4f9d:
    mov ax, 0081
    push ax
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    push word ptr [0032]
    mov ax, 0011
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_4fb7:
    jmp loc_1000_5094

loc_1000_4fba:
    cmp word ptr [bp-42], 01b3
    jz loc_1000_4fc4
    jmp loc_1000_4ffd

loc_1000_4fc4:
    mov ax, 0002
    push ax
    push word ptr [0044]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-4a], ax
    mov ax, [bp-4a]
    mov [bp-2c], ax
    and ax, ax
    jz loc_1000_4fee
    mov word ptr [bp-32], ffff
    mov word ptr [bp-1a], 0087
    jmp loc_1000_4ffa

loc_1000_4fee:
    mov word ptr [0148], 0011
    mov word ptr [0070], 0088

loc_1000_4ffa:
    jmp loc_1000_5094

loc_1000_4ffd:
    cmp word ptr [bp-42], 013b
    jz loc_1000_5007
    jmp loc_1000_5094

loc_1000_5007:
    mov ax, 0192
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-4c], ax
    mov ax, [bp-4c]
    mov [0032], ax
    nop
    push cs
    call sub_1000_50ce
    mov ax, 0002
    push ax
    push word ptr [005e]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-4e], ax
    mov ax, [bp-4e]
    and ax, ax
    jz loc_1000_5047
    mov word ptr [0148], 001b
    mov word ptr [0070], 0085
    jmp loc_1000_5091

loc_1000_5047:
    mov word ptr [372e], 0004
    mov word ptr [3732], 0107
    mov word ptr [3734], 0108
    nop
    push cs
    call sub_1000_28ff
    mov ax, 0106
    push ax
    push word ptr [372e]
    nop
    push cs
    call sub_1000_0a2d
    nop
    push cs
    call sub_1000_549d
    push word ptr [372e]
    call sub_1bd7_bfa2
    add sp, 02
    mov [bp-50], ax
    mov ax, [bp-50]
    mov [3730], ax
    mov word ptr [3736], 0084
    add word ptr [0034], 03e8

loc_1000_5091:
    jmp loc_1000_5094

loc_1000_5094:
    mov ax, [bp-32]
    and ax, ax
    jnz loc_1000_509e
    jmp loc_1000_50b1

loc_1000_509e:
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    mov ax, [bp-1a]
    mov [0070], ax

loc_1000_50b1:
    pop si
    mov sp, bp
    pop bp
    retf 0004
