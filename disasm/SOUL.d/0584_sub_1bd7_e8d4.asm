; ========================================
; New Subroutine: sub_1bd7_e8d4
; ========================================
sub_1bd7_e8d4:
    push bp
    mov bp, sp
    sub sp, 28
    push di
    push si
    mov word ptr [bp-6], 0000
    mov word ptr [bp-12], 0000
    mov word ptr [bp-10], 63ad
    mov ax, 0000
    mov dx, 63ad
    mov cx, ax
    mov bx, dx
    add ax, 0000
    adc dx, 0200
    mov [bp-a], ax
    mov [bp-8], dx
    add cx, 00
    adc bx, 0400
    mov [bp-28], cx
    mov [bp-26], bx
    mov es, [6e96]  ; data_7fc1_6e96 word read
    mov al, es:[0540]  ; data_2c43_0540 byte read
    sub ah, ah
    push ax
    nop
    push cs
    call sub_1bd7_cbee
    add sp, 02
    cmp word ptr [bp-6], 00
    jnz loc_1bd7_e97b
    mov word ptr [bp-14], 0000
    jmp loc_1bd7_e964
