data_1bd7_87e7:
    db 90, 90, 00  ; |...|

loc_1bd7_87ea:
    push bp
    mov bp, sp
    push si
    les si, [bp+6]
    mov cx, es
    jcxz loc_1bd7_87fa
    or byte ptr es:[si-2], 01

loc_1bd7_87fa:
    pop si
    pop bp
    retf

loc_1bd7_87fd:
    push bp
    mov bp, sp
    push si
    push di
    mov cx, [bp+6]
    cmp cx, e8
    ja loc_1bd7_8873
    push ds
    mov ax, [679a]  ; data_7fc1_679a word read
    or ax, ax
    jz loc_1bd7_885a
    mov di, 887a

loc_1bd7_8815:
    mov si, [67a2]
    lds bx, [679c]

loc_1bd7_881d:
    push ds

loc_1bd7_881e:
    push si
    push di
    call di
    pop di
    pop si
    jae loc_1bd7_8851
    mov dx, ds
    lds bx, [bx+c]
    cmp dx, si
    jnz loc_1bd7_881e
    pop ax
    pop ds
    push ds
    les si, [679c]
    mov si, es:[si+12]
    lds bx, [6798]
    mov dx, ds
    cmp dx, ax
    jnz loc_1bd7_881d
    pop ds
    push ds
    cmp di, 88f6
    jz loc_1bd7_885a
    mov di, 88f6
    jmp loc_1bd7_8815

loc_1bd7_8851:
    pop si
    cmp di, 887a
    jz loc_1bd7_8867
    jmp loc_1bd7_8864

loc_1bd7_885a:
    pop es
    push es
    mov di, 6798
    call sub_1bd7_89f6
    jb loc_1bd7_8872

loc_1bd7_8864:
    call sub_1bd7_887a

loc_1bd7_8867:
    pop ds
    mov [679e], dx
    mov [679c], bx
    jmp loc_1bd7_8876

loc_1bd7_8872:
    pop ds

loc_1bd7_8873:
    xor ax, ax
    cwd

loc_1bd7_8876:
    pop di
    pop si
    pop bp
    retf
