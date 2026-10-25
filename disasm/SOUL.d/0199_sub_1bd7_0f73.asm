; ========================================
; New Subroutine: sub_1bd7_0f73
; ========================================
sub_1bd7_0f73:
    push ds
    push es
    mov ax, 3500
    int 21
    mov [5750], bx  ; data_7fc1_5750 word write
    mov [5752], es  ; data_7fc1_5752 word write
    mov ax, 3504
    int 21
    mov [5754], bx  ; data_7fc1_5754 word write
    mov [5756], es  ; data_7fc1_5756 word write
    mov ax, 3524
    int 21
    mov [5758], bx  ; data_7fc1_5758 word write
    mov [575a], es  ; data_7fc1_575a word write
    push cs
    pop ds
    mov dx, 17e7
    mov ax, 2500
    int 21
    mov dx, 17eb
    mov ax, 2504
    int 21
    call sub_1bd7_0f72
    pop es
    pop ds
    or byte ptr [6839], 08  ; data_7fc1_6839 byte readwrite
    ret
