loc_unknown_1bd7_ad46:
    nop
    push cs
    call sub_1bd7_e256
    mov cx, ax
    mov ax, [bp+8]
    mov bx, dx
    cwd
    add ax, cx
    adc dx, bx
    mov [6ec0], ax  ; 7fc1:6ec0 word write
    mov [6ec2], dx  ; 7fc1:6ec2 word write
    jmp loc_1bd7_b064
