; ========================================
; New Subroutine: sub_1bd7_4615
; ========================================
sub_1bd7_4615:
    push ax
    push bx
    push cx
    push si
    push di
    mov si, cx
    inc si
    mov [580e], si  ; data_7fc1_580e word write
    mov [5810], si  ; data_7fc1_5810 word write
    mov [5812], si  ; data_7fc1_5812 word write
    mov byte ptr [si], 04
    mov word ptr [5814], 42ec  ; data_7fc1_5814 word write
    sub si, 07
    cmp si, ax
    jb loc_1bd7_4648
    cmp byte ptr [5772], 00  ; data_7fc1_5772 byte read
    jz loc_1bd7_4645
    call sub_1bd7_1f81
    jmp loc_1bd7_4648

loc_1bd7_4645:
    call sub_1bd7_1f41

loc_1bd7_4648:
    pop di
    pop si
    pop cx
    pop bx
    pop ax
    ret
