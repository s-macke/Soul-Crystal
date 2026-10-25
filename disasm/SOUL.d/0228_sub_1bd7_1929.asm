; ========================================
; New Subroutine: sub_1bd7_1929
; ========================================
sub_1bd7_1929:
    push si
    push di
    push es
    push ds
    pop es
    xor ax, ax
    add byte ptr [6842], 10  ; data_7fc1_6842 byte readwrite
    jnz loc_1bd7_194b
    push es
    les bx, [5776]  ; data_7fc1_5776 word read
    mov di, es:[bx+e]
    mov cx, es:[bx+10]
    pop es
    sub cx, di
    shr cx, 01
    repz stosw

loc_1bd7_194b:
    mov di, 6854
    mov cx, 001c
    repz stosb
    mov bx, sp
    nop
    push cs
    call sub_1bd7_1880
    call sub_1bd7_3e21
    pop es
    pop di
    pop si
    ret
