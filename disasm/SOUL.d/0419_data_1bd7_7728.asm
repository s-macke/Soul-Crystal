data_1bd7_7728:
    db 73, f8, 50, e8, 1a, 00, 58, 32, e4, 8b, e5, 5d, cb  ; |s.P...X2...].|

loc_1bd7_7735:
    jae loc_1bd7_773e

loc_1bd7_7737:
    call sub_1bd7_7748
    mov ax, ffff
    cwd

loc_1bd7_773e:
    mov sp, bp
    pop bp
    retf
