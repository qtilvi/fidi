.PHONY: all


CC := x86_64-elf-gcc
AS := nasm

CFLAGS 		:= -O2 -g
CDEPFLAGS	:= -MD -MP

CFLAGS	:= $(CDEPFLAGS) $(CFLAGS) -std=gnu23 -ffreestanding -Wall -Wextra --sysroot=$(SYSROOT)
ASFLAGS := -f elf64

#  -nostdlib	-> need to supply memcmp, memset, memcpy and memmove
#  -lgcc		-> docs said to include, so why not
#  -lk			-> libk.a will be in fidi/sysroot/usr/lib/libk.a
LIBS	:= -nostdlib \
		   -lgcc \
		   -lk \

ARCHDIR			:= arch/x86_64

include $(ARCHDIR)/make.config

KERNEL_OBJS := $(KERNEL_ARCH_OBJS) \
			   core/kernel_main.o \

OBJS 		:= $(KERNEL_OBJS) \

LINK_LIST	:= $(KERNEL_OBJS) \
			   $(LIBS) \

all: fidi.kernel

fidi.kernel: $(OBJS) $(ARCHDIR)/linker.ld
	$(CC) -T $(ARCHDIR)/linker.ld $(CFLAGS) $(LINK_LIST) -o $(SYSROOT)/boot/$@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

-include $(OBJS:.o=.d)
