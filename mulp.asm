global _start:
section .text
_start:
	mov ax , 30FAH
	mov bx , 595BH
	mul bx
