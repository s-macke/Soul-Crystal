data_1bd7_7991:
    db 90  ; |.|

loc_1bd7_7992:
    mov si, 0301

loc_1bd7_7995:
    mov byte ptr [bp-4], 02
    jmp loc_1bd7_7960

data_1bd7_799b:
    db 90  ; |.|

loc_1bd7_799c:
    mov si, 0109
    jmp loc_1bd7_7995

data_1bd7_79a1:
    db 90  ; |.|

loc_1bd7_79a2:
    add si, 0002
    jnz loc_1bd7_798a
    or si, 02
    and si, fe
    mov byte ptr [bp-4], 80
    jmp loc_1bd7_7965

loc_1bd7_79b4:
    add si, c000
    jnz loc_1bd7_798a
    or si, 4000
    jmp loc_1bd7_7965

loc_1bd7_79c0:
    add si, c000
    jnz loc_1bd7_798a
    or si, 8000
    jmp loc_1bd7_7965

loc_1bd7_79cc:
    mov ax, 01a4
    push ax
    push word ptr [bp+e]
    push si
    push word ptr [bp+8]
    push word ptr [bp+6]
    nop
    push cs
    call sub_1bd7_859a
    add sp, 0a
    mov [bp-6], ax
    or ax, ax
    jge loc_1bd7_79ec
    jmp loc_1bd7_7954

loc_1bd7_79ec:
    inc word ptr [6d92]  ; data_7fc1_6d92 word readwrite
    mov di, [bp+10]
    mov ax, di
    sub ax, 6b4c
    add ax, 6c3c
    mov [bp-8], ax
    mov al, [bp-4]
    mov [di+a], al
    mov bx, [bp-8]
    mov byte ptr [bx], 00
    sub ax, ax
    mov [di+4], ax
    mov [bx+4], ax
    mov [di+2], ax
    mov [di], ax
    mov [di+8], ax
    mov [di+6], ax
    mov al, [bp-6]
    mov [di+b], al
    mov ax, di
    mov dx, ds

loc_1bd7_7a27:
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_7a2d:
    db 90  ; |.|
