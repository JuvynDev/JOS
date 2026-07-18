BITS 32

section .multiboot
align 4
dd 0x1BADB002
dd 0x0
dd -(0x1BADB002)

section .text
global start

start:
    mov edi, 0xb8000
    mov esi, message

print:
    lodsb
    test al, al
    jz halt
    mov [edi], al
    inc edi
    mov byte [edi], 0x07
    inc edi
    jmp print

halt:
    cli
    hlt
    jmp halt

section .data
message db "JOS starting...", 0
