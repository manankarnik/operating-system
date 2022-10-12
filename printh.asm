printh:
mov si, HEX_PATTERN
mov bx, dx
shr bx, 12					;; Shift right 12 bits
mov bx, [bx + HEX_TABLE]	;; Convert ASCII to HEX
mov [HEX_PATTERN + 2], bl	;; Move bl to HEX_PATTERN

mov bx, dx
shr bx, 8					;; Shift right 8 bits
and bx, 0x000f				;; Make all bits 0 except last 4
mov bx, [bx + HEX_TABLE]
mov [HEX_PATTERN + 3], bl

mov bx, dx
shr bx, 4					;; Shift right 4 bits
and bx, 0x000f				;; Make all bits 0 except last 4
mov bx, [bx + HEX_TABLE]
mov [HEX_PATTERN + 4], bl

mov bx, dx
and bx, 0x000f				;; Make all bits 0 except last 4
mov bx, [bx + HEX_TABLE]
mov [HEX_PATTERN + 5], bl

call printf
ret

HEX_PATTERN: db "0x****", 0x0a, 0x0d, 0
HEX_TABLE: db "0123456789abcdef"
