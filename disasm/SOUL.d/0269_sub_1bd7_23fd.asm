; ========================================
; New Subroutine: sub_1bd7_23fd
; ========================================
sub_1bd7_23fd:
    add byte ptr [6618], 40
    jz loc_1bd7_2405
    ret

loc_1bd7_2405:
    push ax
    push bx
    push cx
    push dx
    or byte ptr [6618], 40
    add byte ptr [6abf], 01
    jz loc_1bd7_241f
    call sub_1bd7_25dc
    call word ptr [6adb]
    call sub_1bd7_29c8

loc_1bd7_241f:
    mov ax, [6637]
    call word ptr [6add]
    add byte ptr [6618], 80
    jz loc_1bd7_2430
    call sub_1bd7_0ce2

loc_1bd7_2430:
    call word ptr [6adf]
    pop dx
    pop cx
    pop bx
    pop ax
    ret
