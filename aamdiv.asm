global _start

section .data
    val db 0        ; units digit
    vah db 0        ; tens digit
    newline db 10

section .text
_start:
    ; Load numbers
    mov al, 8
    mov bl, 2
    xor ah, ah       ; clear AH before 8-bit division
    div bl           ; AL = quotient, AH = remainder

    aam              ; convert AL into BCD (AH = tens, AL = units)

    ; Convert to ASCII
    add al, '0'
    mov [val], al
    add ah, '0'
    mov [vah], ah

    ; Print tens digit
    mov eax, 4
    mov ebx, 1
    mov ecx, vah
    mov edx, 1
    int 0x80

    ; Print units digit
    mov eax, 4
    mov ebx, 1
    mov ecx, val
    mov edx, 1
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
