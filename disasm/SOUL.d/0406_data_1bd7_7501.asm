data_1bd7_7501:
    db 90  ; |.|

loc_1bd7_7502:
    and byte ptr [si+a], ef
    cmp word ptr [bp+e], 01
    jnz loc_1bd7_7521
    push ds
    push si
    nop
    push cs
    call sub_1bd7_83a4
    add sp, 04
    add [bp+a], ax
    adc [bp+c], dx
    mov word ptr [bp+e], 0000

loc_1bd7_7521:
    push ds
    push si
    nop
    push cs
    call sub_1bd7_7a2e
    add sp, 04
    add byte ptr [si+a], 80
    jz loc_1bd7_7535
    and byte ptr [si+a], fc

loc_1bd7_7535:
    push word ptr [bp+e]
    push word ptr [bp+c]
    push word ptr [bp+a]
    mov al, [si+b]
    sub ah, ah
    push ax
    nop
    push cs
    call sub_1bd7_806a
    add sp, 08
    cmp ax, ffff
    jnz loc_1bd7_755a
    cmp dx, ax
    jnz loc_1bd7_755a

loc_1bd7_7555:
    mov ax, ffff
    jmp loc_1bd7_755c

loc_1bd7_755a:
    sub ax, ax

loc_1bd7_755c:
    pop si
    mov sp, bp
    pop bp
    retf

data_1bd7_7561:
    db 90  ; |.|
