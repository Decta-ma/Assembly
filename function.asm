section .data 
  msg1 db "hello from function!", 10, 0
  msg1L equ $ - msg1
  msg2 db "this is dynamic length calculation.", 10, 0
  msg2L equ $ - msg2

section .text
  global _start 

_start:
  mov rax, msg1
  call _print_string 

  mov rax, msg2
  call _print_string 

  mov rax, 60
  mov rdi, 0
  syscall

_print_string:
  push rax
  mov rbx, 0
  

  _strlen_loop:
  inc rax
  inc rbx 
  mov cl, [rax]
  cmp cl, 0
  jne _strlen_loop

  mov rax, 1
  mov rdi, 1
  pop rsi
  mov rdx, rbx 
  syscall
  ret