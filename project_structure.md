# source directory

```text
fidi/
├───kernel/
│   ├───arch/
│   │   └───x86_64/
│   │       ├───boot/
│   │       │   └───boot.asm
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
├───sysroot/
│   ├───boot/
│   │   ├───grub/
│   │   │   └───grub.cfg
│   │   └───fidi.kernel
│   └───usr/
│       ├───include/
│       └───lib/
├───project_structure.md
├───readme.md
├───todo.md
└───Makefile
```

# template/future directory

```text
fidi/
├───kernel/
│   ├───arch/
│   │   └───x86_64/
│   ├───drivers/
│   ├───include/
│   ├───kernel/
│   └───Makefile
├───libc
│   ├───arch/
│   ├───include/
│   ├───stdio/
│   ├───stdlib/
│   ├───string/
│   └───Makefile
├───project_structure.md
├───readme.md
└───Makefile
```
