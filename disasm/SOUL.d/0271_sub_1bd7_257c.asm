; ========================================
; New Subroutine: sub_1bd7_257c
; ========================================
sub_1bd7_257c:
    xor ax, ax
    mov es, ax
    mov ax, es:[0488]  ; 07dc:0488 word read
    add ah, 01
    jnz loc_1bd7_25db
    test al, 08
    jnz loc_1bd7_258f
    xor al, 02

loc_1bd7_258f:
    mov ah, es:[0410]
    mov [57b1], ah
    and ah, 30
    cmp ah, 30
    jz loc_1bd7_25a2
    xor al, 02

loc_1bd7_25a2:
    test al, 02
    jz loc_1bd7_25ca
    cmp ah, 30
    jz loc_1bd7_25b8
    and word ptr [57a8], feff
    mov byte ptr [57b5], 10
    jmp loc_1bd7_25db

loc_1bd7_25b8:
    mov byte ptr [57aa], 00
    and word ptr [57a8], 0100
    mov byte ptr [57b5], 08
    jmp loc_1bd7_25db

loc_1bd7_25ca:
    xor ax, ax
    mov [57aa], al
    mov [57a8], ax
    mov al, 02
    mov [57b4], al
    mov [57b5], al
    stc

loc_1bd7_25db:
    ret
