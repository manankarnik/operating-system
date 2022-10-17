read_disk:
    pusha
    mov dx, ax
    push dx
    mov ah, 0x02            ; Read in CHS mode
    mov dl, 0x80            ; Read from hard disk
    mov ch, 0               ; Cylinder
    mov dh, 0               ; Head

    push bx
    mov bx, 0
    mov es, bx              ; Set ex to 0
    pop bx
    mov bx, 0x7e00          ; 0x7c00 + 0x0200 (512)

    int 0x13                ; Read
    jc .disk_err            ; Jump if carry flag is set
    
    pop dx
    cmp al, dl              ; Jump if sectors to be read != actual sectors read
    jne .disk_err
    popa
    ret

.disk_err:
    mov si, DISK_ERR_MSG    ; Move error message to si
    call print              ; Call print function
    popa
    ret

DISK_ERR_MSG: db "Disk error!", 0


