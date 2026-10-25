; ========================================
; New Subroutine: sub_1bd7_3e21
; ========================================
sub_1bd7_3e21:
    push ds
    push ss
    pop ds
    lea bx, [6784]
    mov [bx], ss
    mov ax, [677e]  ; data_7fc1_677e word read
    mov [bx+4], ax
    mov ax, [682f]  ; data_7fc1_682f word read
    push ax
    mov [bx+6], ax
    mov [bx+8], ax
    mov ax, [6831]  ; data_7fc1_6831 word read
    dec ax
    dec ax
    mov [bx+a], ax
    sub ax, [bx+6]
    dec ax
    mov bx, [bx+a]
    mov word ptr [bx], fffe
    pop bx
    mov [bx], ax
    pop ds
    ret
