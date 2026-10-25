; ========================================
; New Subroutine: sub_1bd7_d284
; ========================================
sub_1bd7_d284:
    push bp
    mov bp, sp
    sub sp, 08
    push di
    push si
    mov ds, [bp+a]
    sub ax, ax
    mov [bp-4], ax
    mov [bp-6], ax
    mov [bp-8], ax
    mov ax, [bp+8]

loc_1bd7_d29d:
    mov bx, [bp+8]
    mov si, [bp-4]
    mov al, [bx+si]
    sub ah, ah
    mov [bp-2], ax
    inc word ptr [bp-4]
    cmp ax, 0080
    jge loc_1bd7_d2ec
    inc ax
    or ax, ax
    jle loc_1bd7_d2d7
    mov ax, [bp+c]
    mov dx, [bp+e]
    add ax, [bp-6]
    mov bx, [bp-4]
    add bx, [bp+8]
    mov cx, [bp-2]
    inc cx
    shr cx, 01
    mov di, ax
    mov si, bx
    mov es, dx
    repz movsw
    jae loc_1bd7_d2d7
    movsb

loc_1bd7_d2d7:
    mov ax, [bp-2]
    inc ax
    add [bp-4], ax
    mov ax, [bp-2]
    inc ax
    add [bp-6], ax
    mov ax, [bp-2]
    inc ax
    add [bp-8], ax

loc_1bd7_d2ec:
    cmp word ptr [bp-2], 0080
    jle loc_1bd7_d328
    mov ax, 0101
    sub ax, [bp-2]
    or ax, ax
    jle loc_1bd7_d316
    sub ax, ax
    mov bx, [bp+c]
    mov cx, [bp+e]
    add bx, [bp-6]
    mov dx, cx
    mov cx, 0101
    sub cx, [bp-2]
    mov di, bx
    mov es, dx
    repz stosb

loc_1bd7_d316:
    mov ax, 0101
    sub ax, [bp-2]
    add [bp-6], ax
    mov ax, 0101
    sub ax, [bp-2]
    add [bp-8], ax

loc_1bd7_d328:
    mov ax, [bp+6]
    cmp [bp-8], ax
    jae loc_1bd7_d333
    jmp loc_1bd7_d29d

loc_1bd7_d333:
    mov cx, 7fc1
    mov ds, cx
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
