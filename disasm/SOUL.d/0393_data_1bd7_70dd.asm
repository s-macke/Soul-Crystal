data_1bd7_70dd:
    db 90  ; |.|

loc_1bd7_70de:
    push word ptr [bp-2]
    push ax
    push word ptr [bp+e]
    push word ptr [bp+c]
    push word ptr [bp+a]
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_7936

loc_1bd7_70f6:
    mov sp, bp
    pop bp
    retf
