; ========================================
; New Subroutine: sub_1bd7_18fd
; ========================================
sub_1bd7_18fd:
    push di
    push es
    les bx, [5776]  ; data_7fc1_5776 word read
    mov di, es:[bx+18]
    mov cx, es:[bx+e]
    sub cx, di
    push ds
    pop es
    mov word ptr [6874], 0000  ; data_7fc1_6874 word write
    shr cx, 01
    xor ax, ax
    repz stosw
    mov [6876], di  ; data_7fc1_6876 word write
    mov [6837], ds  ; data_7fc1_6837 word write
    call sub_1bd7_1929
    pop es
    pop di
    ret
