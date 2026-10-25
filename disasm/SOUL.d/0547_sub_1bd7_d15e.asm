; ========================================
; New Subroutine: sub_1bd7_d15e
; ========================================
sub_1bd7_d15e:
    push bp
    mov bp, sp
    sub sp, 1a
    push di
    push si
    mov di, [bp+8]
    sub ax, ax
    mov [bp-10], ax
    or di, di
    jnz loc_1bd7_d175
    jmp loc_1bd7_d27e

loc_1bd7_d175:
    sub bx, bx
    mov si, 0c6c
    mov es, [6e86]
    mov [bp-1a], si
    mov [bp-18], es
    mov ax, es:[si]
    mul word ptr [bp+6]
    mov [bp-14], ax
    mov [bp-12], di

loc_1bd7_d190:
    mov word ptr [bp-a], 0000
    les si, [bp-1a]
    cmp word ptr es:[si], 00
    jnz loc_1bd7_d1a1
    jmp loc_1bd7_d273

loc_1bd7_d1a1:
    mov [bp-8], bx
    mov ax, [bp+6]
    mov [bp-c], ax
    mov [bp-e], bx

loc_1bd7_d1ad:
    mov ax, [bp-8]
    mov [bp-4], ax
    mov word ptr [bp-6], 0000
    mov ds, [bp+c]

loc_1bd7_d1bb:
    mov bx, [bp+a]
    mov si, [bp-10]
    mov al, [bx+si]
    sub ah, ah
    mov [bp-2], ax
    inc word ptr [bp-10]
    cmp ax, 0080
    jge loc_1bd7_d205
    inc ax
    or ax, ax
    jle loc_1bd7_d1f0
    les bx, [bp+e]
    mov si, [bp-4]
    mov ax, [bp-10]
    add ax, [bp+a]
    mov cx, [bp-2]
    inc cx
    shr cx, 01
    lea di, [bx+si]
    mov si, ax
    repz movsw
    jae loc_1bd7_d1f0
    movsb

loc_1bd7_d1f0:
    mov ax, [bp-2]
    inc ax
    add [bp-10], ax
    mov ax, [bp-2]
    inc ax
    add [bp-4], ax
    mov ax, [bp-2]
    inc ax
    add [bp-6], ax

loc_1bd7_d205:
    cmp word ptr [bp-2], 0080
    jle loc_1bd7_d249
    mov bx, [bp+a]
    add bx, [bp-10]
    mov bl, [bx]
    sub bh, bh
    inc word ptr [bp-10]
    mov ax, 0101
    sub ax, [bp-2]
    or ax, ax
    jle loc_1bd7_d237
    mov ax, bx
    sub ah, ah
    les bx, [bp+e]
    mov si, [bp-4]
    mov cx, 0101
    sub cx, [bp-2]
    lea di, [bx+si]
    repz stosb

loc_1bd7_d237:
    mov ax, 0101
    sub ax, [bp-2]
    add [bp-4], ax
    mov ax, 0101
    sub ax, [bp-2]
    add [bp-6], ax

loc_1bd7_d249:
    mov ax, [bp-6]
    cmp [bp+6], ax
    jbe loc_1bd7_d254
    jmp loc_1bd7_d1bb

loc_1bd7_d254:
    mov ax, 7fc1
    mov ds, ax
    mov ax, [bp-c]
    add [bp-8], ax
    les bx, [bp-1a]
    inc word ptr [bp-a]
    mov ax, [bp-a]
    cmp es:[bx], ax
    jbe loc_1bd7_d270
    jmp loc_1bd7_d1ad

loc_1bd7_d270:
    mov bx, [bp-e]

loc_1bd7_d273:
    add bx, [bp-14]
    dec word ptr [bp-12]
    jz loc_1bd7_d27e
    jmp loc_1bd7_d190

loc_1bd7_d27e:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf
