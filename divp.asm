global _start

section .text
_start:
    mov ax, 0x30FA     ; Dividend low word
    xor dx, dx         ; Clear DX (high word) for 16-bit division
    mov bx, 0x20BE     ; Divisor
    div bx             ; AX / BX -> quotient in AX, remainder in DX

    ; Exit syscall
    mov eax, 1         ; sys_exit
    int 0x80
