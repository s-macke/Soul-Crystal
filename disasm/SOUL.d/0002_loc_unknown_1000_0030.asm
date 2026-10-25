loc_unknown_1000_0030:
    mov ax, 0001
    push ax
    mov ax, 000a
    push ax
    mov ax, 000e
    push ax
    mov ax, 0101
    push ax
    mov ax, 0080
    push ax
    call sub_1bd7_14e6
    mov ax, 0001
    push ax
    mov ax, 0004
    push ax
    mov ax, 0008
    push ax
    mov ax, 0101
    push ax
    mov ax, 00b6
    push ax
    call sub_1bd7_14e6
    xor ax, ax
    push ax
    mov ax, 0067
    push ax
    mov ax, 014a
    push ax
    mov ax, 0101
    push ax
    mov ax, 00e4
    push ax
    call sub_1bd7_14e6
    xor ax, ax
    push ax
    mov ax, 0067
    push ax
    mov ax, 0014
    push ax
    mov ax, 0101
    push ax
    mov ax, 0112
    push ax
    call sub_1bd7_14e6
    xor ax, ax
    and ax, ax
    jz loc_1000_00a9
    mov ax, 0001
    push ax
    push word ptr [37ac]
    mov ax, 0002
    push ax
    call sub_1bd7_01be

loc_1000_00a9:
    mov word ptr [0062], ffff  ; data_7fc1_0062 word write
    mov word ptr [37ac], 0001  ; data_7fc1_37ac word write
    mov ax, ds
    push ax
    mov ax, 37ac
    push ax
    call sub_1bd7_d622
    add sp, 04
    mov ax, 0001
    push ax
    push word ptr [37ac]  ; data_7fc1_37ac word read
    nop
    push cs
    call sub_1000_0f0a
    call sub_1bd7_e8d4
    mov [37ae], ax  ; data_7fc1_37ae word write
    mov ax, 0002
    push ax
    push word ptr [37ae]  ; data_7fc1_37ae word read
    nop
    push cs
    call sub_1000_0f0a

loc_1000_00e6:
    call sub_1bd7_db3c
    mov [37b0], ax
    mov ax, 0003
    push ax
    push word ptr [37b0]
    nop
    push cs
    call sub_1000_0f0a
    nop
    push cs
    call sub_1000_2300
    mov word ptr [0068], 0000
    mov word ptr [0030], 0000

loc_1000_010c:
    cmp word ptr [373a], 00
    jz loc_1000_0116
    jmp loc_1000_01b6

loc_1000_0116:
    nop
    push cs
    call sub_1000_2bdc
    cmp word ptr [014a], 02
    jnz loc_1000_0125
    jmp loc_1000_01ad

loc_1000_0125:
    cmp word ptr [0068], 00
    jle loc_1000_013b
    mov ax, [0068]
    not ax
    sub ax, [0030]
    neg ax
    dec ax
    mov [0030], ax

loc_1000_013b:
    mov word ptr [37b2], ffff
    cmp word ptr [0146], 0a
    jz loc_1000_014b
    jmp loc_1000_01aa

loc_1000_014b:
    cmp word ptr [00b0], 00a3
    jz loc_1000_0156
    jmp loc_1000_01a4

loc_1000_0156:
    mov ax, [00ae]
    mov [37b4], ax
    cmp word ptr [37b4], 2e
    jz loc_1000_0166
    jmp loc_1000_0174

loc_1000_0166:
    mov word ptr [37b2], 0000
    nop
    push cs
    call sub_1000_0dcb
    jmp loc_1000_01a4

loc_1000_0174:
    cmp word ptr [37b4], 2b
    jz loc_1000_017e
    jmp loc_1000_018c

loc_1000_017e:
    mov word ptr [37b2], 0000
    nop
    push cs
    call sub_1000_0ade
    jmp loc_1000_01a4

loc_1000_018c:
    cmp word ptr [37b4], 32
    jz loc_1000_0196
    jmp loc_1000_01a4

loc_1000_0196:
    mov word ptr [37b2], 0000
    nop
    push cs
    call sub_1000_0c32
    jmp loc_1000_01a4

loc_1000_01a4:
    mov word ptr [0146], 0000

loc_1000_01aa:
    jmp loc_1000_01b3

loc_1000_01ad:
    mov word ptr [37b2], 0000

loc_1000_01b3:
    jmp loc_1000_01c2

loc_1000_01b6:
    mov word ptr [00ae], 001a
    mov word ptr [37b2], ffff

loc_1000_01c2:
    mov ax, [37b2]
    and ax, [00ae]
    mov [37b6], ax
    cmp word ptr [37b6], 00
    jnz loc_1000_01d6
    jmp loc_1000_07b7

loc_1000_01d6:
    cmp word ptr [37b6], 0f
    jz loc_1000_01e0
    jmp loc_1000_0204

loc_1000_01e0:
    mov ax, 0003
    push ax
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
    jmp loc_1000_07b7

loc_1000_0204:
    cmp word ptr [37b6], 10
    jz loc_1000_020e
    jmp loc_1000_0238

loc_1000_020e:
    mov word ptr [0038], ffff
    mov ax, 000d
    push ax
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
    jmp loc_1000_07b7

loc_1000_0238:
    cmp word ptr [37b6], 11
    jz loc_1000_0242
    jmp loc_1000_0266

loc_1000_0242:
    mov ax, 0004
    push ax
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
    jmp loc_1000_07b7

loc_1000_0266:
    cmp word ptr [37b6], 12
    jz loc_1000_0270
    jmp loc_1000_0278

loc_1000_0270:
    nop
    push cs
    call sub_1000_80c2
    jmp loc_1000_07b7

loc_1000_0278:
    cmp word ptr [37b6], 15
    jz loc_1000_0282
    jmp loc_1000_0316

loc_1000_0282:
    mov ax, 0006
    push ax
    xor ax, ax
    push ax
    call sub_1bd7_0905
    push ax
    mov ax, 37b8
    push ax
    call sub_1bd7_0696
    mov ax, 0001
    jmp loc_1000_02ef

loc_1000_029e:
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 0014
    imul word ptr [0032]
    mov dx, bx
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    add bx, 08
    mov ax, es:[bx]
    mov [37bc], ax
    and ax, 3fff
    cmp ax, [37bc]
    jnz loc_1000_02eb
    cmp word ptr [37bc], 00
    jz loc_1000_02eb
    mov ax, 37b8
    push ds
    push ax
    xor ax, ax
    push ax
    mov ax, 37f0
    push ax
    mov ax, 0001
    push ax
    push word ptr [37be]
    call sub_1bd7_02a2

loc_1000_02eb:
    mov ax, [37be]
    inc ax

loc_1000_02ef:
    mov [37be], ax
    cmp ax, 0006
    jle loc_1000_029e
    mov ax, 37b8
    push ax
    call sub_1bd7_0887
    push ax
    mov ax, 37b8
    push ax
    call sub_1bd7_0891
    push ax
    call sub_1bd7_9438
    add sp, 04
    jmp loc_1000_07b7

loc_1000_0316:
    cmp word ptr [37b6], 16
    jnz loc_1000_0345
    mov word ptr [3724], 0002
    mov ax, ds
    push ax
    mov ax, 3724
    push ax
    mov ax, ds
    push ax
    mov ax, 37ac
    push ax
    call sub_1bd7_c1ac
    add sp, 08
    mov [37c0], ax
    mov ax, [37c0]
    mov [37bc], ax
    jmp loc_1000_07b7

loc_1000_0345:
    cmp word ptr [37b6], 17
    jz loc_1000_034f
    jmp loc_1000_0385

loc_1000_034f:
    mov ax, 37c2
    push ax
    mov ax, 37c6
    push ax
    nop
    push cs
    call sub_1000_5108
    mov ax, 37c2
    push ax
    call sub_1bd7_08a2
    push ax
    mov ax, 37c2
    push ax
    call sub_1bd7_0887
    push ax
    mov ax, 37c2
    push ax
    call sub_1bd7_0891
    push ax
    call sub_1bd7_95c2
    add sp, 06
    jmp loc_1000_07b7

loc_1000_0385:
    cmp word ptr [37b6], 1b
    jz loc_1000_038f
    jmp loc_1000_03a9

loc_1000_038f:
    call sub_1bd7_deb4
    mov [37c8], ax
    cmp word ptr [37c8], 00
    jz loc_1000_03a1
    jmp loc_1000_03a6

loc_1000_03a1:
    nop
    push cs
    call sub_1000_2300

loc_1000_03a6:
    jmp loc_1000_07b7

loc_1000_03a9:
    cmp word ptr [37b6], 1c
    jz loc_1000_03b3
    jmp loc_1000_03bf

loc_1000_03b3:
    mov ax, ffff
    push ax
    nop
    push cs
    call sub_1000_1fca
    jmp loc_1000_07b7

loc_1000_03bf:
    cmp word ptr [37b6], 1e
    jz loc_1000_03c9
    jmp loc_1000_040f

loc_1000_03c9:
    call sub_1bd7_df08
    mov [37ca], ax
    mov ax, [37ca]
    mov [37bc], ax
    mov word ptr [0034], 0000
    mov [37cc], ax
    cmp word ptr [37cc], 00
    jz loc_1000_03ea
    jmp loc_1000_03f2

loc_1000_03ea:
    nop
    push cs
    call sub_1000_2300
    jmp loc_1000_040c

loc_1000_03f2:
    cmp word ptr [37cc], 01
    jz loc_1000_03fc
    jmp loc_1000_040c

loc_1000_03fc:
    mov ax, 0008
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1000_0f0a
    jmp loc_1000_00e6

loc_1000_040c:
    jmp loc_1000_07b7

loc_1000_040f:
    cmp word ptr [37b6], 20
    jz loc_1000_0419
    jmp loc_1000_046b

loc_1000_0419:
    mov ax, [0062]
    not ax
    mov [0062], ax
    mov ax, [0062]
    mov [37ce], ax
    cmp word ptr [37ce], ff
    jnz loc_1000_0437
    mov word ptr [37d0], 000a
    jmp loc_1000_0447

loc_1000_0437:
    cmp word ptr [37ce], 00
    jnz loc_1000_0447
    mov word ptr [37d0], 000b
    jmp loc_1000_0447

loc_1000_0447:
    push word ptr [37d0]
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
    jmp loc_1000_07b7

loc_1000_046b:
    cmp word ptr [37b6], 22
    jz loc_1000_0475
    jmp loc_1000_0480

loc_1000_0475:
    xor ax, ax
    push ax
    nop
    push cs
    call sub_1000_1fca
    jmp loc_1000_07b7

loc_1000_0480:
    cmp word ptr [37b6], 24
    jz loc_1000_048a
    jmp loc_1000_04b4

loc_1000_048a:
    mov word ptr [0038], 0000
    mov ax, 000c
    push ax
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
    jmp loc_1000_07b7

loc_1000_04b4:
    cmp word ptr [37b6], 25
    jz loc_1000_04be
    jmp loc_1000_04f2

loc_1000_04be:
    mov cx, 0003
    mov ax, [0030]
    cwd
    idiv cx
    add dx, 1e
    mov [37bc], dx
    push word ptr [37bc]
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
    jmp loc_1000_07b7

loc_1000_04f2:
    cmp word ptr [37b6], 27
    jz loc_1000_04fc
    jmp loc_1000_0508

loc_1000_04fc:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_943d
    jmp loc_1000_07b7

loc_1000_0508:
    cmp word ptr [37b6], 28
    jz loc_1000_0512
    jmp loc_1000_051e

loc_1000_0512:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_b724
    jmp loc_1000_07b7

loc_1000_051e:
    cmp word ptr [37b6], 29
    jz loc_1000_0528
    jmp loc_1000_0534

loc_1000_0528:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_ab57
    jmp loc_1000_07b7

loc_1000_0534:
    cmp word ptr [37b6], 2a
    jz loc_1000_053e
    jmp loc_1000_054a

loc_1000_053e:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_6703
    jmp loc_1000_07b7

loc_1000_054a:
    cmp word ptr [37b6], 2d
    jz loc_1000_0554
    jmp loc_1000_0560

loc_1000_0554:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_a3d9
    jmp loc_1000_07b7

loc_1000_0560:
    cmp word ptr [37b6], 2e
    jz loc_1000_056a
    jmp loc_1000_0576

loc_1000_056a:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_714d
    jmp loc_1000_07b7

loc_1000_0576:
    cmp word ptr [37b6], 30
    jz loc_1000_0580
    jmp loc_1000_058c

loc_1000_0580:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_ba88
    jmp loc_1000_07b7

loc_1000_058c:
    cmp word ptr [37b6], 31
    jz loc_1000_0596
    jmp loc_1000_05a2

loc_1000_0596:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_750d
    jmp loc_1000_07b7

loc_1000_05a2:
    cmp word ptr [37b6], 33
    jz loc_1000_05ac
    jmp loc_1000_05b8

loc_1000_05ac:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_9c4d
    jmp loc_1000_07b7

loc_1000_05b8:
    cmp word ptr [37b6], 34
    jz loc_1000_05c2
    jmp loc_1000_05d2

loc_1000_05c2:
    push word ptr [00b0]
    push word ptr [00b2]
    nop
    push cs
    call sub_1000_55b4
    jmp loc_1000_07b7

loc_1000_05d2:
    cmp word ptr [37b6], 35
    jz loc_1000_05dc
    jmp loc_1000_05ec

loc_1000_05dc:
    push word ptr [00b0]
    push word ptr [00b2]
    nop
    push cs
    call sub_1000_65cf
    jmp loc_1000_07b7

loc_1000_05ec:
    cmp word ptr [37b6], 36
    jz loc_1000_05f6
    jmp loc_1000_0606

loc_1000_05f6:
    push word ptr [00b0]
    push word ptr [00b2]
    nop
    push cs
    call sub_1000_7dfd
    jmp loc_1000_07b7

loc_1000_0606:
    cmp word ptr [37b6], 37
    jz loc_1000_0610
    jmp loc_1000_0620

loc_1000_0610:
    push word ptr [00b0]
    push word ptr [00b2]
    nop
    push cs
    call sub_1000_adc0
    jmp loc_1000_07b7

loc_1000_0620:
    cmp word ptr [37b6], 38
    jz loc_1000_062a
    jmp loc_1000_063a

loc_1000_062a:
    push word ptr [00b0]
    push word ptr [00b2]
    nop
    push cs
    call sub_1000_76d3
    jmp loc_1000_07b7

loc_1000_063a:
    cmp word ptr [37b6], 1d
    jz loc_1000_0644
    jmp loc_1000_066b

loc_1000_0644:
    mov ax, 0001
    push ax
    xor ax, ax
    push ax
    nop
    push cs
    call sub_1000_0a2d
    mov si, 0080
    mov bx, 000e
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00
    add bx, 04
    mov ax, [0034]
    mov es:[bx], ax
    jmp loc_1000_07b7

loc_1000_066b:
    cmp word ptr [37b6], 2f
    jz loc_1000_0675
    jmp loc_1000_0681

loc_1000_0675:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_872b
    jmp loc_1000_07b7

loc_1000_0681:
    cmp word ptr [37b6], 18
    jz loc_1000_068b
    jmp loc_1000_06a0

loc_1000_068b:
    nop
    push cs
    call sub_1000_50ce
    push word ptr [0070]
    push word ptr [0072]
    nop
    push cs
    call sub_1000_0a2d
    jmp loc_1000_07b7

loc_1000_06a0:
    cmp word ptr [37b6], 32
    jz loc_1000_06aa
    jmp loc_1000_06b6

loc_1000_06aa:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_8432
    jmp loc_1000_07b7

loc_1000_06b6:
    cmp word ptr [37b6], 2b
    jz loc_1000_06c0
    jmp loc_1000_06cc

loc_1000_06c0:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_7ca3
    jmp loc_1000_07b7

loc_1000_06cc:
    cmp word ptr [37b6], 19
    jz loc_1000_06d6
    jmp loc_1000_06e2

loc_1000_06d6:
    push word ptr [00ae]
    nop
    push cs
    call sub_1000_91b2
    jmp loc_1000_07b7

loc_1000_06e2:
    cmp word ptr [37b6], 21
    jz loc_1000_06ec
    jmp loc_1000_06f8

loc_1000_06ec:
    push word ptr [00ae]
    nop
    push cs
    call sub_1000_91b2
    jmp loc_1000_07b7

loc_1000_06f8:
    cmp word ptr [37b6], 14
    jz loc_1000_0702
    jmp loc_1000_070e

loc_1000_0702:
    push word ptr [00ae]
    nop
    push cs
    call sub_1000_91b2
    jmp loc_1000_07b7

loc_1000_070e:
    cmp word ptr [37b6], 26
    jz loc_1000_0718
    jmp loc_1000_0724

loc_1000_0718:
    push word ptr [00ae]
    nop
    push cs
    call sub_1000_91b2
    jmp loc_1000_07b7

loc_1000_0724:
    cmp word ptr [37b6], 23
    jz loc_1000_072e
    jmp loc_1000_073a

loc_1000_072e:
    push word ptr [00ae]
    nop
    push cs
    call sub_1000_91b2
    jmp loc_1000_07b7

loc_1000_073a:
    cmp word ptr [37b6], 13
    jz loc_1000_0744
    jmp loc_1000_0750

loc_1000_0744:
    push word ptr [00ae]
    nop
    push cs
    call sub_1000_91b2
    jmp loc_1000_07b7

loc_1000_0750:
    cmp word ptr [37b6], 2c
    jz loc_1000_075a
    jmp loc_1000_0766

loc_1000_075a:
    push word ptr [00b0]
    nop
    push cs
    call sub_1000_8229
    jmp loc_1000_07b7

loc_1000_0766:
    cmp word ptr [37b6], 1a
    jz loc_1000_0770
    jmp loc_1000_07b7

loc_1000_0770:
    cmp word ptr [373a], 01
    jnz loc_1000_077a
    jmp loc_1000_07a4

loc_1000_077a:
    call sub_1bd7_df72
    mov [37d2], ax
    cmp word ptr [37d2], 00
    jz loc_1000_078c
    jmp loc_1000_079c

loc_1000_078c:
    mov ax, 0008
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1000_0f0a
    jmp loc_1000_00e6

loc_1000_079c:
    nop
    push cs
    call sub_1000_2300
    jmp loc_1000_07b4

loc_1000_07a4:
    mov ax, 0008
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1000_0f0a
    jmp loc_1000_00e6

loc_1000_07b4:
    jmp loc_1000_07b7

loc_1000_07b7:
    cmp word ptr [014a], 02
    jnz loc_1000_07d3
    push word ptr [372e]
    call sub_1bd7_bfa2
    add sp, 02
    mov [37d4], ax
    mov ax, [37d4]
    mov [3730], ax

loc_1000_07d3:
    cmp word ptr [3732], 00
    jg loc_1000_07dd
    jmp loc_1000_08c8

loc_1000_07dd:
    cmp word ptr [37d6], 00
    jnz loc_1000_07ea
    mov ax, [0032]
    mov [37d6], ax

loc_1000_07ea:
    mov cx, 0010
    mov ax, [0030]
    cwd
    idiv cx
    inc dx
    mov [37bc], dx
    push word ptr [37bc]
    push word ptr [3730]
    call sub_1bd7_8af3
    add sp, 04
    mov [37d8], ax
    mov ax, [37d8]
    mov [372a], ax
    mov word ptr [014a], 0000
    and ax, ax
    jnz loc_1000_081e
    jmp loc_1000_08c8

loc_1000_081e:
    mov ax, [37d6]
    mov [0032], ax
    nop
    push cs
    call sub_1000_28ff
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    push word ptr es:[bx]
    mov bx, ax
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    push word ptr es:[bx]
    nop
    push cs
    call sub_1000_0a2d
    cmp word ptr [3736], 00
    jg loc_1000_085b
    jmp loc_1000_087c

loc_1000_085b:
    push word ptr [3736]
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

loc_1000_087c:
    push word ptr [3732]
    push word ptr [372e]
    nop
    push cs
    call sub_1000_0a2d
    mov word ptr [372c], 0000
    mov word ptr [3732], 0000
    mov word ptr [3734], 0000
    mov word ptr [3736], 0000
    mov word ptr [373a], 0000
    mov word ptr [37d6], 0000
    cmp word ptr [372e], 04
    jz loc_1000_08b7
    jmp loc_1000_08c2

loc_1000_08b7:
    mov word ptr [373a], 0001
    nop
    push cs
    call sub_1000_549d

loc_1000_08c2:
    mov word ptr [372e], 0000

loc_1000_08c8:
    mov ax, 13c4
    push ax
    push word ptr [0032]
    call sub_1bd7_8b53
    add sp, 04
    mov [37da], ax
    push word ptr [37da]
    xor ax, ax
    push ax
    call sub_1bd7_8b65
    add sp, 04
    mov [37dc], ax
    mov ax, [37dc]
    mov [0032], ax
    jmp loc_1000_010c
