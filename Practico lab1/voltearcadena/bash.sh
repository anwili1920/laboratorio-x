nasm -g -f elf32 -o voltear.o voltear.asm
gcc -g -m32 -march=i686 programa.c voltear.o -o ejecutable
./ejecutable
gdb -x depurador.gdb