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

STR_DSK_ERR_MSG: db "Error reading disk", 0x0a, 0x0d, 0
