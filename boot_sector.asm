[org 0x7c00]                 ; Address where boot sector will be loaded
mov dx, 0x1234               ; Store hex in dx
call print_hex               ; Call print_hex function
jmp $                        ; Loop

%include "print.asm"         ; Include print function
%include "print_hex.asm"     ; Include print_hex function

times 510 - ($ - $$) db 0    ; Padding
dw 0xaa55                    ; Magic number
