section .data

  msg db "Hello world!", 10, 0

section .text
  global _start

_start:
  mov rsi, msg
  mov rcx, 0
  
  .loop :
  mov al, [rsi]
  cmp al, 0
  je .done 

  mov rax, 1
  mov rdi, 1
  mov rsi, rsi
  mov rdx, 1
  syscall


  inc rsi
  inc rcx
  jmp .loop

  .done:
  mov rax, 60
  mov rdi, 0
  syscall


