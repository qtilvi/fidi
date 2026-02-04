```text
fidi/
├───.git/ (not source, also can't be fucked to do THAT)
├───build/ (not source)
├───isodir/ (not source)
│   └───boot/
│       ├───grub/
│       │   └───grub.cfg
│       └───fidi.kernel
├───kernel/
│   ├───arch/
│   │   └───x86_64/
│   │       ├───boot/
│   │       │   ├───boot.asm
│   │       │   └───switch_to_lm.asm
│   │       ├───grub.cfg
│   │       ├───linker.ld
│   │       └───make.config
│   ├───core/
│   │   └───kernel_main.c
│   └───Makefile
├───libc
│   ├───include/
│   ├───stdio/
│   ├───stdlib/
│   ├───string/
│   └───Makefile
├───sysroot/ (not source)
│   ├───boot/
│   │   └───fidi.kernel
│   └───usr/
│       ├───include/
│       └───lib/
├───.gitignore
├───fidi.iso (not source)
├───Makefile
├───PROJECT_STRUCTURE.md
└───README.md

```
