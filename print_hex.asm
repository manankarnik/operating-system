print_hex:
    pusha
    mov cl, 12                    ; Used for bit shift  
    mov di, 2                     ; Used for pattern offset
    mov si, HEX_PATTERN           ; Move pattern in si
.loop:
    mov bx, dx                    ; Move string in bx
    shr bx, cl                    ; Shift right cl bits
    and bx, 0x000f                ; Bit mask
    mov bx, [bx + HEX_TABLE]      ; Move the corresponding char to bx 
    mov [HEX_PATTERN + di], bl    ; Move bl to the pattern
    sub cl, 4
    inc di
    cmp di, 6
    je .break
    jmp .loop
.break:
    call print
    popa
    ret
    
HEX_TABLE: db "0123456789abcdef"
HEX_PATTERN: db "0x0000", 0x0d, 0x0a, 0
