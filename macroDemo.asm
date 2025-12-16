%macro exit 0
  mov rax, 60
  mov rdi, 0
  syscall
%endmacro 


%macro print 2
  mov rax, 1
  mov rdi, 1
  mov rsi, %1
  mov rdx, %2
  syscall
%endmacro


section .data 
  text db "Hello Macro World!", 10
  len equ $ - text 

section .text 
  global _start

_start:
  print text, len 

  exit