data_1bd7_b90b:
    db 90  ; |.|

loc_1bd7_b90c:
    sub si, si

loc_1bd7_b90e:
    push word ptr [bp-e]
    push word ptr [bp-10]
    nop
    push cs
    call sub_1bd7_7000
    add sp, 04

loc_1bd7_b91c:
    mov ax, si
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
