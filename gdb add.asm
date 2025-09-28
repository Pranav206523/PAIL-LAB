section .data 
    
	result db 0            
section .bss 
section .text 
	global _start          
_start: 

	mov eax,0x2A
	mov ebx,0x3B         

	add al, bl             

	mov [result], al       

	mov eax, 1             

	xor ebx, ebx           
	int 0x80               

