section .bss 
  buf1 resb 2
  buf2 resb 2
  result  resb 2

section .text
  global _start

_start:
  mov rax, 0
  mov rdi, 0
  mov rsi, buf1 
  mov rdx, 2
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, buf2
  mov rdx, 2
  syscall

  movzx rax, byte [buf1]
  sub rax, '0'
  movzx rbx, byte [buf2]
  sub rbx, '0'

  add rax, rbx

  xor rdx, rdx
  mov rcx, 10
  div rcx

  add al, '0'
  add dl, '0'
  mov [result], al 
  mov [result+1], dl

  mov rax, 1
  mov rdi, 1
  mov rsi, result 
  mov rdx, 2
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall
