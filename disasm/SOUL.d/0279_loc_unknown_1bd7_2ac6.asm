loc_unknown_1bd7_2ac6:
    mov [6637], ax  ; data_7fc1_6637 word write
    mov al, ah
    push bp
    push si
    push di
    mov ah, 05
    int 10
    pop di
    pop si
    pop bp
    ret
