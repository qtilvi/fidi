.PHONY: all

CC := x86_64-elf-gcc
AR := x86_64-elf-ar

CDEPFLAGS := -MD -MP
CFLAGS := -O2 -g $(CDEPFLAGS) -std=gnu23 -ffreestanding -Wall -Wextra
CPPFLAGS := -D__is_libk -Iinclude

SYSROOT ?=
PREFIX ?= /usr/local
EXEC_PREFIX ?= $(PREFIX)
INCLUDEDIR := $(PREFIX)/include
LIBDIR := $(EXEC_PREFIX)/lib

FREE_OBJ := \
	string/memcmp.o \
	string/memcpy.o \
	string/memmove.o \
	string/memset.o

LIBK_OBJ := $(FREE_OBJ:.o=.libk.o)

all: libk.a install-headers install-libs

libk.a: $(BUILDDIR)/$(LIBK_OBJ)
	$(AR) rcs $@ $^

$(BUILDDIR)/%.libk.o: %.c
	mkdir -p $(dir $@)
	$(CC) -c $< -o $@ $(CFLAGS) $(CPPFLAGS)

install-headers:
	mkdir -p $(SYSROOT)$(INCLUDEDIR)
	cp -R include/. $(SYSROOT)$(INCLUDEDIR)/.

install-libs:
	mkdir -p $(SYSROOT)$(LIBDIR)
	cp libk.a $(SYSROOT)$(LIBDIR)

-include $(BUILDDIR)/$(LIBK_OBJ:.o=.d)

