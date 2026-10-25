data_1bd7_5e13:
    db 8b, 75, fc  ; |.u.|

loc_1bd7_5e16:
    cld
    xor ax, ax
    mov cx, [si]
    mov dx, [si+2]
    add dx, 7f80
    jz loc_1bd7_5e49
    mov [di], ax
    sar dx, 01
    rcr cx, 01
    rcr ax, 01
    sar dx, 01
    rcr cx, 01
    rcr ax, 01
    sar dx, 01
    rcr cx, 01
    rcr ax, 01
    mov [di+2], ax
    mov [di+4], cx
    and dh, 8f
    add dx, 3800
    mov [di+6], dx
    ret

loc_1bd7_5e49:
    mov [di], ax
    mov [di+2], ax
    mov [di+4], ax
    mov [di+6], ax
    ret

data_1bd7_5e55:
    db 00, 3c, 03, 74, 04, 3c, 07, 75, 0a  ; |.<.t.<.u.|

loc_1bd7_5e5e:
    mov bx, 0006
    jmp loc_1bd7_5e6b

data_1bd7_5e63:
    db bb, 0b, 00, eb, 03, bb, 05, 00  ; |........|

loc_1bd7_5e6b:
    mov sp, [69fc]
    pop bp
    jmp loc_1bd7_5e75

loc_1bd7_5e72:
    mov bx, 0005

loc_1bd7_5e75:
    pop ax
    pop ax
    push bp
    mov bp, sp
    jmp loc_1bd7_16bb

data_1bd7_5e7d:
    db 90, 90, 8b, 3e, fa, 69, fc, 8b, 0c, 8b, 54, 02, 33, c0, f7, c2  ; |...>.i....T.3...|
    db 80, 7f, 74, 29, d1, fa, d1, d9, d1, d8, d1, fa, d1, d9, d1, d8  ; |..t)............|
    db d1, fa, d1, d9, d1, d8, 80, e6, 8f, 81, c2, 00, 38, c7, 05, 00  ; |............8...|
    db 00, 89, 45, 02, 89, 4d, 04, 89, 55, 06, 8b, f7, c3, 8b, c8, 8a  ; |..E..M..U.......|
    db d0, eb, ea  ; |...|
