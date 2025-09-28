section .text
global _start   ; must be declared for linker (ld)

_start:
    mov eax, x      ; load address of array
    mov ebx, 0      ; sum = 0
    mov ecx, 5      ; loop counter (5 elements)

top:
    add bl, [eax]   ; add byte value at [eax] to bl
    inc eax         ; move to next element
    loop top

done:
    ; convert sum (in BL) to ASCII
    add bl, '0'
    mov [sum], bl

display:
    ; print result
    mov edx, 1
    mov ecx, sum
    mov ebx, 1
    mov eax, 4
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

section .data
x: db 1,2,3,1,2      ; array of numbers
newline db 10

section .bss
sum resb 1           ; store result
