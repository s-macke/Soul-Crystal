; ========================================
; New Subroutine: sub_1bd7_1f41
; ========================================
sub_1bd7_1f41:
    mov [57a2], si  ; data_7fc1_57a2 word write
    mov word ptr [si], ffff
    mov [579e], ax  ; data_7fc1_579e word write
    mov di, ax
    mov [57a0], di  ; data_7fc1_57a0 word write
    sub si, di
    dec si
    mov [di], si
    mov word ptr [6849], 0000  ; data_7fc1_6849 word write
    mov cx, 0014
    mov di, 6a38
    mov [57a4], di  ; data_7fc1_57a4 word write
    mov bx, ffff
    mov ax, 6a3e
    push es
    push ds
    pop es

loc_1bd7_1f70:
    stosw
    xchg ax, bx
    stosw
    stosw
    xchg ax, bx
    add ax, 0006
    loop loc_1bd7_1f70
    pop es
    mov word ptr [di-6], 0000
    ret
