; ========================================
; New Subroutine: sub_1bd7_3eef
; ========================================
sub_1bd7_3eef:
    push es
    mov es, [6802]  ; data_7fc1_6802 word read
    mov bx, ffff
    mov ah, 4a
    call sub_1bd7_42d4
    jae loc_1bd7_3eea
    mov ah, 4a
    call sub_1bd7_42d4
    jb loc_1bd7_3eea
    mov ax, [6b2e]  ; data_7fc1_6b2e word read
    inc ax
    mov cl, 04
    shr ax, cl
    inc ax
    mov cx, ds
    add cx, ax
    mov [5808], cx  ; data_7fc1_5808 word write
    mov cx, es
    add cx, bx
    mov [57fc], cx  ; data_7fc1_57fc word write
    xor ax, ax
    mov [5800], ax  ; data_7fc1_5800 word write
    mov word ptr [57fe], 5806  ; data_7fc1_57fe word write
    mov [580c], ax  ; data_7fc1_580c word write
    mov [580a], ax  ; data_7fc1_580a word write
    pop es
    ret
