section .bss 
  digitSpace resb 100
  digitSpacePos resb 8

section .text
  global _start

_start:

  mov rax, 123456789
  call _printRAX
  
  mov rax, 60
  mov rdi, 0
  syscall

_printRAX:
  mov rcx, digitSpace
  mov rbx, 10
  mov [rcx], rbx
  inc rcx
  mov [digitSpacePos], rcx

_pritntRAXLoop:
  xor rdx, rdx
  div rbx
  add rdx, 48

  mov rcx, [digitSpacePos]
  mov [rcx], dl
  inc rcx
  mov [digitSpacePos], rcx

  cmp rax, 0
  jne _pritntRAXLoop

_printRAXLoop2:
  mov rcx, [digitSpacePos]

  dec rcx
  mov [digitSpacePos], rcx

  cmp rcx, digitSpace      
  jle _donePrinting 
  
  mov rax, 1
  mov rdi, 1
  mov rsi, rcx 
  mov rdx, 1
  syscall

  jmp _printRAXLoop2

_donePrinting:
  ret