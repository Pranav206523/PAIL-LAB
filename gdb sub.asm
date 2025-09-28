section .data 
    
	result db 0            
section .bss 
section .text 
	global _start          
_start: 

	mov eax,0x5c
	mov ebx,0x3a
	       

	sub al, bl             

	mov [result], al       

	mov eax, 1             

	xor ebx, ebx           
	int 0x80               
