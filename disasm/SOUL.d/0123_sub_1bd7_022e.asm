; ========================================
; New Subroutine: sub_1bd7_022e
; ========================================
sub_1bd7_022e:
    mov [6764], al  ; data_7fc1_6764 byte write
    mov [675d], al  ; data_7fc1_675d byte write
    mov [675c], cl  ; data_7fc1_675c byte write
    mov byte ptr [675e], 01  ; data_7fc1_675e byte write
    push cx
    dec cl
    mov [675f], cl  ; data_7fc1_675f byte write
    pop cx
    ret

loc_1bd7_0246:
    cmp al, 61
    jb loc_1bd7_0250
    cmp al, 7a
    ja loc_1bd7_0250
    and al, df

loc_1bd7_0250:
    ret
