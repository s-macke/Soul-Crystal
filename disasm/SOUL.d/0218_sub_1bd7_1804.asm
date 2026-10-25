; ========================================
; New Subroutine: sub_1bd7_1804
; ========================================
sub_1bd7_1804:
    call sub_1bd7_1838
    nop
    push cs
    call sub_1bd7_1892
    mov si, [682d]  ; data_7fc1_682d word read
    mov ax, [si]
    mov dx, [si+2]
    nop
    push cs
    call sub_1bd7_3cef
    mov word ptr [6849], 0000  ; data_7fc1_6849 word write
    mov [6845], bp  ; data_7fc1_6845 word write
    or byte ptr [6839], 06  ; data_7fc1_6839 byte readwrite
    push word ptr [si+2]
    mov ax, [si]
    add ax, 0030
    push ax
    retf

loc_1bd7_1833:
    jmp loc_1bd7_18d1
