data_1bd7_b24f:
    db 90  ; |.|

loc_1bd7_b250:
    mov ax, 7fc1
    mov ds, ax
    jmp loc_1bd7_b25f

data_1bd7_b257:
    db 90  ; |.|

loc_1bd7_b258:
    mov ax, 7fc1
    mov ds, ax
    sub cx, cx

loc_1bd7_b25f:
    mov ax, cx
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_b267:
    db 90  ; |.|
