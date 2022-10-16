jmp $							;; Loop

times 510 - ($ - $$) db 0       ;; Padding
dw 0xaa55                       ;; Magic number
