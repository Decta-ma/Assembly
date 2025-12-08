section .data 
    msg db "Enter SomeThing : ", 0
    msg_len equ $ - msg 

section .bss
    buffer resb 64 

section .text 
    global _start

_start:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, msg_len
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, buffer
  mov rdx, 64
  syscall

  mov rdi, 1
  mov rsi, buffer
  mov rdx, rax
  mov rax, 1
  syscall

  mov rax, 60
  mov rdi, 0
  syscall
