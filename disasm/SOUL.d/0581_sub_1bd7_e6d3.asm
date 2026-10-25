; ========================================
; New Subroutine: sub_1bd7_e6d3
; ========================================
sub_1bd7_e6d3:
    push bp
    mov bp, sp
    push si
    push ds
    mov byte ptr cs:[e2b0], 09  ; data_1bd7_e2b0 byte write
    lds si, [bp+6]
    mov cs:[e2a2], si  ; data_1bd7_e2a2 word write
    mov cs:[e2a4], ds  ; data_1bd7_e2a4 word write
    mov word ptr cs:[e2ae], 0000  ; data_1bd7_e2ae word write
    add si, [si]
    mov cs:[e2a6], si  ; data_1bd7_e2a6 word write
    mov cs:[e2a8], ds  ; data_1bd7_e2a8 word write
    mov byte ptr cs:[e2b1], 00  ; data_1bd7_e2b1 byte write
    pop ds
    pop si
    pop bp
    retf 0004
