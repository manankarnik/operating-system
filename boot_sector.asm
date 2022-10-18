[org 0x7c00]                    ; Address where boot sector will be loaded

; mov ax, 0x2400                ; Uncomment to disable A20 line
; int 0x15

call test_A20_line              ; Call function
mov dx, ax                      ; Result is stored in ax
call print_hex                  ; Call print_hex function

jmp $                           ; Loop

%include "print.asm"            ; Include print function
%include "print_hex.asm"        ; Include print_hex function
%include "read_disk.asm"        ; Include read_disk function
%include "test_A20_line.asm"    ; Include read_disk function

times 510 - ($ - $$) db 0       ; Padding
dw 0xaa55                       ; Magic number
