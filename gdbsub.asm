section .data 
    
	result db 0            
section .bss 
section .text 
	global _start          
_start: 

	mov eax,0x5A
	mov ebx,0x6B         

	mul  bl             

	mov [result], al       

	mov eax, 1             

	xor ebx, ebx           
	int 0x80               
