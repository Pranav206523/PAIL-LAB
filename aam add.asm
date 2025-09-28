global _start

section .data
    val db 0        ; stores units digit
    vah db 0        ; stores tens digit
    newline db 10

section .text
_start:
    ; Load numbers
    mov al, 8
    mov bl, 2
    add al, bl      ; AL = 8 + 2 = 10

    aam             ; AH = tens, AL = units (for BCD display)

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
