.PHONY: all

CC := x86_64-elf-gcc
AR := x86_64-elf-ar

CDEPFLAGS := -MD -MP
CFLAGS := -O2 -g $(CDEPFLAGS) -std=gnu23 -ffreestanding -Wall -Wextra
CPPFLAGS := -D__is_libk -Iinclude

SYSROOT ?=
PREFIX ?= /usr
EXEC_PREFIX ?= $(PREFIX)
INCLUDEDIR := $(PREFIX)/include
LIBDIR := $(EXEC_PREFIX)/lib

FREE_OBJ := \
	string/memcmp.o \
	string/memcpy.o \
	string/memmove.o \
	string/memset.o

LIBK_OBJ := \
	$(BUILDDIR)/string/memcmp.libk.o \
	$(BUILDDIR)/string/memcpy.libk.o \
	$(BUILDDIR)/string/memmove.libk.o \
	$(BUILDDIR)/string/memset.libk.o

all: libk.a install-headers install-libs

libk.a: $(LIBK_OBJ)
	$(AR) rcs $@ $^

$(BUILDDIR)/%.libk.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

install-headers:
	mkdir -p $(SYSROOT)$(INCLUDEDIR)
	cp -R include/. $(SYSROOT)$(INCLUDEDIR)/.

install-libs:
	mkdir -p $(SYSROOT)$(LIBDIR)
	cp libk.a $(SYSROOT)$(LIBDIR)

-include $(LIBK_OBJ:.libk.o=.d)
