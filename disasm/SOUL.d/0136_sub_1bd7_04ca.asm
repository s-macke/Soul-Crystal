; ========================================
; New Subroutine: sub_1bd7_04ca
; ========================================
sub_1bd7_04ca:
    mov word ptr [661d], 0467
    mov word ptr [661f], 042f
    add byte ptr [661c], 0d
    mov byte ptr [661c], 00
    jz loc_1bd7_04ea
    push si
    mov si, 6db6
    call sub_1bd7_0522
    pop si

loc_1bd7_04ea:
    ret
