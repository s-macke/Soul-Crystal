; ========================================
; New Subroutine: sub_1bd7_12be
; ========================================
sub_1bd7_12be:
    push bp
    mov bp, sp
    push si
    push di
    mov bx, [bp+6]
    mov cx, [bx+2]
    jcxz loc_1bd7_12f5
    xchg ax, di
    add byte ptr [bx+9], 40
    jnz loc_1bd7_12dc
    cmp word ptr [5802], 00
    jz loc_1bd7_12dc
    call sub_1bd7_0f72

loc_1bd7_12dc:
    add byte ptr [bx+9], 40
    jnz loc_1bd7_12ff
    add byte ptr [bx+9], 80
    jz loc_1bd7_12f7
    mov word ptr [bx+2], 0000
    mov si, [bx]
    call sub_1bd7_4485
    call sub_1bd7_4414

loc_1bd7_12f5:
    jmp loc_1bd7_1339

loc_1bd7_12f7:
    call sub_1bd7_4005
    call sub_1bd7_40e0
    jmp loc_1bd7_1339

loc_1bd7_12ff:
    call sub_1bd7_1974
    mov cx, ax
    mov di, [bx]
    add byte ptr [bx+9], 80
    jz loc_1bd7_131e
    shr cx, 01
    shr cx, 01
    push bx
    mov bx, di

loc_1bd7_1313:
    call sub_1bd7_1e49
    add bx, 04
    loop loc_1bd7_1313
    mov cx, ax
    pop bx

loc_1bd7_131e:
    mov es, [bx+2]
    xor ax, ax
    shr cx, 01
    repz stosw
    adc cx, cx
    repz stosb
    add byte ptr [bx+9], 10
    jz loc_1bd7_1339
    mov si, bx
    mov bx, 57fe
    call sub_1bd7_0f72

loc_1bd7_1339:
    pop di
    pop si
    pop bp
    retf 0002
