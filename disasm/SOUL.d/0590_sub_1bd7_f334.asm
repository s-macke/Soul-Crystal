; ========================================
; New Subroutine: sub_1bd7_f334
; ========================================
sub_1bd7_f334:
    push bp
    mov bp, sp
    sub sp, 04
    push di
    push si
    mov es, [6e96]  ; data_7fc1_6e96 word read
    mov al, es:[0540]  ; data_2c43_0540 byte read
    sub ah, ah
    dec ax
    jz loc_1bd7_f35a
    dec ax
    dec ax
    jz loc_1bd7_f364
    dec ax
    jnz loc_1bd7_f353
    jmp loc_1bd7_f424

loc_1bd7_f353:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
