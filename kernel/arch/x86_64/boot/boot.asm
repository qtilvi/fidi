section .multiboot
align 8
multiboot2_header_start:
    ; magic fields
    magic_number dd 0xE85250D6
    architecture dd 0x0 ; 32 bit (protected) mode of i386
    header_length dd 0x16
    checksum dd -(0xE85250D6 + 0x16)

    ; tags here

    ; end tag
    type dw 0
    flags dw 0
    size dd 8
multiboot2_header_end:


section .text
bits 32

extern switch_to_lm
global _start

_start:
    cli

    mov esp, stack_top
    xor ebp, ebp

    call reconfigure_pm

    jmp switch_to_lm

reconfigure_pm:
    ; intel sdm vol 3a 11.9.1 | 1. -> 4.

    lgdt [gdt_descriptor]

    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; far JMP, for CS register
    jmp KERNEL_CODE_SEGMENT:finish_reconfigure_pm

finish_reconfigure_pm:
    ; intel sdm vol 3a 11.9.1 | 9.
    mov ax, KERNEL_DATA_SEGMENT
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    ret


section .rodata
gdt_descriptor:
    limit dw gdt_end - gdt_start - 1
    base dd gdt_start

KERNEL_CODE_SEGMENT equ kernel_code_segment_discriptor - gdt_start
KERNEL_DATA_SEGMENT equ kernel_data_segment_discriptor - gdt_start

align 8
gdt_start:
    null_discriptor:
        dd 0
        dd 0
    kernel_code_segment_discriptor:
        dw 0xffff   ; limit1
        dw 0        ; base1
        db 0        ; base2
        db 0x9a     ; access_byte
        db 0xcf     ; limit_flags
        db 0        ; base3
    kernel_data_segment_discriptor:
        dw 0xffff   ; limit1
        dw 0        ; base1
        db 0        ; base2
        db 0x92     ; access_byte
        db 0xcf     ; limit_flags
        db 0        ; base3
gdt_end:

section .bss
align 16
stack_space:
    resb 4096
stack_top:
