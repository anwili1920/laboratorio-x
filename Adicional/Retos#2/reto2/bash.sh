nasm -g -f elf64 calculoLimiteASM.asm -o calculoASM.o
gcc -g calculoASM.o  calculoLimite.c -o limite -lm
./limite
#gdb -x depurador.gdb