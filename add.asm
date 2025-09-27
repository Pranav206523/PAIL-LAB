global _start 

section .data
    sum db 0           ; reserve 1 byte for result

section .text
_start:
    mov al, 8          ; first number
    add al, 1          ; add second number
    add al, '0'        ; convert to ASCII
    mov [sum], al      ; store result in memory

    mov edx, 1         ; message length = 1 byte
    mov ecx, sum       ; address of message
    mov ebx, 1         ; stdout
    mov eax, 4         ; sys_write
    int 0x80

    mov eax, 1         ; sys_exit
    xor ebx, ebx       ; return code 0
    int 0x80
