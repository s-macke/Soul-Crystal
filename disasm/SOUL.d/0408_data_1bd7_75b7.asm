data_1bd7_75b7:
    db 90  ; |.|

loc_1bd7_75b8:
    push ds
    push si
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_7812
    add sp, 06

loc_1bd7_75c5:
    mov ax, di
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_75cd:
    db 90  ; |.|
