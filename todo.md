make ´boot.asm´ and ´kernel_main.c´ and don't confuse object with source files (or else ´make clean´ will ´rm -f´ them)...  
do the whole libk.a [thing](https://wiki.osdev.org/Meaty_Skeleton#libc_and_libk_Design)  
make the required files by [-nostdlib](https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#index-nostdlib)
add .gitignores where needed
