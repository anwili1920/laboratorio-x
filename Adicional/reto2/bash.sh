nasm -f elf64 -g assembler.asm -o assembler.o
ld assembler.o -o assembler
gdb -x depurador.gdb
