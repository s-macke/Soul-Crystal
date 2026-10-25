; ========================================
; New Subroutine: sub_1bd7_f0f6
; ========================================
sub_1bd7_f0f6:
    push bp
    mov bp, sp
    sub sp, 0e
    push di
    push si
    sub di, di
    mov es, [6e96]  ; data_7fc1_6e96 word read
    mov al, es:[0540]  ; data_2c43_0540 byte read
    sub ah, ah
    dec ax
    jz loc_1bd7_f116
    dec ax
    dec ax
    jl loc_1bd7_f172
    dec ax
    jle loc_1bd7_f120
    jmp loc_1bd7_f172

loc_1bd7_f116:
    mov ax, 0082
    push ax
    mov ax, 03b8
    jmp loc_1bd7_f169
