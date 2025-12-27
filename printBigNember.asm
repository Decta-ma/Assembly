section .bss 
  digitSpace resb 100
  digitSpacePos resb 8

section .text
  global _start

_start:
  mov rax, 123456789
  call _printRAX

  ; چاپ یک newline در انتها
  mov rax, 1
  mov rdi, 1
  mov rsi, newline
  mov rdx, 1
  syscall

  mov rax, 60
  mov rdi, 0
  syscall

section .data
  newline db 10   ; کاراکتر خط جدید

_printRAX:
  mov rcx, digitSpace     ; rcx = آدرس ابتدای بافر
  mov rbx, 10             ; مبنای ۱۰
  mov [rcx], byte 10      ; نگهبان: newline در ابتدای بافر (که بعداً آخر رشته می‌شود)
  inc rcx
  mov [digitSpacePos], rcx

_printRAXLoop:
  xor rdx, rdx
  div rbx                 ; rdx = رقم یکان
  add dl, '0'             ; تبدیل به ASCII

  mov rcx, [digitSpacePos]
  mov [rcx], dl
  inc rcx
  mov [digitSpacePos], rcx

  test rax, rax           ; یا cmp rax, 0
  jnz _printRAXLoop

_printRAXLoop2:
  mov rcx, [digitSpacePos]
  dec rcx
  mov [digitSpacePos], rcx

  cmp rcx, digitSpace
  jbe _donePrinting       ; jle یا jbe (زیرا برابر هم باید تمام شود)

  mov rax, 1
  mov rdi, 1
  mov rsi, rcx
  mov rdx, 1
  syscall

  jmp _printRAXLoop2

_donePrinting:
  ret