section .data 
    quotient  db 0
    remainder db 0

section .text 
    global _start          

_start: 
    mov al, 0x5A           
    mov ah, 0x00           
    mov bl, 0x06           

    div bl                 

    mov [quotient], al     
    mov [remainder], ah    

    mov eax, 1             
    xor ebx, ebx          
    int 0x80               
