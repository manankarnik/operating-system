print:
	push ax
	mov ah, 0x0e    ; Scrolling teletype BIOS routine 
print_loop:
	mov al, [si]    ; Character to be printed (Address stored in si)
	cmp al, 0       ; Break if 0
	je print_break
	int 0x10        ; Video display functions interrupt
	inc si
	jmp print_loop
print_break:
	pop ax
	ret
