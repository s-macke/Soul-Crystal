; ========================================
; New Subroutine: sub_1bd7_3cef
; ========================================
sub_1bd7_3cef:
    mov [57f4], ax  ; data_7fc1_57f4 word write
    mov cl, 22
    call sub_1bd7_3c7c
    xchg ax, cx
    xor bx, bx
    cmp ax, dc8b
    mov ax, sp
    sub ax, cx
    jb loc_1bd7_3d35
    sub ax, 0012
    jb loc_1bd7_3d35
    cmp ax, [682b]  ; data_7fc1_682b word read
    jb loc_1bd7_3d35
    pop word ptr [57f4]  ; data_7fc1_57f4 word write
    pop word ptr [57f6]  ; data_7fc1_57f6 word write
    xor ax, ax
    push bp
    mov bp, sp
    push word ptr [6847]  ; data_7fc1_6847 word read
    push si
    push di
    push cx
    push ax
    push ax
    push ax
    push ax
    push ax
    sub sp, cx
    mov [6847], bp  ; data_7fc1_6847 word write
    inc word ptr [6849]  ; data_7fc1_6849 word readwrite
    jmp far, [57f4]

loc_1bd7_3d35:
    or bx, bx
    jnz loc_1bd7_3d3e
    push dx
    push word ptr [57f4]

loc_1bd7_3d3e:
    push bp
    mov bp, sp
    jmp loc_1bd7_168d
