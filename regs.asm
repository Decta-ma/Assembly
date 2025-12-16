section .bss
    num resb 2
    
section .text 
    global _start


_start:
    mov rax, 10
    mov rbx, 20
    add rax, rbx

    xor rdx, rdx
    mov rbx, 10
    div rbx

    add rax, '0'
    add rdx, '0'
    mov [num], al
    mov [num+1], dl

    mov rax, 1
    mov rdi, 1
    mov rsi, num
    mov rdx, 2
    syscall

    
    mov rax, 60
    mov rdi, 0
    syscall