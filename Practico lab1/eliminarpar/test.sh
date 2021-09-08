nasm -g -f elf32 -o selector.o selector.asm
gcc -g -m32 -march=i686 eliminarpar.c selector.o -o ejecutable
./ejecutable 12 13 19 18 17 16 14 7 3 5
#gdb -x depurador.gdb