section .data
    ; No data needed for this simple example

section .text
    global _start

_start:
    ; --- Addition ---
    ; eax = 25
    ; ebx = 10
    ; eax = eax + ebx (result is 35)
    mov eax, 25
    mov ebx, 10
    add eax, ebx

    ; --- Subtraction ---
    ; eax = 50
    ; ebx = 15
    ; eax = eax - ebx (result is 35)
    mov eax, 50
    mov ebx, 15
    sub eax, ebx

    ; --- Multiplication ---
    ; eax = 12
    ; ebx = 5
    ; eax = eax * ebx (result is 60)
    mov eax, 12
    mov ebx, 5
    imul ebx

    ; --- Division ---
    ; edx must be cleared for 32-bit division
    ; eax = 100
    ; ebx = 25
    ; eax = eax / ebx (quotient is 4)
    ; edx = remainder (0)
    xor edx, edx
    mov eax, 100
    mov ebx, 25
    div ebx

    ; --- Exit the program ---
    ; syscall number for exit (32-bit Linux)
    mov eax, 1
    ; exit code
    mov ebx, 0
    ; Execute the system call
    int 0x80
