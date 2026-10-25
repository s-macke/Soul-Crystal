data_1bd7_090d:
    db 55, 8b, ec, 8b, 5e, 06, 83, 3f, 00, 74, ea, 53, 8b, 5f, 02, 58  ; |U...^..?.t.S._.X|
    db ff, 37, 93, e8, e5, 14, 5a  ; |.7....Z|

loc_1bd7_0924:
    mov bx, [bp+8]
    call sub_1bd7_08e1
    pop bp
    retf 0004

data_1bd7_092e:
    db 55, 8b, ec, 33, c9, 8b, 5e, 08, 8b, 56, 06, eb, 0d, 55, 8b, ec  ; |U..3..^..V...U..|
    db 8b, 5e, 08, 8b, 56, 06, 8b, 0f, 2b, ca, e8, 3f, 00, 5d, ca, 04  ; |.^..V...+..?.]..|
    db 00  ; |.|

loc_1bd7_094f:
    jmp loc_1bd7_1615
