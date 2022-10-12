printf:
	push ax
	mov ah, 0x0e				;; Move cursor forward

	printf_loop:
		mov al, [si]			;; Move current char pointed by si to al
		cmp al, 0				;; Check if al is 0
		je printf_break				;; If equal break
		int 0x10				;; Write
		inc si					;; Increment si
		jmp printf_loop
	printf_break:
		pop ax
		ret
