global _start

section .text
_start:
    mov ax, 0x595B      ; Load 0x595B into AX
    mov bx, 0x30FA      ; Load 0x30FA into BX
    sub ax, bx          ; AX = AX - BX

    ; Exit syscall
    mov eax, 1          ; sys_exit
    int 0x80
