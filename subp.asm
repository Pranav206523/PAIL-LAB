global _start:
section .text
_start:
	mov ax , 595BH
	MOV bx , 30FAH
	sub ax, bx
