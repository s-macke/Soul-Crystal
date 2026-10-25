; ========================================
; New Subroutine: sub_1bd7_804a
; ========================================
sub_1bd7_804a:
    push bp
    mov bp, sp
    mov bx, [bp+6]
    cmp bx, [67dd]  ; data_7fc1_67dd word read
    jb loc_1bd7_805c
    mov ax, 0900
    stc
    jmp loc_1bd7_8067

loc_1bd7_805c:
    mov ah, 3e
    int 21
    jb loc_1bd7_8067
    mov byte ptr [bx+67df], 00

loc_1bd7_8067:
    jmp loc_1bd7_7720
