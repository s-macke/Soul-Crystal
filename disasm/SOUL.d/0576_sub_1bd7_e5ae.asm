; ========================================
; New Subroutine: sub_1bd7_e5ae
; ========================================
sub_1bd7_e5ae:
    push es
    push ds
    mov dx, e4a8
    xor ax, ax
    mov ds, ax
    cli
    les bx, [0020]  ; 07dc:0020 word read
    mov [0020], dx  ; 07dc:0020 word write
    mov [0022], cs  ; 07dc:0022 word write
    mov cs:[e298], bx  ; data_1bd7_e298 word write
    mov cs:[e29a], es  ; data_1bd7_e29a word write
    mov al, 36
    out 43, al
    xor al, al
    out 40, al
    mov al, 40
    out 40, al
    sti
    pop ds
    pop es
    ret
