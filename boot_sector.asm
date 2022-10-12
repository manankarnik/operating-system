[org 0x7c00]			;; Specify load address

mov si, STR				;; Put string in si
call printf

jmp $					;; Loop

printf:
	push ax
	mov ah, 0x0e		;; Move cursor forward

	loop:
		mov al, [si]	;; Move current char pointed by si to al
		cmp al, 0		;; Check if al is 0
		je break		;; If equal break
		int 0x10		;; Write
		inc si			;; Increment si
		jmp loop
	break:
		pop ax
		ret

STR: db "Hello World!", 0

;; Padding and magic number
times 510 - ($ - $$) db 0
dw 0xaa55

