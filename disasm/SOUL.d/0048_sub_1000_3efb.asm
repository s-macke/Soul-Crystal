; ========================================
; New Subroutine: sub_1000_3efb
; ========================================
sub_1000_3efb:
    mov cx, 0072
    call sub_1bd7_0a67
    mov ax, 000f
    push ax
    push word ptr [bp+8]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-14], ax
    mov ax, [bp-14]
    and ax, ax
    jnz loc_1000_3f1f
    jmp loc_1000_3ff5

loc_1000_3f1f:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-16], ax
    mov ax, [bp-16]
    mov [bp-18], ax
    cmp word ptr [bp-18], 00ca
    jz loc_1000_3f3b
    jmp loc_1000_3f49

loc_1000_3f3b:
    cmp word ptr [bp+6], 26
    jnz loc_1000_3f46
    mov word ptr [bp-1a], 0084

loc_1000_3f46:
    jmp loc_1000_3fe1

loc_1000_3f49:
    cmp word ptr [bp-18], 00cc
    jz loc_1000_3f53
    jmp loc_1000_3f61

loc_1000_3f53:
    cmp word ptr [bp+6], 19
    jnz loc_1000_3f5e
    mov word ptr [bp-1a], 0085

loc_1000_3f5e:
    jmp loc_1000_3fe1

loc_1000_3f61:
    cmp word ptr [bp-18], 00cd
    jz loc_1000_3f6b
    jmp loc_1000_3f79

loc_1000_3f6b:
    cmp word ptr [bp+6], 21
    jnz loc_1000_3f76
    mov word ptr [bp-1a], 0086

loc_1000_3f76:
    jmp loc_1000_3fe1

loc_1000_3f79:
    cmp word ptr [bp-18], 00d2
    jz loc_1000_3f83
    jmp loc_1000_3fa8

loc_1000_3f83:
    mov ax, [bp+6]
    mov [bp-1c], ax
    cmp word ptr [bp-1c], 14
    jnz loc_1000_3f97
    mov word ptr [bp-1a], 0089
    jmp loc_1000_3fa5

loc_1000_3f97:
    cmp word ptr [bp-1c], 19
    jnz loc_1000_3fa5
    mov word ptr [bp-1a], 0087
    jmp loc_1000_3fa5

loc_1000_3fa5:
    jmp loc_1000_3fe1

loc_1000_3fa8:
    cmp word ptr [bp-18], 00d7
    jz loc_1000_3fb2
    jmp loc_1000_3fc9

loc_1000_3fb2:
    mov ax, [bp+6]
    mov [bp-1e], ax
    cmp word ptr [bp-1e], 19
    jnz loc_1000_3fc6
    mov word ptr [bp-1a], 008a
    jmp loc_1000_3fc6

loc_1000_3fc6:
    jmp loc_1000_3fe1

loc_1000_3fc9:
    cmp word ptr [bp-18], 00dc
    jz loc_1000_3fd3
    jmp loc_1000_3fe1

loc_1000_3fd3:
    cmp word ptr [bp+6], 21
    jnz loc_1000_3fde
    mov word ptr [bp-1a], 008a

loc_1000_3fde:
    jmp loc_1000_3fe1

loc_1000_3fe1:
    cmp word ptr [bp-1a], 00
    jnz loc_1000_3fec
    mov word ptr [bp-1a], 0002

loc_1000_3fec:
    mov ax, [bp-1a]
    mov [0070], ax
    jmp loc_1000_47d7

loc_1000_3ff5:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_3230
    mov [bp-20], ax
    mov ax, [bp-20]
    and ax, ax
    jnz loc_1000_400a
    jmp loc_1000_47d7

loc_1000_400a:
    mov word ptr [bp-2c], ffff
    mov word ptr [bp-2e], 0000
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
    mov [bp-22], ax
    mov ax, [bp-22]
    mov [bp-24], ax
    cmp word ptr [bp-24], 00e9
    jz loc_1000_404b
    jmp loc_1000_410e

loc_1000_404b:
    cmp word ptr [bp+6], 23
    jz loc_1000_4054
    jmp loc_1000_410b

loc_1000_4054:
    mov ax, 00ea
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-26], ax
    mov ax, [bp-26]
    mov [bp-30], ax
    mov ax, 000a
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
    mov [bp-28], ax
    mov ax, [bp-28]
    not ax
    mov [bp-32], ax
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [bp-30]
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
    jnz loc_1000_40c6
    jmp loc_1000_40f0

loc_1000_40c6:
    cmp word ptr [0054], 00
    mov ax, 0000
    jle loc_1000_40d1
    dec ax

loc_1000_40d1:
    and ax, [bp-32]
    and ax, ax
    jz loc_1000_40ed
    mov word ptr [bp-36], 0000
    mov word ptr [bp-34], 4130
    mov word ptr [0070], 0083
    mov word ptr [bp-2c], 0000

loc_1000_40ed:
    jmp loc_1000_410b

loc_1000_40f0:
    mov ax, [bp-32]
    and ax, ax
    jnz loc_1000_40fa
    jmp loc_1000_410b

loc_1000_40fa:
    mov word ptr [0148], 0008
    mov word ptr [0070], 0081
    mov word ptr [bp-2c], 0000

loc_1000_410b:
    jmp loc_1000_4340

loc_1000_410e:
    cmp word ptr [bp-24], 00cc
    jz loc_1000_4118
    jmp loc_1000_433b

loc_1000_4118:
    mov ax, 00ea
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-38], ax
    mov ax, [bp-38]
    mov [bp-30], ax
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c0
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-3a], ax
    cmp word ptr [bp+6], 19
    mov ax, 0000
    jnz loc_1000_415b
    dec ax

loc_1000_415b:
    mov cx, [bp-3a]
    not cx
    and ax, cx
    and ax, ax
    jnz loc_1000_4169
    jmp loc_1000_4333

loc_1000_4169:
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov cx, es:[bx]
    mov [bp-3c], cx
    mov bx, ax
    mov ax, 0010
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
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 7e
    mov cx, es:[bx]
    mov [bp-40], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-40]
    push ax
    mov [bp-42], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-42]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 7e
    mov ax, [bp-40]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 7e
    mov cx, es:[bx]
    mov [bp-44], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-44]
    push ax
    mov [bp-46], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-46]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 7e
    mov ax, [bp-44]
    mov es:[bx], ax
    push word ptr [0032]
    mov ax, ff16
    push ax
    mov ax, 0061
    push ax
    nop
    push cs
    call sub_1000_53b2
    mov ax, 00cf
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-48], ax
    mov ax, [bp-48]
    mov [bp-30], ax
    mov ax, 0014
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov cx, es:[bx]
    mov [bp-4a], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-4a]
    push ax
    mov [bp-4c], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-4c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-4a]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 62
    mov cx, es:[bx]
    mov [bp-4e], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-4e]
    push ax
    mov [bp-50], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-50]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 62
    mov ax, [bp-4e]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [bp-30]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 62
    mov cx, es:[bx]
    mov [bp-52], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-52]
    push ax
    mov [bp-54], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-54]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 62
    mov ax, [bp-52]
    mov es:[bx], ax

loc_1000_4333:
    mov word ptr [bp-2e], ffff
    jmp loc_1000_4340

loc_1000_433b:
    mov word ptr [bp-2e], ffff

loc_1000_4340:
    mov ax, [bp-2c]
    and ax, ax
    jz loc_1000_437f
    mov ax, [bp+8]
    and ax, 3fff
    mov [0032], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov cx, es:[bx]
    mov [0070], cx
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    mov word ptr [bp-2e], ffff

loc_1000_437f:
    mov ax, [bp-2e]
    and ax, ax
    jnz loc_1000_4389
    jmp loc_1000_47d7

loc_1000_4389:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-56], ax
    mov ax, [bp-56]
    mov [bp-58], ax
    cmp word ptr [bp-58], 00ca
    jz loc_1000_43a5
    jmp loc_1000_44ca

loc_1000_43a5:
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-5a], ax
    mov ax, [bp-5a]
    not ax
    and ax, ax
    jnz loc_1000_43d8
    jmp loc_1000_44c7

loc_1000_43d8:
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c4
    mov cx, es:[bx]
    mov [bp-5c], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-5c]
    push ax
    mov [bp-5e], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-5e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c4
    mov ax, [bp-5c]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c4
    mov cx, es:[bx]
    mov [bp-60], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-60]
    push ax
    mov [bp-62], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-62]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c4
    mov ax, [bp-60]
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
    mov [bp-64], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-64]
    push ax
    mov [bp-66], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-66]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-64]
    mov es:[bx], ax
    mov ax, 0078
    push ax
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0e97
    mov [bp-68], ax
    mov ax, [bp-68]
    mov [bp-30], ax

loc_1000_44c7:
    jmp loc_1000_47d7

loc_1000_44ca:
    cmp word ptr [bp-58], 00cc
    jz loc_1000_44d4
    jmp loc_1000_4561

loc_1000_44d4:
    mov ax, 00e1
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-6a], ax
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [bp-6a]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-6c], ax
    mov ax, [bp-6c]
    mov [bp-30], ax
    mov ax, 0010
    push ax
    push word ptr [0044]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-6e], ax
    mov ax, [bp-6e]
    not ax
    and ax, [bp-30]
    and ax, ax
    jnz loc_1000_452e
    jmp loc_1000_455e

loc_1000_452e:
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    mov word ptr [0070], 007a
    mov ax, 0010
    push ax
    mov ax, 0044
    push ax
    call sub_1bd7_8acb
    add sp, 04
    push word ptr [0032]
    mov ax, 0061
    push ax
    nop
    push cs
    call sub_1000_3041

loc_1000_455e:
    jmp loc_1000_47d7

loc_1000_4561:
    cmp word ptr [bp-58], 00cd
    jz loc_1000_456b
    jmp loc_1000_45b2

loc_1000_456b:
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 32
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-70], ax
    mov ax, [bp-70]
    and ax, ax
    jz loc_1000_45af
    mov ax, 007b
    push ax
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0e97
    mov [bp-72], ax
    mov ax, [bp-72]
    mov [bp-30], ax

loc_1000_45af:
    jmp loc_1000_47d7

loc_1000_45b2:
    cmp word ptr [bp-58], 00d6
    jz loc_1000_45bc
    jmp loc_1000_45cb

loc_1000_45bc:
    cmp word ptr [bp+6], 21
    jz loc_1000_45c5
    jmp loc_1000_45c8

loc_1000_45c5:
    call sub_1000_47da

loc_1000_45c8:
    jmp loc_1000_47d7

loc_1000_45cb:
    cmp word ptr [bp-58], 00d9
    jz loc_1000_45d5
    jmp loc_1000_45e4

loc_1000_45d5:
    cmp word ptr [bp+6], 19
    jz loc_1000_45de
    jmp loc_1000_45e1

loc_1000_45de:
    call sub_1000_47da

loc_1000_45e1:
    jmp loc_1000_47d7

loc_1000_45e4:
    cmp word ptr [bp-58], 00dc
    jz loc_1000_45ee
    jmp loc_1000_4662

loc_1000_45ee:
    mov ax, 00d7
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-74], ax
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [bp-74]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 5c
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-76], ax
    cmp word ptr [bp+6], 19
    mov ax, 0000
    jnz loc_1000_462a
    dec ax

loc_1000_462a:
    and ax, [bp-76]
    and ax, ax
    jnz loc_1000_4634
    jmp loc_1000_465f

loc_1000_4634:
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    mov word ptr [0070], 007d
    mov ax, 00d7
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-78], ax
    push word ptr [bp-78]
    mov ax, 002f
    push ax
    nop
    push cs
    call sub_1000_3041

loc_1000_465f:
    jmp loc_1000_47d7

loc_1000_4662:
    cmp word ptr [bp-58], 00e1
    jz loc_1000_466c
    jmp loc_1000_46df

loc_1000_466c:
    cmp word ptr [bp+6], 19
    jnz loc_1000_4694
    cmp word ptr [0046], 01
    jz loc_1000_4694
    mov ax, 00db
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-7a], ax
    mov ax, [bp-7a]
    mov [0032], ax
    mov word ptr [0070], 008e
    jmp loc_1000_46dc

loc_1000_4694:
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-7c], ax
    mov ax, [bp-7c]
    not ax
    and ax, ax
    jz loc_1000_46c9
    add word ptr [0034], 19

loc_1000_46c9:
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    mov word ptr [0070], 008d

loc_1000_46dc:
    jmp loc_1000_47d7

loc_1000_46df:
    cmp word ptr [bp-58], 00e2
    jnz loc_1000_46ef
    mov word ptr [014a], ffff
    jmp loc_1000_47d7

loc_1000_46ef:
    cmp word ptr [bp-58], 00ea
    jz loc_1000_46f9
    jmp loc_1000_475c

loc_1000_46f9:
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-7e], ax
    mov ax, [bp-7e]
    not ax
    and ax, ax
    jnz loc_1000_472c
    jmp loc_1000_4746

loc_1000_472c:
    mov ax, 007f
    push ax
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    cmp word ptr [0050], 00
    jnz loc_1000_4746
    mov word ptr [0050], 0001

loc_1000_4746:
    cmp word ptr [0054], 00
    jle loc_1000_4759
    mov word ptr [0148], 000a
    mov word ptr [0070], 008f

loc_1000_4759:
    jmp loc_1000_47d7

loc_1000_475c:
    cmp word ptr [bp-58], 012d
    jz loc_1000_4766
    jmp loc_1000_47d7

loc_1000_4766:
    mov word ptr [003c], 0000
    mov word ptr [372e], 0002
    mov word ptr [3732], 010c
    mov word ptr [3734], 010d
    nop
    push cs
    call sub_1000_28ff
    mov ax, 010b
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1000_0a2d
    nop
    push cs
    call sub_1000_549d
    push word ptr [372e]
    call sub_1bd7_bfa2
    add sp, 02
    mov [bp-80], ax
    mov ax, [bp-80]
    mov [3730], ax
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    mov cx, es:[bx]
    mov [0070], cx
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    jmp loc_1000_47d7

loc_1000_47d7:
    jmp loc_1000_4845
