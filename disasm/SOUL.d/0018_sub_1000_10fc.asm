; ========================================
; New Subroutine: sub_1000_10fc
; ========================================
sub_1000_10fc:
    push bp
    mov bp, sp
    sub sp, 004c
    push si
    mov cx, 001d
    lea di, [bp-4c]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov word ptr [bp-18], 0000
    mov word ptr [bp-1a], ffff
    mov ax, 0014
    imul word ptr [0032]
    mov bx, ax
    mov si, 0112
    add bx, [si+a]
    mov es, [si+2]
    add bx, 04
    mov ax, es:[bx]
    mov [bp-14], ax
    cmp word ptr [bp-14], 01
    jz loc_1000_113f
    jmp loc_1000_1301

loc_1000_113f:
    mov ax, [bp+6]
    mov [bp-16], ax
    cmp word ptr [bp-16], 4d
    jnz loc_1000_1153
    mov word ptr [bp-18], 0070
    jmp loc_1000_12fe

loc_1000_1153:
    cmp word ptr [bp-16], 7e
    jnz loc_1000_1161
    mov word ptr [bp-18], 0074
    jmp loc_1000_12fe

loc_1000_1161:
    cmp word ptr [bp-16], 008f
    jnz loc_1000_1175
    mov word ptr [bp-18], 0077
    mov word ptr [bp-1a], 0005
    jmp loc_1000_12fe

loc_1000_1175:
    cmp word ptr [bp-16], 0098
    jnz loc_1000_1184
    mov word ptr [bp-18], 0079
    jmp loc_1000_12fe

loc_1000_1184:
    cmp word ptr [bp-16], 009a
    jnz loc_1000_1193
    mov word ptr [bp-18], 007a
    jmp loc_1000_12fe

loc_1000_1193:
    cmp word ptr [bp-16], 009c
    jnz loc_1000_11a2
    mov word ptr [bp-18], 007b
    jmp loc_1000_12fe

loc_1000_11a2:
    cmp word ptr [bp-16], 009d
    jnz loc_1000_11b1
    mov word ptr [bp-18], 007c
    jmp loc_1000_12fe

loc_1000_11b1:
    cmp word ptr [bp-16], 18
    jz loc_1000_11ba
    jmp loc_1000_11cf

loc_1000_11ba:
    mov word ptr [bp-18], 0069
    push word ptr [0032]
    mov ax, 0097
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_12fe

loc_1000_11cf:
    cmp word ptr [bp-16], 28
    jnz loc_1000_11dd
    mov word ptr [bp-18], 006a
    jmp loc_1000_12fe

loc_1000_11dd:
    cmp word ptr [bp-16], 29
    jz loc_1000_11e6
    jmp loc_1000_1217

loc_1000_11e6:
    mov word ptr [bp-18], 006b
    push word ptr [0032]
    mov ax, 000c
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_1202
    jmp loc_1000_1214

loc_1000_1202:
    push word ptr [0032]
    mov ax, 0017
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov word ptr [bp-1a], 0000

loc_1000_1214:
    jmp loc_1000_12fe

loc_1000_1217:
    cmp word ptr [bp-16], 31
    jnz loc_1000_1225
    mov word ptr [bp-18], 006c
    jmp loc_1000_12fe

loc_1000_1225:
    cmp word ptr [bp-16], 30
    jnz loc_1000_1233
    mov word ptr [bp-18], 006d
    jmp loc_1000_12fe

loc_1000_1233:
    cmp word ptr [bp-16], 07
    jnz loc_1000_1241
    mov word ptr [bp-18], 0065
    jmp loc_1000_12fe

loc_1000_1241:
    cmp word ptr [bp-16], 48
    jnz loc_1000_124f
    mov word ptr [bp-18], 006e
    jmp loc_1000_12fe

loc_1000_124f:
    cmp word ptr [bp-16], 4a
    jnz loc_1000_125d
    mov word ptr [bp-18], 006f
    jmp loc_1000_12fe

loc_1000_125d:
    cmp word ptr [bp-16], 00a1
    jnz loc_1000_126c
    mov word ptr [bp-18], 007d
    jmp loc_1000_12fe

loc_1000_126c:
    cmp word ptr [bp-16], 5e
    jnz loc_1000_127f
    mov word ptr [bp-18], 0071
    mov word ptr [bp-1a], 0005
    jmp loc_1000_12fe

loc_1000_127f:
    cmp word ptr [bp-16], 62
    jnz loc_1000_128d
    mov word ptr [bp-18], 0072
    jmp loc_1000_12fe

loc_1000_128d:
    cmp word ptr [bp-16], 0c
    jnz loc_1000_129b
    mov word ptr [bp-18], 0066
    jmp loc_1000_12fe

loc_1000_129b:
    cmp word ptr [bp-16], 17
    jz loc_1000_12a4
    jmp loc_1000_12d0

loc_1000_12a4:
    mov word ptr [bp-18], 0067
    mov ax, 0009
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-1c], ax
    mov ax, [bp-1c]
    and ax, ax
    jz loc_1000_12cd
    mov word ptr [bp-18], 0068
    mov word ptr [bp-1a], 0005

loc_1000_12cd:
    jmp loc_1000_12fe

loc_1000_12d0:
    cmp word ptr [bp-16], 0080
    jnz loc_1000_12df
    mov word ptr [bp-18], 0075
    jmp loc_1000_12fe

loc_1000_12df:
    cmp word ptr [bp-16], 0092
    jz loc_1000_12e9
    jmp loc_1000_12fe

loc_1000_12e9:
    mov word ptr [bp-18], 0076
    push word ptr [0032]
    mov ax, 005e
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_12fe

loc_1000_12fe:
    jmp loc_1000_1f89

loc_1000_1301:
    cmp word ptr [bp-14], 02
    jz loc_1000_130a
    jmp loc_1000_1766

loc_1000_130a:
    mov ax, [bp+6]
    mov [bp-1e], ax
    cmp word ptr [bp-1e], 0095
    jnz loc_1000_131f
    mov word ptr [bp-18], 00cb
    jmp loc_1000_1763

loc_1000_131f:
    cmp word ptr [bp-1e], 0b
    jz loc_1000_1328
    jmp loc_1000_134e

loc_1000_1328:
    mov word ptr [bp-18], 009f
    mov ax, [0144]
    not ax
    and ax, ax
    jnz loc_1000_1339
    jmp loc_1000_134b

loc_1000_1339:
    mov word ptr [bp-18], 00a0
    push word ptr [0032]
    mov ax, 0047
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_134b:
    jmp loc_1000_1763

loc_1000_134e:
    cmp word ptr [bp-1e], 47
    jnz loc_1000_135c
    mov word ptr [bp-18], 00b4
    jmp loc_1000_1763

loc_1000_135c:
    cmp word ptr [bp-1e], 46
    jz loc_1000_1365
    jmp loc_1000_13b8

loc_1000_1365:
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_136f
    jmp loc_1000_13b5

loc_1000_136f:
    mov word ptr [bp-18], 00b3
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c6
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-20], ax
    mov ax, [bp-20]
    not ax
    and ax, ax
    jnz loc_1000_13a8
    jmp loc_1000_13b5

loc_1000_13a8:
    push word ptr [0032]
    mov ax, 0064
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_13b5:
    jmp loc_1000_1763

loc_1000_13b8:
    cmp word ptr [bp-1e], 64
    jnz loc_1000_13cb
    mov word ptr [bp-18], 0030
    mov word ptr [bp-1a], 0005
    jmp loc_1000_1763

loc_1000_13cb:
    cmp word ptr [bp-1e], 1a
    jnz loc_1000_13d9
    mov word ptr [bp-18], 00a2
    jmp loc_1000_1763

loc_1000_13d9:
    cmp word ptr [bp-1e], 5b
    jnz loc_1000_13e7
    mov word ptr [bp-18], 00ba
    jmp loc_1000_1763

loc_1000_13e7:
    cmp word ptr [bp-1e], 37
    jnz loc_1000_13f5
    mov word ptr [bp-18], 00ae
    jmp loc_1000_1763

loc_1000_13f5:
    cmp word ptr [bp-1e], 1b
    jnz loc_1000_1403
    mov word ptr [bp-18], 00a3
    jmp loc_1000_1763

loc_1000_1403:
    cmp word ptr [bp-1e], 0090
    jz loc_1000_140d
    jmp loc_1000_1422

loc_1000_140d:
    mov word ptr [bp-18], 00ca
    push word ptr [0032]
    mov ax, 006c
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1763

loc_1000_1422:
    cmp word ptr [bp-1e], 6c
    jnz loc_1000_1430
    mov word ptr [bp-18], 0032
    jmp loc_1000_1763

loc_1000_1430:
    cmp word ptr [bp-1e], 32
    jnz loc_1000_143e
    mov word ptr [bp-18], 00a9
    jmp loc_1000_1763

loc_1000_143e:
    cmp word ptr [bp-1e], 61
    jnz loc_1000_144c
    mov word ptr [bp-18], 00bc
    jmp loc_1000_1763

loc_1000_144c:
    cmp word ptr [bp-1e], 20
    jz loc_1000_1455
    jmp loc_1000_1482

loc_1000_1455:
    mov ax, 0003
    push ax
    push word ptr [0042]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-22], ax
    mov ax, [bp-22]
    mov [bp-24], ax
    and ax, ax
    jz loc_1000_147a
    mov word ptr [bp-18], 0112
    jmp loc_1000_147f

loc_1000_147a:
    mov word ptr [bp-18], 00a6

loc_1000_147f:
    jmp loc_1000_1763

loc_1000_1482:
    cmp word ptr [bp-1e], 50
    jnz loc_1000_1490
    mov word ptr [bp-18], 00b8
    jmp loc_1000_1763

loc_1000_1490:
    cmp word ptr [bp-1e], 0d
    jnz loc_1000_149e
    mov word ptr [bp-18], 00a1
    jmp loc_1000_1763

loc_1000_149e:
    cmp word ptr [bp-1e], 40
    jnz loc_1000_14ac
    mov word ptr [bp-18], 00aa
    jmp loc_1000_1763

loc_1000_14ac:
    cmp word ptr [bp-1e], 1c
    jz loc_1000_14b5
    jmp loc_1000_14f1

loc_1000_14b5:
    mov word ptr [bp-18], 00a4
    mov ax, 0010
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00c0
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-26], ax
    mov ax, [bp-26]
    and ax, ax
    jz loc_1000_14ee
    mov word ptr [bp-18], 00cf

loc_1000_14ee:
    jmp loc_1000_1763

loc_1000_14f1:
    cmp word ptr [bp-1e], 63
    jnz loc_1000_14ff
    mov word ptr [bp-18], 00bd
    jmp loc_1000_1763

loc_1000_14ff:
    cmp word ptr [bp-1e], 00a0
    jnz loc_1000_150e
    mov word ptr [bp-18], 00ab
    jmp loc_1000_1763

loc_1000_150e:
    cmp word ptr [bp-1e], 08
    jnz loc_1000_151c
    mov word ptr [bp-18], 009d
    jmp loc_1000_1763

loc_1000_151c:
    cmp word ptr [bp-1e], 71
    jnz loc_1000_152a
    mov word ptr [bp-18], 00be
    jmp loc_1000_1763

loc_1000_152a:
    cmp word ptr [bp-1e], 0082
    jnz loc_1000_1539
    mov word ptr [bp-18], 00c3
    jmp loc_1000_1763

loc_1000_1539:
    cmp word ptr [bp-1e], 1f
    jnz loc_1000_1547
    mov word ptr [bp-18], 00a5
    jmp loc_1000_1763

loc_1000_1547:
    cmp word ptr [bp-1e], 7a
    jnz loc_1000_1555
    mov word ptr [bp-18], 00c2
    jmp loc_1000_1763

loc_1000_1555:
    cmp word ptr [bp-1e], 2f
    jnz loc_1000_1563
    mov word ptr [bp-18], 00a8
    jmp loc_1000_1763

loc_1000_1563:
    cmp word ptr [bp-1e], 49
    jnz loc_1000_1571
    mov word ptr [bp-18], 00b5
    jmp loc_1000_1763

loc_1000_1571:
    cmp word ptr [bp-1e], 00a2
    jnz loc_1000_1580
    mov word ptr [bp-18], 00ce
    jmp loc_1000_1763

loc_1000_1580:
    cmp word ptr [bp-1e], 3a
    jnz loc_1000_158e
    mov word ptr [bp-18], 00af
    jmp loc_1000_1763

loc_1000_158e:
    cmp word ptr [bp-1e], 04
    jnz loc_1000_159c
    mov word ptr [bp-18], 009c
    jmp loc_1000_1763

loc_1000_159c:
    cmp word ptr [bp-1e], 3b
    jnz loc_1000_15aa
    mov word ptr [bp-18], 002d
    jmp loc_1000_1763

loc_1000_15aa:
    cmp word ptr [bp-1e], 41
    jnz loc_1000_15b8
    mov word ptr [bp-18], 00b0
    jmp loc_1000_1763

loc_1000_15b8:
    cmp word ptr [bp-1e], 42
    jnz loc_1000_15c6
    mov word ptr [bp-18], 00b0
    jmp loc_1000_1763

loc_1000_15c6:
    cmp word ptr [bp-1e], 43
    jnz loc_1000_15d4
    mov word ptr [bp-18], 00b1
    jmp loc_1000_1763

loc_1000_15d4:
    cmp word ptr [bp-1e], 44
    jnz loc_1000_15e2
    mov word ptr [bp-18], 00b2
    jmp loc_1000_1763

loc_1000_15e2:
    cmp word ptr [bp-1e], 02
    jnz loc_1000_15f5
    mov word ptr [bp-18], 009b
    mov word ptr [bp-1a], 0005
    jmp loc_1000_1763

loc_1000_15f5:
    cmp word ptr [bp-1e], 3c
    jnz loc_1000_1603
    mov word ptr [bp-18], 002e
    jmp loc_1000_1763

loc_1000_1603:
    cmp word ptr [bp-1e], 5d
    jz loc_1000_160c
    jmp loc_1000_162f

loc_1000_160c:
    mov word ptr [bp-1a], 0005
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_161b
    jmp loc_1000_162c

loc_1000_161b:
    mov word ptr [bp-18], 00bb
    xor ax, ax
    push ax
    mov ax, 0072
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_162c:
    jmp loc_1000_1763

loc_1000_162f:
    cmp word ptr [bp-1e], 4c
    jnz loc_1000_163d
    mov word ptr [bp-18], 00b6
    jmp loc_1000_1763

loc_1000_163d:
    cmp word ptr [bp-1e], 7f
    jnz loc_1000_164b
    mov word ptr [bp-18], 0038
    jmp loc_1000_1763

loc_1000_164b:
    cmp word ptr [bp-1e], 0085
    jnz loc_1000_165a
    mov word ptr [bp-18], 00c5
    jmp loc_1000_1763

loc_1000_165a:
    cmp word ptr [bp-1e], 77
    jnz loc_1000_1668
    mov word ptr [bp-18], 00c1
    jmp loc_1000_1763

loc_1000_1668:
    cmp word ptr [bp-1e], 4f
    jnz loc_1000_1676
    mov word ptr [bp-18], 00b7
    jmp loc_1000_1763

loc_1000_1676:
    cmp word ptr [bp-1e], 0083
    jnz loc_1000_1685
    mov word ptr [bp-18], 00c4
    jmp loc_1000_1763

loc_1000_1685:
    cmp word ptr [bp-1e], 2a
    jz loc_1000_168e
    jmp loc_1000_16a8

loc_1000_168e:
    mov word ptr [bp-18], 00a7
    mov word ptr [bp-1a], 0005
    push word ptr [0032]
    mov ax, 0035
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1763

loc_1000_16a8:
    cmp word ptr [bp-1e], 35
    jz loc_1000_16b1
    jmp loc_1000_16ef

loc_1000_16b1:
    mov ax, 0009
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-28], ax
    mov ax, [bp-28]
    not ax
    and ax, ax
    jz loc_1000_16d5
    mov word ptr [bp-18], 00ac
    jmp loc_1000_16ec

loc_1000_16d5:
    mov word ptr [bp-1a], 0000
    mov word ptr [bp-18], 00ad
    push word ptr [0032]
    mov ax, 0052
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_16ec:
    jmp loc_1000_1763

loc_1000_16ef:
    cmp word ptr [bp-1e], 52
    jnz loc_1000_16fd
    mov word ptr [bp-18], 002f
    jmp loc_1000_1763

loc_1000_16fd:
    cmp word ptr [bp-1e], 51
    jnz loc_1000_170b
    mov word ptr [bp-18], 00b9
    jmp loc_1000_1763

loc_1000_170b:
    cmp word ptr [bp-1e], 09
    jz loc_1000_1714
    jmp loc_1000_1738

loc_1000_1714:
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_171e
    jmp loc_1000_1735

loc_1000_171e:
    mov word ptr [bp-18], 009e
    mov word ptr [bp-1a], 0005
    push word ptr [0032]
    mov ax, 0003
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_1735:
    jmp loc_1000_1763

loc_1000_1738:
    cmp word ptr [bp-1e], 74
    jnz loc_1000_1746
    mov word ptr [bp-18], 00c0
    jmp loc_1000_1763

loc_1000_1746:
    cmp word ptr [bp-1e], 008b
    jnz loc_1000_1755
    mov word ptr [bp-18], 00b9
    jmp loc_1000_1763

loc_1000_1755:
    cmp word ptr [bp-1e], 72
    jnz loc_1000_1763
    mov word ptr [bp-18], 00bf
    jmp loc_1000_1763

loc_1000_1763:
    jmp loc_1000_1f89

loc_1000_1766:
    cmp word ptr [bp-14], 03
    jz loc_1000_176f
    jmp loc_1000_1807

loc_1000_176f:
    mov ax, [bp+6]
    mov [bp-2a], ax
    cmp word ptr [bp-2a], 0f
    jnz loc_1000_1783
    mov word ptr [bp-18], 006a
    jmp loc_1000_1804

loc_1000_1783:
    cmp word ptr [bp-2a], 16
    jnz loc_1000_1791
    mov word ptr [bp-18], 006b
    jmp loc_1000_1804

loc_1000_1791:
    cmp word ptr [bp-2a], 36
    jnz loc_1000_179f
    mov word ptr [bp-18], 006c
    jmp loc_1000_1804

loc_1000_179f:
    cmp word ptr [bp-2a], 55
    jz loc_1000_17a8
    jmp loc_1000_17bd

loc_1000_17a8:
    mov word ptr [bp-18], 006e
    push word ptr [0032]
    mov ax, 006d
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1804

loc_1000_17bd:
    cmp word ptr [bp-2a], 6d
    jnz loc_1000_17cb
    mov word ptr [bp-18], 006f
    jmp loc_1000_1804

loc_1000_17cb:
    cmp word ptr [bp-2a], 56
    jnz loc_1000_17d9
    mov word ptr [bp-18], 006e
    jmp loc_1000_1804

loc_1000_17d9:
    cmp word ptr [bp-2a], 54
    jnz loc_1000_17e7
    mov word ptr [bp-18], 006d
    jmp loc_1000_1804

loc_1000_17e7:
    cmp word ptr [bp-2a], 6f
    jnz loc_1000_17f5
    mov word ptr [bp-18], 0031
    jmp loc_1000_1804

loc_1000_17f5:
    cmp word ptr [bp-2a], 00a5
    jnz loc_1000_1804
    mov word ptr [bp-18], 0070
    jmp loc_1000_1804

loc_1000_1804:
    jmp loc_1000_1f89

loc_1000_1807:
    cmp word ptr [bp-14], 04
    jz loc_1000_1810
    jmp loc_1000_1f89

loc_1000_1810:
    mov ax, [bp+6]
    mov [bp-2c], ax
    cmp word ptr [bp-2c], 70
    jnz loc_1000_1824
    mov word ptr [bp-18], 00c5
    jmp loc_1000_1f86

loc_1000_1824:
    cmp word ptr [bp-2c], 27
    jnz loc_1000_1832
    mov word ptr [bp-18], 00aa
    jmp loc_1000_1f86

loc_1000_1832:
    cmp word ptr [bp-2c], 01
    jz loc_1000_183b
    jmp loc_1000_1850

loc_1000_183b:
    mov word ptr [bp-18], 0096
    push word ptr [0032]
    mov ax, 0065
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1f86

loc_1000_1850:
    cmp word ptr [bp-2c], 65
    jnz loc_1000_1863
    mov word ptr [bp-18], 00c0
    mov word ptr [bp-1a], 0005
    jmp loc_1000_1f86

loc_1000_1863:
    cmp word ptr [bp-2c], 19
    jnz loc_1000_1876
    mov word ptr [bp-18], 00a1
    mov word ptr [bp-1a], 0005
    jmp loc_1000_1f86

loc_1000_1876:
    cmp word ptr [bp-2c], 6b
    jnz loc_1000_1884
    mov word ptr [bp-18], 00c4
    jmp loc_1000_1f86

loc_1000_1884:
    cmp word ptr [bp-2c], 5c
    jnz loc_1000_1892
    mov word ptr [bp-18], 00bc
    jmp loc_1000_1f86

loc_1000_1892:
    cmp word ptr [bp-2c], 25
    jnz loc_1000_18a0
    mov word ptr [bp-18], 00a8
    jmp loc_1000_1f86

loc_1000_18a0:
    cmp word ptr [bp-2c], 0093
    jnz loc_1000_18af
    mov word ptr [bp-18], 00d5
    jmp loc_1000_1f86

loc_1000_18af:
    cmp word ptr [bp-2c], 0081
    jnz loc_1000_18be
    mov word ptr [bp-18], 00cd
    jmp loc_1000_1f86

loc_1000_18be:
    cmp word ptr [bp-2c], 0089
    jz loc_1000_18c8
    jmp loc_1000_18dd

loc_1000_18c8:
    mov word ptr [bp-18], 00d1
    push word ptr [0032]
    mov ax, 000e
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1f86

loc_1000_18dd:
    cmp word ptr [bp-2c], 0e
    jnz loc_1000_18eb
    mov word ptr [bp-18], 009b
    jmp loc_1000_1f86

loc_1000_18eb:
    cmp word ptr [bp-2c], 10
    jnz loc_1000_18f9
    mov word ptr [bp-18], 009c
    jmp loc_1000_1f86

loc_1000_18f9:
    cmp word ptr [bp-2c], 38
    jnz loc_1000_1907
    mov word ptr [bp-18], 00b2
    jmp loc_1000_1f86

loc_1000_1907:
    cmp word ptr [bp-2c], 11
    jnz loc_1000_1915
    mov word ptr [bp-18], 009d
    jmp loc_1000_1f86

loc_1000_1915:
    cmp word ptr [bp-2c], 4b
    jnz loc_1000_1923
    mov word ptr [bp-18], 00b7
    jmp loc_1000_1f86

loc_1000_1923:
    cmp word ptr [bp-2c], 66
    jnz loc_1000_1931
    mov word ptr [bp-18], 00c1
    jmp loc_1000_1f86

loc_1000_1931:
    cmp word ptr [bp-2c], 67
    jnz loc_1000_193f
    mov word ptr [bp-18], 00c1
    jmp loc_1000_1f86

loc_1000_193f:
    cmp word ptr [bp-2c], 0091
    jz loc_1000_1949
    jmp loc_1000_196b

loc_1000_1949:
    mov word ptr [bp-18], 00d4
    push word ptr [0032]
    mov ax, 0021
    push ax
    nop
    push cs
    call sub_1000_2f74
    push word ptr [0032]
    mov ax, 002e
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1f86

loc_1000_196b:
    cmp word ptr [bp-2c], 21
    jnz loc_1000_1979
    mov word ptr [bp-18], 00a5
    jmp loc_1000_1f86

loc_1000_1979:
    cmp word ptr [bp-2c], 2e
    jz loc_1000_1982
    jmp loc_1000_1997

loc_1000_1982:
    mov word ptr [bp-18], 00af
    push word ptr [0032]
    mov ax, 003e
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1f86

loc_1000_1997:
    cmp word ptr [bp-2c], 3e
    jnz loc_1000_19aa
    mov word ptr [bp-18], 00b4
    mov word ptr [bp-1a], 0000
    jmp loc_1000_1f86

loc_1000_19aa:
    cmp word ptr [bp-2c], 73
    jnz loc_1000_19b8
    mov word ptr [bp-18], 00c6
    jmp loc_1000_1f86

loc_1000_19b8:
    cmp word ptr [bp-2c], 15
    jz loc_1000_19c1
    jmp loc_1000_19d8

loc_1000_19c1:
    mov ax, [0144]
    and ax, ax
    jz loc_1000_19d0
    mov word ptr [bp-18], 009f
    jmp loc_1000_19d5

loc_1000_19d0:
    mov word ptr [bp-18], 00a0

loc_1000_19d5:
    jmp loc_1000_1f86

loc_1000_19d8:
    cmp word ptr [bp-2c], 45
    jnz loc_1000_19eb
    mov word ptr [bp-18], 00b6
    mov word ptr [bp-1a], 0005
    jmp loc_1000_1f86

loc_1000_19eb:
    cmp word ptr [bp-2c], 7b
    jnz loc_1000_19f9
    mov word ptr [bp-18], 00cb
    jmp loc_1000_1f86

loc_1000_19f9:
    cmp word ptr [bp-2c], 06
    jnz loc_1000_1a07
    mov word ptr [bp-18], 0099
    jmp loc_1000_1f86

loc_1000_1a07:
    cmp word ptr [bp-2c], 53
    jnz loc_1000_1a15
    mov word ptr [bp-18], 00b9
    jmp loc_1000_1f86

loc_1000_1a15:
    cmp word ptr [bp-2c], 26
    jnz loc_1000_1a23
    mov word ptr [bp-18], 00a9
    jmp loc_1000_1f86

loc_1000_1a23:
    cmp word ptr [bp-2c], 69
    jnz loc_1000_1a31
    mov word ptr [bp-18], 00c3
    jmp loc_1000_1f86

loc_1000_1a31:
    cmp word ptr [bp-2c], 1e
    jz loc_1000_1a3a
    jmp loc_1000_1ae9

loc_1000_1a3a:
    mov word ptr [bp-18], 00a3
    mov ax, 000d
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00be
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-2e], ax
    mov ax, [bp-2e]
    not ax
    mov [bp-32], ax
    mov ax, 0009
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-30], ax
    mov ax, [bp-30]
    mov [bp-34], ax
    and ax, [bp-32]
    and ax, ax
    jnz loc_1000_1a92
    jmp loc_1000_1ae6

loc_1000_1a92:
    push word ptr [0032]
    mov ax, 0060
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00be
    mov cx, es:[bx]
    mov [bp-36], cx
    mov bx, ax
    mov ax, 000d
    push ax
    lea ax, [bp-36]
    push ax
    mov [bp-38], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-38]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 00be
    mov ax, [bp-36]
    mov es:[bx], ax

loc_1000_1ae6:
    jmp loc_1000_1f86

loc_1000_1ae9:
    cmp word ptr [bp-2c], 60
    jnz loc_1000_1af7
    mov word ptr [bp-18], 00bf
    jmp loc_1000_1f86

loc_1000_1af7:
    cmp word ptr [bp-2c], 0086
    jz loc_1000_1b01
    jmp loc_1000_1b16

loc_1000_1b01:
    mov word ptr [bp-18], 00cf
    push word ptr [0032]
    mov ax, 005f
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1f86

loc_1000_1b16:
    cmp word ptr [bp-2c], 5f
    jz loc_1000_1b1f
    jmp loc_1000_1b82

loc_1000_1b1f:
    mov ax, 0001
    push ax
    push word ptr [005e]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-3a], ax
    mov ax, [bp-3a]
    mov [bp-32], ax
    mov ax, 0003
    push ax
    push word ptr [005e]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-3c], ax
    mov ax, [bp-3c]
    not ax
    mov [bp-34], ax
    and ax, [bp-32]
    and ax, ax
    jnz loc_1000_1b5d
    jmp loc_1000_1b7a

loc_1000_1b5d:
    mov ax, 0002
    push ax
    mov ax, 005e
    push ax
    call sub_1bd7_8acb
    add sp, 04
    mov word ptr [bp-1a], 0032
    mov word ptr [bp-18], 00bd
    jmp loc_1000_1b7f

loc_1000_1b7a:
    mov word ptr [bp-18], 00be

loc_1000_1b7f:
    jmp loc_1000_1f86

loc_1000_1b82:
    cmp word ptr [bp-2c], 2b
    jz loc_1000_1b8b
    jmp loc_1000_1baf

loc_1000_1b8b:
    mov word ptr [bp-18], 00ab
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_1b9a
    jmp loc_1000_1bac

loc_1000_1b9a:
    mov word ptr [bp-1a], 0000
    push word ptr [0032]
    mov ax, 002d
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_1bac:
    jmp loc_1000_1f86

loc_1000_1baf:
    cmp word ptr [bp-2c], 2d
    jz loc_1000_1bb8
    jmp loc_1000_1bf7

loc_1000_1bb8:
    mov word ptr [bp-18], 00ad
    mov ax, 0009
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-3e], ax
    mov ax, [bp-3e]
    and ax, ax
    jnz loc_1000_1bda
    jmp loc_1000_1bf4

loc_1000_1bda:
    mov ax, 0009
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8ade
    add sp, 04
    mov word ptr [bp-18], 00ae
    mov word ptr [bp-1a], 0005

loc_1000_1bf4:
    jmp loc_1000_1f86

loc_1000_1bf7:
    cmp word ptr [bp-2c], 008c
    jnz loc_1000_1c06
    mov word ptr [bp-18], 00d3
    jmp loc_1000_1f86

loc_1000_1c06:
    cmp word ptr [bp-2c], 008d
    jnz loc_1000_1c15
    mov word ptr [bp-18], 00d3
    jmp loc_1000_1f86

loc_1000_1c15:
    cmp word ptr [bp-2c], 0084
    jnz loc_1000_1c24
    mov word ptr [bp-18], 00ce
    jmp loc_1000_1f86

loc_1000_1c24:
    cmp word ptr [bp-2c], 57
    jnz loc_1000_1c32
    mov word ptr [bp-18], 00ce
    jmp loc_1000_1f86

loc_1000_1c32:
    cmp word ptr [bp-2c], 58
    jnz loc_1000_1c40
    mov word ptr [bp-18], 00ba
    jmp loc_1000_1f86

loc_1000_1c40:
    cmp word ptr [bp-2c], 79
    jnz loc_1000_1c53
    mov word ptr [bp-18], 00ca
    mov word ptr [bp-1a], 0005
    jmp loc_1000_1f86

loc_1000_1c53:
    cmp word ptr [bp-2c], 33
    jz loc_1000_1c5c
    jmp loc_1000_1c71

loc_1000_1c5c:
    mov word ptr [bp-18], 00b0
    push word ptr [0032]
    mov ax, 0034
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1f86

loc_1000_1c71:
    cmp word ptr [bp-2c], 34
    jnz loc_1000_1c7f
    mov word ptr [bp-18], 00b1
    jmp loc_1000_1f86

loc_1000_1c7f:
    cmp word ptr [bp-2c], 7c
    jz loc_1000_1c8e
    cmp word ptr [bp-2c], 12
    jz loc_1000_1c8e
    jmp loc_1000_1cbb

loc_1000_1c8e:
    mov word ptr [bp-18], 00cc
    mov ax, 01ab
    push ax
    nop
    push cs
    call sub_1000_34e1
    mov [bp-40], ax
    mov ax, [bp-40]
    cmp ax, [0032]
    jz loc_1000_1cab
    jmp loc_1000_1cb8

loc_1000_1cab:
    push word ptr [0032]
    mov ax, 0013
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_1cb8:
    jmp loc_1000_1f86

loc_1000_1cbb:
    cmp word ptr [bp-2c], 3f
    jz loc_1000_1cc4
    jmp loc_1000_1cd9

loc_1000_1cc4:
    mov word ptr [bp-18], 00b5
    push word ptr [0032]
    mov ax, 000a
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1f86

loc_1000_1cd9:
    cmp word ptr [bp-2c], 0a
    jz loc_1000_1ce2
    jmp loc_1000_1d06

loc_1000_1ce2:
    mov word ptr [bp-18], 009a
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_1cf1
    jmp loc_1000_1d03

loc_1000_1cf1:
    mov word ptr [bp-1a], 0000
    push word ptr [0032]
    mov ax, 0005
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_1d03:
    jmp loc_1000_1f86

loc_1000_1d06:
    cmp word ptr [bp-2c], 05
    jz loc_1000_1d0f
    jmp loc_1000_1d73

loc_1000_1d0f:
    mov word ptr [bp-18], 0098
    mov ax, 0009
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-42], ax
    mov ax, [bp-42]
    and ax, ax
    jnz loc_1000_1d31
    jmp loc_1000_1d70

loc_1000_1d31:
    mov ax, [0144]
    and ax, ax
    jnz loc_1000_1d3b
    jmp loc_1000_1d66

loc_1000_1d3b:
    mov word ptr [bp-1a], 0000
    cmp word ptr [0142], 02
    jz loc_1000_1d4a
    jmp loc_1000_1d59

loc_1000_1d4a:
    xor ax, ax
    push ax
    mov ax, 0068
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1d66

loc_1000_1d59:
    push word ptr [0032]
    mov ax, 0068
    push ax
    nop
    push cs
    call sub_1000_2f74

loc_1000_1d66:
    mov word ptr [bp-18], 0097
    mov word ptr [bp-1a], 0005

loc_1000_1d70:
    jmp loc_1000_1f86

loc_1000_1d73:
    cmp word ptr [bp-2c], 68
    jz loc_1000_1d7c
    jmp loc_1000_1da4

loc_1000_1d7c:
    mov word ptr [bp-18], 00c2
    mov word ptr [bp-1a], 0014
    mov ax, [0032]
    neg ax
    push ax
    mov ax, 0068
    push ax
    nop
    push cs
    call sub_1000_3041
    xor ax, ax
    push ax
    mov ax, 001d
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1f86

loc_1000_1da4:
    cmp word ptr [bp-2c], 1d
    jnz loc_1000_1db2
    mov word ptr [bp-18], 00a2
    jmp loc_1000_1f86

loc_1000_1db2:
    cmp word ptr [bp-2c], 76
    jz loc_1000_1dbb
    jmp loc_1000_1e6d

loc_1000_1dbb:
    mov word ptr [bp-18], 00c7
    mov ax, 000d
    push ax
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 38
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-44], ax
    mov ax, [bp-44]
    not ax
    mov [bp-32], ax
    mov ax, 0009
    push ax
    push word ptr [0140]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-46], ax
    mov ax, [bp-46]
    mov [bp-34], ax
    and ax, [bp-32]
    and ax, ax
    jnz loc_1000_1e12
    jmp loc_1000_1e6a

loc_1000_1e12:
    mov ax, 014a
    imul word ptr [0032]
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, 38
    mov cx, es:[bx]
    mov [bp-48], cx
    mov bx, ax
    mov ax, 000d
    push ax
    lea ax, [bp-48]
    push ax
    mov [bp-4a], bx
    call sub_1bd7_8acb
    add sp, 04
    mov si, 00e4
    mov bx, [bp-4a]
    add bx, [si+a]
    mov es, [si+2]
    add bx, 38
    mov ax, [bp-48]
    mov es:[bx], ax
    push word ptr [0032]
    mov ax, 0020
    push ax
    nop
    push cs
    call sub_1000_2f74
    mov word ptr [0042], 0000

loc_1000_1e6a:
    jmp loc_1000_1f86

loc_1000_1e6d:
    cmp word ptr [bp-2c], 20
    jnz loc_1000_1e7b
    mov word ptr [bp-18], 00a4
    jmp loc_1000_1f86

loc_1000_1e7b:
    cmp word ptr [bp-2c], 2c
    jz loc_1000_1e84
    jmp loc_1000_1e99

loc_1000_1e84:
    mov word ptr [bp-18], 00ac
    push word ptr [0032]
    mov ax, 0059
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1f86

loc_1000_1e99:
    cmp word ptr [bp-2c], 59
    jnz loc_1000_1eac
    mov word ptr [bp-18], 00bb
    mov word ptr [bp-1a], 0005
    jmp loc_1000_1f86

loc_1000_1eac:
    cmp word ptr [bp-2c], 13
    jnz loc_1000_1eba
    mov word ptr [bp-18], 009e
    jmp loc_1000_1f86

loc_1000_1eba:
    cmp word ptr [bp-2c], 39
    jnz loc_1000_1ec8
    mov word ptr [bp-18], 00b3
    jmp loc_1000_1f86

loc_1000_1ec8:
    cmp word ptr [bp-2c], 3d
    jz loc_1000_1ed1
    jmp loc_1000_1ee6

loc_1000_1ed1:
    mov word ptr [bp-18], 002e
    push word ptr [0032]
    mov ax, 009b
    push ax
    nop
    push cs
    call sub_1000_2f74
    jmp loc_1000_1f86

loc_1000_1ee6:
    cmp word ptr [bp-2c], 009b
    jnz loc_1000_1ef5
    mov word ptr [bp-18], 00d7
    jmp loc_1000_1f86

loc_1000_1ef5:
    cmp word ptr [bp-2c], 23
    jnz loc_1000_1f03
    mov word ptr [bp-18], 00a7
    jmp loc_1000_1f86

loc_1000_1f03:
    cmp word ptr [bp-2c], 4e
    jnz loc_1000_1f11
    mov word ptr [bp-18], 00b8
    jmp loc_1000_1f86

loc_1000_1f11:
    cmp word ptr [bp-2c], 00a4
    jnz loc_1000_1f20
    mov word ptr [bp-18], 00d9
    jmp loc_1000_1f86

loc_1000_1f20:
    cmp word ptr [bp-2c], 6a
    jnz loc_1000_1f2e
    mov word ptr [bp-18], 00c3
    jmp loc_1000_1f86

loc_1000_1f2e:
    cmp word ptr [bp-2c], 009e
    jnz loc_1000_1f3d
    mov word ptr [bp-18], 00d8
    jmp loc_1000_1f86

loc_1000_1f3d:
    cmp word ptr [bp-2c], 008a
    jnz loc_1000_1f4c
    mov word ptr [bp-18], 00d2
    jmp loc_1000_1f86

loc_1000_1f4c:
    cmp word ptr [bp-2c], 0087
    jnz loc_1000_1f5b
    mov word ptr [bp-18], 00d0
    jmp loc_1000_1f86

loc_1000_1f5b:
    cmp word ptr [bp-2c], 0099
    jnz loc_1000_1f6a
    mov word ptr [bp-18], 00d6
    jmp loc_1000_1f86

loc_1000_1f6a:
    cmp word ptr [bp-2c], 22
    jnz loc_1000_1f78
    mov word ptr [bp-18], 00a6
    jmp loc_1000_1f86

loc_1000_1f78:
    cmp word ptr [bp-2c], 78
    jnz loc_1000_1f86
    mov word ptr [bp-18], 00c9
    jmp loc_1000_1f86

loc_1000_1f86:
    jmp loc_1000_1f89

loc_1000_1f89:
    cmp word ptr [bp-1a], ff
    mov ax, 0000
    jle loc_1000_1f93
    dec ax

loc_1000_1f93:
    and ax, [0144]
    and ax, ax
    jnz loc_1000_1f9e
    jmp loc_1000_1fb5

loc_1000_1f9e:
    mov ax, [bp-1a]
    add [0034], ax
    mov ax, 000d
    push ax
    mov ax, 0140
    push ax
    call sub_1bd7_8acb
    add sp, 04

loc_1000_1fb5:
    mov ax, [bp-18]
    mov [bp-4c], ax
    mov ax, [bp-4c]
    pop si
    mov sp, bp
    pop bp
    retf 0002
