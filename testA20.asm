;;0x0000-0xffff
;;0x0000-0xf000
;;
;; segment:offset
;; addr = segment * 16 + offset
;; 0xf000:0xfffd
;; = 0xf000 * 16 + 0xfffd
;; = 0xf0000 + 0xfffd
;; = 0xffffd

testA20:
pusha

;; mov ax, [0x7dfe]	;; Magic number location [0x7c00 + 510]
;; mov dx, ax
;; call printh

push bx
mov bx, 0xffff
mov es, bx
pop bx

;; 0xffff0 + offset = 0x107dfe
;; offset = 0x107dfe - 0xffff0
;; offset = 0x7e0e

mov bx, 0x7e0e		;; Magic number location 0x7c00 + 510
mov dx, [es:bx]
call printh

cmp ax, dx
je testA20_continue
popa
mov ax, 1			;; If not equal set ax to 1
ret

testA20_continue:
;; mov ax, [0x7dff]	;; Move one over and print
;; mov dx, ax
;; call printh

push bx
mov bx, 0xffff
mov es, bx
pop bx

;; mov bx, 0x7e0f		;; Segment
;; mov dx, [es:bx]
;; call printh

cmp ax, dx
je testA20_exit
popa
mov ax, 1			;; If not equal set ax to 1
ret

testA20_exit:
popa
xor ax, ax			;; Set ax to 0
ret

