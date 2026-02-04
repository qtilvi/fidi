section .multiboot
align 8
multiboot2_header_start:
    magic_number dd 0xE85250D6
    architecture dd 0x0 ; 32 bit (protected) mode of i386
    header_length dd 0x16
    checksum dd -(0xE85250D6 + 0x16)
    ; add tags here
    ; end tag
    type dd 0
    size dd 8
multiboot2_header_end:

section .text
;extern kernel_main
global _start
bits 32

initialize_ia_32_mode:
    ; intel sdm vol 3a 11.8.5

_start:
    cli
    ; set up stack
    ; set up paging | intel sdm vol 3a 5.5
    ; call initialize_ia_32_mode
    cli
    hlt

section .bss
align 16
stack_space resb 4096
stack_top:
