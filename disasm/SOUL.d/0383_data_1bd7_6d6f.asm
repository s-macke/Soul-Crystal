data_1bd7_6d6f:
    db 55, 8b, ec, 16, 1f, e9, 01, a9, 90, 90, 00  ; |U..........|

loc_1bd7_6d7a:
    mov ax, 0002
    jmp loc_1bd7_5d90

entry_1bd7_6d80:
    mov ah, 30
    int 21
    cmp al, 02
    jae loc_1bd7_6d8d
    xor ax, ax
    push es
    push ax
    retf

loc_1bd7_6d8d:
    xchg al, ah
    cmp ax, 020a
    mov al, 04
    jb loc_1bd7_6db4
    mov di, 7fc1
    mov si, [0002]  ; 0ff0:0002 word read
    sub si, di
    cmp si, 1000
    jb loc_1bd7_6da8
    mov si, 1000

loc_1bd7_6da8:
    cli
    mov ss, di
    add sp, 70de
    sti
    jae loc_1bd7_6dc0
    xor ax, ax

loc_1bd7_6db4:
    mov word ptr ss:[6780], 6f92
    jmp loc_1bd7_5d90

data_1bd7_6dbe:
    db 90, 90  ; |..|

loc_1bd7_6dc0:
    mov ax, si
    mov cl, 04
    shl ax, cl
    dec ax
    mov ss:[677c], ax  ; data_7fc1_677c word write
    and sp, fe
    mov ss:[677e], sp  ; data_7fc1_677e word write
    add si, di
    mov [0002], si  ; 0ff0:0002 word write
    mov bx, es
    sub bx, si
    neg bx
    mov ah, 4a
    int 21
    mov ss:[67d6], ds  ; data_7fc1_67d6 word write
    mov ax, [002c]  ; 0ff0:002c word read
    mov ss:[6804], ax  ; data_7fc1_6804 word write
    mov ss:[6802], ds  ; data_7fc1_6802 word write
    mov word ptr ss:[6800], 0081  ; data_7fc1_6800 word write
    push ss
    pop es
    cld
    mov di, 6ea4
    mov cx, 70e0
    sub cx, di
    xor ax, ax
    repz stosb
    push ss
    pop ds
    mov cx, [6e08]  ; data_7fc1_6e08 word read
    jcxz loc_1bd7_6e14
    call cx

loc_1bd7_6e14:
    mov word ptr [6780], 6f1b  ; data_7fc1_6780 word write
    nop
    push cs
    call sub_1bd7_18b6
    xor bp, bp
    nop
    push cs
    call sub_1bd7_6e44
    push ss
    pop ds
    or byte ptr [6839], 01  ; data_7fc1_6839 byte readwrite
    nop
    push cs
    call sub_1bd7_1804
    ret

data_1bd7_6e33:
    db b8, 03, 00, 36, c7, 06, 80, 67, 1b, 6f, e9, 50, ef, 90, 90, c1  ; |...6...g.o.P....|
    db 7f  ; |.|
