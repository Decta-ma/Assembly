section .data 
    msg db "resualt is : ", 0
    msgL equ $ - msg

section .bss
    num resb 2

section .text
    global _start 

_start:
    mov rax, 1
    mov rdi, 1
    mov 