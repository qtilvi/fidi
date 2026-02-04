.PHONY: all qemu iso build libc kernel clean


all: qemu

qemu: iso
	qemu-system-x86_64 -cdrom fidi.iso

iso: build
	mkdir -p isodir/boot/grub
	cp sysroot/boot/fidi.kernel isodir/boot/fidi.kernel
	cp kernel/arch/x86_64/grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o fidi.iso isodir

build: libc kernel

libc:
	mkdir -p build/libc/
	$(MAKE) -C libc all BUILDDIR=$(CURDIR)/build/libc SYSROOT=$(CURDIR)/sysroot

kernel:
	mkdir -p build/kernel/
	$(MAKE) -C kernel all BUILDDIR=$(CURDIR)/build/kernel SYSROOT=$(CURDIR)/sysroot

clean:
	rm -f fidi.iso
	rm -rf build/
	rm -rf isodir/
	rm -rf sysroot/
