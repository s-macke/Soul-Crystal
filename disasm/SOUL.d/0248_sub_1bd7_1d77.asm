; ========================================
; New Subroutine: sub_1bd7_1d77
; ========================================
sub_1bd7_1d77:
    or bx, bx
    jz loc_1bd7_1da6
    cmp word ptr [57a4], 00  ; data_7fc1_57a4 word read
    jz loc_1bd7_1dad
    push si
    push bx
    call sub_1bd7_1ba8
    mov si, [57a4]  ; data_7fc1_57a4 word read
    mov dx, [si]
    mov [57a4], dx  ; data_7fc1_57a4 word write
    pop word ptr [si]
    mov [bx-2], si
    mov [si+2], bx
    mov dx, [6849]  ; data_7fc1_6849 word read
    mov [si+4], dx
    mov dx, bx
    mov bx, si
    pop si
    ret

loc_1bd7_1da6:
    mov dx, 6a32
    mov bx, 6a34
    ret

loc_1bd7_1dad:
    jmp loc_1bd7_162d
