mov ah, 0x0e
mov al, 'A'
int 0x010

jmp $

;; Padding and magic number
times 510 - ($ - $$) db 0
dw 0xaa55

