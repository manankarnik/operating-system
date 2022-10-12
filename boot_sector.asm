[org 0x7c00]					;; Specify load address

mov si, STR						;; Put string in si
call printf

mov al, 1						;; Number of sectors to read
mov cl, 2						;; Sector
call readDisk
jmp second_sector

jmp $							;; Loop

printf:
	push ax
	mov ah, 0x0e				;; Move cursor forward

	loop:
		mov al, [si]			;; Move current char pointed by si to al
		cmp al, 0				;; Check if al is 0
		je break				;; If equal break
		int 0x10				;; Write
		inc si					;; Increment si
		jmp loop
	break:
		pop ax
		ret

readDisk:
	pusha
	mov ah, 0x02
	mov ch, 0					;; Cylinder
	mov dh, 0					;; Head
	mov dl, 0x80				;; Read from hard disk

	push bx
	mov bx, 0					;; Reset memory address
	mov es, bx					;; Move address to es
	pop bx
	mov bx, 0x7c00 + 512		;; Offset bx by 512 bytes

	int 0x13					;; Read

	jc disk_err					;; Jump if carry flag set
	popa
	ret

disk_err:						;; Print error message
	mov si, STR_DSK_ERR_MSG
	call printf
	jmp $
	

STR: db "Hello World!", 0x0a, 0x0d, 0
STR_TEST: db "String loaded from second sector", 0x0a, 0x0d, 0 
STR_DSK_ERR_MSG: db "Error reading disk", 0x0a, 0x0d, 0


;; Padding and magic number
times 510 - ($ - $$) db 0
dw 0xaa55

;; Second sector
second_sector:
	mov si, STR_TEST
	call printf
	times 152 db 0
