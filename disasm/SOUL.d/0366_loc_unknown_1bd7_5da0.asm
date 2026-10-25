loc_unknown_1bd7_5da0:
    mov cx, ax
    mov ax, ds
    nop
    inc bp
    push bp
    mov bp, sp
    push ds
    mov ds, ax
    cmp bx, 03
    ja loc_1bd7_5dc6
    jz loc_1bd7_5dbc
    mov word ptr ss:[69fa], 688a  ; data_7fc1_69fa word write
    jmp loc_1bd7_5dc6

loc_1bd7_5dbc:
    mov ss:[6878], cx  ; data_7fc1_6878 word write
    mov ss:[687a], dx  ; data_7fc1_687a word write

loc_1bd7_5dc6:
    clc
    lea sp, [bp-2]
    pop ds
    pop bp
    dec bp
    retf
