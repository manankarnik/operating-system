test_A20_line:
    pusha

    mov ax, [0x7dfe]    ; Memory location of 0xaa55 (0x7c00 + 510)


    push bx
    mov bx, 0xffff
    mov es, bx          ; Set es to 0xffff
    pop bx
    
    mov bx, 0x7e0e      ; 0x107cdfe = 0xffff0 + offset
    mov dx, [es:bx]     ; Offset = 0x107cdfe - 0xffff0 = 0x7e0e

    cmp ax, dx          ; If equal, test next byte
    je .continue
    popa
    mov ax, 1           ; If not, A20 line is enabled
    ret

.continue
    mov ax, [0x7dff]    ; Next byte 

    mov bx, 0x7e0f      ; Next byte offset
    mov dx, [es:bx]     ; Segment address

    cmp ax, dx          ; If equal, A20 line is disabled
    je .exit
    popa
    mov ax, 1           ; If not, A20 line is enabled
    ret

.exit
    popa
    xor ax, ax          ; Set ax to 0
    ret
