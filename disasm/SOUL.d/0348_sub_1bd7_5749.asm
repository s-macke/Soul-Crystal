; ========================================
; New Subroutine: sub_1bd7_5749
; ========================================
sub_1bd7_5749:
    mov ax, [6b2c]  ; data_7fc1_6b2c word read
    mov cx, [6b2e]  ; data_7fc1_6b2e word read
    call sub_1bd7_4615
    jae loc_1bd7_5758
    jmp loc_1bd7_16a6

loc_1bd7_5758:
    ret
