[org 0x7c00]					;; Specify load address
[bits 16]

section .text
	global start

start:
mov si, STR						;; Put string in si
call printf

mov al, 1						;; Number of sectors to read
mov cl, 2						;; Sector
call readDisk
jmp second_sector

jmp $							;; Loop

%include "./printf.asm"
%include "./read_disk.asm"

STR: db "Hello World!", 0x0a, 0x0d, 0
STR_TEST: db "String loaded from second sector", 0x0a, 0x0d, 0 

;; Padding and magic number
times 510 - ($ - $$) db 0
dw 0xaa55

;; Second sector
second_sector:
	mov si, STR_TEST
	call printf
	times 152 db 0
