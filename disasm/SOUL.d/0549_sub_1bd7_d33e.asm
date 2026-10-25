; ========================================
; New Subroutine: sub_1bd7_d33e
; ========================================
sub_1bd7_d33e:
    push bp
    mov bp, sp
    sub sp, 26
    push di
    push si
    mov ax, 2c43
    mov es, ax
    mov al, es:[0540]
    sub ah, ah
    dec ax
    jz loc_1bd7_d368
    dec ax
    dec ax
    jnz loc_1bd7_d35b
    jmp loc_1bd7_d3fa

loc_1bd7_d35b:
    dec ax
    jnz loc_1bd7_d361
    jmp loc_1bd7_d528

loc_1bd7_d361:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
