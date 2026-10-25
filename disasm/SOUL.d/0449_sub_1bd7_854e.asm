; ========================================
; New Subroutine: sub_1bd7_854e
; ========================================
sub_1bd7_854e:
    push bp
    mov bp, sp
    push si
    mov si, [bp+4]
    mov ax, 0200
    push ax
    nop
    push cs
    call sub_1bd7_87e4
    pop cx
    mov bx, si
    sub bx, 6b4c
    add bx, 6c3c
    or dx, dx
    jz loc_1bd7_8578
    or byte ptr [si+a], 08
    mov word ptr [bx+2], 0200
    jmp loc_1bd7_8586

loc_1bd7_8578:
    or byte ptr [si+a], 04
    mov word ptr [bx+2], 0001
    mov dx, ds
    lea ax, [bx+1]

loc_1bd7_8586:
    mov [si+2], dx
    mov [si], ax
    mov [si+8], dx
    mov [si+6], ax
    mov word ptr [si+4], 0000
    pop si
    pop bp
    ret
