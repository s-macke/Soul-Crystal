data_1bd7_b0fd:
    db 90  ; |.|

loc_1bd7_b0fe:
    mov [6ec4], di  ; 7fc1:6ec4 word write

loc_1bd7_b102:
    mov ax, di
    mov dx, [bp-2]
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_b10d:
    db 90  ; |.|
