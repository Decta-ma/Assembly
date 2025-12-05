section .data 
    msg db "Enter SomeThing : ", 0
    msg_len equ $ - msg 

section .bss
    buffer resb 64 

section .text 
    global _start

_start 

