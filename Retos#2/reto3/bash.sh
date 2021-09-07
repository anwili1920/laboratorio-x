nasm -g -f elf64 calculoLimiteASMB.asm -o calculoASM.o
gcc -g calculoASM.o  calculoLimiteB.c -o limite -lm
gdb -x depurador.gdb