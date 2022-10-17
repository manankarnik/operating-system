[org 0x7c00]                 ; Address where boot sector will be loaded
mov al, 2                    ; Number of sectors to read
mov cl, 2                    ; Read 2nd sector
call read_disk               ; Call read_disk function

mov si, STR                  ; Store address of string in si
call print                   ; Call print function
jmp $                        ; Loop

%include "print.asm"         ; Include print function
%include "print_hex.asm"     ; Include print_hex function
%include "read_disk.asm"     ; Include read_disk function

times 510 - ($ - $$) db 0    ; Padding
dw 0xaa55                    ; Magic number

STR: db "String in second sector", 0x0a, 0x0d, 0
times 512 db 0
