ENTRY(_start)

SECTIONS
{
    . = 2M;
    .text BLOCK(4K) : ALIGN(4K)
    {
        *(.multiboot)
        *(.text)
    }
    .rodata BLOCK(4K) : ALIGN(4K)
    {
        *(.rodata)
    }
}
