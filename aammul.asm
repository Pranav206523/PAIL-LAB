global _start

section .data
    val db 0        ; units digit
    vah db 0        ; tens digit
    newline db 10

section .text
_start:
    ; Load numbers
    mov al, 5
    mov bl, 8
    mul bl          ; AL * BL -> AX

    aam             ; AH = tens, AL = units (BCD adjust)

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
