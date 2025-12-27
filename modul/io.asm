section .data
    nl db 10

section .text
global print_number_exit

print_number_exit:
    ; rax = number (0–9)
    add rax, '0'        ; convert to ASCII

    sub rsp, 8
    mov [rsp], al

    mov rax, 1          ; write
    mov rdi, 1          ; stdout
    mov rsi, rsp
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, [rel nl]
    mov rdx, 1
    syscall

    add rsp, 8

    mov rax, 60         ; exit
    xor rdi, rdi
    syscall
