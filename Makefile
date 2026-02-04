.PHONY: all clean build iso qemu


all: qemu

qemu: fidi.iso
	qemu-system-x86_64 -cdrom fidi.iso

fidi.iso: build
	mkdir -p isodir/boot/grub
	cp sysroot/boot/fidi.kernel isodir/boot/fidi.kernel
	cp kernel/arch/x86_64/grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o fidi.iso isodir

build: fidi.kernel

fidi.kernel:
	$(MAKE) -C kernel all BUILDDIR=$(CURDIR)/build SYSROOT=$(CURDIR)/sysroot

clean:
	rm -f fidi.iso
	rm -rf build/
	rm -rf isodir/
	rm -rf sysroot/
