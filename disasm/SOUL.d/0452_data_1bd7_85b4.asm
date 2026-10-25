data_1bd7_85b4:
    db 55, 8b, ec, 83, ec, 04, 32, ff  ; |U.....2.|

loc_1bd7_85bc:
    mov [bp-2], bh
    mov ax, [bp+a]
    mov cx, ax
    mov byte ptr [bp-4], 00
    test ax, 8000
    jnz loc_1bd7_85dd
    test ax, 4000
    jnz loc_1bd7_85d9
    add byte ptr [6db3], 80
    jnz loc_1bd7_85dd

loc_1bd7_85d9:
    mov byte ptr [bp-4], 80

loc_1bd7_85dd:
    push ds
    lds dx, [bp+6]
    and al, 03
    or al, bh
    mov ah, 3d
    int 21
    pop ds
    jae loc_1bd7_85fe
    cmp ax, 0002
    jnz loc_1bd7_85fa
    add cx, 0100
    jz loc_1bd7_85fa
    jmp loc_1bd7_869f

loc_1bd7_85fa:
    stc
    jmp loc_1bd7_7735

loc_1bd7_85fe:
    xchg ax, bx
    mov ax, cx
    and ax, 0500
    cmp ax, 0500
    jnz loc_1bd7_8612
    mov ah, 3e
    int 21
    mov ax, 1100
    jmp loc_1bd7_85fa

loc_1bd7_8612:
    mov byte ptr [bp-3], 01
    mov ax, 4400
    int 21
    add dl, 80
    jz loc_1bd7_8624
    or byte ptr [bp-4], 40

loc_1bd7_8624:
    add byte ptr [bp-4], 40
    jz loc_1bd7_862d
    jmp loc_1bd7_870c

loc_1bd7_862d:
    mov ax, [bp+a]
    test ax, 0200
    jz loc_1bd7_8653
    test ax, 0003
    jz loc_1bd7_8643
    xor cx, cx
    mov ah, 40
    int 21
    jmp loc_1bd7_870c

loc_1bd7_8643:
    mov ah, 3e
    int 21
    push ds
    lds dx, [bp+6]
    mov ax, 4300
    int 21
    pop ds
    jmp loc_1bd7_86bc

loc_1bd7_8653:
    add byte ptr [bp-4], 80
    jnz loc_1bd7_865c
    jmp loc_1bd7_870c

loc_1bd7_865c:
    test ax, 0002
    jnz loc_1bd7_8664
    jmp loc_1bd7_870c

loc_1bd7_8664:
    mov cx, ffff
    mov dx, cx
    mov ax, 4202
    int 21
    neg cx
    push ds
    push ss
    pop ds
    lea dx, [bp-1]
    mov ah, 3f
    int 21
    pop ds
    or ax, ax
    jz loc_1bd7_8694
    cmp byte ptr [bp-1], 1a
    jnz loc_1bd7_8694
    neg cx
    mov dx, cx
    mov ax, 4202
    int 21
    xor cx, cx
    mov ah, 40
    int 21

loc_1bd7_8694:
    xor cx, cx
    mov dx, cx
    mov ax, 4200
    int 21
    jmp loc_1bd7_870c

loc_1bd7_869f:
    mov byte ptr [bp-3], 00
    mov cx, [bp+c]
    call sub_1bd7_8755
    mov [bp+c], cx
    add byte ptr [bp-2], ff
    jnz loc_1bd7_86b9
    add word ptr [bp+a], 0002
    jnz loc_1bd7_86bc

loc_1bd7_86b9:
    and cl, fe

loc_1bd7_86bc:
    push ds
    lds dx, [bp+6]
    mov ah, 3c
    int 21
    pop ds
    jae loc_1bd7_86ca

loc_1bd7_86c7:
    jmp loc_1bd7_7735

loc_1bd7_86ca:
    xchg ax, bx
    add byte ptr [bp-2], ff
    jnz loc_1bd7_86d8
    add word ptr [bp+a], 0002
    jnz loc_1bd7_870c

loc_1bd7_86d8:
    mov ah, 3e
    int 21
    mov al, [bp+a]
    and al, 03
    or al, [bp-2]
    push ds
    lds dx, [bp+6]
    mov ah, 3d
    int 21
    pop ds
    jb loc_1bd7_86c7
    xchg ax, bx
    add byte ptr [bp-3], 01
    jnz loc_1bd7_870c
    add word ptr [bp+c], 0001
    jz loc_1bd7_870c
    or cl, 01
    push ds
    lds dx, [bp+6]
    mov ax, 4301
    int 21
    pop ds
    jb loc_1bd7_86c7

loc_1bd7_870c:
    add byte ptr [bp-4], 40
    jnz loc_1bd7_8751
    push ds
    lds dx, [bp+6]
    mov ax, 4300
    int 21
    pop ds
    mov ax, cx
    xor cl, cl
    and ax, 0001
    jz loc_1bd7_8727
    mov cl, 10

loc_1bd7_8727:
    add word ptr [bp+a], 0008
    jz loc_1bd7_8731
    or cl, 20

loc_1bd7_8731:
    cmp bx, [67dd]  ; data_7fc1_67dd word read
    jb loc_1bd7_8741
    mov ah, 3e
    int 21
    mov ax, 1800
    jmp loc_1bd7_85fa

loc_1bd7_8741:
    or cl, [bp-4]
    or cl, 01
    mov [bx+67df], cl
    mov ax, bx
    mov sp, bp
    pop bp
    retf

loc_1bd7_8751:
    xor cl, cl
    jmp loc_1bd7_8731
