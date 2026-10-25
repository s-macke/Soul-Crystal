; ========================================
; New Subroutine: sub_1bd7_806a
; ========================================
sub_1bd7_806a:
    push bp
    mov bp, sp
    sub sp, 04
    mov bx, [bp+6]
    cmp bx, [67dd]  ; data_7fc1_67dd word read
    jb loc_1bd7_807e
    mov ax, 0900
    jmp loc_1bd7_80a8

loc_1bd7_807e:
    add word ptr [bp+a], 8000
    jz loc_1bd7_80cd
    cmp word ptr [bp+c], 00
    jz loc_1bd7_80a5
    xor cx, cx
    mov dx, cx
    mov ax, 4201
    int 21
    jb loc_1bd7_80e1
    add word ptr [bp+c], 0002
    jnz loc_1bd7_80ab
    add ax, [bp+8]
    adc dx, [bp+a]
    jns loc_1bd7_80cd

loc_1bd7_80a5:
    mov ax, 1600

loc_1bd7_80a8:
    stc
    jmp loc_1bd7_80e1

loc_1bd7_80ab:
    mov [bp-2], dx
    mov [bp-4], ax
    mov dx, cx
    mov ax, 4202
    int 21
    add ax, [bp+8]
    adc dx, [bp+a]
    jns loc_1bd7_80cd
    mov cx, [bp-2]
    mov dx, [bp-4]
    mov ax, 4200
    int 21
    jmp loc_1bd7_80a5

loc_1bd7_80cd:
    mov dx, [bp+8]
    mov cx, [bp+a]
    mov al, [bp+c]
    mov ah, 42
    int 21
    jb loc_1bd7_80e1
    and byte ptr [bx+67df], fd

loc_1bd7_80e1:
    jmp loc_1bd7_7735
