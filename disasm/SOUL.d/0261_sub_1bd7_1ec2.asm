; ========================================
; New Subroutine: sub_1bd7_1ec2
; ========================================
sub_1bd7_1ec2:
    push ax
    push si
    push di
    call sub_1bd7_45e6
    cmp di, [5812]
    jz loc_1bd7_1ef2
    mov byte ptr [di], 04
    mov [5812], di
    cmp di, [5810]
    jb loc_1bd7_1edf
    mov [5810], di

loc_1bd7_1edf:
    sub di, 07
    mov word ptr [di], ffff
    call sub_1bd7_1ea4
    mov [57a2], di
    sub di, si
    dec di
    mov [si], di

loc_1bd7_1ef2:
    pop di
    pop si
    pop ax
    ret
