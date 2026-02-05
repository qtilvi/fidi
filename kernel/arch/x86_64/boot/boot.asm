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

reconfigure_pm:
    ; intel sdm vol 3a 11.9.1
    cli

    ; laod gdtr with base of gdt
    lgdt [gdt_descriptor]

    ; with a MOV CR0 instruction, set PE (opt. PG) flag in control register CR0
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; execute a far JMP instruction
    jmp KERNEL_CODE_SEGMENT:finish_reconfigure_pm

finish_reconfigure_pm:
    ; reload segment registers DS, SS, ES, FS, and GS. load segment registers ES, FS, and GS with a null selector
    ; maybe need to do idt stuff, I'm gonna not and see if that works
    jmp switch_to_lm

_start:
    cli

    jmp reconfigure_pm


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
