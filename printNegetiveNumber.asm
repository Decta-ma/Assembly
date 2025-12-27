section .bss
    buf resb 2        ; برای '-' و رقم (یا فقط رقم)

section .text
    global _start

_start:
    ; -----------------------
    ; خواندن ورودی
    ; -----------------------
    mov rax, 0        ; sys_read
    mov rdi, 0        ; stdin
    mov rsi, buf
    mov rdx, 2
    syscall

    ; -----------------------
    ; بررسی منفی بودن
    ; -----------------------
    mov al, [buf]
    cmp al, '-'
    jne positive

    ; ----- عدد منفی -----
    ; چاپ '-'
    mov rax, 1        ; sys_write
    mov rdi, 1        ; stdout
    mov rsi, buf
    mov rdx, 1
    syscall

    ; چاپ رقم
    mov rax, 1
    mov rdi, 1
    lea rsi, [buf + 1]
    mov rdx, 1
    syscall
    jmp exit

positive:
    ; ----- عدد مثبت -----
    mov rax, 1
    mov rdi, 1
    mov rsi, buf
    mov rdx, 1
    syscall

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
