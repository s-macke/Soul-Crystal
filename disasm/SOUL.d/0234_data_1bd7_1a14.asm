data_1bd7_1a14:
    db e8, 16, 00, e8, e3, 09, ff, 16, e7, 6a, 72, 21  ; |.........jr!|

loc_1bd7_1a20:
    pop si
    pop es
    pop bp
    pop ax
    pop dx
    pop cx
    shl cx, 01
    add sp, cx
    push dx
    push ax
    retf
