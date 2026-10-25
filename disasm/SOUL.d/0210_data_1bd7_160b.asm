data_1bd7_160b:
    db 00, b3, 02, b8, b3, 03, b8, b3, 04, b8  ; |..........|

loc_1bd7_1615:
    mov bl, 05
    mov ax, 06b3
    mov ax, 07b3
    mov ax, 09b3
    mov ax, 0ab3
    mov ax, 0bb3
    mov ax, 0db3
    mov ax, 0eb3
    mov ax, 10b3
    mov ax, 13b3
    mov ax, 18b3
    mov ax, 19b3
    mov ax, 1bb3
    mov ax, 28b3
    mov ax, 32b3
    mov ax, 34b3
    mov ax, 35b3
    mov ax, 36b3
    mov ax, 37b3
    mov ax, 38b3
    mov ax, 39b3
    mov ax, 3ab3
    mov ax, 3bb3
    mov ax, 3db3
    mov ax, 3eb3
    mov ax, 3fb3
    mov ax, 40b3
    mov ax, 43b3
    mov ax, 44b3
    mov ax, 45b3
    mov ax, 46b3
    mov ax, 47b3
    mov ax, 48b3
    mov ax, 49b3
    mov ax, 4ab3
    mov ax, 4bb3
    mov ax, 4cb3
    mov ax, 50b3
    jmp loc_1bd7_16b9

loc_1bd7_1688:
    mov bx, 9000
    jmp loc_1bd7_16bb

loc_1bd7_168d:
    mov bx, 9007
    jmp loc_1bd7_16bb

data_1bd7_1692:
    db bb, 00, 94, eb, 24  ; |....$|

loc_1bd7_1697:
    mov bx, 9801
    jmp loc_1bd7_16bb

loc_1bd7_169c:
    mov bx, 9803
    jmp loc_1bd7_16bb

loc_1bd7_16a1:
    mov bx, 9804
    jmp loc_1bd7_16bb

loc_1bd7_16a6:
    jmp loc_1bd7_161b

data_1bd7_16a9:
    db 55, 8b, ec, eb, d6, 55, 8b, ec, e9, 61, ff, 55, 8b, ec, eb, bf  ; |U....U...a.U....|

loc_1bd7_16b9:
    xor bh, bh

loc_1bd7_16bb:
    cld
    sti
    add byte ptr [6839], 02
    jz loc_1bd7_16e4
    mov byte ptr [6770], ff
    mov cx, [5774]
    jcxz loc_1bd7_16d1
    jmp cx

loc_1bd7_16d1:
    mov [6860], bx
    mov cx, bp
    cmp cx, [6847]
    jnz loc_1bd7_16e6

loc_1bd7_16dd:
    push bp
    mov bp, sp
    mov bx, bp
    jmp loc_1bd7_16f2

loc_1bd7_16e4:
    jmp loc_1bd7_1740

loc_1bd7_16e6:
    mov bx, cx
    jcxz loc_1bd7_16dd
    mov cx, [bx]
    cmp cx, [6847]
    jnz loc_1bd7_16e6

loc_1bd7_16f2:
    push bx
    push bx
    call sub_1bd7_0f72
    call sub_1bd7_0f72
    call sub_1bd7_1dee
    call sub_1bd7_0f72
    call sub_1bd7_04ca
    nop
    push cs
    call sub_1bd7_6d30
    mov byte ptr [5772], 00
    pop bx
    cmp byte ptr [6861], 98
    jz loc_1bd7_172b
    add byte ptr [6839], 04
    jz loc_1bd7_172b
    mov byte ptr [5773], 00
    call sub_1bd7_0f72
    mov al, [5773]
    call far, [6816]

loc_1bd7_172b:
    cmp word ptr [6860], 9006
    jz loc_1bd7_1738
    mov byte ptr [663a], ff

loc_1bd7_1738:
    call sub_1bd7_3e01
    ret

data_1bd7_173c:
    db 8b, 1e, 60, 68  ; |..`h|

loc_1bd7_1740:
    cmp bx, 9a00
    jae loc_1bd7_174d
    xchg ax, bx
    call sub_1bd7_1767
    call sub_1bd7_0f01

loc_1bd7_174d:
    push bx
    mov ax, 9aff
    call sub_1bd7_1767
    pop ax
    call sub_1bd7_1767
    mov ax, 00ff
    push ax
    push ax
    push ax
    mov bx, 1bd7
    push bx
    push word ptr [6780]
    retf
