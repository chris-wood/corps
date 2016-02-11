global loader

MAGIC_NUMBER equ 0x1BADB002
FLAGS        equ 0x0
CHECKSUM     equ -MAGIC_NUMBER

KERNEL_STACK_SIZE equ 4096 ; size of the stack in 4 bytes

section .text:
align 4
    dd MAGIC_NUMBER
    dd FLAGS
    dd CHECKSUM

section .bss:
align 4 
kernel_stack:
    resb KERNEL_STACK_SIZE ; reserve stack for the kernel
    mov esp, kernel_stack + KERNEL_STACK_SIZE ; point esp to the start of the stack (end of memory -- it grows down in size)

loader:
    mov eax, 0xCAFEBABE
.loop:
    jmp .loop
