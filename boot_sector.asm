mov ah, 0x0e                 ; Scrolling teletype BIOS routine 
mov al, 'A'                  ; Character to be printed
int 0x10                     ; Video display functions interrupt

jmp $                        ; Loop

times 510 - ($ - $$) db 0    ; Padding
dw 0xaa55                    ; Magic number
