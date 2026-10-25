; ========================================
; New Subroutine: sub_1bd7_25dc
; ========================================
sub_1bd7_25dc:
    cmp byte ptr [57b4], 08
    jnz loc_1bd7_2616
    push es
    xor ax, ax
    mov es, ax
    mov ah, es:[0410]
    or ah, 30
    mov al, [6ac1]
    and al, 07
    sub al, 07
    jz loc_1bd7_25fe
    and ah, ef
    mov al, 01

loc_1bd7_25fe:
    mov [57b1], ah
    mov es:[0410], ah
    pop es
    add byte ptr [57b2], 04
    jnz loc_1bd7_2616
    mov bl, 33
    mov ah, 12
    call sub_1bd7_0b1a

loc_1bd7_2616:
    ret
