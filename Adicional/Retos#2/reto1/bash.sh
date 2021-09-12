nasm -g -f elf64 calculoASM.asm -o calculoASM.o
gcc -g calculoASM.o  calculoVarianza.c -o varianza -lm
gdb -x depurador.gdb
