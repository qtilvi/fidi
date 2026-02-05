.PHONY: all


CC := x86_64-elf-gcc
AS := nasm

CFLAGS 		:= -O2 -g
CDEPFLAGS	:= -MD -MP

CFLAGS	:= $(CDEPFLAGS) $(CFLAGS) -std=gnu23 -ffreestanding -Wall -Wextra --sysroot=$(SYSROOT)
ASFLAGS := -f elf64

LIBS	:= -nostdlib \
		   -lgcc \
		   -lk \

ARCHDIR		:= arch/x86_64

include $(ARCHDIR)/make.config

KERNEL_OBJS := $(KERNEL_ARCH_OBJS) \
			   core/kernel_main.o \

OBJS 		:= $(KERNEL_OBJS) \

LINK_LIST	:= $(foreach obj,$(KERNEL_OBJS),$(BUILDDIR)/$(obj)) $(LIBS)

all: fidi.kernel

fidi.kernel: $(KERNEL_OBJS) $(ARCHDIR)/linker.ld
	mkdir -p $(SYSROOT)/boot/
	$(CC) -T $(ARCHDIR)/linker.ld $(CFLAGS) $(LINK_LIST) -o $(SYSROOT)/boot/$@

%.o: %.c
	mkdir -p $(dir $(BUILDDIR)/$@)
	$(CC) $(CFLAGS) -c $< -o $(BUILDDIR)/$@

%.o: %.asm
	mkdir -p $(dir $(BUILDDIR)/$@)
	$(AS) $(ASFLAGS) $< -o $(BUILDDIR)/$@

-include $(OBJS:.o=.d)
