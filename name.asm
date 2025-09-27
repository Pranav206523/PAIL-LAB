global _start 

section .data
    name1 db "Pranav", 10       ; first name
    length1 equ $-name1

    name2 db "Mishra", 10       ; last name
    length2 equ $-name2

section .text 
_start:
    ; print first name
    mov eax, 4          ; syscall: sys_write
    mov ebx, 1          ; file descriptor: stdout
    mov ecx, name1      ; message to write
    mov edx, length1    ; message length
    int 80h

    ; print last name
    mov eax, 4
    mov ebx, 1
    mov ecx, name2
    mov edx, length2
    int 80h

    ; exit program
    mov eax, 1          ; syscall: sys_exit
    xor ebx, ebx        ; return code = 0
    int 80h
