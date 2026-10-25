; ========================================
; New Subroutine: sub_1bd7_b39e
; ========================================
sub_1bd7_b39e:
    push bp
    mov bp, sp
    sub sp, 12
    mov word ptr [bp-6], 0001
    mov es, [6e68]  ; data_7fc1_6e68 word read
    mov ax, es:[0c68]  ; data_2c43_0c68 word read
    mov dx, es:[0c6a]  ; data_2c43_0c6a word read
    mov [bp-4], ax
    mov [bp-2], dx
    cmp word ptr [bp+c], 00
    jz loc_1bd7_b3d2
    mov al, es:[0540]  ; data_2c43_0540 byte read
    sub ah, ah
    sub ax, 0004
    jnz loc_1bd7_b3d2
    add word ptr [bp-4], 0c80

loc_1bd7_b3d2:
    mov es, [6e68]  ; data_7fc1_6e68 word read
    mov al, es:[0540]  ; data_2c43_0540 byte read
    sub ah, ah
    jmp loc_1bd7_b732
