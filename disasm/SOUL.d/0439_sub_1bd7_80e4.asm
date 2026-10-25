; ========================================
; New Subroutine: sub_1bd7_80e4
; ========================================
sub_1bd7_80e4:
    push bp
    mov bp, sp
    sub sp, 02
    mov bx, [bp+6]
    cmp bx, [67dd]  ; data_7fc1_67dd word read
    jb loc_1bd7_80f9
    stc
    mov ax, 0900
    jmp loc_1bd7_816c

loc_1bd7_80f9:
    xor ax, ax
    mov cx, [bp+c]
    jcxz loc_1bd7_816c
    add byte ptr [bx+67df], 02
    jnz loc_1bd7_816c
    cmp word ptr [6e0a], d6d6  ; data_7fc1_6e0a word read
    jnz loc_1bd7_8113
    call word ptr [6e0c]

loc_1bd7_8113:
    mov cx, [bp+c]
    push ds
    lds dx, [bp+8]
    mov ah, 3f
    int 21
    pop ds
    jae loc_1bd7_8125
    mov ah, 09
    jmp loc_1bd7_816c

loc_1bd7_8125:
    add byte ptr [bx+67df], 80
    jz loc_1bd7_816c
    and byte ptr [bx+67df], fb
    push si
    push di
    push ds
    pop es
    mov ds, [bp+a]
    cld
    mov si, dx
    mov di, dx
    mov cx, ax
    jcxz loc_1bd7_8168
    mov ah, 0d
    cmp byte ptr [si], 0a
    jnz loc_1bd7_814e
    or byte ptr es:[bx+67df], 04

loc_1bd7_814e:
    lodsb byte ptr [si]
    cmp al, ah
    jz loc_1bd7_816f
    cmp al, 1a
    jnz loc_1bd7_815f
    or byte ptr es:[bx+67df], 02
    jmp loc_1bd7_8164

loc_1bd7_815f:
    mov [di], al
    inc di

loc_1bd7_8162:
    loop loc_1bd7_814e

loc_1bd7_8164:
    mov ax, di
    sub ax, dx

loc_1bd7_8168:
    push es
    pop ds

loc_1bd7_816a:
    pop di
    pop si

loc_1bd7_816c:
    jmp loc_1bd7_7735

loc_1bd7_816f:
    cmp cx, 01
    jz loc_1bd7_817b
    cmp byte ptr [si], 0a
    jz loc_1bd7_8162
    jmp loc_1bd7_815f

loc_1bd7_817b:
    push es
    pop ds
    add byte ptr [bx+67df], 40
    jz loc_1bd7_81a0
    mov ax, 4400
    int 21
    add dx, 0020
    jnz loc_1bd7_819c
    push ds
    push ss
    pop ds
    lea dx, [bp-1]
    mov ah, 3f
    int 21
    pop ds
    jb loc_1bd7_816a

loc_1bd7_819c:
    mov al, 0a
    jmp loc_1bd7_81d0

loc_1bd7_81a0:
    push ds
    push ss
    pop ds
    mov byte ptr [bp-1], 00
    lea dx, [bp-1]
    mov ah, 3f
    int 21
    pop ds
    jb loc_1bd7_816a
    or ax, ax
    jz loc_1bd7_81ce
    cmp word ptr [bp+c], 01
    jz loc_1bd7_81da

loc_1bd7_81bb:
    mov cx, ffff
    mov dx, cx
    mov ax, 4201
    int 21
    mov cx, 0001
    cmp byte ptr [bp-1], 0a
    jz loc_1bd7_81d5

loc_1bd7_81ce:
    mov al, 0d

loc_1bd7_81d0:
    lds dx, [bp+8]
    jmp loc_1bd7_815f

loc_1bd7_81d5:
    lds dx, [bp+8]
    jmp loc_1bd7_8162

loc_1bd7_81da:
    cmp byte ptr [bp-1], 0a
    jnz loc_1bd7_81bb
    jmp loc_1bd7_819c
