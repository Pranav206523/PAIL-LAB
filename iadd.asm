global _start

section .data
    msg1 db "Enter 1st Value: ", 10
    msg1len equ $- msg1

    msg2 db "Enter 2nd Value: ", 10
    msg2len equ $- msg2

    msg3 db "The addition is: "
    msg3len equ $- msg3

    newline db 10

section .bss
    val1 resb 2       ; store input for 1st number (1 char + newline)
    val2 resb 2       ; store input for 2nd number (1 char + newline)
    result resb 2     ; store 2-digit result

section .text
_start:
    ; print msg1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, msg1len
    int 0x80

    ; read val1
    mov eax, 3
    mov ebx, 0
    mov ecx, val1
    mov edx, 2
    int 0x80

    ; print msg2
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, msg2len
    int 0x80

    ; read val2
    mov eax, 3
    mov ebx, 0
    mov ecx, val2
    mov edx, 2
    int 0x80

    ; convert ASCII to integer
    mov al, [val1]
    sub al, '0'        ; AL = val1 numeric
    mov bl, [val2]
    sub bl, '0'        ; BL = val2 numeric

    ; add
    add al, bl         ; AL = val1 + val2

    ; divide by 10 to get quotient (tens) and remainder (units)
    mov ah, 0
    mov bl, 10
    div bl             ; AL = quotient, AH = remainder

    ; store result as ASCII
    add al, '0'
    mov [result], al
    add ah, '0'
    mov [result+1], ah

    ; print msg3
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, msg3len
    int 0x80

    ; print result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 0x80

    ; print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
