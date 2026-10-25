; ========================================
; New Subroutine: sub_1bd7_859a
; ========================================
sub_1bd7_859a:
    push bp
    mov bp, sp
    sub sp, 04
    xor bh, bh
    cmp byte ptr [67d8], 03  ; data_7fc1_67d8 byte read
    jb loc_1bd7_85ac
    mov bh, [bp+c]

loc_1bd7_85ac:
    mov ax, [bp+e]
    mov [bp+c], ax
    jmp loc_1bd7_85bc
