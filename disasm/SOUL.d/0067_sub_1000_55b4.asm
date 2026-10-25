; ========================================
; New Subroutine: sub_1000_55b4
; ========================================
sub_1000_55b4:
    push bp
    mov bp, sp
    sub sp, 009c
    push si
    mov cx, 0045
    lea di, [bp-9c]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov word ptr [bp-14], ffff
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [0072], ax
    mov word ptr [bp-16], 0000
    cmp word ptr [bp+6], 00a3
    jz loc_1000_55f8
    jmp loc_1000_5884

loc_1000_55f8:
    push word ptr [bp+8]
    nop
    push cs
    call sub_1000_333c
    mov word ptr [bp-1c], 0000
    mov ax, [bp+8]
    mov [bp-18], ax
    cmp word ptr [bp-18], 71
    jz loc_1000_5614
    jmp loc_1000_5659

loc_1000_5614:
    push word ptr [0032]
    nop
    push cs
    call sub_1000_2b9b
    mov [bp-1a], ax
    cmp word ptr [bp-1a], 00db
    jz loc_1000_562a
    jmp loc_1000_5651

loc_1000_562a:
    mov word ptr [bp-14], 000a
    mov word ptr [0046], 0000
    mov word ptr [bp-1e], 00fa
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0071
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-1c], ffff
    jmp loc_1000_5656

loc_1000_5651:
    mov word ptr [bp-1e], 0002

loc_1000_5656:
    jmp loc_1000_5843

loc_1000_5659:
    cmp word ptr [bp-18], 50
    jz loc_1000_5662
    jmp loc_1000_568a

loc_1000_5662:
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_566c
    jmp loc_1000_5687

loc_1000_566c:
    xor ax, ax
    push ax
    mov ax, 000d
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov word ptr [bp-1e], 00f8
    mov word ptr [bp-1c], ffff
    mov word ptr [bp-14], 0000

loc_1000_5687:
    jmp loc_1000_5843

loc_1000_568a:
    cmp word ptr [bp-18], 07
    jnz loc_1000_5698
    mov word ptr [bp-1e], 008c
    jmp loc_1000_5843

loc_1000_5698:
    cmp word ptr [bp-18], 28
    jnz loc_1000_56a6
    mov word ptr [bp-1e], 008d
    jmp loc_1000_5843

loc_1000_56a6:
    cmp word ptr [bp-18], 47
    jnz loc_1000_56b4
    mov word ptr [bp-1e], 00f7
    jmp loc_1000_5843

loc_1000_56b4:
    cmp word ptr [bp-18], 37
    jnz loc_1000_56c2
    mov word ptr [bp-1e], 0103
    jmp loc_1000_5843

loc_1000_56c2:
    cmp word ptr [bp-18], 6b
    jz loc_1000_56cb
    jmp loc_1000_56e8

loc_1000_56cb:
    mov word ptr [bp-1e], 00fb
    mov word ptr [bp-14], 000f
    mov ax, 0002
    push ax
    mov ax, 0044
    push ax
    call sub_1bd7_8acb
    add sp, 04
    jmp loc_1000_5843

loc_1000_56e8:
    cmp word ptr [bp-18], 3e
    jnz loc_1000_5711
    mov word ptr [bp-1e], 00fa
    xor ax, ax
    push ax
    mov ax, [0034]
    sub ax, 0019
    push ax
    call sub_1bd7_8b65
    add sp, 04
    mov [bp-20], ax
    mov ax, [bp-20]
    mov [0034], ax
    jmp loc_1000_5843

loc_1000_5711:
    cmp word ptr [bp-18], 15
    jz loc_1000_571a
    jmp loc_1000_5737

loc_1000_571a:
    mov ax, [0144]
    and ax, ax
    jz loc_1000_5729
    mov word ptr [bp-1e], 00f5
    jmp loc_1000_5734

loc_1000_5729:
    mov word ptr [bp-1e], 00f6
    mov word ptr [0148], 0013

loc_1000_5734:
    jmp loc_1000_5843

loc_1000_5737:
    cmp word ptr [bp-18], 0e
    jz loc_1000_5740
    jmp loc_1000_57ef

loc_1000_5740:
    mov ax, 0001
    push ax
    push word ptr [005e]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-22], ax
    mov ax, [bp-22]
    mov [bp-26], ax
    mov ax, 0002
    push ax
    push word ptr [005e]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-24], ax
    mov ax, [bp-24]
    not ax
    and ax, [bp-26]
    mov [bp-28], ax
    mov cx, [bp-26]
    not cx
    or ax, cx
    mov [bp-28], ax
    mov ax, 0002
    push ax
    mov ax, 005e
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, 0001
    push ax
    mov ax, 005e
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, [bp-28]
    and ax, ax
    jz loc_1000_57b0
    mov word ptr [bp-1e], 00f4
    jmp loc_1000_57ec

loc_1000_57b0:
    mov word ptr [bp-1e], 00f4
    mov ax, 0003
    push ax
    push word ptr [005e]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-2a], ax
    mov ax, [bp-2a]
    not ax
    mov [bp-26], ax
    and ax, ax
    jnz loc_1000_57d7
    jmp loc_1000_57ec

loc_1000_57d7:
    mov ax, 0003
    push ax
    mov ax, 005e
    push ax
    call sub_1bd7_8acb
    add sp, 04
    add word ptr [0034], 2d

loc_1000_57ec:
    jmp loc_1000_5843

loc_1000_57ef:
    cmp word ptr [bp-18], 22
    jnz loc_1000_5803
    mov word ptr [bp-1e], 00f9
    mov word ptr [0148], 001a
    jmp loc_1000_5843

loc_1000_5803:
    cmp word ptr [bp-18], 43
    jnz loc_1000_5811
    mov word ptr [bp-1e], 0115
    jmp loc_1000_5843

loc_1000_5811:
    push word ptr [0032]
    push word ptr [bp+8]
    nop
    push cs
    call sub_1000_294f
    mov [bp-2c], ax
    mov ax, [bp-2c]
    mov [bp-26], ax
    or ax, ax
    jle loc_1000_5835
    mov [bp-1e], ax
    mov word ptr [bp-1c], ffff
    jmp loc_1000_5843

loc_1000_5835:
    cmp word ptr [bp-26], 00
    jl loc_1000_583e
    jmp loc_1000_5843

loc_1000_583e:
    mov word ptr [bp-1e], 0002

loc_1000_5843:
    mov ax, [bp-1c]
    and ax, ax
    jnz loc_1000_584d
    jmp loc_1000_5881

loc_1000_584d:
    cmp word ptr [bp-14], 00
    mov ax, 0000
    jl loc_1000_5857
    dec ax

loc_1000_5857:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_5862
    jmp loc_1000_5879

loc_1000_5862:
    mov ax, [bp-14]
    add [0034], ax
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_5879:
    push word ptr [bp+8]
    nop
    push cs
    call sub_1000_33e6

loc_1000_5881:
    jmp loc_1000_65a0

loc_1000_5884:
    cmp word ptr [bp+8], 00a3
    jz loc_1000_588e
    jmp loc_1000_5bfe

loc_1000_588e:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov ax, [bp+6]
    mov [bp-2e], ax
    cmp word ptr [bp-2e], 07
    jnz loc_1000_58aa
    mov word ptr [bp-1e], 008c
    jmp loc_1000_5bbb

loc_1000_58aa:
    cmp word ptr [bp-2e], 08
    jz loc_1000_58b3
    jmp loc_1000_5a9c

loc_1000_58b3:
    mov word ptr [bp-1e], 00ff
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_58c2
    jmp loc_1000_5a99

loc_1000_58c2:
    mov word ptr [bp-14], 000a
    mov ax, 00ca
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-30], ax
    mov ax, [bp-30]
    mov [bp-26], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c4
    mov cx, es:[bx]
    mov [bp-32], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-32]
    push ax
    mov [bp-34], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-34]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c4
    mov ax, [bp-32]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c4
    mov cx, es:[bx]
    mov [bp-36], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-36]
    push ax
    mov [bp-38], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-38]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c4
    mov ax, [bp-36]
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
    mov [bp-3a], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-3a]
    push ax
    mov [bp-3c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-3c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-3a]
    mov es:[bx], ax
    mov ax, 00cc
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-3e], ax
    mov ax, [bp-3e]
    mov [bp-26], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 62
    mov cx, es:[bx]
    mov [bp-40], cx
    mov bx, ax
    mov ax, 000a
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
    add bx, 62
    mov ax, [bp-40]
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
    mov [bp-44], cx
    mov bx, ax
    mov ax, 0010
    push ax
    lea ax, [bp-44]
    push ax
    mov [bp-46], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-46]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-44]
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
    add bx, 00
    add bx, 08
    mov ax, [bp-48]
    mov es:[bx], ax

loc_1000_5a99:
    jmp loc_1000_5bbb

loc_1000_5a9c:
    cmp word ptr [bp-2e], 32
    jz loc_1000_5aa5
    jmp loc_1000_5afd

loc_1000_5aa5:
    mov word ptr [bp-1e], 0101
    mov word ptr [bp-14], 000a
    mov ax, 00cc
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-4c], ax
    mov ax, 0010
    push ax
    mov ax, 0014
    imul word ptr [bp-4c]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-4e], ax
    mov ax, [bp-4e]
    not ax
    and ax, ax
    jnz loc_1000_5aed
    jmp loc_1000_5afa

loc_1000_5aed:
    push word ptr [0032]
    mov ax, 0061
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_5afa:
    jmp loc_1000_5bbb

loc_1000_5afd:
    cmp word ptr [bp-2e], 37
    jnz loc_1000_5b0b
    mov word ptr [bp-1e], 0103
    jmp loc_1000_5bbb

loc_1000_5b0b:
    cmp word ptr [bp-2e], 0083
    jz loc_1000_5b1c
    cmp word ptr [bp-2e], 0084
    jz loc_1000_5b1c
    jmp loc_1000_5b2a

loc_1000_5b1c:
    mov word ptr [bp-1e], 0103
    mov word ptr [0072], 0000
    jmp loc_1000_5bbb

loc_1000_5b2a:
    cmp word ptr [bp-2e], 008a
    jnz loc_1000_5b39
    mov word ptr [bp-1e], 0101
    jmp loc_1000_5bbb

loc_1000_5b39:
    cmp word ptr [bp-2e], 2f
    jz loc_1000_5b54
    cmp word ptr [bp-2e], 04
    jz loc_1000_5b54
    cmp word ptr [bp-2e], 0f
    jz loc_1000_5b54
    cmp word ptr [bp-2e], 10
    jz loc_1000_5b54
    jmp loc_1000_5b64

loc_1000_5b54:
    mov word ptr [bp-16], ffff
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_6703
    jmp loc_1000_5bbb

loc_1000_5b64:
    cmp word ptr [bp-2e], 69
    jz loc_1000_5b7f
    cmp word ptr [bp-2e], 6a
    jz loc_1000_5b7f
    cmp word ptr [bp-2e], 48
    jz loc_1000_5b7f
    cmp word ptr [bp-2e], 49
    jz loc_1000_5b7f
    jmp loc_1000_5b8f

loc_1000_5b7f:
    mov word ptr [bp-16], ffff
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_6703
    jmp loc_1000_5bbb

loc_1000_5b8f:
    cmp word ptr [bp-2e], 53
    jz loc_1000_5bab
    cmp word ptr [bp-2e], 06
    jz loc_1000_5bab
    cmp word ptr [bp-2e], 27
    jz loc_1000_5bab
    cmp word ptr [bp-2e], 009a
    jz loc_1000_5bab
    jmp loc_1000_5bbb

loc_1000_5bab:
    mov word ptr [bp-16], ffff
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_6703
    jmp loc_1000_5bbb

loc_1000_5bbb:
    cmp word ptr [bp-14], 00
    mov ax, 0000
    jle loc_1000_5bc5
    dec ax

loc_1000_5bc5:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_5bd0
    jmp loc_1000_5be7

loc_1000_5bd0:
    mov ax, [bp-14]
    add [0034], ax
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_5be7:
    mov ax, [bp-16]
    not ax
    and ax, ax
    jnz loc_1000_5bf3
    jmp loc_1000_5bfb

loc_1000_5bf3:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6

loc_1000_5bfb:
    jmp loc_1000_65a0

loc_1000_5bfe:
    cmp word ptr [bp+8], 0d
    jz loc_1000_5c07
    jmp loc_1000_5c60

loc_1000_5c07:
    cmp word ptr [bp+6], 20
    jz loc_1000_5c10
    jmp loc_1000_5c58

loc_1000_5c10:
    mov word ptr [bp-1e], 00f6
    mov ax, 0003
    push ax
    push word ptr [0042]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-50], ax
    mov ax, [bp-50]
    not ax
    and ax, ax
    jnz loc_1000_5c34
    jmp loc_1000_5c55

loc_1000_5c34:
    add word ptr [0034], 14
    mov ax, 0003
    push ax
    mov ax, 0042
    push ax
    call sub_1bd7_8acb
    add sp, 04
    xor ax, ax
    push ax
    mov ax, 000d
    push ax
    nop
    push cs
    call sub_1000_3041

loc_1000_5c55:
    jmp loc_1000_5c5d

loc_1000_5c58:
    mov word ptr [bp-1e], 0118

loc_1000_5c5d:
    jmp loc_1000_65a0

loc_1000_5c60:
    cmp word ptr [bp+8], 6c
    jz loc_1000_5c69
    jmp loc_1000_5cc6

loc_1000_5c69:
    cmp word ptr [bp+6], 0b
    jz loc_1000_5c72
    jmp loc_1000_5cc6

loc_1000_5c72:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov ax, 000d
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-52], ax
    mov ax, [bp-52]
    not ax
    and ax, ax
    jnz loc_1000_5c99
    jmp loc_1000_5cb6

loc_1000_5c99:
    add word ptr [0034], 19
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov word ptr [bp-1e], 00f9
    jmp loc_1000_5cbb

loc_1000_5cb6:
    mov word ptr [bp-1e], 0046

loc_1000_5cbb:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6
    jmp loc_1000_65a0

loc_1000_5cc6:
    cmp word ptr [bp+8], 008e
    jz loc_1000_5cd0
    jmp loc_1000_5e14

loc_1000_5cd0:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov word ptr [bp-1c], ffff
    mov ax, [bp+6]
    mov [bp-54], ax
    cmp word ptr [bp-54], 3c
    jz loc_1000_5cec
    jmp loc_1000_5d23

loc_1000_5cec:
    mov word ptr [bp-1e], 00fe
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_5cfb
    jmp loc_1000_5d20

loc_1000_5cfb:
    add word ptr [0034], 14
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, 0001
    push ax
    mov ax, 004a
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_5d20:
    jmp loc_1000_5dff

loc_1000_5d23:
    cmp word ptr [bp-54], 0082
    jz loc_1000_5d2d
    jmp loc_1000_5d79

loc_1000_5d2d:
    mov word ptr [bp-1e], 00fd
    mov ax, 000d
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-56], ax
    mov ax, [bp-56]
    not ax
    and ax, ax
    jnz loc_1000_5d51
    jmp loc_1000_5d76

loc_1000_5d51:
    add word ptr [0034], 14
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, 0002
    push ax
    mov ax, 004a
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_5d76:
    jmp loc_1000_5dff

loc_1000_5d79:
    cmp word ptr [bp-54], 00a3
    jnz loc_1000_5d88
    mov word ptr [bp-1e], 0048
    jmp loc_1000_5dff

loc_1000_5d88:
    cmp word ptr [bp-54], 009f
    jz loc_1000_5d92
    jmp loc_1000_5deb

loc_1000_5d92:
    cmp word ptr [004a], 03
    mov ax, 0000
    jnz loc_1000_5d9d
    dec ax

loc_1000_5d9d:
    mov si, 00e4
    xor bx, bx
    add bx, [si+a]
    mov es, [si+2]
    add bx, 011a
    and ax, es:[bx]
    and ax, ax
    jnz loc_1000_5db6
    jmp loc_1000_5de8

loc_1000_5db6:
    add word ptr [0034], 64
    mov word ptr [004e], 0004
    mov word ptr [bp-1e], 009a
    push word ptr [0032]
    mov ax, 009f
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-1c], 0000
    mov ax, 0001
    push ax
    mov ax, 005e
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_5de8:
    jmp loc_1000_5dff

loc_1000_5deb:
    cmp word ptr [bp-54], 19
    jnz loc_1000_5dff
    mov word ptr [0148], 0010
    mov word ptr [bp-1e], 008d
    jmp loc_1000_5dff

loc_1000_5dff:
    mov ax, [bp-1c]
    and ax, ax
    jnz loc_1000_5e09
    jmp loc_1000_5e11

loc_1000_5e09:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6

loc_1000_5e11:
    jmp loc_1000_65a0

loc_1000_5e14:
    cmp word ptr [bp+8], 47
    jz loc_1000_5e1d
    jmp loc_1000_5e7f

loc_1000_5e1d:
    mov ax, [bp+6]
    mov [bp-58], ax
    cmp word ptr [bp-58], 14
    jz loc_1000_5e2c
    jmp loc_1000_5e68

loc_1000_5e2c:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    add word ptr [0034], 14
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0047
    push ax
    nop
    push cs
    call sub_1000_3041
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6
    mov word ptr [bp-1e], 0104
    jmp loc_1000_5e7c

loc_1000_5e68:
    cmp word ptr [bp-58], 0095
    jnz loc_1000_5e77
    mov word ptr [bp-1e], 0117
    jmp loc_1000_5e7c

loc_1000_5e77:
    mov word ptr [bp-1e], 0119

loc_1000_5e7c:
    jmp loc_1000_65a0

loc_1000_5e7f:
    cmp word ptr [bp+8], 0085
    jz loc_1000_5e89
    jmp loc_1000_5ec9

loc_1000_5e89:
    cmp word ptr [bp+6], 0083
    jz loc_1000_5e93
    jmp loc_1000_5ec9

loc_1000_5e93:
    add word ptr [0034], 2d
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0085
    push ax
    nop
    push cs
    call sub_1000_3041
    push word ptr [0032]
    mov ax, 0083
    push ax
    nop
    push cs
    call sub_1000_3041
    push word ptr [0032]
    mov ax, 004f
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov word ptr [bp-1e], 0102
    jmp loc_1000_65a0

loc_1000_5ec9:
    cmp word ptr [bp+8], 72
    jz loc_1000_5ed2
    jmp loc_1000_5f01

loc_1000_5ed2:
    cmp word ptr [bp+6], 02
    jz loc_1000_5edb
    jmp loc_1000_5f01

loc_1000_5edb:
    add word ptr [0034], 64
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
    mov word ptr [bp-1e], 00fb
    jmp loc_1000_65a0

loc_1000_5f01:
    cmp word ptr [bp+8], 0088
    jz loc_1000_5f0b
    jmp loc_1000_601a

loc_1000_5f0b:
    cmp word ptr [bp+6], 00a0
    jz loc_1000_5f15
    jmp loc_1000_601a

loc_1000_5f15:
    add word ptr [0034], 14
    mov ax, 00ca
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-5a], ax
    mov ax, [bp-5a]
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
    mov [bp-5c], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-5c]
    push ax
    mov [bp-5e], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-5e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-5c]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 013e
    mov cx, es:[bx]
    mov [bp-60], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-60]
    push ax
    mov [bp-62], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-62]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 013e
    mov ax, [bp-60]
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
    add bx, 06
    add bx, 08
    mov ax, [bp-64]
    mov es:[bx], ax
    xor ax, ax
    push ax
    mov ax, 0088
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-1e], 00fc
    jmp loc_1000_65a0

loc_1000_601a:
    cmp word ptr [bp+8], 16
    jz loc_1000_6023
    jmp loc_1000_610a

loc_1000_6023:
    cmp word ptr [bp+6], 6d
    jz loc_1000_602c
    jmp loc_1000_610a

loc_1000_602c:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    add word ptr [0034], 32
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
    mov ax, 0139
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-68], ax
    mov ax, [bp-68]
    mov [bp-26], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00a8
    mov cx, es:[bx]
    mov [bp-6a], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-6a]
    push ax
    mov [bp-6c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 00e4
    mov bx, [bp-6c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00a8
    mov ax, [bp-6a]
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
    add bx, 00
    add bx, 08
    mov ax, [bp-6e]
    mov es:[bx], ax
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0016
    push ax
    nop
    push cs
    call sub_1000_3041
    mov word ptr [bp-1e], 0078
    jmp loc_1000_65a0

loc_1000_610a:
    cmp word ptr [bp+8], 6e
    jz loc_1000_6113
    jmp loc_1000_6158

loc_1000_6113:
    cmp word ptr [bp+6], 15
    jz loc_1000_611c
    jmp loc_1000_6158

loc_1000_611c:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    add word ptr [0034], 19
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 006e
    push ax
    nop
    push cs
    call sub_1000_3041
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
    mov word ptr [bp-1e], 00fc
    jmp loc_1000_65a0

loc_1000_6158:
    cmp word ptr [bp+8], 1d
    jz loc_1000_6161
    jmp loc_1000_61b6

loc_1000_6161:
    cmp word ptr [bp+6], 76
    jz loc_1000_616a
    jmp loc_1000_61b6

loc_1000_616a:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    add word ptr [0034], 14
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov ax, 000a
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 001d
    push ax
    nop
    push cs
    call sub_1000_3041
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6
    mov word ptr [bp-1e], 00f7
    jmp loc_1000_65a0

loc_1000_61b6:
    cmp word ptr [bp+8], 11
    jz loc_1000_61bf
    jmp loc_1000_63ed

loc_1000_61bf:
    cmp word ptr [bp+6], 10
    jz loc_1000_61c8
    jmp loc_1000_63ed

loc_1000_61c8:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov ax, 000a
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-72], ax
    mov ax, [bp-72]
    and ax, ax
    jnz loc_1000_61ed
    jmp loc_1000_63ea

loc_1000_61ed:
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_61f7
    jmp loc_1000_620c

loc_1000_61f7:
    add word ptr [0034], 14
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_620c:
    mov ax, 000a
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov ax, 0001
    push ax
    push word ptr [0044]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-74], ax
    mov ax, [bp-74]
    and ax, ax
    jnz loc_1000_6239
    jmp loc_1000_63dd

loc_1000_6239:
    mov ax, 01af
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-76], ax
    mov ax, [bp-76]
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
    add bx, 04
    add bx, 08
    mov ax, [bp-78]
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
    mov [bp-7c], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-7c]
    push ax
    mov [bp-7e], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-7e]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 08
    mov ax, [bp-7c]
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
    mov [bp-80], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-80]
    push ax
    mov [bp-82], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-82]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-80]
    mov es:[bx], ax
    mov ax, 01b0
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-84], ax
    mov ax, [bp-84]
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
    mov [bp-86], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-86]
    push ax
    mov [bp-88], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 0112
    mov bx, [bp-88]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-86]
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
    mov [bp-8a], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-8a]
    push ax
    mov [bp-8c], bx
    call sub_1bd7_8ade
    add sp, 04
    mov si, 0112
    mov bx, [bp-8c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 06
    add bx, 08
    mov ax, [bp-8a]
    mov es:[bx], ax

loc_1000_63dd:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_33e6
    mov word ptr [bp-1e], 0105

loc_1000_63ea:
    jmp loc_1000_65a0

loc_1000_63ed:
    cmp word ptr [bp+8], 20
    jz loc_1000_63f6
    jmp loc_1000_6430

loc_1000_63f6:
    cmp word ptr [bp+6], 39
    jz loc_1000_63ff
    jmp loc_1000_6430

loc_1000_63ff:
    add word ptr [0034], 0320
    mov word ptr [bp-1e], 00f8
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0020
    push ax
    nop
    push cs
    call sub_1000_3041
    mov ax, 0192
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-8e], ax
    mov ax, [bp-8e]
    mov [bp-26], ax
    jmp loc_1000_65a0

loc_1000_6430:
    cmp word ptr [bp+8], 009b
    jz loc_1000_643a
    jmp loc_1000_645f

loc_1000_643a:
    cmp word ptr [bp+6], 39
    jz loc_1000_6443
    jmp loc_1000_645f

loc_1000_6443:
    add word ptr [0034], 64
    mov word ptr [bp-1e], 00ff
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0039
    push ax
    nop
    push cs
    call sub_1000_3041
    jmp loc_1000_65a0

loc_1000_645f:
    cmp word ptr [bp+8], 78
    jz loc_1000_6468
    jmp loc_1000_65a0

loc_1000_6468:
    cmp word ptr [bp+6], 0087
    jz loc_1000_6472
    jmp loc_1000_65a0

loc_1000_6472:
    push word ptr [bp+6]
    nop
    push cs
    call sub_1000_333c
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_6484
    jmp loc_1000_64a2

loc_1000_6484:
    add word ptr [0034], 0320
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

loc_1000_64a2:
    mov ax, 0192
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-90], ax
    mov ax, [bp-90]
    mov [bp-26], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00de
    mov cx, es:[bx]
    mov [bp-92], cx
    mov bx, ax
    mov ax, 000a
    push ax
    lea ax, [bp-92]
    push ax
    mov [bp-94], bx
    call sub_1bd7_8ab8
    add sp, 04
    mov si, 00e4
    mov bx, [bp-94]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00de
    mov ax, [bp-92]
    mov es:[bx], ax
    mov ax, 014a
    imul word ptr [bp-26]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00de
    mov cx, es:[bx]
    mov [bp-96], cx
    mov bx, ax
    mov ax, 0009
    push ax
    lea ax, [bp-96]
    push ax
    mov [bp-98], bx
    call sub_1bd7_8ab8
    add sp, 04
    mov si, 00e4
    mov bx, [bp-98]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00de
    mov ax, [bp-96]
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
    mov [bp-9a], cx
    mov bx, ax
    mov ax, 000f
    push ax
    lea ax, [bp-9a]
    push ax
    mov [bp-9c], bx
    call sub_1bd7_8ab8
    add sp, 04
    mov si, 0112
    mov bx, [bp-9c]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 02
    add bx, 08
    mov ax, [bp-9a]
    mov es:[bx], ax
    mov word ptr [bp-1e], 00fd

loc_1000_65a0:
    mov ax, [bp-16]
    not ax
    and ax, ax
    jnz loc_1000_65ac
    jmp loc_1000_65c3

loc_1000_65ac:
    cmp word ptr [bp-1e], 00
    jnz loc_1000_65b7
    mov word ptr [bp-1e], 004f

loc_1000_65b7:
    push word ptr [bp-1e]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d

loc_1000_65c3:
    pop si
    mov sp, bp
    pop bp
    retf 0004
