; ========================================
; New Subroutine: sub_1bd7_7748
; ========================================
sub_1bd7_7748:
    mov [67db], al  ; data_7fc1_67db byte write
    or ah, ah
    jnz loc_1bd7_7771
    cmp byte ptr [67d8], 03  ; data_7fc1_67d8 byte read
    jb loc_1bd7_7762
    cmp al, 22
    jae loc_1bd7_7766
    cmp al, 20
    jb loc_1bd7_7762
    mov al, 05
    jmp loc_1bd7_7768

loc_1bd7_7762:
    cmp al, 13
    jbe loc_1bd7_7768

loc_1bd7_7766:
    mov al, 13

loc_1bd7_7768:
    mov bx, 6b38
    xlat

loc_1bd7_776c:
    cbw
    mov [67b4], ax  ; data_7fc1_67b4 word write
    ret

loc_1bd7_7771:
    mov al, ah
    jmp loc_1bd7_776c
