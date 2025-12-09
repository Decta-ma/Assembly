section .bss
  buf1 resb 3
  buf2 resb 3

section .text 
  global _start 

_start:
  mov rax, 0
  mov rdi, 0
  mov rsi, buf1
  mov rdx, 3
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, buf2
  mov rdx, 3
  syscall

  movzx rax, byte [buf1]
  sub rax, '0'
  movzx rbx, byte [buf2]
  sub rbx, '0'

  add rax, rbx

  add al, '0'
  mov [buf1], al

  mov rax, 1
  mov rdi, 1
  mov rsi, buf1
  mov rdx, 1
  syscall 

  mov rax, 60
  mov rdi, 0

  syscall

