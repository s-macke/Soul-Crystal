; ========================================
; New Subroutine: sub_1bd7_14e6
; ========================================
sub_1bd7_14e6:
    push bp
    mov bp, sp
    push si
    push di
    mov bx, [bp+6]
    cmp word ptr [bx+2], 00
    jz loc_1bd7_14fa
    jmp loc_1bd7_1621

loc_1bd7_14f7:
    jmp loc_1bd7_161e

loc_1bd7_14fa:
    mov cx, [bp+8]
    mov [bx+8], cx
    mov ax, [bp+a]
    mov [bx+c], ax
    xor ch, ch
    lea si, [bp+c]
    push bx
    xor dx, dx

loc_1bd7_150e:
    lodsw word ptr [si]
    sub ax, [si]
    jl loc_1bd7_14f7
    inc ax
    js loc_1bd7_14f7
    mov [bx+e], ax
    mul dx
    xchg ax, dx
    lodsw word ptr [si]
    mov [bx+10], ax
    sub dx, ax
    add bx, 04
    loop loc_1bd7_150e
    pop bx
    xchg ax, dx
    mul word ptr [bx+c]
    mov [bx+a], ax
    call sub_1bd7_1974
    jb loc_1bd7_14f7
    mov [bx+6], ax
    mov word ptr [bx], 0000
    add byte ptr [bx+9], 02
    jnz loc_1bd7_1569
    cmp dx, 01
    jb loc_1bd7_154c
    ja loc_1bd7_1566
    or ax, ax
    jnz loc_1bd7_1566

loc_1bd7_154c:
    add byte ptr [bx+9], 01
    jnz loc_1bd7_1577
    mov cx, bx
    mov dl, 02
    xchg ax, bx
    call sub_1bd7_464e
    mov bx, cx
    mov [bx+2], ss
    mov [bx], si
    add [bx+a], si
    jmp loc_1bd7_157a

loc_1bd7_1566:
    jmp loc_1bd7_161e

loc_1bd7_1569:
    or dx, dx
    jz loc_1bd7_1577
    call sub_1bd7_15eb
    ja loc_1bd7_1566
    mov [bx], cx
    add [bx+a], cx

loc_1bd7_1577:
    call sub_1bd7_3f73

loc_1bd7_157a:
    mov cx, [bp+8]
    xor ch, ch
    shl cx, 01
    shl cx, 01
    add cx, 06
    mov [6644], cx  ; data_7fc1_6644 word write
    pop di
    pop si
    pop bp
    pop word ptr [6646]  ; data_7fc1_6646 word write
    pop word ptr [6648]  ; data_7fc1_6648 word write
    add sp, [6644]  ; data_7fc1_6644 word readwrite
    jmp far, [6646]
