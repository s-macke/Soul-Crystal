; ========================================
; New Subroutine: sub_1bd7_46e0
; ========================================
sub_1bd7_46e0:
    push ax
    or si, si
    jnz loc_1bd7_46ed
    call sub_1bd7_4309
    call sub_1bd7_4710
    jmp loc_1bd7_470a

loc_1bd7_46ed:
    mov ax, si
    sub ax, [580e]
    cmp ax, 0008
    jb loc_1bd7_4707
    mov byte ptr [si], 01
    mov [si-3], ax
    mov [580e], si
    sub si, ax
    mov [si+1], ax

loc_1bd7_4707:
    call sub_1bd7_4414

loc_1bd7_470a:
    mov si, [580e]
    pop ax
    ret
