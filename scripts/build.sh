#!/bin/bash

mkdir -p ../build/isofiles/boot/grub

nasm -f elf32 ../boot/boot.asm -o ../build/boot.o

gcc -m32 -ffreestanding -c ../kernel/kernel.c -o ../build/kernel.o
gcc -m32 -ffreestanding -c ../drivers/screen.c -o ../build/screen.o

ld -m elf_i386 -T ../boot/linker.ld ../build/boot.o ../build/kernel.o ../build/screen.o -o ../build/jos.bin

cp ../build/jos.bin ../build/isofiles/boot/

echo 'menuentry "JOS" {
    multiboot /boot/jos.bin
}' > ../build/isofiles/boot/grub/grub.cfg

grub-mkrescue -o ../build/JOS.iso ../build/isofiles

echo "JOS ISO created!"
