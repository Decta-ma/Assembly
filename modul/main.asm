extern add
extern print_number_exit

section .text
  global _start

_start:

  mov rdi, 5
  mov rsi, 4
  call add 

  call print_number_exit  