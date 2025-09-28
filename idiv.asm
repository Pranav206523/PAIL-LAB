global _start

section .data
    msg1 db "Enter 1st Value: ", 10
    msg1len equ $- msg1

    msg2 db "Enter 2nd Value: ", 10
    msg2len equ $- msg2

    msg3 db "The Division is: "
    msg3len equ $- msg3

    newline db 10

section .bss
    val1 resb 2
    val2 resb 2
    result resb 2

section .text
_start:
    ; print first message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, msg1len
    int 0x80

    ; read first value
    mov eax, 3
    mov ebx, 0
    mov ecx, val1
    mov edx, 2
    int 0x80

    ; print second message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, msg2len
    int 0x80

    ; read second value
    mov eax, 3
    mov ebx, 0
    mov ecx, val2
    mov edx, 2
    int 0x80

    ; convert ASCII to numeric
    mov al, [val1]
    sub al, '0'
    mov bl, [val2]
    sub bl, '0'

    ; division
    xor ah, ah        ; clear AH for AX = AL
    div bl            ; AX / BL => AL = quotient, AH = remainder

    ; convert quotient to ASCII
    add al, '0'
    mov [result], al

    ; print result message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, msg3len
    int 0x80

    ; print result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
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
