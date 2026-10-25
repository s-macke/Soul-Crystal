; ========================================
; New Subroutine: sub_1bd7_18b6
; ========================================
sub_1bd7_18b6:
    push si
    push es
    mov si, [682d]  ; data_7fc1_682d word read
    les si, [si]
    mov [5776], si  ; data_7fc1_5776 word write
    mov [5778], es  ; data_7fc1_5778 word write
    call sub_1bd7_18f4
    or byte ptr [6842], 10  ; data_7fc1_6842 byte readwrite
    pop es
    pop si
    retf

loc_1bd7_18d1:
    jmp loc_1bd7_1697
