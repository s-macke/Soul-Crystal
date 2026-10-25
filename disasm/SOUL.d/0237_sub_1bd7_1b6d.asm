; ========================================
; New Subroutine: sub_1bd7_1b6d
; ========================================
sub_1bd7_1b6d:
    push bp
    mov bp, sp
    push si
    push di
    push es
    call sub_1bd7_1b82
    xchg ax, cx
    repz movsb
    xchg ax, cx
    xchg ax, dx
    repz stosw
    jae loc_1bd7_1b63
    stosb
    jmp loc_1bd7_1b63
