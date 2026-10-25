; ========================================
; New Subroutine: sub_1bd7_e5de
; ========================================
sub_1bd7_e5de:
    push ax
    push bx
    push cx
    push dx
    mov word ptr cs:[e294], 03e8  ; data_1bd7_e294 word write
    mov word ptr cs:[e296], 03e8  ; data_1bd7_e296 word write
    mov byte ptr cs:[e2b1], ff  ; data_1bd7_e2b1 byte write
    call sub_1bd7_e45d
    call sub_1bd7_e3f0
    mov ax, 0904
    mov cs:[e2a0], ax  ; data_1bd7_e2a0 word write
    call sub_1bd7_e5ae
    pop dx
    pop cx
    pop bx
    pop ax
    retf
