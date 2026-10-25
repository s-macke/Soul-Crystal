data_1bd7_5c74:
    db bb, 18, 00  ; |...|

loc_1bd7_5c77:
    push si
    push di
    mov di, [69fa]
    cmp byte ptr [di-2], 07
    jz loc_1bd7_5cbc
    cmp byte ptr [di-e], 07
    jz loc_1bd7_5cb4

loc_1bd7_5c89:
    sub di, 0c
    mov [69fa], di

loc_1bd7_5c90:
    mov ax, ds
    mov es, ax
    mov si, [di-4]
    mov [di-4], di
    mov di, [di+8]
    cmp bx, 1c
    jae loc_1bd7_5cd1
    cmp bx, 18
    jae loc_1bd7_5ce5
    push bp
    mov [69fc], sp
    call word ptr [bx+65fa]
    pop bp
    pop di
    pop si
    retf

loc_1bd7_5cb4:
    add bx, 02
    call sub_1bd7_5e07
    jmp loc_1bd7_5c89

loc_1bd7_5cbc:
    add bx, 02
    cmp byte ptr [di-e], 07
    jz loc_1bd7_5c89
    sub di, 0c
    mov [69fa], di
    call sub_1bd7_5e07
    jmp loc_1bd7_5c90

loc_1bd7_5cd1:
    xchg di, si
    sub word ptr [69fa], 0c
    push bp
    mov [69fc], sp
    call word ptr [bx+65f6]
    pop bp
    pop di
    pop si
    retf

loc_1bd7_5ce5:
    sub word ptr [69fa], 0c
    push bp
    mov [69fc], sp
    call word ptr [bx+65fa]
    pop bp
    lahf
    and ax, 4100
    shr ax, 01
    shl ah, 01
    or ah, al
    pop di
    pop si
    sahf
    retf

data_1bd7_5d02:
    db d0, e3, d0, e3, 8a, fb, d0, e7, 02, df, 32, ff, eb, 03, bb, 0c  ; |..........2.....|
    db 00, 56, 57, 8c, d8, 8e, c0, fc, 8b, 36, fa, 69, 4e, 4e, 8b, fe  ; |.VW......6.iNN..|
    db 2b, fb, b9, 05, 00, ad, 87, 05, 89, 44, fe, 8b, 1d, 47, 47, e2  ; |+........D...GG.|
    db f4, 5f, 5e, cb, 55, 8b, ec, 56, 57, 8b, 3e, fa, 69, 80, 7d, fe  ; |._^.U..VW.>.i.}.|
    db 07, 74, 03, e8, bf, 00, 5f, 5e, 8b, e5, 5d, cb  ; |.t...._^..].|
