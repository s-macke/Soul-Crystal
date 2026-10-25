data_1bd7_5879:
    db 8b, 07, 99  ; |...|

loc_1bd7_587c:
    push si
    push di
    mov bx, dx
    mov dx, ax
    mov al, bh
    and al, 80
    jns loc_1bd7_588f
    neg bx
    neg dx
    sbb bx, 00

loc_1bd7_588f:
    mov di, [69fa]
    add di, 0c
    cmp di, 69e6
    jz loc_1bd7_58b8
    mov [69fa], di
    mov [di-4], di
    mov cx, ds
    mov es, cx
    cmp bh, 00
    jnz loc_1bd7_58bb
    mov byte ptr [di-2], 03
    mov ah, 9e
    call sub_1bd7_63e6
    pop di
    pop si
    retf

loc_1bd7_58b8:
    jmp loc_1bd7_581e

loc_1bd7_58bb:
    mov byte ptr [di-2], 07
    push bp
    mov bp, 8760
    mov cx, bx
    xor bx, bx
    mov di, bx
    call sub_1bd7_675c
    pop bp
    pop di
    pop si
    retf

data_1bd7_58d0:
    db 56, 57, 8c, d8, 8e, c0, 8b, 3e, fa, 69, 8b, 75, fc, 8a, 45, fe  ; |VW.....>.i.u..E.|
    db 83, c7, 0c, 81, ff, e6, 69, 74, b1, 89, 3e, fa, 69, 89, 7d, fc  ; |......it..>.i.}.|
    db 88, 45, fe, fc, a5, a5, 3c, 03, 74, 02, a5, a5, 5f, 5e, cb, 56  ; |.E....<.t..._^.V|
    db 57, 8b, 3e, fa, 69, 83, c7, 0c, 81, ff, e6, 69, 74, 8c, 89, 3e  ; |W.>.i......it..>|
    db fa, 69, 89, 7d, fc, c6, 45, fe, 03, 8c, d8, 8e, c0, 33, c0, fc  ; |.i.}..E......3..|
    db ab, ab, 5f, 5e, cb, 8c, d0, eb, 02, 8c, d8, 8e, c0, 56, 57, 8b  ; |.._^.........VW.|
    db fb, fc, 8b, 1e, fa, 69, 83, 06, fa, 69, 0c, eb, 11, 8c, d0, eb  ; |.....i...i......|
    db 02  ; |.|
