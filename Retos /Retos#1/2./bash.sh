nasm -g -f elf64 fuerte.asm -o fuerte.o
gcc -g fuerte.o -o ejecutable
./ejecutable
#gdb -x depurador.gdb