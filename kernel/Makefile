.PHONY: all clean


CC := x86_64-elf-gcc
AS := nasm

CFLAGS :=-O2 -g

CFLAGS	:= $(CFLAGS) -std=gnu23 -ffreestanding -Wall -Wextra --sysroot=$(SYSROOT)

#  -nostdlib	-> need to supply memcmp, memset, memcpy and memmove
#  -lgcc		-> docs said to include, so why not
#  -lk			-> libk.a will be in fidi/sysroot/usr/lib/libk.a
LIBS	:= -nostdlib \
		   -lgcc \
		   -lk \

ARCHDIR			:= $(CURDIR)/arch/x86_64
ARCHDIR_BOOT	:= $(ARCHDIR)/boot

include $(ARCHDIR)/make.config

KERNEL_OBJS := $(KERNEL_ARCH_OBJS) \
			   core/kernel_main.o \

OBJS 		:= $(KERNEL_OBJS) \

LINK_LIST	:= $(KERNEL_OBJS) \
			   $(LIBS) \

all: fidi.kernel

fidi.kernel: $(OBJS) $(ARCHDIR)/linker.ld
	$(CC) -T $(ARCHDIR)/linker.ld $(CFLAGS) $(KERNEl_OBJS) -o $@

core/kernel_main.o: core/kernel_main.c
	$(CC) $(CFLAGS) -c $< -o $@

$(ARCHDIR)/boot/boot.o: $(ARCHDIR)/boot/boot.asm
	$(AS) -f elf64 $< -o $@

clean:
	rm -f $(OBJS) fidi.kernel
