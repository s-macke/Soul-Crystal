; ========================================
; New Subroutine: sub_2b9c_041a
; ========================================
sub_2b9c_041a:
    push ax
    push dx
    push es
    push ds
    push cs
    pop ds
    cmp word ptr [0418], 00  ; data_2b9c_0418 word read
    jnz loc_2b9c_0434
    mov ax, 3523
    int 21
    mov [0416], bx  ; data_2b9c_0416 word write
    mov [0418], es  ; data_2b9c_0418 word write

loc_2b9c_0434:
    mov dx, 0447
    jcxz loc_2b9c_043d
    lds dx, [0416]

loc_2b9c_043d:
    mov ax, 2523
    int 21
    pop ds
    pop es
    pop dx
    pop ax
    retf
