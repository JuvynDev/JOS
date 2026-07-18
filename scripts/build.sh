#!/bin/bash

mkdir -p ../build/isofiles/boot/grub

nasm -f elf32 ../boot/boot.asm -o ../build/boot.o

ld -m elf_i386 -T ../boot/linker.ld ../build/boot.o -o ../build/jos.bin

cp ../build/jos.bin ../build/isofiles/boot/

echo 'menuentry "JOS" {
    multiboot /boot/jos.bin
}' > ../build/isofiles/boot/grub/grub.cfg

grub-mkrescue -o ../build/JOS.iso ../build/isofiles

echo "JOS ISO created!"
