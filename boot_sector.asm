[org 0x7c00]                 ;; Address where boot sector will be loaded
mov si, STR                  ;; Store address of string in si
call print                   ;; Call print function
jmp $                        ;; Loop

STR: db "Hello world!", 0    ;; Define string
%include "print.asm"         ;; Include print function

times 510 - ($ - $$) db 0    ;; Padding
dw 0xaa55                    ;; Magic number
