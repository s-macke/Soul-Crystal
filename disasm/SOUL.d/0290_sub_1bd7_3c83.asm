; ========================================
; New Subroutine: sub_1bd7_3c83
; ========================================
sub_1bd7_3c83:
    push si
    mov bx, bp

loc_1bd7_3c86:
    mov cx, bx
    call far, [680e]
    mov bx, [bx]
    cmp bx, [6847]
    jnz loc_1bd7_3c86
    cmp bx, [6845]
    jnz loc_1bd7_3ca5
    mov bx, [682d]
    mov cx, [bx]
    mov bx, [bx+2]
    jmp loc_1bd7_3cc8

loc_1bd7_3ca5:
    mov bx, cx
    mov cx, [bx+4]
    mov si, [bx+2]
    cmp byte ptr [5773], 00
    jnz loc_1bd7_3cbc
    mov bl, [6822]
    mov [5773], bl

loc_1bd7_3cbc:
    mov bx, [682d]  ; data_7fc1_682d word read
    call sub_1bd7_3cd3
    mov bx, [bx-4]
    xchg cx, bx

loc_1bd7_3cc8:
    cbw
    xchg ax, si
    add si, cx
    push ds
    mov ds, bx
    lodsw word ptr [si]
    pop ds
    pop si
    ret
